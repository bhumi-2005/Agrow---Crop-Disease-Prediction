import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/market_price.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/foundation.dart';

class MarketService {
  late final String baseUrl;

  MarketService() {
    baseUrl =
        dotenv.env['AGMARKNET_API_URL'] ??
        'https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070';
  }

  Future<List<MarketPrice>> getMarketPrices({
    String? state,
    String? district,
    String? commodity,
    String? sortBy,
  }) async {
    try {
      final apiKey = dotenv.env['AGMARKNET_API_KEY'];
      if (apiKey == null) {
        debugPrint('Error: AGMARKNET_API_KEY not found in .env file');
        throw Exception('API key not found in environment configuration');
      }

      final queryParams = {
        'api-key': apiKey,
        'format': 'json',
        'limit': '100',
        if (state != null && state != 'All States') 'filters[state]': state,
        if (district != null && district != 'All Districts')
          'filters[district]': district,
        if (commodity != null) 'filters[commodity]': commodity,
        if (sortBy != null) 'sort[modal_price]': sortBy,
      };

      final uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);
      debugPrint('Fetching market prices from: $uri');

      final response = await http.get(uri);
      debugPrint('Response status code: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['records'] == null) {
          debugPrint('No records found in API response');
          throw Exception('No market data available from the API');
        }

        final records = data['records'] as List;
        if (records.isEmpty) {
          debugPrint('Empty records list in API response');
          throw Exception('No market prices found for the selected criteria');
        }

        return records.map((record) => MarketPrice.fromJson(record)).toList();
      } else {
        debugPrint(
          'API request failed with status code: ${response.statusCode}',
        );
        throw Exception(
          'Failed to load market prices: HTTP ${response.statusCode}',
        );
      }
    } catch (e) {
      debugPrint('Error fetching market prices: $e');
      throw Exception('Failed to load market prices: $e');
    }
  }

  Future<List<String>> getStates() async {
    try {
      final apiKey = dotenv.env['AGMARKNET_API_KEY'];
      if (apiKey == null) throw Exception('API key not found');

      final uri = Uri.parse(
        '$baseUrl?api-key=$apiKey&format=json&limit=1000&select=state',
      );
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final records = data['records'] as List;
        final states =
            records.map((record) => record['state'] as String).toSet().toList();
        states.sort();
        return states;
      } else {
        throw Exception('Failed to load states');
      }
    } catch (e) {
      // Return default list as fallback
      return [
        'All States',
        'Maharashtra',
        'Karnataka',
        'Gujarat',
        'Punjab',
        'Uttar Pradesh',
        'Madhya Pradesh',
      ];
    }
  }

  Future<List<String>> getDistricts(String state) async {
    try {
      final apiKey = dotenv.env['AGMARKNET_API_KEY'];
      if (apiKey == null) throw Exception('API key not found');

      final uri = Uri.parse(
        '$baseUrl?api-key=$apiKey&format=json&limit=1000&filters[state]=$state&select=district',
      );
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final records = data['records'] as List;
        final districts =
            records
                .map((record) => record['district'] as String)
                .toSet()
                .toList();
        districts.sort();
        return ['All Districts', ...districts];
      } else {
        throw Exception('Failed to load districts');
      }
    } catch (e) {
      // Return mock data as fallback
      final Map<String, List<String>> mockDistricts = {
        'Maharashtra': [
          'All Districts',
          'Mumbai',
          'Pune',
          'Nagpur',
          'Nashik',
          'Aurangabad',
        ],
        // Add other states as needed
      };

      return mockDistricts[state] ?? ['All Districts'];
    }
  }

  Future<List<String>> getCommodities() async {
    try {
      final apiKey = dotenv.env['AGMARKNET_API_KEY'];
      if (apiKey == null) throw Exception('API key not found');

      final uri = Uri.parse(
        '$baseUrl?api-key=$apiKey&format=json&limit=1000&select=commodity',
      );
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final records = data['records'] as List;
        final commodities =
            records
                .map((record) => record['commodity'] as String)
                .toSet()
                .toList();
        commodities.sort();
        return commodities;
      } else {
        throw Exception('Failed to load commodities');
      }
    } catch (e) {
      // Return default list as fallback
      return [
        'Rice',
        'Wheat',
        'Cotton',
        'Soybean',
        'Onion',
        'Tomato',
        'Potato',
      ];
    }
  }

  Future<String?> getCurrentState() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied');
      }

      // Get current position
      final position = await Geolocator.getCurrentPosition();

      // Get address from coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        return placemarks.first.administrativeArea; // Returns state name
      }
      return null;
    } catch (e) {
      throw Exception('Error getting location: $e');
    }
  }

  Future<String?> getCurrentDistrict() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        return placemarks.first.subAdministrativeArea; // Returns district name
      }
      return null;
    } catch (e) {
      throw Exception('Error getting district: $e');
    }
  }
}

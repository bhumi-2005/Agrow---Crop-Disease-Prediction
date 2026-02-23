import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../providers/market_provider.dart';
import '../models/market_price.dart';
import 'package:agrow/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  Timer? _refreshTimer;
  // Store internal values, not translated values
  String? _selectedState = 'All States';
  String? _selectedCommodity;

  // Internal state keys (not translated)
  final List<String> _stateKeys = [
    'All States',
    'Maharashtra',
    'Karnataka',
    'Gujarat',
    'Punjab',
    'Uttar Pradesh',
    'Madhya Pradesh',
  ];

  // Default selection for initial load
  final String _defaultState = 'All States';

  // Update color constants for a more modern look
  final Color primaryColor = Color(
    0xFF6B4EE6,
  ); // Deep purple for primary elements
  final Color secondaryColor = Color(
    0xFFF3F1FF,
  ); // Light purple for backgrounds
  final Color accentColor = Color(0xFF8D77AB); // Medium purple for accents
  final Color surfaceColor = Color(0xFFFFFFFF); // White for cards
  final Color textPrimaryColor = Color(
    0xFF2D3142,
  ); // Dark gray for primary text
  final Color textSecondaryColor = Color(
    0xFF9094A6,
  ); // Medium gray for secondary text

  @override
  void initState() {
    super.initState();
    _selectedState = 'All States'; // Default state (internal value)
    _setupAutoRefresh();

    // Add listener to search controller
    _searchController.addListener(() {
      setState(() {
        _isSearching = _searchController.text.isNotEmpty;
      });

      if (_searchController.text.isNotEmpty) {
        Provider.of<MarketProvider>(
          context,
          listen: false,
        ).searchCropPrices(_searchController.text);
      } else {
        Provider.of<MarketProvider>(context, listen: false).resetSearch();
      }
    });

    // Load prices for default location initially
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadPrices();
    });
  }

  void _setupAutoRefresh() {
    _refreshTimer = Timer.periodic(Duration(minutes: 5), (_) => _loadPrices());
  }

  void _loadPrices() {
    // Always provide state and district (default or selected)
    final state = _selectedState;

    Provider.of<MarketProvider>(
      context,
      listen: false,
    ).updateFilters(state: state, commodity: _selectedCommodity);
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  // Get localized state name from internal key
  String _getLocalizedStateName(
    String stateKey,
    AppLocalizations appLocalizations,
  ) {
    switch (stateKey) {
      case 'All States':
        return appLocalizations.allStates;
      case 'Maharashtra':
        return appLocalizations.maharashtra;
      case 'Karnataka':
        return appLocalizations.karnataka;
      case 'Gujarat':
        return appLocalizations.gujarat;
      case 'Punjab':
        return appLocalizations.punjab;
      case 'Uttar Pradesh':
        return appLocalizations.uttarPradesh;
      case 'Madhya Pradesh':
        return appLocalizations.madhyaPradesh;
      default:
        return stateKey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final marketProvider = Provider.of<MarketProvider>(context);

    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          appLocalizations.marketPrices,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search bar with improved styling
            Container(
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: textPrimaryColor),
                decoration: InputDecoration(
                  hintText: appLocalizations.searchCrops,
                  hintStyle: TextStyle(color: textSecondaryColor),
                  prefixIcon: Icon(Icons.search, color: accentColor),
                  suffixIcon:
                      _isSearching
                          ? IconButton(
                            icon: Icon(Icons.clear, color: accentColor),
                            onPressed: () => _searchController.clear(),
                          )
                          : null,
                  filled: true,
                  fillColor: surfaceColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: primaryColor, width: 1),
                  ),
                ),
              ),
            ),

            // State selection with improved styling
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedState,
                    dropdownColor: surfaceColor,
                    style: TextStyle(color: textPrimaryColor, fontSize: 16),
                    icon: Icon(Icons.arrow_drop_down, color: accentColor),
                    isExpanded: true,
                    hint: Text(
                      appLocalizations.selectState,
                      style: TextStyle(color: textSecondaryColor),
                    ),
                    items:
                        _stateKeys.map((String stateKey) {
                          return DropdownMenuItem<String>(
                            value: stateKey,
                            child: Text(
                              _getLocalizedStateName(
                                stateKey,
                                appLocalizations,
                              ),
                            ),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedState = newValue;
                      });
                      _loadPrices();
                    },
                  ),
                ),
              ),
            ),

            // Market prices list with improved styling
            Expanded(
              child:
                  marketProvider.isLoading
                      ? _buildLoadingShimmer()
                      : marketProvider.prices.isEmpty
                      ? _buildNoResults(appLocalizations.noCropPrices)
                      : AnimationLimiter(
                        child: ListView.builder(
                          padding: EdgeInsets.all(16),
                          itemCount: marketProvider.prices.length,
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: _buildCropCard(
                                    marketProvider.prices[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCropCard(MarketPrice crop) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Card(
      elevation: 0,
      color: surfaceColor,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    crop.commodity,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textPrimaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getPriceChangeColor(
                      crop.getPriceChange(),
                    ).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _getPriceChangeColor(
                        crop.getPriceChange(),
                      ).withOpacity(0.5),
                    ),
                  ),
                  child: Text(
                    _formatPriceChange(crop.getPriceChange()),
                    style: TextStyle(
                      color: _getPriceChangeColor(crop.getPriceChange()),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              crop.variety,
              style: TextStyle(color: textSecondaryColor, fontSize: 14),
            ),
            SizedBox(height: 16),

            // Prices
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.all(16),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appLocalizations.currentPrice,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        '₹${crop.modalPrice.toStringAsFixed(2)}/kg',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        appLocalizations.marketName,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(crop.market, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
              children: [
                // Price details
                Text(
                  appLocalizations.priceDetails,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildPriceColumn(
                      title: appLocalizations.minPrice,
                      price: crop.minPrice,
                      color: Colors.blue,
                    ),
                    _buildPriceColumn(
                      title: appLocalizations.modalPrice,
                      price: crop.modalPrice,
                      color: Colors.deepPurple,
                      isBold: true,
                    ),
                    _buildPriceColumn(
                      title: appLocalizations.maxPrice,
                      price: crop.maxPrice,
                      color: Colors.green,
                    ),
                  ],
                ),

                SizedBox(height: 16),
                Divider(),
                SizedBox(height: 16),

                // Location details
                Text(
                  appLocalizations.marketDetails,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                _buildInfoRow(
                  icon: Icons.store,
                  title: appLocalizations.market,
                  value: crop.market,
                ),
                SizedBox(height: 8),
                _buildInfoRow(
                  icon: Icons.location_city,
                  title: appLocalizations.district,
                  value: crop.district,
                ),
                SizedBox(height: 8),
                _buildInfoRow(
                  icon: Icons.map,
                  title: appLocalizations.state,
                  value: crop.state,
                ),

                SizedBox(height: 16),
                Divider(),
                SizedBox(height: 16),

                // Date information
                Text(
                  appLocalizations.dateInformation,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                _buildInfoRow(
                  icon: Icons.calendar_today,
                  title: appLocalizations.arrivalDate,
                  value: crop.arrivalDate,
                ),
                SizedBox(height: 8),
                _buildInfoRow(
                  icon: Icons.update,
                  title: appLocalizations.lastUpdated,
                  value: crop.lastUpdated,
                ),
              ],
              iconColor: accentColor,
              textColor: textPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceColumn({
    required String title,
    required double price,
    required Color color,
    bool isBold = false,
  }) {
    final currencyFormat = NumberFormat.currency(
      symbol: '₹',
      locale: 'en_IN',
      decimalDigits: 2,
    );

    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        SizedBox(height: 4),
        Text(
          currencyFormat.format(price),
          style: TextStyle(
            fontSize: isBold ? 16 : 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade700),
        SizedBox(width: 8),
        Text(
          '$title:',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 4),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade900),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[50]!,
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            height: 140,
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNoResults(String message) {
    final appLocalizations = AppLocalizations.of(context)!;
    final marketProvider = Provider.of<MarketProvider>(context);
    final error = marketProvider.error;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              error != null ? Icons.error_outline : Icons.search_off_rounded,
              size: 48,
              color: error != null ? Colors.red : primaryColor,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              error ?? message,
              style: TextStyle(
                color: error != null ? Colors.red : textPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 24),
          if (error == null || !error.contains('API key'))
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedState = _defaultState;
                  _searchController.clear();
                });
                _loadPrices();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                appLocalizations.showDefaultPrices,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          if (error?.contains('API key') ?? false)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Please contact support to resolve this issue.',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  Color _getPriceChangeColor(double priceChange) {
    if (priceChange > 0) return Color(0xFF34C759); // Green
    if (priceChange < 0) return Color(0xFFFF3B30); // Red
    return textSecondaryColor;
  }

  String _formatPriceChange(double priceChange) {
    String sign = priceChange > 0 ? '+' : '';
    return '$sign${priceChange.toStringAsFixed(2)}%';
  }
}

import 'package:flutter/material.dart';
import 'consultation_screen.dart';
import 'package:agrow/l10n/app_localizations.dart';
import 'crop_advisory_screen.dart';
import 'crop_disease_screen.dart';
import 'market_screen.dart';
import 'pesticide_screen.dart';
import '../widgets/weather_widget.dart';
import 'package:provider/provider.dart';
import '../providers/market_provider.dart';
import 'govt_schemes_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const HomeScreen({super.key, required this.onLocaleChange});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentLanguage = 'English'; // Default language
  Map<String, dynamic>? weatherData; // Add this line

  final List<Map<String, dynamic>> languages = [
    {'name': 'English', 'code': 'en'},
    {'name': 'हिंदी', 'code': 'hi'}, // Hindi
    {'name': 'मराठी', 'code': 'mr'}, // Marathi
  ];

  void _changeLanguage(String? langCode) {
    if (langCode != null) {
      setState(() {
        currentLanguage =
            languages.firstWhere((lang) => lang['code'] == langCode)['name']!;
      });
      widget.onLocaleChange(Locale(langCode));
    }
  }

  // Add this method to update weather data
  void updateWeatherData(Map<String, dynamic> data) {
    setState(() {
      weatherData = data;
    });
  }

  Widget _buildFeatureCard({
    required String title,
    required IconData icon,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: backgroundColor),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              appLocalizations.appName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.eco, color: Colors.white, size: 32),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.2),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value:
                      languages.firstWhere(
                        (lang) => lang['name'] == currentLanguage,
                      )['code'],
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  dropdownColor: Colors.green.shade600,
                  items:
                      languages.map((language) {
                        return DropdownMenuItem<String>(
                          value: language['code'],
                          child: Text(
                            language['name'],
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                  onChanged: _changeLanguage,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFFF0FDF4), // Solid light mint green background
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Weather Widget with callback
                WeatherWidget(onWeatherDataUpdate: updateWeatherData),
                SizedBox(height: 16),

                // Forecast Widget (only show if weather data is available)
                if (weatherData != null && weatherData!['forecast'] != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TranslatedForecastWidget(
                      forecast: weatherData!['forecast']['forecastday'],
                    ),
                  ),
                SizedBox(height: 16),

                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appLocalizations.services,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          _buildFeatureCard(
                            title: appLocalizations.cropDiseaseDetection,
                            icon: Icons.healing,
                            backgroundColor: Colors.amber,
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CropDiseaseScreen(),
                                  ),
                                ),
                          ),
                          _buildFeatureCard(
                            title: appLocalizations.cropAdvisory,
                            icon: Icons.eco,
                            backgroundColor: Colors.teal,
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CropAdvisoryScreen(),
                                  ),
                                ),
                          ),
                          _buildFeatureCard(
                            title:
                                appLocalizations.governmentSchemesAndSubsidies,
                            icon: Icons.policy,
                            backgroundColor: Colors.purple,
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GovtSchemesScreen(),
                                  ),
                                ),
                          ),
                          _buildFeatureCard(
                            title: appLocalizations.expertConsultation,
                            icon: Icons.support_agent,
                            backgroundColor: Colors.blue,
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ConsultationScreen(),
                                  ),
                                ),
                          ),
                          _buildFeatureCard(
                            title: appLocalizations.pesticides,
                            icon: Icons.pest_control,
                            backgroundColor: Colors.orange,
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PesticideScreen(),
                                  ),
                                ),
                          ),
                          _buildFeatureCard(
                            title: appLocalizations.marketPrices,
                            icon: Icons.trending_up,
                            backgroundColor: Colors.deepPurple,
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => ChangeNotifierProvider(
                                          create: (context) => MarketProvider(),
                                          child: MarketScreen(),
                                        ),
                                  ),
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Add this custom clipper class
class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Create a translated version of the forecast widget
class TranslatedForecastWidget extends StatelessWidget {
  final List<dynamic> forecast;

  const TranslatedForecastWidget({Key? key, required this.forecast})
    : super(key: key);

  String _getLocalizedDayName(int weekday, BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    switch (weekday) {
      case 1:
        return appLocalizations.monday;
      case 2:
        return appLocalizations.tuesday;
      case 3:
        return appLocalizations.wednesday;
      case 4:
        return appLocalizations.thursday;
      case 5:
        return appLocalizations.friday;
      case 6:
        return appLocalizations.saturday;
      case 7:
        return appLocalizations.sunday;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Color(0xFFE3F2FD), // Light blue background
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.threeDayForecast,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4285F4), // Blue text to match theme
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                forecast.length > 3 ? 3 : forecast.length,
                (index) {
                  final forecastDay = forecast[index];
                  final date = DateTime.parse(forecastDay['date']);
                  final dayName = _getLocalizedDayName(date.weekday, context);

                  return Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Center alignment
                      children: [
                        Text(
                          dayName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Image.network(
                          'https:${forecastDay['day']['condition']['icon']}',
                          height: 56,
                          width: 56,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${forecastDay['day']['maxtemp_c']}°C',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${forecastDay['day']['mintemp_c']}°C',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

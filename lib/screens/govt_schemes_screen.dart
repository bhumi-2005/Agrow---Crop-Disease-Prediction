import 'package:flutter/material.dart';
import 'package:agrow/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class GovtSchemesScreen extends StatefulWidget {
  const GovtSchemesScreen({super.key});

  @override
  _GovtSchemesScreenState createState() => _GovtSchemesScreenState();
}

class _GovtSchemesScreenState extends State<GovtSchemesScreen> {
  String selectedFilter = 'all';
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  // Schemes data is now created in the build method to use translations
  List<Map<String, dynamic>> getSchemes(AppLocalizations appLocalizations) {
    return [
      {
        'title': appLocalizations.schemeTitle1,
        'description': appLocalizations.schemeDesc1,
        'status': 'active',
        'lastDate': '31 March 2024',
        'website': 'https://pmfby.gov.in',
      },
      {
        'title': appLocalizations.schemeTitle2,
        'description': appLocalizations.schemeDesc2,
        'status': 'active',
        'lastDate': appLocalizations.ongoing,
        'website': 'https://pmkisan.gov.in',
      },
      {
        'title': appLocalizations.schemeTitle3,
        'description': appLocalizations.schemeDesc3,
        'status': 'active',
        'lastDate': appLocalizations.ongoing,
        'website':
            'https://sbi.co.in/web/agri-rural/agriculture-banking/crop-loan/kisan-credit-card',
      },
    ];
  }

  // Filter schemes based on selected filter and search query
  List<Map<String, dynamic>> getFilteredSchemes(
    AppLocalizations appLocalizations,
  ) {
    final schemes = getSchemes(appLocalizations);
    return schemes.where((scheme) {
      final matchesFilter =
          selectedFilter == 'all' || scheme['status'] == selectedFilter;
      final matchesSearch =
          searchQuery.isEmpty ||
          scheme['title'].toString().toLowerCase().contains(searchQuery) ||
          scheme['description'].toString().toLowerCase().contains(searchQuery);
      return matchesFilter && matchesSearch;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final filteredSchemes = getFilteredSchemes(appLocalizations);

    // Add color constants at the top of the class
    final Color primaryGreen = Color(0xFFBAD8B6); // Light green
    // final Color secondaryGreen = Color(0xFFE1EACD); // Very light green
    final Color backgroundColor = Color(0xFFF9F6E6); // Cream/beige
    final Color accentPurple = Color(0xFF8D77AB); // Purple

    return Scaffold(
      backgroundColor: backgroundColor, // Set solid background color
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          appLocalizations.govtSchemesTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: accentPurple, // Changed to purple
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search bar styling
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: appLocalizations.searchSchemes,
              prefixIcon: Icon(Icons.search, color: primaryGreen),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryGreen),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: accentPurple),
              ),
            ),
          ),

          // Filter chips styling
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilterChip(
                  label: Text(appLocalizations.allSchemes),
                  selected: selectedFilter == 'all',
                  selectedColor: primaryGreen,
                  checkmarkColor: Colors.white,
                  onSelected: (bool selected) {
                    setState(() => selectedFilter = 'all');
                  },
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text(appLocalizations.activeSchemes),
                  selected: selectedFilter == 'active',
                  selectedColor: primaryGreen,
                  checkmarkColor: Colors.white,
                  onSelected: (bool selected) {
                    setState(() => selectedFilter = 'active');
                  },
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text(appLocalizations.upcomingSchemes),
                  selected: selectedFilter == 'upcoming',
                  selectedColor: primaryGreen,
                  checkmarkColor: Colors.white,
                  onSelected: (bool selected) {
                    setState(() => selectedFilter = 'upcoming');
                  },
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text(appLocalizations.expiredSchemes),
                  selected: selectedFilter == 'expired',
                  selectedColor: primaryGreen,
                  checkmarkColor: Colors.white,
                  onSelected: (bool selected) {
                    setState(() => selectedFilter = 'expired');
                  },
                ),
              ],
            ),
          ),

          // Scheme cards
          Expanded(
            child:
                filteredSchemes.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            appLocalizations.noSchemesFound,
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          Text(
                            appLocalizations.tryDifferentSearch,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                      padding: EdgeInsets.all(16.0),
                      itemCount: filteredSchemes.length,
                      itemBuilder: (context, index) {
                        final scheme = filteredSchemes[index];
                        return SchemeCard(
                          scheme: scheme,
                          appLocalizations: appLocalizations,
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

class SchemeCard extends StatelessWidget {
  final Map<String, dynamic> scheme;
  final AppLocalizations appLocalizations;

  const SchemeCard({
    super.key,
    required this.scheme,
    required this.appLocalizations,
  });

  void _showSchemeDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            expand: false,
            builder:
                (context, scrollController) => SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          scheme['title'],
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildDetailSection(
                          title: appLocalizations.eligibility,
                          content:
                              "• Small and marginal farmers\n• Land holding up to 2 hectares\n• Active bank account",
                        ),
                        _buildDetailSection(
                          title: appLocalizations.benefits,
                          content:
                              "• Financial support for crop loss\n• Insurance coverage\n• Stable income protection",
                        ),
                        _buildDetailSection(
                          title: appLocalizations.requiredDocuments,
                          content:
                              "• Aadhaar Card\n• Land Records\n• Bank Account Details\n• Recent Passport Size Photo",
                        ),
                        _buildDetailSection(
                          title: appLocalizations.applicationProcess,
                          content:
                              "1. Visit nearest bank branch\n2. Fill application form\n3. Submit required documents\n4. Pay premium amount",
                        ),
                      ],
                    ),
                  ),
                ),
          ),
    );
  }

  Widget _buildDetailSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8D77AB),
          ),
        ),
        SizedBox(height: 8),
        Text(content, style: TextStyle(fontSize: 16)),
        SizedBox(height: 16),
      ],
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              scheme['title'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              scheme['description'],
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${appLocalizations.lastDate}: ${scheme['lastDate']}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  '${appLocalizations.status}: ${scheme['status'] == 'active'
                      ? appLocalizations.activeSchemes
                      : scheme['status'] == 'upcoming'
                      ? appLocalizations.upcomingSchemes
                      : appLocalizations.expiredSchemes}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color:
                        scheme['status'] == 'active'
                            ? Colors.green
                            : scheme['status'] == 'upcoming'
                            ? Colors.blue
                            : Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _showSchemeDetails(context),
                  child: Text(
                    appLocalizations.viewMore,
                    style: TextStyle(color: Color(0xFF8D77AB)),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed:
                      scheme['status'] == 'active'
                          ? () async {
                            try {
                              await _launchURL(scheme['website']);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Could not open website'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                          : null,
                  icon: Icon(Icons.open_in_new, color: Colors.white),
                  label: Text(
                    appLocalizations.visitWebsite,
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFBAD8B6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

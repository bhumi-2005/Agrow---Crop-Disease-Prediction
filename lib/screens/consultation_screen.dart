import 'package:flutter/material.dart';
import 'package:agrow/l10n/app_localizations.dart';

class ConsultationScreen extends StatefulWidget {
  const ConsultationScreen({super.key});

  @override
  _ConsultationScreenState createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  String? selectedFilter;
  final searchController = TextEditingController();
  String searchQuery = '';

  // Add color constants at the top of the class
  final Color primaryGreen = Color(0xFFBAD8B6); // Light green
  final Color secondaryGreen = Color(0xFFE1EACD); // Very light green
  final Color backgroundColor = Color(0xFFF9F6E6); // Cream/beige
  final Color accentPurple = Color(0xFF8D77AB); // Purple

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (selectedFilter == null) {
      selectedFilter = AppLocalizations.of(context)!.filterAll;
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> getFilteredExperts(
    AppLocalizations appLocalizations,
  ) {
    final List<Map<String, dynamic>> experts = [
      {
        'name': appLocalizations.expertName1,
        'image': 'assets/expert1.jpg',
        'specialization': appLocalizations.expertSpec1,
        'experience': appLocalizations.expertExp1,
        'tags': [appLocalizations.tagCrops, appLocalizations.tagDisease],
        'fee': '500',
        'rating': 4.8,
        'type': appLocalizations.filterCrops,
      },
      {
        'name': appLocalizations.expertName2,
        'image': 'assets/expert2.jpg',
        'specialization': appLocalizations.expertSpec2,
        'experience': appLocalizations.expertExp2,
        'tags': [appLocalizations.tagSoil, appLocalizations.tagFertility],
        'fee': '600',
        'rating': 4.9,
        'type': appLocalizations.filterSoil,
      },
      {
        'name': appLocalizations.expertName3,
        'image': 'assets/expert3.jpg',
        'specialization': appLocalizations.expertSpec3,
        'experience': appLocalizations.expertExp3,
        'tags': [appLocalizations.tagGovt, appLocalizations.tagSubsidies],
        'fee': '400',
        'rating': 4.7,
        'type': appLocalizations.filterGovt,
      },
    ];

    return experts.where((expert) {
      final matchesFilter =
          selectedFilter == appLocalizations.filterAll ||
          expert['type'] == selectedFilter;
      final matchesSearch =
          searchQuery.isEmpty ||
          expert['name'].toString().toLowerCase().contains(searchQuery) ||
          expert['specialization'].toString().toLowerCase().contains(
            searchQuery,
          );
      return matchesFilter && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final filteredExperts = getFilteredExperts(appLocalizations);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          appLocalizations.expertConsultationTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: accentPurple,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search bar styling
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: appLocalizations.searchExpertsHint,
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

          // Filter chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilterChip(
                  label: Text(appLocalizations.filterAll),
                  selected: selectedFilter == appLocalizations.filterAll,
                  selectedColor: primaryGreen,
                  checkmarkColor: Colors.white,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedFilter = appLocalizations.filterAll;
                    });
                  },
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text(appLocalizations.filterCrops),
                  selected: selectedFilter == appLocalizations.filterCrops,
                  selectedColor: primaryGreen,
                  checkmarkColor: Colors.white,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedFilter = appLocalizations.filterCrops;
                    });
                  },
                ),
                FilterChip(
                  label: Text(appLocalizations.filterSoil),
                  selected: selectedFilter == appLocalizations.filterSoil,
                  selectedColor: primaryGreen,
                  checkmarkColor: Colors.white,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedFilter = appLocalizations.filterSoil;
                    });
                  },
                ),
                FilterChip(
                  label: Text(appLocalizations.filterGovt),
                  selected: selectedFilter == appLocalizations.filterGovt,
                  selectedColor: primaryGreen,
                  checkmarkColor: Colors.white,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedFilter = appLocalizations.filterGovt;
                    });
                  },
                ),
              ],
            ),
          ),

          // Experts List or No Results Message
          Expanded(
            child:
                filteredExperts.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            appLocalizations.noExpertsFound,
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
                      itemCount: filteredExperts.length,
                      itemBuilder: (context, index) {
                        final expert = filteredExperts[index];
                        return ExpertCard(
                          expert: expert,
                          appLocalizations: appLocalizations,
                          primaryGreen: primaryGreen,
                          secondaryGreen: secondaryGreen,
                          accentPurple: accentPurple,
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

class ExpertCard extends StatelessWidget {
  final Map<String, dynamic> expert;
  final AppLocalizations appLocalizations;
  final Color primaryGreen;
  final Color secondaryGreen;
  final Color accentPurple;

  const ExpertCard({
    super.key,
    required this.expert,
    required this.appLocalizations,
    required this.primaryGreen,
    required this.secondaryGreen,
    required this.accentPurple,
  });

  @override
  Widget build(BuildContext context) {
    // Function to get tag color based on expert type
    Color getTagColor(String type) {
      if (type == appLocalizations.filterCrops) {
        return Colors.green;
      } else if (type == appLocalizations.filterSoil) {
        return Colors.blue;
      } else if (type == appLocalizations.filterGovt) {
        return Colors.purple;
      }
      return Colors.grey;
    }

    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: secondaryGreen,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: primaryGreen,
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expert['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        expert['specialization'],
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(expert['experience']),
            SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children:
                  (expert['tags'] as List).map<Widget>((tagText) {
                    return Chip(
                      label: Text(
                        tagText,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      backgroundColor: getTagColor(expert['type']),
                    );
                  }).toList(),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appLocalizations.feePerSession(expert['fee']),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 4),
                    Text(
                      expert['rating'].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.chat, color: Colors.white70),
                  label: Text(
                    appLocalizations.chatButton,
                    style: TextStyle(color: Colors.white70),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                  ),
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.phone, color: Colors.white70),
                  label: Text(
                    appLocalizations.callButton,
                    style: TextStyle(color: Colors.white70),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                  ),
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.videocam, color: Colors.white70),
                  label: Text(
                    appLocalizations.videoButton,
                    style: TextStyle(color: Colors.white70),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentPurple,
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

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agrow/l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CropAdvisoryScreen extends StatefulWidget {
  const CropAdvisoryScreen({super.key});

  @override
  _CropAdvisoryScreenState createState() => _CropAdvisoryScreenState();
}

class _CropAdvisoryScreenState extends State<CropAdvisoryScreen> {
  String? selectedCropMethod;
  String? selectedCrop;
  String? selectedIrrigationMethodType;

  String? selectedIrrigationMethod;
  String? selectedWeatherMethodType;
  String? selectedWeather;
  TextEditingController areaController = TextEditingController();
  String? selectedSoilType;

  final List<String> soilTypes = [
    "loam",
    "clayLoam",
    "sandyLoam",
    "siltLoam",
    "clay",
    "sandy",
    "silty",
    "peaty",
    "chalky",
    "saline",
    "alluvial",
    "redSoil",
    "blackSoil",
    "laterite",
  ];

  final List<String> crops = [
    "wheat",
    "rice",
    "cotton",
    "sugarcane",
    "maize",
    "soybean",
    "potato",
    "tomato",
    "onion",
    "groundnut",
    "chickpea",
    "mustard",
    "sunflower",
    "turmeric",
    "ginger",
    "garlic",
    "chili",
    "cauliflower",
    "cabbage",
    "carrot",
    "peas",
    "beans",
    "cucumber",
    "eggplant",
    "okra",
  ];

  final List<String> irrigationMethods = [
    "drip",
    "sprinkler",
    "flood",
    "furrow",
    "centerPivot",
    "subsurfaceDrip",
    "microSprinkler",
    "surface",
    "basin",
    "borderStrip",
  ];

  final List<String> weatherConditions = [
    "sunny",
    "partlyCloudy",
    "overcast",
    "lightRain",
    "heavyRain",
    "thunderstorm",
    "windy",
    "hotHumid",
    "coldDry",
    "foggy",
    "hazy",
    "drought",
    "highTemp",
    "lowTemp",
  ];

  final List<String> areaUnits = [
    "acres",
    "hectares",
    "squareMeters",
    "squareFeet",
    "guntha",
    "bigha",
  ];

  String selectedAreaUnit = "acres";

  String? aiResponse;
  bool isLoading = false;
  late final String apiKey;
  late final String apiUrl;

  // Add color constants at the top of the class
  final Color primaryGreen = Color(0xFF4CAF50); // More vibrant green
  final Color secondaryGreen = Color(0xFFE1EACD); // Light green
  final Color backgroundColor = Color(0xFFF9F6E6); // Cream/beige
  final Color accentGreen = Color(0xFF2E7D32); // Dark green (replacing purple)

  // Add these new style constants
  final BorderRadius standardBorderRadius = BorderRadius.circular(12.0);
  final EdgeInsets standardPadding = EdgeInsets.all(16.0);

  // Update card decoration
  BoxDecoration get cardDecoration => BoxDecoration(
    color: Colors.white,
    borderRadius: standardBorderRadius,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 5,
        offset: Offset(0, 2),
      ),
    ],
  );

  // Update input decoration
  InputDecoration getInputDecoration(String hint) => InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: Colors.grey[50],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: primaryGreen.withOpacity(0.3)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: accentGreen, width: 2),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );

  @override
  void initState() {
    super.initState();
    // Initialize environment variables
    apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
    apiUrl = dotenv.env['GEMINI_API_URL'] ?? '';

    // Set default values
    selectedCropMethod = 'list';
    selectedIrrigationMethodType = 'list';
    selectedWeatherMethodType = 'list';
    selectedSoilType = null; // No default soil type
  }

  bool isFormValid() {
    print('Checking form validity:');
    print('Crop Method: $selectedCropMethod, Crop: $selectedCrop');
    print('Area: ${areaController.text}');
    print(
      'Irrigation Method Type: $selectedIrrigationMethodType, Method: $selectedIrrigationMethod',
    );
    print(
      'Weather Method Type: $selectedWeatherMethodType, Weather: $selectedWeather',
    );
    print('Soil Type: $selectedSoilType');

    // At least one field should have a non-null and non-empty value to generate advice
    bool hasAtLeastOneField = false;

    if (selectedCrop != null && selectedCrop!.isNotEmpty)
      hasAtLeastOneField = true;
    if (areaController.text.isNotEmpty && areaController.text != '0')
      hasAtLeastOneField = true;
    if (selectedIrrigationMethod != null &&
        selectedIrrigationMethod!.isNotEmpty)
      hasAtLeastOneField = true;
    if (selectedWeather != null && selectedWeather!.isNotEmpty)
      hasAtLeastOneField = true;
    if (selectedSoilType != null && selectedSoilType!.isNotEmpty)
      hasAtLeastOneField = true;

    print('Form has at least one field: $hasAtLeastOneField');
    return hasAtLeastOneField;
  }

  Future<void> getGeminiResponse() async {
    setState(() {
      isLoading = true;
      aiResponse = null;
    });

    // Get the current locale's language code
    final String currentLanguage = Localizations.localeOf(context).languageCode;

    String prompt =
        currentLanguage == 'hi'
            ? """
You are an AI assistant for a **Smart Agricultural Advisory System**.  
Your task is to provide **detailed, practical, and region-specific recommendations** for Indian farmers.  
Respond strictly in **Hindi language** and in **Markdown format**.  
Do not use HTML tags, emojis, or special symbols.  
Use only `*` for bullet points and `###` for section headings.
If any farm details are missing (like crop, soil, or weather), 
make reasonable assumptions based on typical Indian agricultural conditions 
and provide generalized yet practical recommendations.
---

#  खेत की जानकारी
- **फसल का प्रकार:** $selectedCrop  
- **भूमि क्षेत्र:** ${areaController.text.isNotEmpty ? '${areaController.text} $selectedAreaUnit' : null}  
- **सिंचाई विधि:** $selectedIrrigationMethod  
- **मौसम की स्थिति:** $selectedWeather  
- **मिट्टी का प्रकार:** $selectedSoilType  

---

### 1. उचित बुवाई और कटाई अवधि
वर्तमान मौसम और मिट्टी की स्थिति को ध्यान में रखते हुए बुवाई और कटाई के लिए उपयुक्त समय बताएं।  
**बुवाई का समय**, **अंकुरण अवधि**, और **कटाई के दिनों** की जानकारी स्पष्ट रूप से दें।

### 2. सिंचाई प्रबंधन
चयनित सिंचाई विधि और मौसम के अनुसार **पानी प्रबंधन** की जानकारी दें।  
शामिल करें:
* सिंचाई की आवृत्ति और अवधि  
* पानी बचत तकनीकें (ड्रिप, मल्चिंग, समय-आधारित सिंचाई आदि)  
* अधिक या कम सिंचाई से बचाव के उपाय  

### 3. उर्वरक प्रबंधन
**पोषक तत्व प्रबंधन योजना** विस्तार से बताएं, जिसमें शामिल हों:
* विशेष उर्वरक (NPK, सूक्ष्म पोषक तत्व, सेंद्रिय खाद)  
* मात्रा (प्रति एकड़ या हेक्टेयर)  
* प्रयोग का समय (बेसल, टॉप ड्रेसिंग, फोलियर स्प्रे)  
* सुरक्षा और उपयोग के दिशा-निर्देश  

### 4. कीट और रोग प्रबंधन
फसल में लगने वाले मुख्य **कीट और रोगों** की रोकथाम और नियंत्रण के उपाय बताएं।  
शामिल करें:
* प्रारंभिक लक्षण या चेतावनी संकेत  
* जैविक और रासायनिक नियंत्रण उपाय  
* फसल कटाई से पहले सुरक्षित अंतराल की जानकारी  

### 5. सिंचाई विधि आधारित सुझाव
चयनित सिंचाई विधि के अनुसार अतिरिक्त सुझाव दें:  
* **ड्रिप:** फर्टिगेशन और पाइप क्लॉगिंग से बचने के उपाय  
* **स्प्रिंकलर:** समान पानी वितरण और तेज हवा में फवारनी से बचाव  
* **फ्लड सिंचाई:** जल निकासी और मिट्टी कटाव नियंत्रण के उपाय  

### 6. टिकाऊ खेती के उपाय
पर्यावरण अनुकूल और **सतत कृषि पद्धतियाँ** सुझाएं:  
* फसल चक्र और अंतरफसल प्रणाली अपनाएं  
* जैविक खाद और कंपोस्ट का प्रयोग करें  
* एकीकृत कीट प्रबंधन (IPM) तकनीकें अपनाएं  
* मिट्टी की स्वास्थ्य जांच और संरक्षण करें  
* ऊर्जा और संसाधनों का कुशल उपयोग करें  

---

### Formatting Rules (Important)
- Respond **only in Hindi language**(no English except for chemical or product names if required).  
- Use **Markdown format** with `###` for section headings and `*` for bullet points.  
- Use **bold text** for important terms or actions.  
- Do **not** use HTML tags, numbering, emojis, or special characters.  
- The tone should be **clear, instructional, and farmer-friendly**.  
- Output must display correctly in the `flutter_markdown` widget.
"""
            : currentLanguage == 'mr'
            ? """
You are an AI assistant for a **Smart Agricultural Advisory System**.  
Your task is to provide **detailed, practical, and region-specific recommendations** for Indian farmers.  
Respond strictly in **Marathi language** and in **Markdown format**.  
Do not use HTML tags, emojis, or symbols. Use only `*` for bullet points and `###` for section headings.
If any farm details are missing (like crop, soil, or weather), 
make reasonable assumptions based on typical Indian agricultural conditions 
and provide generalized yet practical recommendations.
---

#  शेताची माहिती
- **पीक:** $selectedCrop  
- **जमीन क्षेत्र:** ${areaController.text} $selectedAreaUnit  
- **सिंचन पद्धत:** $selectedIrrigationMethod  
- **हवामान स्थिती:** $selectedWeather  
- **मातीचा प्रकार:** $selectedSoilType  

---

### 1. योग्य पेरणी व कापणी कालावधी
सध्याच्या हवामान आणि मातीच्या परिस्थितीचा विचार करून पेरणी व कापणीसाठी योग्य वेळ स्पष्टपणे सांगा.  
**पेरणीचा कालावधी**, **अंकुरणाचा काळ**, आणि **कापणीसाठी लागणारा कालावधी** याबद्दल सविस्तर माहिती द्या.

### 2. सिंचन व्यवस्थापन
निवडलेल्या सिंचन पद्धतीनुसार आणि हवामानाच्या परिस्थितीनुसार **पाण्याचे व्यवस्थापन** कसे करावे याचे मार्गदर्शन द्या.  
यात समाविष्ट करा:
* सिंचनाचे वारंवारता आणि कालावधी  
* पाणी बचत तंत्रे (ड्रिप, मल्चिंग, वेळापत्रकनिहाय सिंचन इ.)  
* जास्त किंवा कमी सिंचन टाळण्यासाठी उपाय  

### 3. खत व्यवस्थापन
**पोषक तत्व व्यवस्थापन योजना** सविस्तर द्या, ज्यात समाविष्ट असेल:
* विशिष्ट खते (NPK, सूक्ष्म पोषक, सेंद्रिय खत)  
* प्रमाण (प्रति एकर किंवा हेक्टरनुसार)  
* वापरण्याची वेळ व पद्धत (बेसल, टॉप ड्रेसिंग, फवारणी)  
* सुरक्षित वापरासाठी सूचना  

### 4. कीड व रोग व्यवस्थापन
सध्याच्या परिस्थितीत पिकावर होणाऱ्या प्रमुख **किडी आणि रोगांपासून संरक्षण** कसे करावे याबद्दल माहिती द्या.  
यात समाविष्ट करा:
* लक्षणे किंवा प्रारंभिक इशारे  
* जैविक आणि रासायनिक नियंत्रण उपाय  
* फवारणी आणि कापणी दरम्यानचे सुरक्षित अंतर  

### 5. सिंचन पद्धतीनुसार मार्गदर्शन
निवडलेल्या सिंचन पद्धतीसाठी अतिरिक्त सूचना द्या:  
* **ड्रिप:** फर्टिगेशन आणि पाईप क्लॉगिंग टाळण्यासाठी उपाय  
* **स्प्रिंकलर:** समान पाणी वितरण आणि वाऱ्यामुळे होणारे नुकसान टाळण्यासाठी सूचना  
* **फ्लड सिंचन:** पाण्याचा निचरा आणि मृदस्खलन नियंत्रणासाठी उपाय  

### 6. शाश्वत शेती पद्धती
पर्यावरणपूरक आणि दीर्घकालीन **शाश्वत शेती तंत्रे** सुचवा:  
* पीक फेरपालट आणि आंतरपीक पद्धती  
* सेंद्रिय खत आणि कंपोस्टचा वापर  
* एकात्मिक कीड व्यवस्थापन (IPM)  
* माती आरोग्य तपासणी आणि संरक्षण  
* ऊर्जा आणि संसाधनांचा कार्यक्षम वापर  

---

### Formatting Rules
- Respond **only in Marathi language**(no English except for chemical or product names if required).
- Respond **strictly in Markdown format**.  
- Use **bold** for key terms and important actions.  
- Use `*` for bulleted lists (no numbering).  
- Start each section with `###` headers as shown.  
- Keep the tone **instructional**, **concise**, and **actionable**.  
- Avoid HTML, emojis, or unnecessary symbols.

---
"""
            : """You are an AI assistant for a **Smart Agricultural Advisory System**.  
Your task is to provide **comprehensive, practical, and field-optimized recommendations** for Indian agricultural conditions.  
Respond **strictly in Markdown format** — no HTML tags or extra symbols.
If any farm details are missing (like crop, soil, or weather), 
make reasonable assumptions based on typical Indian agricultural conditions 
and provide generalized yet practical recommendations.

---

#  Farm Details
- **Crop Type:** $selectedCrop  
- **Land Area:** ${areaController.text} $selectedAreaUnit  
- **Irrigation Method:** $selectedIrrigationMethod  
- **Weather Condition:** $selectedWeather  
- **Soil Type:** $selectedSoilType  

---

### 1. Optimal Sowing & Harvesting Periods
Provide clear and specific timing recommendations considering the crop, soil, and current weather conditions.  
Explain the **ideal sowing window**, **expected germination period**, and **harvest timeline** for maximum yield.

### 2. Irrigation Strategy
Describe efficient **water management practices** for the selected irrigation method and weather condition.  
Include:
* Recommended irrigation frequency and duration  
* Water-saving techniques (drip, mulching, scheduling, etc.)  
* Tips for avoiding over- or under-watering  

### 3. Fertilizer Recommendations
Provide a **complete nutrient management plan**, including:
* Specific fertilizers (NPK, micronutrients, and organics)  
* Dosages (per acre or per hectare)  
* Application stages (basal, top dressing, foliar spray)  
* Safety and timing considerations  

### 4. Pest & Disease Management
Give **preventive and control measures** for major pests and diseases that affect the crop under current conditions.  
Include:
* Early warning signs or symptoms to monitor  
* Biological and chemical control options  
* Recommended safe intervals before harvest  

### 5. Irrigation-Specific Considerations
Provide additional tips relevant to the selected irrigation type:  
* For **drip**: mention fertigation and clogging prevention  
* For **sprinkler**: mention uniform coverage and wind management  
* For **flood**: mention drainage and soil erosion control  

### 6. Sustainable Farming Practices
Recommend **eco-friendly and long-term sustainable practices**, such as:
* Crop rotation and intercropping  
* Use of organic manure or compost  
* Integrated Pest Management (IPM)  
* Soil health monitoring and conservation  
* Efficient energy and resource utilization  

---

### Formatting Rules
- Respond **strictly in Markdown format**.  
- Use **bold** for key terms and important actions.  
- Use `*` for bulleted lists (no numbering).  
- Start each section with `###` headers as shown.  
- Keep the tone **instructional**, **concise**, and **actionable**.  
- Avoid HTML, emojis, or unnecessary symbols.""";

    final Map<String, dynamic> requestBody = {
      "contents": [
        {
          "parts": [
            {"text": prompt},
          ],
        },
      ],
      "generationConfig": {
        "temperature": 0.7,
        "topK": 40,
        "topP": 0.95,
        "maxOutputTokens": 4096,
      },
    };

    try {
      final response = await http.post(
        Uri.parse("$apiUrl?key=$apiKey"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          aiResponse =
              responseData['candidates']?.isNotEmpty == true
                  ? responseData['candidates'][0]['content']['parts'][0]['text']
                  : "No response received";
        });
      } else {
        setState(() {
          aiResponse =
              "Error fetching data: ${response.statusCode}\n${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        aiResponse = "Error: $e";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          appLocalizations.cropAdvisory,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryGreen, // Changed from accentPurple
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Updated Header Section
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appLocalizations.getPersonalizedRecommendations,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      appLocalizations.fillDetailsBelow,
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Updated Cards
              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  decoration: cardDecoration,
                  child: _buildCropSelectionSection(appLocalizations),
                ),
              ),
              SizedBox(height: 16),

              // Land Area Input
              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  decoration: cardDecoration,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appLocalizations.landArea,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: areaController,
                                keyboardType: TextInputType.number,
                                decoration: getInputDecoration(
                                  appLocalizations.enterArea,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            _buildAreaUnitDropdown(appLocalizations),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Add this new Irrigation Method Card
              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  decoration: cardDecoration,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appLocalizations.irrigationMethod,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Radio<String>(
                              value: 'list',
                              groupValue: selectedIrrigationMethodType,
                              onChanged: (value) {
                                setState(() {
                                  selectedIrrigationMethodType = value;
                                  selectedIrrigationMethod =
                                      null; // Reset selection when changing method
                                });
                              },
                            ),
                            Text(appLocalizations.selectFromList),
                            Radio<String>(
                              value: 'manual',
                              groupValue: selectedIrrigationMethodType,
                              onChanged: (value) {
                                setState(() {
                                  selectedIrrigationMethodType = value;
                                  selectedIrrigationMethod =
                                      null; // Reset selection when changing method
                                });
                              },
                            ),
                            Text(appLocalizations.enterManually),
                          ],
                        ),
                        if (selectedIrrigationMethodType == 'list')
                          _buildIrrigationDropdown(appLocalizations),
                        if (selectedIrrigationMethodType == 'manual')
                          TextField(
                            decoration: getInputDecoration(
                              appLocalizations.enterIrrigationMethod,
                            ),
                            onChanged: (value) {
                              setState(() => selectedIrrigationMethod = value);
                            },
                          ),
                        SizedBox(height: 8),
                        // Optional: Add irrigation method description
                        if (selectedIrrigationMethod != null &&
                            selectedIrrigationMethod == 'list')
                          Text(
                            getIrrigationDescription(selectedIrrigationMethod!),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Soil Type Card
              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  decoration: cardDecoration,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Localizations.localeOf(context).languageCode == 'hi'
                              ? 'मिट्टी का प्रकार'
                              : Localizations.localeOf(context).languageCode ==
                                  'mr'
                              ? 'मातीचा प्रकार'
                              : 'Soil Type',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildSoilTypeDropdown(appLocalizations),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Weather Conditions Card
              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  decoration: cardDecoration,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appLocalizations.weatherConditions,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Radio<String>(
                              value: 'list',
                              groupValue: selectedWeatherMethodType,
                              onChanged: (value) {
                                setState(() {
                                  selectedWeatherMethodType = value;
                                  selectedWeather =
                                      null; // Reset selection when changing method
                                });
                              },
                            ),
                            Text(appLocalizations.selectFromList),
                            Radio<String>(
                              value: 'manual',
                              groupValue: selectedWeatherMethodType,
                              onChanged: (value) {
                                setState(() {
                                  selectedWeatherMethodType = value;
                                  selectedWeather =
                                      null; // Reset selection when changing method
                                });
                              },
                            ),
                            Text(appLocalizations.enterManually),
                          ],
                        ),
                        if (selectedWeatherMethodType == 'list')
                          _buildWeatherDropdown(appLocalizations),
                        if (selectedWeatherMethodType == 'manual')
                          TextField(
                            decoration: getInputDecoration(
                              appLocalizations.enterWeatherCondition,
                            ),
                            onChanged: (value) {
                              setState(() => selectedWeather = value);
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Updated Submit Button
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isFormValid() ? primaryGreen : Colors.grey[300],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: isFormValid() ? 2 : 0,
                  ),
                  onPressed: isFormValid() ? getGeminiResponse : null,
                  child: Text(
                    appLocalizations.getAdvisory,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              // Updated Response Section
              if (isLoading)
                Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(
                        color: primaryGreen,
                        strokeWidth: 3,
                      ),
                      SizedBox(height: 16),
                      Text(
                        appLocalizations.analyzing,
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                    ],
                  ),
                ),
              if (aiResponse != null)
                Container(
                  decoration: cardDecoration.copyWith(color: Colors.white),
                  padding: standardPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.agriculture_outlined, color: accentGreen),
                          SizedBox(width: 8),
                          Text(
                            appLocalizations.cropAdvisory,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: MarkdownBody(
                          data: aiResponse!,
                          styleSheet: MarkdownStyleSheet(
                            h1: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                              height: 1.5,
                            ),
                            h2: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[600],
                              height: 1.5,
                            ),
                            h3: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.green[500],
                              height: 1.5,
                            ),
                            p: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              color: Colors.black87,
                            ),
                            listBullet: TextStyle(color: Colors.green[700]),
                            strong: TextStyle(
                              color: Colors.green[900],
                              fontWeight: FontWeight.bold,
                            ),
                            blockquote: TextStyle(
                              color: Colors.grey[700],
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                            ),
                            code: TextStyle(
                              backgroundColor: Colors.grey[200],
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                            horizontalRuleDecoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey[300]!,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            blockSpacing: 16.0,
                            listIndent: 24.0,
                          ),
                          selectable: true,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Add this helper method for irrigation descriptions
  String getIrrigationDescription(String method) {
    switch (method) {
      case 'drip':
        return 'Water-efficient method that delivers water directly to plant roots through a network of pipes';
      case 'sprinkler':
        return 'Overhead irrigation that simulates rainfall, suitable for many types of crops';
      case 'flood':
        return 'Traditional method of flooding the entire field, commonly used in rice cultivation';
      case 'furrow':
        return 'Water flows through small channels between crop rows, good for row crops';
      case 'centerPivot':
        return 'Mechanized sprinkler system that rotates around a central pivot, ideal for large fields';
      case 'subsurfaceDrip':
        return 'Underground drip system that reduces water evaporation and promotes deep root growth';
      case 'microSprinkler':
        return 'Low-pressure sprinklers providing uniform water distribution for orchards and vegetables';
      case 'surface':
        return 'Traditional method where water flows over the soil surface by gravity';
      case 'basin':
        return 'Method where level areas are flooded with water, suitable for orchards';
      case 'borderStrip':
        return 'Long rectangular strips with raised borders for controlled flooding';
      default:
        return '';
    }
  }

  Widget _buildCropSelectionSection(AppLocalizations appLocalizations) {
    return Padding(
      padding: standardPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.agriculture, color: accentGreen),
              SizedBox(width: 8),
              Text(
                appLocalizations.cropSelection,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Radio<String>(
                value: 'list',
                groupValue: selectedCropMethod,
                onChanged: (value) {
                  setState(() {
                    selectedCropMethod = value;
                    selectedCrop = null; // Reset selection when changing method
                  });
                },
              ),
              Text(appLocalizations.selectFromList),
              Radio<String>(
                value: 'manual',
                groupValue: selectedCropMethod,
                onChanged: (value) {
                  setState(() {
                    selectedCropMethod = value;
                    selectedCrop = null; // Reset selection when changing method
                  });
                },
              ),
              Text(appLocalizations.enterManually),
            ],
          ),
          if (selectedCropMethod == 'list')
            _buildCropDropdown(appLocalizations),
          if (selectedCropMethod == 'manual')
            TextField(
              decoration: getInputDecoration(appLocalizations.enterCropName),
              onChanged: (value) {
                setState(() => selectedCrop = value);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildCropDropdown(AppLocalizations localizations) {
    return DropdownButtonFormField<String>(
      decoration: getInputDecoration(localizations.selectCrop),
      hint: Text(localizations.selectCrop),
      value: selectedCrop,
      items:
          crops.map((String cropKey) {
            // Use switch statement instead of reflection
            String translation = _getCropTranslation(localizations, cropKey);
            return DropdownMenuItem(value: cropKey, child: Text(translation));
          }).toList(),
      onChanged: (value) {
        setState(() => selectedCrop = value);
      },
    );
  }

  Widget _buildIrrigationDropdown(AppLocalizations localizations) {
    return DropdownButtonFormField<String>(
      decoration: getInputDecoration(localizations.selectIrrigationMethod),
      hint: Text(localizations.selectIrrigationMethod),
      value: selectedIrrigationMethod,
      items:
          irrigationMethods.map((String methodKey) {
            String translation = _getIrrigationTranslation(
              localizations,
              methodKey,
            );
            return DropdownMenuItem(value: methodKey, child: Text(translation));
          }).toList(),
      onChanged: (value) {
        setState(() => selectedIrrigationMethod = value);
      },
    );
  }

  Widget _buildWeatherDropdown(AppLocalizations localizations) {
    return DropdownButtonFormField<String>(
      decoration: getInputDecoration(localizations.selectWeatherCondition),
      hint: Text(localizations.selectWeatherCondition),
      value: selectedWeather,
      items:
          weatherConditions.map((String weatherKey) {
            String translation = _getWeatherTranslation(
              localizations,
              weatherKey,
            );
            return DropdownMenuItem(
              value: weatherKey,
              child: Text(translation),
            );
          }).toList(),
      onChanged: (value) {
        setState(() => selectedWeather = value);
      },
    );
  }

  Widget _buildAreaUnitDropdown(AppLocalizations localizations) {
    return DropdownButton<String>(
      value: selectedAreaUnit,
      items:
          areaUnits.map((String unitKey) {
            String translation = _getAreaUnitTranslation(
              localizations,
              unitKey,
            );
            return DropdownMenuItem(value: unitKey, child: Text(translation));
          }).toList(),
      onChanged: (value) {
        setState(() => selectedAreaUnit = value!);
      },
    );
  }

  // Helper methods for translations
  String _getCropTranslation(AppLocalizations localizations, String key) {
    switch (key) {
      case 'wheat':
        return localizations.cropsWheat;
      case 'rice':
        return localizations.cropsRice;
      case 'cotton':
        return localizations.cropsCotton;
      case 'sugarcane':
        return localizations.cropsSugarcane;
      case 'maize':
        return localizations.cropsMaize;
      case 'soybean':
        return localizations.cropsSoybean;
      case 'potato':
        return localizations.cropsPotato;
      case 'tomato':
        return localizations.cropsTomato;
      case 'onion':
        return localizations.cropsOnion;
      case 'groundnut':
        return localizations.cropsGroundnut;
      case 'chickpea':
        return localizations.cropsChickpea;
      case 'mustard':
        return localizations.cropsMustard;
      case 'sunflower':
        return localizations.cropsSunflower;
      case 'turmeric':
        return localizations.cropsTurmeric;
      case 'ginger':
        return localizations.cropsGinger;
      case 'garlic':
        return localizations.cropsGarlic;
      case 'chili':
        return localizations.cropsChili;
      case 'cauliflower':
        return localizations.cropsCauliflower;
      case 'cabbage':
        return localizations.cropsCabbage;
      case 'carrot':
        return localizations.cropsCarrot;
      case 'peas':
        return localizations.cropsPeas;
      case 'beans':
        return localizations.cropsBeans;
      case 'cucumber':
        return localizations.cropsCucumber;
      case 'eggplant':
        return localizations.cropsEggplant;
      case 'okra':
        return localizations.cropsOkra;
      default:
        return key;
    }
  }

  String _getIrrigationTranslation(AppLocalizations localizations, String key) {
    switch (key) {
      case 'drip':
        return localizations.irrigationTypesDrip;
      case 'sprinkler':
        return localizations.irrigationTypesSprinkler;
      case 'flood':
        return localizations.irrigationTypesFlood;
      case 'furrow':
        return localizations.irrigationTypesFurrow;
      case 'centerPivot':
        return localizations.irrigationTypesCenterPivot;
      case 'subsurfaceDrip':
        return localizations.irrigationTypesSubsurfaceDrip;
      case 'microSprinkler':
        return localizations.irrigationTypesMicroSprinkler;
      case 'surface':
        return localizations.irrigationTypesSurface;
      case 'basin':
        return localizations.irrigationTypesBasin;
      case 'borderStrip':
        return localizations.irrigationTypesBorderStrip;
      default:
        return key;
    }
  }

  String _getWeatherTranslation(AppLocalizations localizations, String key) {
    switch (key) {
      case 'sunny':
        return localizations.weatherTypesSunny;
      case 'partlyCloudy':
        return localizations.weatherTypesPartlyCloudy;
      case 'overcast':
        return localizations.weatherTypesOvercast;
      case 'lightRain':
        return localizations.weatherTypesLightRain;
      case 'heavyRain':
        return localizations.weatherTypesHeavyRain;
      case 'thunderstorm':
        return localizations.weatherTypesThunderstorm;
      case 'windy':
        return localizations.weatherTypesWindy;
      case 'hotHumid':
        return localizations.weatherTypesHotHumid;
      case 'coldDry':
        return localizations.weatherTypesColdDry;
      case 'foggy':
        return localizations.weatherTypesFoggy;
      case 'hazy':
        return localizations.weatherTypesHazy;
      case 'drought':
        return localizations.weatherTypesDrought;
      case 'highTemp':
        return localizations.weatherTypesHighTemp;
      case 'lowTemp':
        return localizations.weatherTypesLowTemp;
      default:
        return key;
    }
  }

  String _getSoilTypeTranslation(AppLocalizations localizations, String key) {
    final String currentLanguage = Localizations.localeOf(context).languageCode;

    // Hindi translations
    if (currentLanguage == 'hi') {
      switch (key) {
        case 'loam':
          return 'दोमट मिट्टी';
        case 'clayLoam':
          return 'चिकनी दोमट मिट्टी';
        case 'sandyLoam':
          return 'बलुई दोमट मिट्टी';
        case 'siltLoam':
          return 'गाद दोमट मिट्टी';
        case 'clay':
          return 'चिकनी मिट्टी';
        case 'sandy':
          return 'बलुई मिट्टी';
        case 'silty':
          return 'गाद मिट्टी';
        case 'peaty':
          return 'पीट मिट्टी';
        case 'chalky':
          return 'चूना मिट्टी';
        case 'saline':
          return 'लवणीय मिट्टी';
        case 'alluvial':
          return 'जलोढ़ मिट्टी';
        case 'redSoil':
          return 'लाल मिट्टी';
        case 'blackSoil':
          return 'काली मिट्टी';
        case 'laterite':
          return 'लेटराइट मिट्टी';
        default:
          return key;
      }
    }
    // Marathi translations
    else if (currentLanguage == 'mr') {
      switch (key) {
        case 'loam':
          return 'मुरमाड माती';
        case 'clayLoam':
          return 'चिकणमाती मुरमाड';
        case 'sandyLoam':
          return 'वाळूमिश्रित मुरमाड';
        case 'siltLoam':
          return 'गाळमिश्रित मुरमाड';
        case 'clay':
          return 'चिकणमाती';
        case 'sandy':
          return 'वाळूमिश्रित माती';
        case 'silty':
          return 'गाळमिश्रित माती';
        case 'peaty':
          return 'सेंद्रिय माती';
        case 'chalky':
          return 'चुनखडीयुक्त माती';
        case 'saline':
          return 'क्षारयुक्त माती';
        case 'alluvial':
          return 'गाळाची माती';
        case 'redSoil':
          return 'लाल माती';
        case 'blackSoil':
          return 'काळी माती';
        case 'laterite':
          return 'लॅटेराइट माती';
        default:
          return key;
      }
    }
    // English - convert key to title case for display
    else {
      String prettifiedKey =
          key
              .replaceAllMapped(
                RegExp(r'([A-Z])|(\b\w)'),
                (Match m) => ' ${m[0]?.toUpperCase()}',
              )
              .trim();
      return prettifiedKey;
    }
  }

  Widget _buildSoilTypeDropdown(AppLocalizations localizations) {
    return DropdownButtonFormField<String>(
      decoration: getInputDecoration('Select Soil Type'),
      hint: Text('Select Soil Type'),
      value: selectedSoilType,
      items:
          soilTypes.map((String soilKey) {
            String translation = _getSoilTypeTranslation(
              localizations,
              soilKey,
            );
            return DropdownMenuItem(value: soilKey, child: Text(translation));
          }).toList(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select soil type';
        }
        return null;
      },
      onChanged: (value) {
        setState(() => selectedSoilType = value);
      },
    );
  }

  String _getAreaUnitTranslation(AppLocalizations localizations, String key) {
    switch (key) {
      case 'acres':
        return localizations.areaUnitsAcres;
      case 'hectares':
        return localizations.areaUnitsHectares;
      case 'squareMeters':
        return localizations.areaUnitsSquareMeters;
      case 'squareFeet':
        return localizations.areaUnitsSquareFeet;
      case 'guntha':
        return localizations.areaUnitsGuntha;
      case 'bigha':
        return localizations.areaUnitsBigha;
      default:
        return key;
    }
  }
}

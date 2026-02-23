import 'package:flutter/material.dart';
import 'package:agrow/l10n/app_localizations.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PesticideScreen extends StatefulWidget {
  @override
  _PesticideScreenState createState() => _PesticideScreenState();
}

class _PesticideScreenState extends State<PesticideScreen> {
  // Helper function for platform-aware image loading
  String corsSafeUrl(String url) {
    final encoded = Uri.encodeFull(url);
    final corsProxyUrl = dotenv.env['CORS_PROXY_URL'] ?? '';
    // Use CORS proxy only on web platform
    return kIsWeb && corsProxyUrl.isNotEmpty
        ? "$corsProxyUrl/?url=$encoded"
        : url;
  }

  String? selectedIssue;
  String? enteredIssue;
  String? selectedCropType;
  String? enteredCropType;
  String? selectedPestType;
  String? enteredPestType;
  String? selectedRegion;
  String? enteredRegion;
  String? selectedPlantingMonth;
  String? enteredPlantingMonth;
  String? selectedSoilType;
  String? enteredSoilType;
  String? selectedWeatherCondition;
  String? enteredWeatherCondition;
  String? selectedIrrigationMethod;
  String? enteredIrrigationMethod;
  String? selectedGrowthStage;
  String? enteredGrowthStage;
  String extraInfo = '';
  final _formKey = GlobalKey<FormState>();
  int charCount = 0;

  // Add selection method variables
  String issueSelectionMethod = 'dropdown';
  String cropSelectionMethod = 'dropdown';
  String pestSelectionMethod = 'dropdown';
  String regionSelectionMethod = 'dropdown';
  String monthSelectionMethod = 'dropdown';
  String soilTypeSelectionMethod = 'dropdown';
  String weatherConditionSelectionMethod = 'dropdown';
  String irrigationMethodSelectionMethod = 'dropdown';
  String growthStageSelectionMethod = 'dropdown';

  String _getInstructionPrompt(BuildContext context) {
    final String currentLanguage = Localizations.localeOf(context).languageCode;

    if (currentLanguage == 'hi') {
      return """You are an AI assistant for a Smart Agricultural Advisory System.

Your role is to analyze the given pest, crop, and regional details and any other details, 
and provide detailed, structured agricultural guidance in Markdown format.

# Output Language
All responses must be written entirely in **Hindi**, including section headers.  
However, the **pesticide or remedy name** should appear in **both Hindi and English (bold)** on the first line.

# Missing or Null Values Handling
If any provided value (like pest, crop, region, month, or extra info) is **null, blank, or unavailable**,  
you must:
- Ignore that missing field gracefully.
- Do **not** mention it directly in the response.
- Provide a **generalized, context-appropriate** answer instead.  
  For example:  
  - If the pest is missing → give a general pest management guide for that crop or season.  
  - If the crop is missing → provide general advice based on pest type and region.  
  - If region is missing → give recommendations suitable for **Indian climatic conditions** in general.  
  - If month is missing → suggest timing based on the **crop’s general growth stages**.  
  - If multiple fields are missing → give a **broad but practical agricultural advisory** relevant to the available inputs.  

Do not explicitly say “value not provided” — instead, naturally generalize your response.

# Formatting Rules
- Respond in **valid Markdown** syntax.
- Use `**` for bold text, `###` for section headers, and `---` for dividers.
- Do not include HTML tags or code blocks.
- Write in clear, natural Hindi suitable for displaying in a Flutter `flutter_markdown` widget.
- Avoid Markdown tables, images, or links unless explicitly required.

# Response Structure (Markdown Format)

Your response must follow **this exact structure and section order**, but all section titles should be in Hindi:

**<कीटनाशक या उपचार का नाम>**

---

### 1. अनुशंसित कीटनाशक या उपचार
बताएँ कि कौन सा कीटनाशक या उपचार इस फसल–कीट स्थिति के लिए उपयुक्त है,  
और यह क्यों प्रभावी है।

### 2. कीटनाशक छिड़काव के दौरान सावधानियाँ
किसानों और खेत में काम करने वाले मजदूरों को छिड़काव के समय कौन-कौन सी सावधानियाँ रखनी चाहिए।

### 3. प्राकृतिक या जैविक विकल्प
यदि उपलब्ध हों तो जैविक, हर्बल या पर्यावरण-अनुकूल विकल्प बताएं।

### 4. भविष्य के लिए रोकथाम के उपाय
फसल प्रबंधन, मिट्टी सुधार और खेत की स्वच्छता से संबंधित उपाय बताएं,  
जिससे यह समस्या दोबारा न हो।

### 5. कीटनाशक लगाने का सर्वोत्तम समय
दिन के किस समय या फसल के किस विकास चरण में कीटनाशक का प्रयोग सबसे अच्छा रहेगा।

### 6. एकीकृत कीट प्रबंधन (IPM) के साथ समन्वय
इस विधि को अन्य सांस्कृतिक, जैविक या यांत्रिक नियंत्रण तरीकों के साथ कैसे जोड़ा जा सकता है।

### 7. मात्रा और प्रयोग की विधि
कीटनाशक की प्रति लीटर या किलोग्राम मात्रा स्पष्ट रूप से बताएं,  
और इसके छिड़काव की सही विधि समझाएं।

---

Keep the **pesticide or remedy name in both Hindi and English**,  
but write everything else — headers and content — in **Hindi only**.  
Ensure Markdown syntax is valid for direct rendering in Flutter using `flutter_markdown`.

समस्या का प्रकार: ${issueSelectionMethod == 'dropdown' ? selectedIssue : enteredIssue}  
फसल का प्रकार: ${cropSelectionMethod == 'dropdown' ? selectedCropType : enteredCropType}  
कीट का प्रकार: ${pestSelectionMethod == 'dropdown' ? selectedPestType : enteredPestType}  
क्षेत्र: ${regionSelectionMethod == 'dropdown' ? selectedRegion : enteredRegion}  
रोपण माह: ${monthSelectionMethod == 'dropdown' ? selectedPlantingMonth : enteredPlantingMonth}  
मिट्टी का प्रकार: ${soilTypeSelectionMethod == 'dropdown' ? selectedSoilType : enteredSoilType}  
मौसम की स्थिति: ${weatherConditionSelectionMethod == 'dropdown' ? selectedWeatherCondition : enteredWeatherCondition}  
सिंचाई की विधि: ${irrigationMethodSelectionMethod == 'dropdown' ? selectedIrrigationMethod : enteredIrrigationMethod}  
फसल की वृद्धि अवस्था: ${growthStageSelectionMethod == 'dropdown' ? selectedGrowthStage : enteredGrowthStage}
अतिरिक्त जानकारी: $extraInfo""";
    } else if (currentLanguage == 'mr') {
      return """You are an AI assistant for a Smart Agricultural Advisory System.

Your role is to analyze the given pest, crop, and regional details and any other details, 
and provide detailed, structured agricultural guidance in Markdown format.

# Output Language
All responses must be written entirely in **Marathi**, including section headers.  
However, the **pesticide or remedy name** should appear in **both Marathi and English (bold)** on the first line.

# Missing or Null Values Handling
If any provided value (like pest, crop, region, month, or extra info) is **null, blank, or unavailable**,  
you must:
- Ignore that missing field gracefully.
- Do **not** mention it directly in the response.
- Provide a **generalized, context-appropriate** answer instead.  
  For example:  
  - If the pest is missing → give a general pest management guide for that crop or season.  
  - If the crop is missing → provide general advice based on pest type and region.  
  - If region is missing → give recommendations suitable for **Indian climatic conditions** in general.  
  - If month is missing → suggest timing based on the **crop’s general growth stages**.  
  - If multiple fields are missing → give a **broad but practical agricultural advisory** relevant to the available inputs.  

Do not explicitly say “value not provided” — instead, naturally generalize your response.

# Formatting Rules
- Respond in **valid Markdown** syntax.
- Use `**` for bold text, `###` for section headers, and `---` for dividers.
- Do not include HTML tags or code blocks.
- Write in clear, simple Marathi suitable for displaying in a Flutter `flutter_markdown` widget.
- Avoid Markdown tables, images, or links unless explicitly required.

# Response Structure (Markdown Format)

Your response must follow **this exact structure and section order**, but all section titles should be in Marathi:

**<कीटकनाशक किंवा उपायाचे नाव>**

---

### 1. शिफारस केलेले कीटकनाशक किंवा उपाय
दिलेल्या पिक आणि कीटक परिस्थितीसाठी कोणते कीटकनाशक किंवा उपाय योग्य आहे,  
आणि ते का प्रभावी आहे हे स्पष्ट करा.

### 2. कीटकनाशक फवारणी दरम्यान घ्यावयाच्या काळजी
शेतकरी आणि शेतमजुरांनी फवारणी करताना कोणती काळजी घ्यावी.

### 3. नैसर्गिक किंवा सेंद्रिय पर्याय
उपलब्ध असल्यास जैविक, हर्बल किंवा पर्यावरणपूरक पर्याय सांगा.

### 4. भविष्यासाठी प्रतिबंधक उपाय
माती व्यवस्थापन, पीक पद्धती आणि शेत स्वच्छता यासंबंधित उपाय सुचवा,  
जेणेकरून ही समस्या पुन्हा उद्भवणार नाही.

### 5. कीटकनाशक फवारणीचा सर्वोत्तम वेळ
दिवसातील कोणत्या वेळेस किंवा पिकाच्या कोणत्या वाढीच्या टप्प्यावर फवारणी करणे योग्य ठरेल हे सांगा.

### 6. एकात्मिक कीटक व्यवस्थापन (IPM) सोबत समन्वय
ही पद्धत सांस्कृतिक, जैविक किंवा यांत्रिक नियंत्रण तंत्रांसोबत कशी एकत्रित करता येईल ते स्पष्ट करा.

### 7. मात्रा आणि फवारणीची पद्धत
कीटकनाशकाची प्रति लिटर/किलो मात्रा स्पष्टपणे लिहा,  
आणि फवारणीची योग्य पद्धत समजावून सांगा.

---

Keep the **pesticide or remedy name in both Marathi and English**,  
but write everything else — headers and content — in **Marathi only**.  
Ensure Markdown syntax is valid for direct rendering in Flutter using `flutter_markdown`.

समस्येचा प्रकार: ${issueSelectionMethod == 'dropdown' ? selectedIssue : enteredIssue}  
पिकाचा प्रकार: ${cropSelectionMethod == 'dropdown' ? selectedCropType : enteredCropType}  
कीटकाचा प्रकार: ${pestSelectionMethod == 'dropdown' ? selectedPestType : enteredPestType}  
प्रदेश: ${regionSelectionMethod == 'dropdown' ? selectedRegion : enteredRegion}  
लागवड महिना: ${monthSelectionMethod == 'dropdown' ? selectedPlantingMonth : enteredPlantingMonth}  
मातीचा प्रकार: ${soilTypeSelectionMethod == 'dropdown' ? selectedSoilType : enteredSoilType}  
हवामानाची स्थिती: ${weatherConditionSelectionMethod == 'dropdown' ? selectedWeatherCondition : enteredWeatherCondition}  
सिंचन पद्धत: ${irrigationMethodSelectionMethod == 'dropdown' ? selectedIrrigationMethod : enteredIrrigationMethod}  
पिकाची वाढीची अवस्था: ${growthStageSelectionMethod == 'dropdown' ? selectedGrowthStage : enteredGrowthStage}
अतिरिक्त माहिती: $extraInfo
""";
    } else {
      return """You are an AI assistant for a Smart Agricultural Advisory System. 

Your role is to analyze the given pest, crop, and regional details and any other details, 
and provide detailed, structured agricultural guidance in Markdown format. 

# Missing or Null Values Handling
If any provided value (like pest, crop, region, month, or extra info) is **null, blank, or unavailable**,  
you must:
- Ignore that missing field gracefully.
- Do **not** mention it directly in the response.
- Provide a **generalized, context-appropriate** answer instead.  
  For example:  
  - If the pest is missing → give a general pest management guide for that crop or season.  
  - If the crop is missing → provide general advice based on pest type and region.  
  - If region is missing → give recommendations suitable for **Indian climatic conditions** in general.  
  - If month is missing → suggest timing based on the **crop’s general growth stages**.  
  - If multiple fields are missing → give a **broad but practical agricultural advisory** relevant to the available inputs.  

Do not explicitly say “value not provided” — instead, naturally generalize your response.

# Formatting Rules
- Respond in **valid Markdown** syntax.
- Use `**` for bold text, `###` for section headers, and `*` for bullet points.
- Use `---` for dividers between major sections.
- Never include HTML tags or code blocks.
- Write in clear, readable English suitable for displaying in a Flutter `flutter_markdown` widget.
- Avoid Markdown tables, images, or links unless explicitly required.

# Response Structure (Markdown Format)

Your response must follow **this exact structure and section order**:

**<Pesticide or Remedy Name>**

---

### 1. Recommended Pesticide or Remedy
Choose the appropriate header label based on context:
- If the suggested treatment is chemical-based, use **"Recommended Pesticide"**.
- If it is natural, organic, or biological, use **"Recommended Remedy"**.
Write the name of the pesticide or remedy **directly after the colon** in the same line.
Do not include both terms or any extra words.

Example:
### 1. Recommended Pesticide: Carbendazim 50% WP
or
### 1. Recommended Remedy: Neem Oil

Then, in the next lines, explain briefly what it targets and why it’s suitable for this pest–crop scenario.


### 2. Safety Precautions While Applying Pesticides
List all important safety measures for farmers and field workers during application.

### 3. Natural or Organic Alternatives
Include biological, herbal, or eco-friendly substitutes if available.

### 4. Preventive Measures for Future
Suggest soil management, cultural, and hygiene practices to prevent recurrence.

### 5. Best Time for Pesticide Application
Specify the optimal time of day, growth stage, or environmental condition for best results.

### 6. Integration with Other Pest Management Practices (IPM)
Explain how to combine this method with cultural, biological, or mechanical control strategies.

### 7. Dosage and Method of Application
State clear dosage per liter/kg and describe proper application methods.

---

Keep the language simple and instructional.
Ensure Markdown syntax is valid so it can be rendered directly in Flutter using the `flutter_markdown` widget.

Issue Type: ${issueSelectionMethod == 'dropdown' ? selectedIssue : enteredIssue}
Crop Type: ${cropSelectionMethod == 'dropdown' ? selectedCropType : enteredCropType}
Pest Type: ${pestSelectionMethod == 'dropdown' ? selectedPestType : enteredPestType}
Region: ${regionSelectionMethod == 'dropdown' ? selectedRegion : enteredRegion}
Planting Month: ${monthSelectionMethod == 'dropdown' ? selectedPlantingMonth : enteredPlantingMonth}
Soil Type: ${soilTypeSelectionMethod == 'dropdown' ? selectedSoilType : enteredSoilType}
Weather Conditions: ${weatherConditionSelectionMethod == 'dropdown' ? selectedWeatherCondition : enteredWeatherCondition}
Irrigation Method: ${irrigationMethodSelectionMethod == 'dropdown' ? selectedIrrigationMethod : enteredIrrigationMethod}
Crop Growth Stage: ${growthStageSelectionMethod == 'dropdown' ? selectedGrowthStage : enteredGrowthStage}

Additional Information: $extraInfo""";
    }
  }

  // Add color constants at the top of the class
  final Color primaryGreen = Color(0xFFBAD8B6); // Light green
  final Color secondaryGreen = Color(0xFFE1EACD); // Very light green
  final Color backgroundColor = Color(0xFFF9F6E6); // Cream/beige
  final Color accentPurple = Color(0xFF8D77AB); // Purple

  // Add these variables with your other state variables
  String? aiResponse;
  bool isLoading = false;
  late final String apiKey;
  late final String apiUrl;
  String? firstLine;
  List<String> searchImages = [];
  late final String cseApiKey;
  late final String cseEngineId;
  late final String cseApiUrl;
  List<String> validImages = [];

  @override
  void initState() {
    super.initState();
    apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
    apiUrl = dotenv.env['GEMINI_API_URL'] ?? '';
    cseApiKey = dotenv.env['CSE_API_KEY'] ?? '';
    cseEngineId = dotenv.env['CSE_ENGINE_ID'] ?? '';
    cseApiUrl = dotenv.env['CSE_API_URL'] ?? '';
  }

  // Add this at the top of the class with other controller declarations
  final TextEditingController _additionalInfoController =
      TextEditingController();

  Widget _buildSelectionSection({
    required String title,
    required String description,
    required String selectionMethod,
    required Function(String) onSelectionMethodChanged,
    required String? selectedValue,
    required Function(String?) onDropdownChanged,
    required Function(String) onTextChanged,
    required List<String> items,
    required String textFieldLabel,
    required String dropdownLabel,
  }) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Radio<String>(
                        value: 'dropdown',
                        groupValue: selectionMethod,
                        onChanged: (value) => onSelectionMethodChanged(value!),
                        activeColor: Color(0xFF8BC34A),
                      ),
                      Text(appLocalizations.selectFromList),
                      SizedBox(width: 16),
                      Radio<String>(
                        value: 'text',
                        groupValue: selectionMethod,
                        onChanged: (value) => onSelectionMethodChanged(value!),
                        activeColor: Color(0xFF8BC34A),
                      ),
                      Text(appLocalizations.enterManually),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            if (selectionMethod == 'dropdown')
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: dropdownLabel,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                value: selectedValue,
                items:
                    items.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                onChanged: onDropdownChanged,
              )
            else
              TextFormField(
                decoration: InputDecoration(
                  labelText: textFieldLabel,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: onTextChanged,
              ),
          ],
        ),
      ),
    );
  }

  List<String> getIssues(AppLocalizations appLocalizations) => [
    appLocalizations.issueTypePests,
    appLocalizations.issueTypeDiseases,
    appLocalizations.issueTypeWeeds,
    appLocalizations.issueTypeNutrient,
    appLocalizations.issueTypeOther,
  ];

  List<String> getCropTypes(AppLocalizations appLocalizations) => [
    appLocalizations.cropsWheat, // गहू / गेहूं
    appLocalizations.cropsRice, // भात / धान
    appLocalizations.cropsCotton, // कापूस / कपास
    appLocalizations.cropsSugarcane, // ऊस / गन्ना
    appLocalizations.cropsMaize, // मका / मक्का
    appLocalizations.cropsSoybean, // सोयाबीन
    appLocalizations.cropsOnion, // कांदा / प्याज
    appLocalizations.cropsChickpea, // हरभरा / चना
    appLocalizations.cropsPotato, // बटाटा / आलू
    appLocalizations.cropsGroundnut, // भुईमूग / मूंगफली
    appLocalizations.cropsTomato, // टोमॅटो / टमाटर
    appLocalizations.cropsMustard, // मोहरी / सरसों
    appLocalizations.cropsSunflower, // सूर्यफूल / सूरजमुखी
    appLocalizations.cropsTurmeric, // हळद / हल्दी
    appLocalizations.cropsGinger, // आले / अदरक
    appLocalizations.cropsGarlic, // लसूण / लहसुन
    appLocalizations.cropsChili, // मिरची / मिर्च
    appLocalizations.cropsCauliflower, // फुलकोबी / फूलगोभी
    appLocalizations.cropsCabbage, // कोबी / पत्तागोभी
    appLocalizations.cropsCarrot, // गाजर
    appLocalizations.cropsPeas, // वाटाणा / मटर
    appLocalizations.cropsBeans, // शेंगा / फलियां
    appLocalizations.cropsCucumber, // काकडी / खीरा
    appLocalizations.cropsEggplant, // वांगे / बैंगन
    appLocalizations.cropsOkra, // भेंडी / भिंडी
  ];

  List<String> getPestTypes(AppLocalizations appLocalizations) => [
    appLocalizations.pestsAphids, // माहूर / माहू
    appLocalizations.pestsWeevils, // घोगडा / घुन
    appLocalizations.pestsBollworm, // बोंड अळी / सुंडी
    appLocalizations.pestsStemborer, // खोड किडा / तना छेदक
    appLocalizations.pestsArmyworm, // लष्करी अळी / सेना कीट
    appLocalizations.pestsLeafhopper, // तुडतुडे / चिटका
    appLocalizations.pestsWhitefly, // पांढरी माशी / सफेद मक्खी
    appLocalizations.pestsGrasshopper, // टोळ / टिड्डा
    appLocalizations.pestsThrips, // फुलकिडे / थ्रिप्स
    appLocalizations.pestsMites, // कोळी / माइट्स
  ];

  List<String> getRegions(AppLocalizations appLocalizations) => [
    appLocalizations.regionsKonkan, // कोकण
    appLocalizations.regionsWestern, // पश्चिम महाराष्ट्र
    appLocalizations.regionsMarathwada, // मराठवाडा
    appLocalizations.regionsVidarbha, // विदर्भ
    appLocalizations.regionsNorthern, // उत्तर महाराष्ट्र
    appLocalizations.regionsNagpur, // नागपूर
    appLocalizations.regionsNashik, // नाशिक
    appLocalizations.regionsPune, // पुणे
    appLocalizations.regionsAmravati, // अमरावती
    appLocalizations.regionsLatur, // लातूर
  ];

  List<String> getMonths(AppLocalizations appLocalizations) => [
    appLocalizations.monthsJanuary, // जनवरी / जानेवारी
    appLocalizations.monthsFebruary, // फरवरी / फेब्रुवारी
    appLocalizations.monthsMarch, // मार्च
    appLocalizations.monthsApril, // अप्रैल / एप्रिल
    appLocalizations.monthsMay, // मई / मे
    appLocalizations.monthsJune, // जून
    appLocalizations.monthsJuly, // जुलाई / जुलै
    appLocalizations.monthsAugust, // अगस्त / ऑगस्ट
    appLocalizations.monthsSeptember, // सितंबर / सप्टेंबर
    appLocalizations.monthsOctober, // अक्टूबर / ऑक्टोबर
    appLocalizations.monthsNovember, // नवंबर / नोव्हेंबर
    appLocalizations.monthsDecember, // दिसंबर / डिसेंबर
  ];

  List<String> getSoilTypes(AppLocalizations appLocalizations) => [
    appLocalizations.soilClay,
    appLocalizations.soilSandy,
    appLocalizations.soilLoamy,
    appLocalizations.soilSilt,
    appLocalizations.soilBlackCotton,
    appLocalizations.soilRed,
    appLocalizations.soilAlluvial,
  ];

  List<String> getWeatherConditions(AppLocalizations appLocalizations) => [
    appLocalizations.weatherSunny,
    appLocalizations.weatherCloudy,
    appLocalizations.weatherRainy,
    appLocalizations.weatherHotHumid,
    appLocalizations.weatherCold,
    appLocalizations.weatherWindy,
    appLocalizations.weatherDrought,
  ];

  List<String> getIrrigationMethods(AppLocalizations appLocalizations) => [
    appLocalizations.irrigationDrip,
    appLocalizations.irrigationSprinkler,
    appLocalizations.irrigationFlood,
    appLocalizations.irrigationFurrow,
    appLocalizations.irrigationBasin,
    appLocalizations.irrigationRainfed,
  ];

  List<String> getGrowthStages(AppLocalizations appLocalizations) => [
    appLocalizations.stageSeedling,
    appLocalizations.stageVegetative,
    appLocalizations.stageFlowering,
    appLocalizations.stageFruiting,
    appLocalizations.stageMaturity,
    appLocalizations.stageHarvest,
  ];

  // Modify the fetchImages method to include headers and better error handling
  Future<void> fetchImages(String query) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$cseApiUrl?key=$cseApiKey'
          '&cx=$cseEngineId'
          '&q=${Uri.encodeComponent(query)}'
          '&searchType=image'
          '&num=4',
        ),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data != null && data['items'] != null) {
          final items = data['items'] as List?;
          if (items != null) {
            setState(() {
              searchImages =
                  items
                      .where((item) => item != null && item['link'] != null)
                      .map((item) => item['link'] as String)
                      .toList();
              validImages = []; // Reset valid images
            });
          }
        }
      }
    } catch (e) {
      print('Error fetching images: $e');
    }
  }

  // Modify getGeminiResponse to call fetchImages after getting the first line
  Future<void> getGeminiResponse() async {
    setState(() {
      isLoading = true;
      aiResponse = null;
      firstLine = null; // Clear first line
      searchImages = []; // Clear previous images
    });

    try {
      final String prompt = _getInstructionPrompt(context);

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

      final response = await http.post(
        Uri.parse("$apiUrl?key=$apiKey"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode != 200) {
        setState(() {
          aiResponse =
              "Error: API request failed with status ${response.statusCode}";
          firstLine = null;
        });
        return;
      }

      final Map<String, dynamic> responseJson = jsonDecode(response.body);

      if (!responseJson.containsKey('candidates') ||
          responseJson['candidates'] == null ||
          (responseJson['candidates'] as List).isEmpty) {
        setState(() {
          aiResponse = "Error: No response received from AI";
          firstLine = null;
        });
        return;
      }

      final Map<String, dynamic> firstCandidate = responseJson['candidates'][0];

      // Even if MAX_TOKENS, we'll still show the content we received
      // Get the content map
      final Map<String, dynamic>? content = firstCandidate['content'];
      if (content == null) {
        setState(() {
          aiResponse = "Error: Response content is missing";
          firstLine = null;
        });
        return;
      }

      // Get the parts list
      final List<dynamic>? parts = content['parts'];
      if (parts == null || parts.isEmpty) {
        setState(() {
          aiResponse = "Error: Response parts are missing";
          firstLine = null;
        });
        return;
      }

      // Get the text from the first part
      final Map<String, dynamic> firstPart = parts[0];
      final String? text = firstPart['text'];
      if (text == null || text.isEmpty) {
        setState(() {
          aiResponse = "Error: Response text is empty";
          firstLine = null;
        });
        return;
      }

      // Process valid response
      setState(() {
        aiResponse = text;
        firstLine = text
            .split('\n')
            .firstWhere((line) => line.trim().isNotEmpty, orElse: () => '');
      });

      if (firstLine?.isNotEmpty == true) {
        await fetchImages(firstLine!);
      }
    } catch (e, stackTrace) {
      print('Error in getGeminiResponse: $e');
      print('Stack trace: $stackTrace');
      setState(() {
        aiResponse = "Error: $e";
        firstLine = null;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Modify the _resetForm method
  void _resetForm() {
    setState(() {
      // Reset selections
      selectedIssue = null;
      enteredIssue = null;
      selectedCropType = null;
      enteredCropType = null;
      selectedPestType = null;
      enteredPestType = null;
      selectedRegion = null;
      enteredRegion = null;
      selectedPlantingMonth = null;
      selectedSoilType = null;
      enteredSoilType = null;
      selectedWeatherCondition = null;
      enteredWeatherCondition = null;
      selectedIrrigationMethod = null;
      enteredIrrigationMethod = null;
      selectedGrowthStage = null;
      enteredGrowthStage = null;

      // Clear additional info
      _additionalInfoController.clear();
      extraInfo = '';
      charCount = 0;

      // Reset selection methods to dropdown
      issueSelectionMethod = 'dropdown';
      cropSelectionMethod = 'dropdown';
      pestSelectionMethod = 'dropdown';
      regionSelectionMethod = 'dropdown';
      monthSelectionMethod = 'dropdown';
      soilTypeSelectionMethod = 'dropdown';
      weatherConditionSelectionMethod = 'dropdown';
      irrigationMethodSelectionMethod = 'dropdown';
      growthStageSelectionMethod = 'dropdown';

      // Reset response data
      aiResponse = null;
      firstLine = null;
      searchImages = [];
      validImages = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: backgroundColor, // Main background color
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          appLocalizations.pesticides,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: accentPurple, // Purple app bar
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.pest_control, color: Colors.green, size: 32),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            appLocalizations.fillDetailsBelow,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),

                _buildSelectionSection(
                  title: appLocalizations.issueTypeTitle,
                  description: appLocalizations.issueTypeDesc,
                  selectionMethod: issueSelectionMethod,
                  onSelectionMethodChanged:
                      (value) => setState(() => issueSelectionMethod = value),
                  selectedValue: selectedIssue,
                  onDropdownChanged:
                      (value) => setState(() => selectedIssue = value),
                  onTextChanged:
                      (value) => setState(() => enteredIssue = value),
                  items: getIssues(appLocalizations),
                  textFieldLabel: appLocalizations.enterIssueType,
                  dropdownLabel: appLocalizations.selectIssueType,
                ),
                SizedBox(height: 16),

                _buildSelectionSection(
                  title: appLocalizations.cropType,
                  description: appLocalizations.cropTypeDesc,
                  selectionMethod: cropSelectionMethod,
                  onSelectionMethodChanged:
                      (value) => setState(() => cropSelectionMethod = value),
                  selectedValue: selectedCropType,
                  onDropdownChanged:
                      (value) => setState(() => selectedCropType = value),
                  onTextChanged:
                      (value) => setState(() => enteredCropType = value),
                  items: getCropTypes(appLocalizations),
                  textFieldLabel: appLocalizations.enterCropType,
                  dropdownLabel: appLocalizations.selectCropType,
                ),
                SizedBox(height: 16),

                _buildSelectionSection(
                  title: appLocalizations.pestType,
                  description: appLocalizations.pestTypeDesc,
                  selectionMethod: pestSelectionMethod,
                  onSelectionMethodChanged:
                      (value) => setState(() => pestSelectionMethod = value),
                  selectedValue: selectedPestType,
                  onDropdownChanged:
                      (value) => setState(() => selectedPestType = value),
                  onTextChanged:
                      (value) => setState(() => enteredPestType = value),
                  items: getPestTypes(appLocalizations),
                  textFieldLabel: appLocalizations.enterPestType,
                  dropdownLabel: appLocalizations.selectPestType,
                ),
                SizedBox(height: 16),

                _buildSelectionSection(
                  title: appLocalizations.region,
                  description: appLocalizations.regionDesc,
                  selectionMethod: regionSelectionMethod,
                  onSelectionMethodChanged:
                      (value) => setState(() => regionSelectionMethod = value),
                  selectedValue: selectedRegion,
                  onDropdownChanged:
                      (value) => setState(() => selectedRegion = value),
                  onTextChanged:
                      (value) => setState(() => enteredRegion = value),
                  items: getRegions(appLocalizations),
                  textFieldLabel: appLocalizations.enterRegion,
                  dropdownLabel: appLocalizations.selectRegion,
                ),
                SizedBox(height: 16),

                _buildSelectionSection(
                  title: appLocalizations.plantingMonth,
                  description: appLocalizations.plantingMonthDesc,
                  selectionMethod: monthSelectionMethod,
                  onSelectionMethodChanged:
                      (value) => setState(() => monthSelectionMethod = value),
                  selectedValue: selectedPlantingMonth,
                  onDropdownChanged:
                      (value) => setState(() => selectedPlantingMonth = value),
                  onTextChanged:
                      (value) => setState(() => enteredPlantingMonth = value),
                  items: getMonths(appLocalizations),
                  textFieldLabel: appLocalizations.enterPlantingMonth,
                  dropdownLabel: appLocalizations.selectPlantingMonth,
                ),
                SizedBox(height: 16),

                _buildSelectionSection(
                  title: appLocalizations.soilTypeTitle,
                  description: appLocalizations.soilTypeDesc,
                  selectionMethod: soilTypeSelectionMethod,
                  onSelectionMethodChanged:
                      (value) =>
                          setState(() => soilTypeSelectionMethod = value),
                  selectedValue: selectedSoilType,
                  onDropdownChanged:
                      (value) => setState(() => selectedSoilType = value),
                  onTextChanged:
                      (value) => setState(() => enteredSoilType = value),
                  items: getSoilTypes(appLocalizations),
                  textFieldLabel: appLocalizations.enterSoilType,
                  dropdownLabel: appLocalizations.selectSoilType,
                ),
                SizedBox(height: 16),

                _buildSelectionSection(
                  title: appLocalizations.weatherTitle,
                  description: appLocalizations.weatherDesc,
                  selectionMethod: weatherConditionSelectionMethod,
                  onSelectionMethodChanged:
                      (value) => setState(
                        () => weatherConditionSelectionMethod = value,
                      ),
                  selectedValue: selectedWeatherCondition,
                  onDropdownChanged:
                      (value) =>
                          setState(() => selectedWeatherCondition = value),
                  onTextChanged:
                      (value) =>
                          setState(() => enteredWeatherCondition = value),
                  items: getWeatherConditions(appLocalizations),
                  textFieldLabel: appLocalizations.enterWeather,
                  dropdownLabel: appLocalizations.selectWeather,
                ),
                SizedBox(height: 16),

                _buildSelectionSection(
                  title: appLocalizations.irrigationTitle,
                  description: appLocalizations.irrigationDesc,
                  selectionMethod: irrigationMethodSelectionMethod,
                  onSelectionMethodChanged:
                      (value) => setState(
                        () => irrigationMethodSelectionMethod = value,
                      ),
                  selectedValue: selectedIrrigationMethod,
                  onDropdownChanged:
                      (value) =>
                          setState(() => selectedIrrigationMethod = value),
                  onTextChanged:
                      (value) =>
                          setState(() => enteredIrrigationMethod = value),
                  items: getIrrigationMethods(appLocalizations),
                  textFieldLabel: appLocalizations.enterIrrigation,
                  dropdownLabel: appLocalizations.selectIrrigation,
                ),
                SizedBox(height: 16),

                _buildSelectionSection(
                  title: appLocalizations.growthStageTitle,
                  description: appLocalizations.growthStageDesc,
                  selectionMethod: growthStageSelectionMethod,
                  onSelectionMethodChanged:
                      (value) =>
                          setState(() => growthStageSelectionMethod = value),
                  selectedValue: selectedGrowthStage,
                  onDropdownChanged:
                      (value) => setState(() => selectedGrowthStage = value),
                  onTextChanged:
                      (value) => setState(() => enteredGrowthStage = value),
                  items: getGrowthStages(appLocalizations),
                  textFieldLabel: appLocalizations.enterGrowthStage,
                  dropdownLabel: appLocalizations.selectGrowthStage,
                ),
                SizedBox(height: 16),

                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appLocalizations.additionalInfo,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          appLocalizations.additionalInfoDesc,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _additionalInfoController,
                          maxLines: 4,
                          maxLength: 250,
                          decoration: InputDecoration(
                            hintText: appLocalizations.additionalInfoHint,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              extraInfo = value;
                              charCount = value.length;
                            });
                          },
                        ),
                        Text(
                          appLocalizations.characterCount(charCount),
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            getGeminiResponse();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          appLocalizations.getPesticideInfo,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: _resetForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Clear',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                if (isLoading)
                  Center(child: CircularProgressIndicator(color: accentPurple)),
                if (firstLine != null) ...[
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MarkdownBody(
                            data: "**Recommended Solution:** $firstLine",
                            styleSheet: MarkdownStyleSheet(
                              p: TextStyle(
                                fontSize: 18,
                                height: 1.5,
                                color: Colors.black87,
                              ),
                              strong: TextStyle(
                                color: Colors.green[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          if (searchImages.isNotEmpty) ...[
                            SizedBox(height: 16),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(8),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  final crossAxisCount =
                                      searchImages.length > 1 ? 2 : 1;
                                  final aspectRatio =
                                      searchImages.length > 1
                                          ? 1.0
                                          : 16.0 / 9.0;

                                  return GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: crossAxisCount,
                                          crossAxisSpacing: 8,
                                          mainAxisSpacing: 8,
                                          childAspectRatio: aspectRatio,
                                        ),
                                    itemCount: searchImages.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child: Image.network(
                                            corsSafeUrl(searchImages[index]),
                                            fit: BoxFit.cover,
                                            errorBuilder: (_, __, ___) {
                                              return const Icon(
                                                Icons.broken_image,
                                                color: Colors.grey,
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
                if (aiResponse != null) ...[
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MarkdownBody(
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
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

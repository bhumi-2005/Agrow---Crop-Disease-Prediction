import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:agrow/l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CropDiseaseScreen extends StatefulWidget {
  @override
  _CropDiseaseScreenState createState() => _CropDiseaseScreenState();
}

class _CropDiseaseScreenState extends State<CropDiseaseScreen> {
  final ImagePicker _picker = ImagePicker();
  Uint8List? _imageBytes;
  String? _response; // AI Response
  bool _isAnalyzing = false;
  Map<String, dynamic>? _diseaseResult;
  String? _error;
  late final String apiKey;
  late final String apiUrl;

  @override
  void initState() {
    super.initState();
    // Initialize environment variables
    apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
    apiUrl = dotenv.env['GEMINI_API_URL'] ?? '';
  }

  String _getInstructionPrompt(BuildContext context) {
    final String currentLanguage = Localizations.localeOf(context).languageCode;

    if (currentLanguage == 'hi') {
      // Hindi
      return '''You are an expert AI agronomist specializing in crop disease identification and treatment.

You will receive an image of a diseased crop.  
Your task is to analyze the image and provide the answer in **Hindi language**, optimized for Indian farmers.  
The response must include:
- The disease name (first line — for pesticide or remedy lookup)
- A brief diagnosis explaining the disease, its cause, and symptoms
- Preventive measures to avoid recurrence
- Treatment measures (both organic and chemical) suitable for Indian agricultural conditions
if the image is irrelevant, please mention that in the response and dont generate anything further as its irrelvant from agriculture.
If any information is unclear from the image, make reasonable assumptions based on typical Indian crop conditions and still provide a complete answer.

---

###  Response Format (Important)
Respond strictly in **Hindi** and in **Markdown format**.  
Do not use HTML tags, emojis, tables, or special symbols.  
Use plain Markdown headings (`###`) and bullet points (`-`).  
Do not include numbering or code blocks.  
Keep the layout clean and readable in `flutter_markdown`.

---

### Structure

###  रोग का नाम  
<disease name in Hindi>

###  रोग का विवरण  
- <short explanation of the disease and its symptoms in Hindi>

###  रोकथाम के उपाय  
- <preventive measure in Hindi>  
- <preventive measure in Hindi>  
- <preventive measure in Hindi>

###  उपचार के उपाय  
- <organic treatment or biological control in Hindi>  
- <chemical pesticide name, formulation, and dosage in Hindi>  
- <application timing and safety precautions in Hindi>

---

###  Rules
- The **entire response** must be in Hindi (use English only for chemical or product names if required).  
- Use **simple, farmer-friendly Hindi** suitable for rural Indian audiences.  
- Keep the output **concise, clear, and formatted in Markdown**.  
- The output must display correctly using `flutter_markdown` (plain text, bold, and bullet points only).  
- **Do not** use HTML, numbering, or extra symbols beyond Markdown syntax.  
- If mult
''';
    } else if (currentLanguage == 'mr') {
      // Marathi
      return '''You are an expert AI agronomist specializing in crop disease identification and treatment.

You will receive an image of a diseased crop.  
if the image is irrelevant, please mention that in the response and dont generate anything further as its irrelvant from agriculture.
Your task is to analyze the image and provide the answer in **Marathi language**, optimized for Indian farmers.  
The response must include:
- The disease name (first line — for pesticide or remedy lookup)
- A brief diagnosis explaining the disease, its cause, and symptoms
- Preventive measures to avoid recurrence
- Treatment measures (both organic and chemical) suitable for Indian agricultural conditions

If any details cannot be identified from the image, make reasonable assumptions based on typical conditions in Maharashtra and still provide a complete and useful response.

---

### Response Format (Important)
Respond strictly in **Marathi** and in **Markdown format**.  
Do not use HTML tags, emojis, tables, or special symbols.  
Use plain Markdown headings (`###`) and bullet points (`-`).  
Do not include numbering or code blocks.  
Ensure the response displays clearly in the `flutter_markdown` widget.

---

### Structure

# ओळखलेला रोग
## <disease name in Marathi>

###  रोगाचे वर्णन  
- <short explanation of the disease and symptoms in Marathi>

###  प्रतिबंधक उपाय  
- <preventive measure in Marathi>  
- <preventive measure in Marathi>  
- <preventive measure in Marathi>

###  उपचाराचे उपाय  
- <organic treatment or biological control in Marathi>  
- <chemical pesticide name, formulation, and dosage in Marathi>  
- <application timing and safety precautions in Marathi>

---

### Rules
- The **entire response** must be in Marathi (use English only for product or chemical names if needed).  
- Use simple, farmer-friendly Marathi easily understood in rural Maharashtra.  
- Keep the answer concise, clear, and well-formatted in Markdown.  
- Output must render correctly in `flutter_markdown` (no HTML, symbols, or numbering).  
- If multiple possible diseases are found, mention up to **two probable diseases** with their distinguishing features.  

---
''';
    } else {
      // Default English
      return '''You are an expert AI agronomist specializing in crop disease identification and treatment.

You will receive an image of a diseased crop.  
if the image is irrelevant, please mention that in the response and dont generate anything further as its irrelvant from agriculture.
Your task is to analyze the image and provide:
- The name of the disease (first line — for pesticide or remedy lookup)
- A brief diagnosis explaining the disease, its cause, and symptoms
- Preventive measures to avoid recurrence
- Treatment measures (both organic and chemical) suitable for Indian agricultural conditions

If any information cannot be clearly identified from the image, make reasonable assumptions based on typical crop conditions in India and still provide a complete, useful response.

---

### Response Format (Important)
Respond strictly in **Markdown format**.  
Do not use HTML tags, emojis, tables, or special symbols.  
Use plain Markdown headings (`###`), bold text, and bullet points (`-`).  
Do not include numbering or code blocks.  
Ensure the response displays clearly in `flutter_markdown`.

---

### Structure

### Disease Name  
<disease name>

### Diagnosis  
- <short explanation of the disease and symptoms>

### Preventive Measures  
- <practical prevention method>  
- <practical prevention method>  
- <practical prevention method>

### Treatment Measures  
- <organic remedy or biological control>  
- <chemical pesticide with formulation and recommended dosage>  
- <application timing and safety precautions>

---

### Rules
- The entire output must be **in English**, written in clean and professional Markdown format.  
- Keep the response concise, clear, and field-ready for Indian farmers.  
- Focus on **actionable and practical guidance**.  
- If uncertain, mention up to **two possible diseases** with distinct differences.  
- Ensure the output displays correctly using the `flutter_markdown` widget (no HTML or non-ASCII symbols).

---
''';
    }
  }

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      final Uint8List bytes = await photo.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
      _sendToGemini(bytes);
    }
  }

  Future<void> _uploadImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final Uint8List bytes = await image.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
      _sendToGemini(bytes);
    }
  }

  Future<void> _sendToGemini(Uint8List imageBytes) async {
    final appLocalizations = AppLocalizations.of(context)!;
    setState(() {
      _isAnalyzing = true;
      _response = appLocalizations.analyzing;
    });

    // Use API endpoint and key from environment variables
    final String apiEndpoint = "$apiUrl?key=$apiKey";

    // Get the instruction prompt based on current language
    final String instructionPrompt = _getInstructionPrompt(context);

    // Convert image to base64
    String base64Image = base64Encode(imageBytes);

    // Prepare request body
    Map<String, dynamic> requestBody = {
      "contents": [
        {
          "parts": [
            {"text": instructionPrompt},
            {
              "inline_data": {"mime_type": "image/jpeg", "data": base64Image},
            },
          ],
        },
      ],
    };

    try {
      final response = await http.post(
        Uri.parse(apiEndpoint),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        String aiResponse =
            data["candidates"]?[0]?["content"]?["parts"]?[0]?["text"] ??
            "No response from AI.";
        setState(() {
          _response = aiResponse;
          _isAnalyzing = false;
        });
      } else {
        setState(() {
          _response = "Error: ${response.statusCode} - ${response.body}";
          _isAnalyzing = false;
        });
      }
    } catch (e) {
      setState(() {
        _response = "Error sending request: $e";
        _isAnalyzing = false;
      });
    }
  }

  // First, let's define the color constants
  final Color primaryGreen = Color(
    0xFF4CAF50,
  ); // Changed to a more vibrant green
  final Color secondaryGreen = Color(0xFFE1EACD); // Very light green
  final Color backgroundColor = Color(0xFFF9F6E6); // Cream/beige
  final Color accentPurple = Color(0xFF8D77AB); // Purple

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    // Initialize _response with localized string if null
    if (_response == null) {
      _response = appLocalizations.uploadImageForResults;
    }

    return Scaffold(
      backgroundColor: backgroundColor, // Set solid background color F9F6E6
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          appLocalizations.cropDiseaseDetection,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: accentPurple,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appLocalizations.cropDiseaseDesc,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 24),
              if (!_isAnalyzing)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _takePhoto,
                            icon: Icon(Icons.camera_alt, color: Colors.white),
                            label: Text(
                              appLocalizations.takePhoto,
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryGreen,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _uploadImage,
                            icon: Icon(
                              Icons.photo_library,
                              color: Colors.white,
                            ),
                            label: Text(
                              appLocalizations.chooseFromGallery,
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryGreen,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_imageBytes != null) ...[
                      SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _imageBytes = null;
                            _response = appLocalizations.uploadOrTakePhoto;
                            _diseaseResult = null;
                            _error = null;
                          });
                        },
                        icon: Icon(Icons.clear, color: Colors.white),
                        label: Text(
                          appLocalizations.clear,
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              if (!_isAnalyzing)
                SizedBox(height: 32), // Added more space after buttons
              if (_imageBytes != null)
                Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.9,
                      maxHeight: MediaQuery.of(context).size.height * 0.4,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.memory(_imageBytes!, fit: BoxFit.contain),
                    ),
                  ),
                ),
              if (_isAnalyzing)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        appLocalizations.analyzing,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      SizedBox(width: 12),
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: accentPurple,
                          strokeWidth: 2.5,
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 24),
              Text(
                "${appLocalizations.diagnostics}:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child:
                    _imageBytes == null
                        ? Text(
                          appLocalizations.uploadOrTakePhoto,
                          style: TextStyle(fontSize: 16),
                        )
                        : MarkdownBody(
                          data: _response!,
                          styleSheet: MarkdownStyleSheet(
                            p: TextStyle(fontSize: 16),
                            h1: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(
                                0xFF2E7D32,
                              ), // Dark green for main headers
                            ),
                            h2: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD32F2F), // Red for disease name
                            ),
                            h3: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(
                                0xFF1B5E20,
                              ), // Another shade of green for sub-headers
                            ),
                            strong: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B5E20), // Green for bold text
                            ),
                            listBullet: TextStyle(
                              color: Color(0xFF2E7D32),
                            ), // Green bullets
                          ),
                        ),
              ),
              if (_diseaseResult != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appLocalizations.diseaseDetected,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color:
                                  accentPurple, // Changed from green to purple
                            ),
                          ),
                          Divider(),
                          _buildResultRow(
                            appLocalizations.diseaseName,
                            _diseaseResult!['name'] ?? '',
                          ),
                          _buildResultRow(
                            appLocalizations.confidence,
                            '${(_diseaseResult!['confidence'] * 100).toStringAsFixed(1)}%',
                          ),
                          _buildResultRow(
                            appLocalizations.treatment,
                            _diseaseResult!['treatment'] ?? '',
                          ),
                          _buildResultRow(
                            appLocalizations.preventiveMeasures,
                            _diseaseResult!['prevention'] ?? '',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (_error != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(Icons.error_outline, color: Colors.red, size: 48),
                      SizedBox(height: 16),
                      Text(
                        appLocalizations.analysisFailed,
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          if (_imageBytes != null) {
                            _sendToGemini(_imageBytes!);
                          }
                        },
                        child: Text(appLocalizations.retryAnalysis),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryGreen,
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

  Widget _buildResultRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}

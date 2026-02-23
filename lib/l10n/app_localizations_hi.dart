// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'एग्रो';

  @override
  String get todaysWeather => 'आज का मौसम';

  @override
  String get hourlyForecast => 'प्रति घंटा पूर्वानुमान';

  @override
  String currentTime(String time) {
    return 'वर्तमान समय: $time';
  }

  @override
  String temperature(int temp) {
    return '$temp°C';
  }

  @override
  String get govtSchemes => 'सरकारी योजनाएं और सब्सिडी';

  @override
  String get govtSchemesDesc =>
      'किसानों के लिए उपलब्ध सरकारी योजनाएं और सब्सिडी देखें';

  @override
  String get expertConsultation => 'विशेषज्ञ परामर्श';

  @override
  String get expertConsultationDesc =>
      'कृषि विशेषज्ञों से व्यक्तिगत सलाह प्राप्त करें';

  @override
  String get warningAlert => 'आंधी की चेतावनी';

  @override
  String get partlyCloudy => 'आंशिक रूप से बादल';

  @override
  String get searchExperts => 'नाम या विशेषज्ञता से खोजें...';

  @override
  String get applyNow => 'अभी आवेदन करें';

  @override
  String get details => 'विवरण';

  @override
  String get remind => 'याद दिलाएं';

  @override
  String get location => 'स्थान';

  @override
  String get condition => 'आंशिक रूप से बादल';

  @override
  String forecast(String time) {
    return 'पूर्वानुमान';
  }

  @override
  String forecastTemp(int temp) {
    return '$temp°C';
  }

  @override
  String timeFormat(int hour, String period) {
    return '$hour $period';
  }

  @override
  String get am => 'पूर्वाह्न';

  @override
  String get pm => 'अपराह्न';

  @override
  String get warningMessage => 'आंधी-तूफान की चेतावनी';

  @override
  String get safe => 'सुरक्षित';

  @override
  String get caution => 'सावधान';

  @override
  String get danger => 'खतरा';

  @override
  String get expertConsultationTitle => 'विशेषज्ञ परामर्श';

  @override
  String get searchExpertsHint => 'नाम या विशेषज्ञता से खोजें...';

  @override
  String get filterAll => 'सभी';

  @override
  String get filterCrops => 'फसल';

  @override
  String get filterSoil => 'मिट्टी';

  @override
  String get filterGovt => 'सरकारी';

  @override
  String get noExpertsFound => 'कोई विशेषज्ञ नहीं मिला';

  @override
  String get tryDifferentSearch => 'अलग खोज शब्द या फ़िल्टर आज़माएं';

  @override
  String get experienceLabel => 'वर्षों का अनुभव';

  @override
  String feePerSession(String amount) {
    return '₹$amount/30मिनट';
  }

  @override
  String rating(double score) {
    return '$score';
  }

  @override
  String get chatButton => 'चैट';

  @override
  String get callButton => 'कॉल';

  @override
  String get videoButton => 'वीडियो';

  @override
  String get expertName1 => 'डॉ. राजेश कुमार';

  @override
  String get expertName2 => 'डॉ. प्रिया शर्मा';

  @override
  String get expertName3 => 'अमित पटेल';

  @override
  String get expertSpec1 => 'फसल रोग विशेषज्ञ';

  @override
  String get expertSpec2 => 'मृदा वैज्ञानिक';

  @override
  String get expertSpec3 => 'सरकारी योजना सलाहकार';

  @override
  String get expertExp1 => 'फसल रोग प्रबंधन और रोकथाम में 15 वर्षों का अनुभव';

  @override
  String get expertExp2 =>
      'मिट्टी की स्वास्थ्य और उर्वरता प्रबंधन में 12 वर्षों का अनुभव';

  @override
  String get expertExp3 =>
      'कृषि योजनाओं और सब्सिडी में 10 वर्षों की विशेषज्ञता';

  @override
  String get tagCrops => 'फसलें';

  @override
  String get tagDisease => 'रोग नियंत्रण';

  @override
  String get tagSoil => 'मिट्टी';

  @override
  String get tagFertility => 'उर्वरता';

  @override
  String get tagGovt => 'सरकारी';

  @override
  String get tagSubsidies => 'सब्सिडी';

  @override
  String get expertType1 => 'फसलें';

  @override
  String get expertType2 => 'मिट्टी';

  @override
  String get expertType3 => 'सरकारी';

  @override
  String get cropAdvisory => 'फसल सलाह';

  @override
  String get cropAdvisoryDesc =>
      'अपनी भूमि और परिस्थितियों के आधार पर व्यक्तिगत फसल की सिफारिशें प्राप्त करें';

  @override
  String get cropDisease => 'फसल रोग';

  @override
  String get cropDiseaseDesc =>
      'बीमारियों की पहचान करने और उपचार की सिफारिशें प्राप्त करने के लिए अपनी फसल की तस्वीर लें या छवि अपलोड करें';

  @override
  String get cropAdvisoryTitle => 'फसल सलाह';

  @override
  String get getPersonalizedRecommendations =>
      'व्यक्तिगत फसल सिफारिशें प्राप्त करें';

  @override
  String get fillDetailsBelow => 'अनुकूलित कीटनाशक सलाह के लिए नीचे विवरण भरें';

  @override
  String get cropSelection => 'फसल चयन';

  @override
  String get selectFromList => 'सूची से चुनें';

  @override
  String get enterManually => 'मैन्युअल रूप से दर्ज करें';

  @override
  String get selectCrop => 'फसल चुनें';

  @override
  String get enterCropName => 'फसल का नाम दर्ज करें';

  @override
  String get landArea => 'भूमि क्षेत्र';

  @override
  String get enterArea => 'क्षेत्र दर्ज करें';

  @override
  String get irrigationMethod => 'सिंचाई विधि';

  @override
  String get selectIrrigationMethod => 'सिंचाई विधि चुनें';

  @override
  String get enterIrrigationMethod => 'सिंचाई विधि दर्ज करें';

  @override
  String get weatherConditions => 'मौसम की स्थिति';

  @override
  String get selectWeatherCondition => 'मौसम की स्थिति चुनें';

  @override
  String get enterWeatherCondition => 'मौसम की स्थिति दर्ज करें';

  @override
  String get getAdvisory => 'सलाह प्राप्त करें';

  @override
  String get areaUnitsAcres => 'एकड़';

  @override
  String get areaUnitsHectares => 'हेक्टेयर';

  @override
  String get areaUnitsSquareMeters => 'वर्ग मीटर';

  @override
  String get areaUnitsSquareFeet => 'वर्ग फुट';

  @override
  String get areaUnitsGuntha => 'गुंठा';

  @override
  String get areaUnitsBigha => 'बीघा';

  @override
  String get weatherTypesSunny => 'धूप';

  @override
  String get weatherTypesPartlyCloudy => 'आंशिक बादल';

  @override
  String get weatherTypesOvercast => 'पूर्ण बादल';

  @override
  String get weatherTypesLightRain => 'हल्की बारिश';

  @override
  String get weatherTypesHeavyRain => 'भारी बारिश';

  @override
  String get weatherTypesThunderstorm => 'आंधी-तूफान';

  @override
  String get weatherTypesWindy => 'हवादार';

  @override
  String get weatherTypesHotHumid => 'गर्म और नम';

  @override
  String get weatherTypesColdDry => 'ठंडा और शुष्क';

  @override
  String get weatherTypesFoggy => 'धुंधला';

  @override
  String get weatherTypesHazy => 'धुंध';

  @override
  String get weatherTypesDrought => 'सूखा स्थिति';

  @override
  String get weatherTypesHighTemp => 'उच्च तापमान';

  @override
  String get weatherTypesLowTemp => 'निम्न तापमान';

  @override
  String get irrigationTypesDrip => 'टपक सिंचाई';

  @override
  String get irrigationTypesSprinkler => 'फव्वारा सिंचाई';

  @override
  String get irrigationTypesFlood => 'बाढ़ सिंचाई';

  @override
  String get irrigationTypesFurrow => 'कूंड सिंचाई';

  @override
  String get irrigationTypesCenterPivot => 'केंद्रीय घूर्णन सिंचाई';

  @override
  String get irrigationTypesSubsurfaceDrip => 'भूमिगत टपक सिंचाई';

  @override
  String get irrigationTypesMicroSprinkler => 'सूक्ष्म फव्वारा प्रणाली';

  @override
  String get irrigationTypesSurface => 'सतही सिंचाई';

  @override
  String get irrigationTypesBasin => 'थाला सिंचाई';

  @override
  String get irrigationTypesBorderStrip => 'सीमा पट्टी सिंचाई';

  @override
  String get cropsWheat => 'गेहूं';

  @override
  String get cropsRice => 'धान';

  @override
  String get cropsCotton => 'कपास';

  @override
  String get cropsSugarcane => 'गन्ना';

  @override
  String get cropsMaize => 'मक्का';

  @override
  String get cropsSoybean => 'सोयाबीन';

  @override
  String get soilClay => 'चिकनी मिट्टी';

  @override
  String get soilSandy => 'बलुई मिट्टी';

  @override
  String get soilLoamy => 'दोमट मिट्टी';

  @override
  String get soilSilt => 'गाद मिट्टी';

  @override
  String get soilBlackCotton => 'काली मिट्टी';

  @override
  String get soilRed => 'लाल मिट्टी';

  @override
  String get soilAlluvial => 'जलोढ़ मिट्टी';

  @override
  String get weatherSunny => 'धूप';

  @override
  String get weatherCloudy => 'बादल';

  @override
  String get weatherRainy => 'बारिश';

  @override
  String get weatherHotHumid => 'गर्म और नम';

  @override
  String get weatherCold => 'ठंडा';

  @override
  String get weatherWindy => 'हवादार';

  @override
  String get weatherDrought => 'सूखा';

  @override
  String get irrigationDrip => 'टपक सिंचाई';

  @override
  String get irrigationSprinkler => 'फव्वारा सिंचाई';

  @override
  String get irrigationFlood => 'बाढ़ सिंचाई';

  @override
  String get irrigationFurrow => 'कूंड सिंचाई';

  @override
  String get irrigationBasin => 'थाला सिंचाई';

  @override
  String get irrigationRainfed => 'वर्षा आधारित';

  @override
  String get stageSeedling => 'अंकुर अवस्था';

  @override
  String get stageVegetative => 'वानस्पतिक अवस्था';

  @override
  String get stageFlowering => 'पुष्पन अवस्था';

  @override
  String get stageFruiting => 'फलन अवस्था';

  @override
  String get stageMaturity => 'परिपक्वता अवस्था';

  @override
  String get stageHarvest => 'कटाई अवस्था';

  @override
  String get soilTypeTitle => 'मिट्टी का प्रकार';

  @override
  String get soilTypeDesc => 'अपने खेत की मिट्टी का प्रकार चुनें';

  @override
  String get enterSoilType => 'मिट्टी का प्रकार दर्ज करें';

  @override
  String get selectSoilType => 'मिट्टी का प्रकार चुनें';

  @override
  String get weatherTitle => 'मौसम की स्थिति';

  @override
  String get weatherDesc => 'वर्तमान मौसम की स्थिति चुनें';

  @override
  String get enterWeather => 'मौसम की स्थिति दर्ज करें';

  @override
  String get selectWeather => 'मौसम की स्थिति चुनें';

  @override
  String get irrigationTitle => 'सिंचाई विधि';

  @override
  String get irrigationDesc => 'अपनी सिंचाई विधि चुनें';

  @override
  String get enterIrrigation => 'सिंचाई विधि दर्ज करें';

  @override
  String get selectIrrigation => 'सिंचाई विधि चुनें';

  @override
  String get growthStageTitle => 'फसल की बढ़वार अवस्था';

  @override
  String get growthStageDesc => 'अपनी फसल की वर्तमान बढ़वार अवस्था चुनें';

  @override
  String get enterGrowthStage => 'बढ़वार अवस्था दर्ज करें';

  @override
  String get selectGrowthStage => 'बढ़वार अवस्था चुनें';

  @override
  String get cropsPotato => 'आलू';

  @override
  String get cropsTomato => 'टमाटर';

  @override
  String get cropsOnion => 'प्याज';

  @override
  String get cropsGroundnut => 'मूंगफली';

  @override
  String get cropsChickpea => 'चना';

  @override
  String get cropsMustard => 'सरसों';

  @override
  String get cropsSunflower => 'सूरजमुखी';

  @override
  String get cropsTurmeric => 'हल्दी';

  @override
  String get cropsGinger => 'अदरक';

  @override
  String get cropsGarlic => 'लहसुन';

  @override
  String get cropsChili => 'मिर्च';

  @override
  String get cropsCauliflower => 'फूलगोभी';

  @override
  String get cropsCabbage => 'पत्तागोभी';

  @override
  String get cropsCarrot => 'गाजर';

  @override
  String get cropsPeas => 'मटर';

  @override
  String get cropsBeans => 'फलियां';

  @override
  String get cropsCucumber => 'खीरा';

  @override
  String get cropsEggplant => 'बैंगन';

  @override
  String get cropsOkra => 'भिंडी';

  @override
  String get appName => 'एग्रो';

  @override
  String get services => 'सेवाएं';

  @override
  String get pesticides => 'कीटनाशक सलाह';

  @override
  String get marketPrices => 'बाज़ार मूल्य';

  @override
  String get currentTemp => 'वर्तमान तापमान';

  @override
  String get feelsLike => 'महसूस होता है';

  @override
  String get humidity => 'नमी';

  @override
  String get windSpeed => 'हवा की गति';

  @override
  String get precipitation => 'वर्षा';

  @override
  String get weeklyForecast => 'साप्ताहिक पूर्वानुमान';

  @override
  String get loading => 'लोड हो रहा है...';

  @override
  String get errorLoading => 'मौसम डेटा लोड करने में त्रुटि';

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get kmh => 'किमी/घंटा';

  @override
  String get percent => '%';

  @override
  String get mm => 'मिमी';

  @override
  String get clear => 'साफ़';

  @override
  String get sunny => 'धूप';

  @override
  String get cloudy => 'बादल';

  @override
  String get rainy => 'Rainy';

  @override
  String get thunderstorm => 'आंधी-तूफान';

  @override
  String get uv => 'यूवी';

  @override
  String get wind => 'हवा';

  @override
  String get day => 'दिन';

  @override
  String get today => 'आज';

  @override
  String get tomorrow => 'कल';

  @override
  String get monday => 'सोमवार';

  @override
  String get tuesday => 'मंगलवार';

  @override
  String get wednesday => 'बुधवार';

  @override
  String get thursday => 'गुरुवार';

  @override
  String get friday => 'शुक्रवार';

  @override
  String get saturday => 'शनिवार';

  @override
  String get sunday => 'रविवार';

  @override
  String get min => 'न्यूनतम';

  @override
  String get max => 'अधिकतम';

  @override
  String get threeDayForecast => '3 दिन का पूर्वानुमान';

  @override
  String get cropDiseasePrediction => 'फसल रोग पहचान';

  @override
  String get uploadImage => 'छवि अपलोड करें';

  @override
  String get takePhoto => 'फोटो लें';

  @override
  String get chooseFromGallery => 'गैलरी से चुनें';

  @override
  String get analyzing => 'विश्लेषण हो रहा है...';

  @override
  String get uploadOrTakePhoto =>
      'कृपया प्रभावित फसल की फोटो अपलोड करें या लें';

  @override
  String get diseaseDetected => 'रोग का पता चला';

  @override
  String get diseaseName => 'रोग का नाम';

  @override
  String get confidence => 'विश्वसनीयता';

  @override
  String get treatment => 'उपचार';

  @override
  String get preventiveMeasures => 'निवारक उपाय';

  @override
  String get noDisease => 'कोई रोग नहीं मिला';

  @override
  String get healthyPlant => 'आपका पौधा स्वस्थ दिखाई दे रहा है!';

  @override
  String get tryDifferentImage => 'दूसरी छवि के साथ प्रयास करें';

  @override
  String get imageError => 'छवि लोड करने में त्रुटि';

  @override
  String get analysisFailed => 'विश्लेषण विफल रहा';

  @override
  String get retryAnalysis => 'पुनः विश्लेषण करें';

  @override
  String get diagnostics => 'निदान';

  @override
  String get uploadImageForResults =>
      'परिणाम प्राप्त करने के लिए छवि अपलोड करें';

  @override
  String get pesticideAdvisory => 'कीटनाशक सलाह';

  @override
  String get searchPesticide => 'कीटनाशक खोजें...';

  @override
  String get pesticideDetails => 'कीटनाशक विवरण';

  @override
  String get activeIngredient => 'सक्रिय तत्व';

  @override
  String get targetPests => 'लक्षित कीट';

  @override
  String get applicableCrops => 'उपयुक्त फसलें';

  @override
  String get dosage => 'मात्रा';

  @override
  String get safetyPeriod => 'सुरक्षा अवधि';

  @override
  String get precautions => 'सावधानियां';

  @override
  String get application => 'प्रयोग विधि';

  @override
  String get effectiveness => 'प्रभावशीलता';

  @override
  String get alternatives => 'जैविक विकल्प';

  @override
  String get filterBy => 'फ़िल्टर करें';

  @override
  String get allPesticides => 'सभी कीटनाशक';

  @override
  String get organic => 'जैविक';

  @override
  String get chemical => 'रासायनिक';

  @override
  String get biological => 'जैविक';

  @override
  String get noPesticidesFound => 'कोई कीटनाशक नहीं मिला';

  @override
  String get tryDifferentFilter => 'अलग फ़िल्टर या खोज शब्द आज़माएं';

  @override
  String get pesticideAdvisoryDesc =>
      'Fill in the details below for customized pesticide advisory';

  @override
  String get issueType => 'Issue Type';

  @override
  String get issueTypeDesc => 'आप किस प्रकार की समस्या का सामना कर रहे हैं?';

  @override
  String get enterIssueType => 'Enter Issue Type';

  @override
  String get additionalInfo => 'अतिरिक्त जानकारी';

  @override
  String get additionalInfoDesc => 'क्या आप कोई अन्य विवरण जोड़ना चाहेंगे?';

  @override
  String get additionalInfoHint => 'कोई अतिरिक्त जानकारी दर्ज करें...';

  @override
  String characterCount(int count) {
    return 'अक्षर संख्या: $count/250';
  }

  @override
  String get pestIssue => 'Pests';

  @override
  String get diseaseIssue => 'Diseases';

  @override
  String get weedIssue => 'Weeds';

  @override
  String get nutrientDeficiencyIssue => 'Soil Nutrient Deficiency';

  @override
  String get otherIssue => 'Other';

  @override
  String get cropSugarcane => 'Sugarcane';

  @override
  String get cropCotton => 'Cotton';

  @override
  String get cropSoybean => 'Soybeans';

  @override
  String get cropRice => 'Rice';

  @override
  String get cropWheat => 'Wheat';

  @override
  String get cropMaize => 'Maize';

  @override
  String get cropOnion => 'Onions';

  @override
  String get cropChickpea => 'Chickpeas';

  @override
  String get cropPulses => 'Pulses';

  @override
  String get cropGroundnut => 'Groundnut';

  @override
  String get cropMillet => 'Millets';

  @override
  String get pestAphids => 'Aphids';

  @override
  String get pestWeevils => 'Weevils';

  @override
  String get pestBollworm => 'Bollworm';

  @override
  String get pestArmyworm => 'Armyworm';

  @override
  String get pestLeafhopper => 'Leafhopper';

  @override
  String get regionWestern => 'Western Maharashtra';

  @override
  String get regionVidarbha => 'Vidarbha';

  @override
  String get regionMarathwada => 'Marathwada';

  @override
  String get regionNorth => 'North Maharashtra';

  @override
  String get regionKonkan => 'Konkan';

  @override
  String get monthJanuary => 'January';

  @override
  String get monthFebruary => 'February';

  @override
  String get monthMarch => 'March';

  @override
  String get monthApril => 'April';

  @override
  String get monthMay => 'May';

  @override
  String get monthJune => 'June';

  @override
  String get monthJuly => 'July';

  @override
  String get monthAugust => 'August';

  @override
  String get monthSeptember => 'September';

  @override
  String get monthOctober => 'October';

  @override
  String get monthNovember => 'November';

  @override
  String get monthDecember => 'December';

  @override
  String get cropType => 'फसल का प्रकार';

  @override
  String get cropTypeDesc => 'आप कौन सी फसल उगा रहे हैं?';

  @override
  String get enterCropType => 'फसल का प्रकार दर्ज करें';

  @override
  String get pestType => 'कीट का प्रकार';

  @override
  String get pestTypeDesc => 'आप किस प्रकार के कीट से निपट रहे हैं?';

  @override
  String get enterPestType => 'कीट का प्रकार दर्ज करें';

  @override
  String get region => 'क्षेत्र';

  @override
  String get regionDesc => 'आपका खेत किस क्षेत्र में स्थित है?';

  @override
  String get enterRegion => 'क्षेत्र दर्ज करें';

  @override
  String get plantingMonth => 'बुवाई का महीना';

  @override
  String get plantingMonthDesc => 'आपने फसल कब बोई थी?';

  @override
  String get enterPlantingMonth => 'बुवाई का महीना दर्ज करें';

  @override
  String get issueTypeTitle => 'समस्या का प्रकार';

  @override
  String get issueTypePests => 'कीट';

  @override
  String get issueTypeDiseases => 'रोग';

  @override
  String get issueTypeWeeds => 'खरपतवार';

  @override
  String get issueTypeNutrient => 'पोषक तत्वों की कमी';

  @override
  String get issueTypeOther => 'अन्य';

  @override
  String get selectIssueType => 'समस्या का प्रकार चुनें';

  @override
  String get selectCropType => 'फसल का प्रकार चुनें';

  @override
  String get selectPestType => 'कीट का प्रकार चुनें';

  @override
  String get selectRegion => 'क्षेत्र चुनें';

  @override
  String get selectPlantingMonth => 'बुवाई का महीना चुनें';

  @override
  String get pestsAphids => 'माहू';

  @override
  String get pestsWeevils => 'घुन';

  @override
  String get pestsBollworm => 'सुंडी';

  @override
  String get pestsStemborer => 'तना छेदक';

  @override
  String get pestsArmyworm => 'सेना कीट';

  @override
  String get pestsLeafhopper => 'चिटका';

  @override
  String get pestsWhitefly => 'सफेद मक्खी';

  @override
  String get pestsGrasshopper => 'टिड्डा';

  @override
  String get pestsThrips => 'थ्रिप्स';

  @override
  String get pestsMites => 'माइट्स';

  @override
  String get regionsKonkan => 'कोंकण';

  @override
  String get regionsWestern => 'पश्चिम महाराष्ट्र';

  @override
  String get regionsMarathwada => 'मराठवाड़ा';

  @override
  String get regionsVidarbha => 'विदर्भ';

  @override
  String get regionsNorthern => 'उत्तर महाराष्ट्र';

  @override
  String get regionsNagpur => 'नागपुर';

  @override
  String get regionsNashik => 'नासिक';

  @override
  String get regionsPune => 'पुणे';

  @override
  String get regionsAmravati => 'अमरावती';

  @override
  String get regionsLatur => 'लातूर';

  @override
  String get monthsJanuary => 'जनवरी';

  @override
  String get monthsFebruary => 'फरवरी';

  @override
  String get monthsMarch => 'मार्च';

  @override
  String get monthsApril => 'अप्रैल';

  @override
  String get monthsMay => 'मई';

  @override
  String get monthsJune => 'जून';

  @override
  String get monthsJuly => 'जुलाई';

  @override
  String get monthsAugust => 'अगस्त';

  @override
  String get monthsSeptember => 'सितंबर';

  @override
  String get monthsOctober => 'अक्टूबर';

  @override
  String get monthsNovember => 'नवंबर';

  @override
  String get monthsDecember => 'दिसंबर';

  @override
  String get govtSchemesTitle => 'सरकारी योजनाएं और सब्सिडी';

  @override
  String get searchSchemes => 'योजनाएं खोजें...';

  @override
  String get filterSchemes => 'योजनाएं फ़िल्टर करें';

  @override
  String get allSchemes => 'सभी योजनाएं';

  @override
  String get activeSchemes => 'सक्रिय';

  @override
  String get upcomingSchemes => 'आगामी';

  @override
  String get expiredSchemes => 'समाप्त';

  @override
  String get schemeDetails => 'योजना विवरण';

  @override
  String get eligibility => 'पात्रता';

  @override
  String get benefits => 'लाभ';

  @override
  String get requiredDocuments => 'आवश्यक दस्तावेज';

  @override
  String get applicationProcess => 'आवेदन प्रक्रिया';

  @override
  String get lastDate => 'अंतिम तिथि';

  @override
  String get status => 'स्थिति';

  @override
  String get viewMore => 'और देखें';

  @override
  String get noSchemesFound => 'कोई योजना नहीं मिली';

  @override
  String get schemeTitle1 => 'प्रधानमंत्री फसल बीमा योजना';

  @override
  String get schemeDesc1 => 'किसानों के लिए फसल बीमा योजना';

  @override
  String get schemeTitle2 => 'पीएम किसान सम्मान निधि';

  @override
  String get schemeDesc2 => 'किसानों के लिए प्रत्यक्ष आय सहायता';

  @override
  String get schemeTitle3 => 'किसान क्रेडिट कार्ड';

  @override
  String get schemeDesc3 => 'कृषि आवश्यकताओं के लिए ऋण सुविधा';

  @override
  String get ongoing => 'चालू';

  @override
  String get visitWebsite => 'वेबसाइट पर जाएं';

  @override
  String get searchCrops => 'फसल, किस्म, बाज़ार खोजें...';

  @override
  String get loadingLocation => 'आपका स्थान प्राप्त कर रहे हैं...';

  @override
  String get currentPrice => 'वर्तमान मूल्य';

  @override
  String get marketName => 'बाज़ार';

  @override
  String get lastUpdated => 'अंतिम अपडेट';

  @override
  String get tryAgain => 'पुनः प्रयास करें';

  @override
  String get noSearchResults => 'आपकी खोज से मेल खाने वाली कोई फसल नहीं मिली';

  @override
  String get noCropPrices => 'आपके स्थान के लिए कोई फसल मूल्य उपलब्ध नहीं है';

  @override
  String get allStates => 'सभी राज्य';

  @override
  String get maharashtra => 'महाराष्ट्र';

  @override
  String get karnataka => 'कर्नाटक';

  @override
  String get gujarat => 'गुजरात';

  @override
  String get punjab => 'पंजाब';

  @override
  String get uttarPradesh => 'उत्तर प्रदेश';

  @override
  String get madhyaPradesh => 'मध्य प्रदेश';

  @override
  String get allDistricts => 'सभी जिले';

  @override
  String get mumbai => 'मुंबई';

  @override
  String get pune => 'पुणे';

  @override
  String get nagpur => 'नागपुर';

  @override
  String get nashik => 'नासिक';

  @override
  String get aurangabad => 'औरंगाबाद';

  @override
  String get bangalore => 'बैंगलोर';

  @override
  String get mysore => 'मैसूर';

  @override
  String get hubli => 'हुबली';

  @override
  String get mangalore => 'मंगलौर';

  @override
  String get selectState => 'राज्य चुनें';

  @override
  String get selectDistrict => 'जिला चुनें';

  @override
  String get showDefaultPrices => 'डिफ़ॉल्ट बाज़ार मूल्य दिखाएं';

  @override
  String get priceDetails => 'मूल्य विवरण';

  @override
  String get minPrice => 'न्यूनतम मूल्य';

  @override
  String get modalPrice => 'मोडल मूल्य';

  @override
  String get maxPrice => 'अधिकतम मूल्य';

  @override
  String get marketDetails => 'बाज़ार विवरण';

  @override
  String get market => 'बाज़ार';

  @override
  String get district => 'जिला';

  @override
  String get state => 'राज्य';

  @override
  String get dateInformation => 'तारीख जानकारी';

  @override
  String get arrivalDate => 'आवक तिथि';

  @override
  String get cropDiseaseDetection => 'फसल रोग पहचान';

  @override
  String get governmentSchemesAndSubsidies => 'सरकारी योजनाएँ और सब्सिडी';

  @override
  String get snow => 'Snow';

  @override
  String get mist => 'Mist';

  @override
  String get fog => 'Fog';

  @override
  String get haze => 'Haze';

  @override
  String get rain => 'बारिश';

  @override
  String get drizzle => 'Drizzle';

  @override
  String get shower => 'Shower';

  @override
  String get locationMumbai => 'मुंबई';

  @override
  String get locationDelhi => 'दिल्ली';

  @override
  String get locationPune => 'पुणे';

  @override
  String get locationBangalore => 'बैंगलोर';

  @override
  String get locationChennai => 'चेन्नई';

  @override
  String get locationKolkata => 'कोलकाता';

  @override
  String get locationHyderabad => 'हैदराबाद';

  @override
  String get locationAhmedabad => 'अहमदाबाद';

  @override
  String get locationNagpur => 'नागपुर';

  @override
  String get overcast => 'बादल छाए';

  @override
  String get lightRain => 'हल्की बारिश';

  @override
  String get heavyRain => 'भारी बारिश';

  @override
  String get getPesticideInfo => 'कीटनाशक जानकारी प्राप्त करें';
}

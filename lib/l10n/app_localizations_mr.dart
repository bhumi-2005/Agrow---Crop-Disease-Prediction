// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'अॅग्रो';

  @override
  String get todaysWeather => 'आजचे हवामान';

  @override
  String get hourlyForecast => 'तासाभराचा अंदाज';

  @override
  String currentTime(String time) {
    return 'सध्याची वेळ: $time';
  }

  @override
  String temperature(int temp) {
    return '$temp°C';
  }

  @override
  String get govtSchemes => 'सरकारी योजना आणि अनुदान';

  @override
  String get govtSchemesDesc =>
      'शेतकऱ्यांसाठी उपलब्ध सरकारी योजना आणि अनुदान तपासा';

  @override
  String get expertConsultation => 'तज्ञ सल्ला';

  @override
  String get expertConsultationDesc => 'कृषी तज्ञांकडून वैयक्तिक सल्ला मिळवा';

  @override
  String get warningAlert => 'वादळाचा इशारा';

  @override
  String get partlyCloudy => 'अंशतः ढगाळ';

  @override
  String get searchExperts => 'नाव किंवा विशेषज्ञता शोधा...';

  @override
  String get applyNow => 'अर्ज करा';

  @override
  String get details => 'तपशील';

  @override
  String get remind => 'आठवण करा';

  @override
  String get location => 'स्थान';

  @override
  String get condition => 'अंशतः ढगाळ';

  @override
  String forecast(String time) {
    return 'अंदाज';
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
  String get am => 'सकाळी';

  @override
  String get pm => 'संध्याकाळी';

  @override
  String get warningMessage => 'वादळाचा इशारा';

  @override
  String get safe => 'सुरक्षित';

  @override
  String get caution => 'सावधानता';

  @override
  String get danger => 'धोका';

  @override
  String get expertConsultationTitle => 'तज्ञ सल्ला';

  @override
  String get searchExpertsHint => 'नाव किंवा विशेषज्ञता शोधा...';

  @override
  String get filterAll => 'सर्व';

  @override
  String get filterCrops => 'पीक';

  @override
  String get filterSoil => 'माती';

  @override
  String get filterGovt => 'सरकारी';

  @override
  String get noExpertsFound => 'कोणतेही तज्ञ सापडले नाहीत';

  @override
  String get tryDifferentSearch => 'वेगळे शोध शब्द किंवा फिल्टर वापरून पहा';

  @override
  String get experienceLabel => 'वर्षांचा अनुभव';

  @override
  String feePerSession(String amount) {
    return '₹$amount/30मिनिटे';
  }

  @override
  String rating(double score) {
    return '$score';
  }

  @override
  String get chatButton => 'चॅट';

  @override
  String get callButton => 'कॉल';

  @override
  String get videoButton => 'व्हिडिओ';

  @override
  String get expertName1 => 'डॉ. राजेश कुमार';

  @override
  String get expertName2 => 'डॉ. प्रिया शर्मा';

  @override
  String get expertName3 => 'अमित पाटील';

  @override
  String get expertSpec1 => 'पीक रोग तज्ञ';

  @override
  String get expertSpec2 => 'मृदा शास्त्रज्ञ';

  @override
  String get expertSpec3 => 'सरकारी योजना सल्लागार';

  @override
  String get expertExp1 =>
      'पीक रोग व्यवस्थापन आणि प्रतिबंधात १५ वर्षांचा अनुभव';

  @override
  String get expertExp2 =>
      'माती आरोग्य आणि सुपीकता व्यवस्थापनात १२ वर्षांचा अनुभव';

  @override
  String get expertExp3 => 'कृषी योजना आणि अनुदानात १० वर्षांची विशेषज्ञता';

  @override
  String get tagCrops => 'पिके';

  @override
  String get tagDisease => 'रोग नियंत्रण';

  @override
  String get tagSoil => 'माती';

  @override
  String get tagFertility => 'सुपीकता';

  @override
  String get tagGovt => 'सरकारी';

  @override
  String get tagSubsidies => 'अनुदान';

  @override
  String get expertType1 => 'पिके';

  @override
  String get expertType2 => 'माती';

  @override
  String get expertType3 => 'सरकारी';

  @override
  String get cropAdvisory => 'पीक सल्ला';

  @override
  String get cropAdvisoryDesc =>
      'तुमच्या जमिनी आणि परिस्थितींवर आधारित वैयक्तिक पीक शिफारसी मिळवा';

  @override
  String get cropDisease => 'पीक रोग';

  @override
  String get cropDiseaseDesc =>
      'रोग ओळखण्यासाठी आणि उपचाराच्या शिफारसी मिळवण्यासाठी तुमच्या पिकाचा फोटो काढा किंवा प्रतिमा अपलोड करा';

  @override
  String get cropAdvisoryTitle => 'पीक सल्ला';

  @override
  String get getPersonalizedRecommendations => 'वैयक्तिक पीक शिफारसी मिळवा';

  @override
  String get fillDetailsBelow => 'सानुकूल कीटकनाशक सल्ल्यासाठी खालील तपशील भरा';

  @override
  String get cropSelection => 'पीक निवड';

  @override
  String get selectFromList => 'यादीतून निवडा';

  @override
  String get enterManually => 'स्वतः टाइप करा';

  @override
  String get selectCrop => 'पीक निवडा';

  @override
  String get enterCropName => 'पीक नाव टाका';

  @override
  String get landArea => 'जमीन क्षेत्र';

  @override
  String get enterArea => 'क्षेत्र टाका';

  @override
  String get irrigationMethod => 'सिंचन पद्धत';

  @override
  String get selectIrrigationMethod => 'सिंचन पद्धत निवडा';

  @override
  String get enterIrrigationMethod => 'सिंचन पद्धत टाका';

  @override
  String get weatherConditions => 'हवामान स्थिती';

  @override
  String get selectWeatherCondition => 'हवामान स्थिती निवडा';

  @override
  String get enterWeatherCondition => 'हवामान स्थिती टाका';

  @override
  String get getAdvisory => 'सल्ला मिळवा';

  @override
  String get areaUnitsAcres => 'एकर';

  @override
  String get areaUnitsHectares => 'हेक्टर';

  @override
  String get areaUnitsSquareMeters => 'चौरस मीटर';

  @override
  String get areaUnitsSquareFeet => 'चौरस फूट';

  @override
  String get areaUnitsGuntha => 'गुंठा';

  @override
  String get areaUnitsBigha => 'बिघा';

  @override
  String get weatherTypesSunny => 'ऊन';

  @override
  String get weatherTypesPartlyCloudy => 'अंशतः ढगाळ';

  @override
  String get weatherTypesOvercast => 'पूर्ण ढगाळ';

  @override
  String get weatherTypesLightRain => 'हलका पाऊस';

  @override
  String get weatherTypesHeavyRain => 'जोरदार पाऊस';

  @override
  String get weatherTypesThunderstorm => 'वादळी पाऊस';

  @override
  String get weatherTypesWindy => 'वारा';

  @override
  String get weatherTypesHotHumid => 'उष्ण आणि दमट';

  @override
  String get weatherTypesColdDry => 'थंड आणि कोरडे';

  @override
  String get weatherTypesFoggy => 'धुके';

  @override
  String get weatherTypesHazy => 'धुरके';

  @override
  String get weatherTypesDrought => 'दुष्काळी परिस्थिती';

  @override
  String get weatherTypesHighTemp => 'उच्च तापमान';

  @override
  String get weatherTypesLowTemp => 'कमी तापमान';

  @override
  String get irrigationTypesDrip => 'ठिबक सिंचन';

  @override
  String get irrigationTypesSprinkler => 'तुषार सिंचन';

  @override
  String get irrigationTypesFlood => 'पाट पाणी';

  @override
  String get irrigationTypesFurrow => 'सरी पद्धत';

  @override
  String get irrigationTypesCenterPivot => 'फिरते सिंचन';

  @override
  String get irrigationTypesSubsurfaceDrip => 'भूमिगत ठिबक';

  @override
  String get irrigationTypesMicroSprinkler => 'सूक्ष्म तुषार प्रणाली';

  @override
  String get irrigationTypesSurface => 'पृष्ठभाग सिंचन';

  @override
  String get irrigationTypesBasin => 'वाफा पद्धत';

  @override
  String get irrigationTypesBorderStrip => 'बांध पद्धत';

  @override
  String get cropsWheat => 'गहू';

  @override
  String get cropsRice => 'भात';

  @override
  String get cropsCotton => 'कापूस';

  @override
  String get cropsSugarcane => 'ऊस';

  @override
  String get cropsMaize => 'मका';

  @override
  String get cropsSoybean => 'सोयाबीन';

  @override
  String get soilClay => 'चिकणमाती';

  @override
  String get soilSandy => 'वाळूमिश्रित माती';

  @override
  String get soilLoamy => 'मुरमाड माती';

  @override
  String get soilSilt => 'गाळाची माती';

  @override
  String get soilBlackCotton => 'काळी कसदार माती';

  @override
  String get soilRed => 'लाल माती';

  @override
  String get soilAlluvial => 'गाळाची माती';

  @override
  String get weatherSunny => 'ऊन';

  @override
  String get weatherCloudy => 'ढगाळ';

  @override
  String get weatherRainy => 'पावसाळी';

  @override
  String get weatherHotHumid => 'उष्ण आणि दमट';

  @override
  String get weatherCold => 'थंड';

  @override
  String get weatherWindy => 'वारा';

  @override
  String get weatherDrought => 'दुष्काळ';

  @override
  String get irrigationDrip => 'ठिबक सिंचन';

  @override
  String get irrigationSprinkler => 'तुषार सिंचन';

  @override
  String get irrigationFlood => 'पाट पाणी';

  @override
  String get irrigationFurrow => 'सरी सिंचन';

  @override
  String get irrigationBasin => 'थाळे पद्धत';

  @override
  String get irrigationRainfed => 'कोरडवाहू';

  @override
  String get stageSeedling => 'रोप अवस्था';

  @override
  String get stageVegetative => 'वाढीची अवस्था';

  @override
  String get stageFlowering => 'फुलोरा अवस्था';

  @override
  String get stageFruiting => 'फळधारणा अवस्था';

  @override
  String get stageMaturity => 'परिपक्व अवस्था';

  @override
  String get stageHarvest => 'काढणी अवस्था';

  @override
  String get soilTypeTitle => 'जमिनीचा प्रकार';

  @override
  String get soilTypeDesc => 'तुमच्या शेतातील जमिनीचा प्रकार निवडा';

  @override
  String get enterSoilType => 'जमिनीचा प्रकार टाका';

  @override
  String get selectSoilType => 'जमिनीचा प्रकार निवडा';

  @override
  String get weatherTitle => 'हवामान स्थिती';

  @override
  String get weatherDesc => 'सध्याची हवामान स्थिती निवडा';

  @override
  String get enterWeather => 'हवामान स्थिती टाका';

  @override
  String get selectWeather => 'हवामान स्थिती निवडा';

  @override
  String get irrigationTitle => 'सिंचन पद्धत';

  @override
  String get irrigationDesc => 'तुमची सिंचन पद्धत निवडा';

  @override
  String get enterIrrigation => 'सिंचन पद्धत टाका';

  @override
  String get selectIrrigation => 'सिंचन पद्धत निवडा';

  @override
  String get growthStageTitle => 'पीक वाढीची अवस्था';

  @override
  String get growthStageDesc => 'तुमच्या पिकाची सध्याची वाढीची अवस्था निवडा';

  @override
  String get enterGrowthStage => 'वाढीची अवस्था टाका';

  @override
  String get selectGrowthStage => 'वाढीची अवस्था निवडा';

  @override
  String get cropsPotato => 'बटाटा';

  @override
  String get cropsTomato => 'टोमॅटो';

  @override
  String get cropsOnion => 'कांदा';

  @override
  String get cropsGroundnut => 'भुईमूग';

  @override
  String get cropsChickpea => 'हरभरा';

  @override
  String get cropsMustard => 'मोहरी';

  @override
  String get cropsSunflower => 'सूर्यफूल';

  @override
  String get cropsTurmeric => 'हळद';

  @override
  String get cropsGinger => 'आले';

  @override
  String get cropsGarlic => 'लसूण';

  @override
  String get cropsChili => 'मिरची';

  @override
  String get cropsCauliflower => 'फुलकोबी';

  @override
  String get cropsCabbage => 'कोबी';

  @override
  String get cropsCarrot => 'गाजर';

  @override
  String get cropsPeas => 'वाटाणा';

  @override
  String get cropsBeans => 'शेंगा';

  @override
  String get cropsCucumber => 'काकडी';

  @override
  String get cropsEggplant => 'वांगे';

  @override
  String get cropsOkra => 'भेंडी';

  @override
  String get appName => 'एग्रो';

  @override
  String get services => 'सेवा';

  @override
  String get pesticides => 'कीटकनाशक सल्ला';

  @override
  String get marketPrices => 'बाजार भाव';

  @override
  String get currentTemp => 'सध्याचे तापमान';

  @override
  String get feelsLike => 'जाणवते';

  @override
  String get humidity => 'आर्द्रता';

  @override
  String get windSpeed => 'वाऱ्याचा वेग';

  @override
  String get precipitation => 'पाऊस';

  @override
  String get weeklyForecast => 'आठवड्याचा अंदाज';

  @override
  String get loading => 'लोड होत आहे...';

  @override
  String get errorLoading => 'हवामान माहिती लोड करताना त्रुटी';

  @override
  String get retry => 'पुन्हा प्रयत्न करा';

  @override
  String get kmh => 'किमी/तास';

  @override
  String get percent => '%';

  @override
  String get mm => 'मिमी';

  @override
  String get clear => 'निरभ्र';

  @override
  String get sunny => 'उन्हाळी';

  @override
  String get cloudy => 'ढगाळ';

  @override
  String get rainy => 'Rainy';

  @override
  String get thunderstorm => 'वादळ';

  @override
  String get uv => 'यूव्ही';

  @override
  String get wind => 'वारा';

  @override
  String get day => 'दिवस';

  @override
  String get today => 'आज';

  @override
  String get tomorrow => 'उद्या';

  @override
  String get monday => 'सोमवार';

  @override
  String get tuesday => 'मंगळवार';

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
  String get min => 'किमान';

  @override
  String get max => 'कमाल';

  @override
  String get threeDayForecast => '3 दिवसांचा अंदाज';

  @override
  String get cropDiseasePrediction => 'पीक रोग ओळख';

  @override
  String get uploadImage => 'प्रतिमा अपलोड करा';

  @override
  String get takePhoto => 'फोटो काढा';

  @override
  String get chooseFromGallery => 'गॅलरीमधून निवडा';

  @override
  String get analyzing => 'विश्लेषण करत आहे...';

  @override
  String get uploadOrTakePhoto =>
      'कृपया प्रभावित पिकाचा फोटो अपलोड करा किंवा काढा';

  @override
  String get diseaseDetected => 'रोग आढळला';

  @override
  String get diseaseName => 'रोगाचे नाव';

  @override
  String get confidence => 'विश्वसनीयता';

  @override
  String get treatment => 'उपचार';

  @override
  String get preventiveMeasures => 'प्रतिबंधात्मक उपाय';

  @override
  String get noDisease => 'कोणताही रोग आढळला नाही';

  @override
  String get healthyPlant => 'तुमचे रोपण निरोगी दिसत आहे!';

  @override
  String get tryDifferentImage => 'वेगळ्या प्रतिमेसह प्रयत्न करा';

  @override
  String get imageError => 'प्रतिमा लोड करताना त्रुटी';

  @override
  String get analysisFailed => 'विश्लेषण अयशस्वी';

  @override
  String get retryAnalysis => 'पुन्हा विश्लेषण करा';

  @override
  String get diagnostics => 'निदान';

  @override
  String get uploadImageForResults => 'निकाल मिळवण्यासाठी प्रतिमा अपलोड करा';

  @override
  String get pesticideAdvisory => 'कीटकनाशक सल्ला';

  @override
  String get searchPesticide => 'कीटकनाशके शोधा...';

  @override
  String get pesticideDetails => 'कीटकनाशक तपशील';

  @override
  String get activeIngredient => 'सक्रिय घटक';

  @override
  String get targetPests => 'लक्ष्यित कीटक';

  @override
  String get applicableCrops => 'लागू पिके';

  @override
  String get dosage => 'मात्रा';

  @override
  String get safetyPeriod => 'सुरक्षा कालावधी';

  @override
  String get precautions => 'खबरदारी';

  @override
  String get application => 'वापरण्याची पद्धत';

  @override
  String get effectiveness => 'परिणामकारकता';

  @override
  String get alternatives => 'नैसर्गिक पर्याय';

  @override
  String get filterBy => 'फिल्टर करा';

  @override
  String get allPesticides => 'सर्व कीटकनाशके';

  @override
  String get organic => 'सेंद्रिय';

  @override
  String get chemical => 'रासायनिक';

  @override
  String get biological => 'जैविक';

  @override
  String get noPesticidesFound => 'कोणतीही कीटकनाशके सापडली नाहीत';

  @override
  String get tryDifferentFilter => 'वेगळा फिल्टर किंवा शोध शब्द वापरून पहा';

  @override
  String get pesticideAdvisoryDesc =>
      'Fill in the details below for customized pesticide advisory';

  @override
  String get issueType => 'Issue Type';

  @override
  String get issueTypeDesc => 'तुम्हाला कोणत्या प्रकारची समस्या जाणवत आहे?';

  @override
  String get enterIssueType => 'Enter Issue Type';

  @override
  String get additionalInfo => 'अतिरिक्त माहिती';

  @override
  String get additionalInfoDesc => 'तुम्हाला आणखी काही तपशील जोडायचे आहेत का?';

  @override
  String get additionalInfoHint => 'काही अतिरिक्त माहिती टाका...';

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
  String get cropType => 'पीक प्रकार';

  @override
  String get cropTypeDesc => 'तुम्ही कोणते पीक लावत आहात?';

  @override
  String get enterCropType => 'पीक प्रकार टाका';

  @override
  String get pestType => 'कीटक प्रकार';

  @override
  String get pestTypeDesc =>
      'तुम्ही कोणत्या प्रकारच्या कीटकांशी सामना करत आहात?';

  @override
  String get enterPestType => 'कीटक प्रकार टाका';

  @override
  String get region => 'प्रदेश';

  @override
  String get regionDesc => 'तुमचे शेत कोणत्या प्रदेशात आहे?';

  @override
  String get enterRegion => 'प्रदेश टाका';

  @override
  String get plantingMonth => 'लागवडीचा महिना';

  @override
  String get plantingMonthDesc => 'तुम्ही पीक केव्हा लावले?';

  @override
  String get enterPlantingMonth => 'लागवडीचा महिना टाका';

  @override
  String get issueTypeTitle => 'समस्येचा प्रकार';

  @override
  String get issueTypePests => 'कीटक';

  @override
  String get issueTypeDiseases => 'रोग';

  @override
  String get issueTypeWeeds => 'तण';

  @override
  String get issueTypeNutrient => 'पोषक द्रव्यांची कमतरता';

  @override
  String get issueTypeOther => 'इतर';

  @override
  String get selectIssueType => 'समस्येचा प्रकार निवडा';

  @override
  String get selectCropType => 'पीक प्रकार निवडा';

  @override
  String get selectPestType => 'कीटक प्रकार निवडा';

  @override
  String get selectRegion => 'प्रदेश निवडा';

  @override
  String get selectPlantingMonth => 'लागवडीचा महिना निवडा';

  @override
  String get pestsAphids => 'माहूर';

  @override
  String get pestsWeevils => 'घोगडा';

  @override
  String get pestsBollworm => 'बोंड अळी';

  @override
  String get pestsStemborer => 'खोड किडा';

  @override
  String get pestsArmyworm => 'लष्करी अळी';

  @override
  String get pestsLeafhopper => 'तुडतुडे';

  @override
  String get pestsWhitefly => 'पांढरी माशी';

  @override
  String get pestsGrasshopper => 'टोळ';

  @override
  String get pestsThrips => 'फुलकिडे';

  @override
  String get pestsMites => 'कोळी';

  @override
  String get regionsKonkan => 'कोकण';

  @override
  String get regionsWestern => 'पश्चिम महाराष्ट्र';

  @override
  String get regionsMarathwada => 'मराठवाडा';

  @override
  String get regionsVidarbha => 'विदर्भ';

  @override
  String get regionsNorthern => 'उत्तर महाराष्ट्र';

  @override
  String get regionsNagpur => 'नागपूर';

  @override
  String get regionsNashik => 'नाशिक';

  @override
  String get regionsPune => 'पुणे';

  @override
  String get regionsAmravati => 'अमरावती';

  @override
  String get regionsLatur => 'लातूर';

  @override
  String get monthsJanuary => 'जानेवारी';

  @override
  String get monthsFebruary => 'फेब्रुवारी';

  @override
  String get monthsMarch => 'मार्च';

  @override
  String get monthsApril => 'एप्रिल';

  @override
  String get monthsMay => 'मे';

  @override
  String get monthsJune => 'जून';

  @override
  String get monthsJuly => 'जुलै';

  @override
  String get monthsAugust => 'ऑगस्ट';

  @override
  String get monthsSeptember => 'सप्टेंबर';

  @override
  String get monthsOctober => 'ऑक्टोबर';

  @override
  String get monthsNovember => 'नोव्हेंबर';

  @override
  String get monthsDecember => 'डिसेंबर';

  @override
  String get govtSchemesTitle => 'सरकारी योजना आणि अनुदान';

  @override
  String get searchSchemes => 'योजना शोधा...';

  @override
  String get filterSchemes => 'योजना फिल्टर करा';

  @override
  String get allSchemes => 'सर्व योजना';

  @override
  String get activeSchemes => 'सक्रिय';

  @override
  String get upcomingSchemes => 'येणाऱ्या';

  @override
  String get expiredSchemes => 'कालबाह्य';

  @override
  String get schemeDetails => 'योजना तपशील';

  @override
  String get eligibility => 'पात्रता';

  @override
  String get benefits => 'लाभ';

  @override
  String get requiredDocuments => 'आवश्यक कागदपत्रे';

  @override
  String get applicationProcess => 'अर्ज प्रक्रिया';

  @override
  String get lastDate => 'अंतिम दिनांक';

  @override
  String get status => 'स्थिती';

  @override
  String get viewMore => 'अधिक पहा';

  @override
  String get noSchemesFound => 'कोणतीही योजना सापडली नाही';

  @override
  String get schemeTitle1 => 'प्रधानमंत्री पीक विमा योजना';

  @override
  String get schemeDesc1 => 'शेतकऱ्यांसाठी पीक विमा योजना';

  @override
  String get schemeTitle2 => 'पीएम किसान सन्मान निधी';

  @override
  String get schemeDesc2 => 'शेतकऱ्यांसाठी थेट उत्पन्न सहाय्य';

  @override
  String get schemeTitle3 => 'किसान क्रेडिट कार्ड';

  @override
  String get schemeDesc3 => 'कृषी गरजांसाठी कर्ज सुविधा';

  @override
  String get ongoing => 'सुरू';

  @override
  String get visitWebsite => 'वेबसाइट भेट द्या';

  @override
  String get searchCrops => 'पिके, प्रकार, बाजार शोधा...';

  @override
  String get loadingLocation => 'तुमचे स्थान मिळवत आहे...';

  @override
  String get currentPrice => 'सध्याचा भाव';

  @override
  String get marketName => 'बाजार';

  @override
  String get lastUpdated => 'शेवटचे अपडेट';

  @override
  String get tryAgain => 'पुन्हा प्रयत्न करा';

  @override
  String get noSearchResults => 'तुमच्या शोधाशी जुळणारी कोणतीही पिके नाहीत';

  @override
  String get noCropPrices => 'तुमच्या स्थानासाठी कोणतेही पीक भाव उपलब्ध नाहीत';

  @override
  String get allStates => 'सर्व राज्ये';

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
  String get allDistricts => 'सर्व जिल्हे';

  @override
  String get mumbai => 'मुंबई';

  @override
  String get pune => 'पुणे';

  @override
  String get nagpur => 'नागपूर';

  @override
  String get nashik => 'नाशिक';

  @override
  String get aurangabad => 'औरंगाबाद';

  @override
  String get bangalore => 'बेंगळुरू';

  @override
  String get mysore => 'मैसूर';

  @override
  String get hubli => 'हुबळी';

  @override
  String get mangalore => 'मंगळूर';

  @override
  String get selectState => 'राज्य निवडा';

  @override
  String get selectDistrict => 'जिल्हा निवडा';

  @override
  String get showDefaultPrices => 'डीफॉल्ट बाजार भाव दाखवा';

  @override
  String get priceDetails => 'किंमत तपशील';

  @override
  String get minPrice => 'किमान किंमत';

  @override
  String get modalPrice => 'मोडल किंमत';

  @override
  String get maxPrice => 'कमाल किंमत';

  @override
  String get marketDetails => 'बाजार तपशील';

  @override
  String get market => 'बाजार';

  @override
  String get district => 'जिल्हा';

  @override
  String get state => 'राज्य';

  @override
  String get dateInformation => 'तारीख माहिती';

  @override
  String get arrivalDate => 'आवक तारीख';

  @override
  String get cropDiseaseDetection => 'पीक रोग निदान';

  @override
  String get governmentSchemesAndSubsidies => 'सरकारी योजना आणि अनुदान';

  @override
  String get snow => 'बर्फ';

  @override
  String get mist => 'धुके';

  @override
  String get fog => 'दाट धुके';

  @override
  String get haze => 'धूसर';

  @override
  String get rain => 'पाऊस';

  @override
  String get drizzle => 'रिमझिम';

  @override
  String get shower => 'सरी';

  @override
  String get locationMumbai => 'मुंबई';

  @override
  String get locationDelhi => 'दिल्ली';

  @override
  String get locationPune => 'पुणे';

  @override
  String get locationBangalore => 'बेंगळुरू';

  @override
  String get locationChennai => 'चेन्नई';

  @override
  String get locationKolkata => 'कोलकाता';

  @override
  String get locationHyderabad => 'हैदराबाद';

  @override
  String get locationAhmedabad => 'अहमदाबाद';

  @override
  String get locationNagpur => 'नागपूर';

  @override
  String get overcast => 'मेघाच्छादित';

  @override
  String get lightRain => 'हलका पाऊस';

  @override
  String get heavyRain => 'जोरदार पाऊस';

  @override
  String get getPesticideInfo => 'कीटकनाशक माहिती मिळवा';
}

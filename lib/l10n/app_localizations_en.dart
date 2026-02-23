// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Agrow';

  @override
  String get todaysWeather => 'Today\'s Weather';

  @override
  String get hourlyForecast => 'Hourly Forecast';

  @override
  String currentTime(String time) {
    return 'Current Time: $time';
  }

  @override
  String temperature(int temp) {
    return '$temp°C';
  }

  @override
  String get govtSchemes => 'Govt. Schemes';

  @override
  String get govtSchemesDesc =>
      'Check available government schemes and subsidies for farmers';

  @override
  String get expertConsultation => 'Expert Consultation';

  @override
  String get expertConsultationDesc =>
      'Connect with agricultural experts for personalized advice';

  @override
  String get warningAlert => 'Thunderstorm warning';

  @override
  String get partlyCloudy => 'Partly Cloudy';

  @override
  String get searchExperts => 'Search experts by name or specialization...';

  @override
  String get applyNow => 'Apply Now';

  @override
  String get details => 'Details';

  @override
  String get remind => 'Remind';

  @override
  String get location => 'Location';

  @override
  String get condition => 'Partly Cloudy';

  @override
  String forecast(String time) {
    return 'Forecast';
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
  String get am => 'AM';

  @override
  String get pm => 'PM';

  @override
  String get warningMessage => 'Thunderstorm warning';

  @override
  String get safe => 'Safe';

  @override
  String get caution => 'Caution';

  @override
  String get danger => 'Danger';

  @override
  String get expertConsultationTitle => 'Expert Consultation';

  @override
  String get searchExpertsHint => 'Search experts by name or specialization...';

  @override
  String get filterAll => 'All';

  @override
  String get filterCrops => 'Crops';

  @override
  String get filterSoil => 'Soil';

  @override
  String get filterGovt => 'Govt.';

  @override
  String get noExpertsFound => 'No experts found';

  @override
  String get tryDifferentSearch => 'Try different search terms or filters';

  @override
  String get experienceLabel => 'years of experience';

  @override
  String feePerSession(String amount) {
    return '₹$amount/30min';
  }

  @override
  String rating(double score) {
    return '$score';
  }

  @override
  String get chatButton => 'Chat';

  @override
  String get callButton => 'Call';

  @override
  String get videoButton => 'Video';

  @override
  String get expertName1 => 'Dr. Rajesh Kumar';

  @override
  String get expertName2 => 'Dr. Priya Sharma';

  @override
  String get expertName3 => 'Amit Patel';

  @override
  String get expertSpec1 => 'Crop Disease Specialist';

  @override
  String get expertSpec2 => 'Soil Scientist';

  @override
  String get expertSpec3 => 'Government Scheme Advisor';

  @override
  String get expertExp1 =>
      '15 years of experience in crop disease management and prevention';

  @override
  String get expertExp2 =>
      'Expert in soil health and fertility management with 12 years of experience';

  @override
  String get expertExp3 =>
      'Specialized in agricultural schemes and subsidies for 10 years';

  @override
  String get tagCrops => 'Crops';

  @override
  String get tagDisease => 'Disease Control';

  @override
  String get tagSoil => 'Soil';

  @override
  String get tagFertility => 'Fertility';

  @override
  String get tagGovt => 'Government';

  @override
  String get tagSubsidies => 'Subsidies';

  @override
  String get expertType1 => 'Crops';

  @override
  String get expertType2 => 'Soil';

  @override
  String get expertType3 => 'Govt.';

  @override
  String get cropAdvisory => 'Crop Advisory';

  @override
  String get cropAdvisoryDesc =>
      'Get personalized crop recommendations based on your land and conditions';

  @override
  String get cropDisease => 'Crop Disease';

  @override
  String get cropDiseaseDesc =>
      'Take a photo or upload an image of your crop to identify diseases and get treatment recommendations';

  @override
  String get cropAdvisoryTitle => 'Crop Advisory';

  @override
  String get getPersonalizedRecommendations =>
      'Get Personalized Crop Recommendations';

  @override
  String get fillDetailsBelow =>
      'Fill in the details below for customized pesticide advisory';

  @override
  String get cropSelection => 'Crop Selection';

  @override
  String get selectFromList => 'Select from list';

  @override
  String get enterManually => 'Enter manually';

  @override
  String get selectCrop => 'Select crop';

  @override
  String get enterCropName => 'Enter crop name';

  @override
  String get landArea => 'Land Area';

  @override
  String get enterArea => 'Enter area';

  @override
  String get irrigationMethod => 'Irrigation Method';

  @override
  String get selectIrrigationMethod => 'Select irrigation method';

  @override
  String get enterIrrigationMethod => 'Enter irrigation method';

  @override
  String get weatherConditions => 'Weather Conditions';

  @override
  String get selectWeatherCondition => 'Select weather condition';

  @override
  String get enterWeatherCondition => 'Enter weather condition';

  @override
  String get getAdvisory => 'Get Advisory';

  @override
  String get areaUnitsAcres => 'Acres';

  @override
  String get areaUnitsHectares => 'Hectares';

  @override
  String get areaUnitsSquareMeters => 'Square Meters';

  @override
  String get areaUnitsSquareFeet => 'Square Feet';

  @override
  String get areaUnitsGuntha => 'Guntha';

  @override
  String get areaUnitsBigha => 'Bigha';

  @override
  String get weatherTypesSunny => 'Sunny';

  @override
  String get weatherTypesPartlyCloudy => 'Partly Cloudy';

  @override
  String get weatherTypesOvercast => 'Overcast';

  @override
  String get weatherTypesLightRain => 'Light Rain';

  @override
  String get weatherTypesHeavyRain => 'Heavy Rain';

  @override
  String get weatherTypesThunderstorm => 'Thunderstorm';

  @override
  String get weatherTypesWindy => 'Windy';

  @override
  String get weatherTypesHotHumid => 'Hot and Humid';

  @override
  String get weatherTypesColdDry => 'Cold and Dry';

  @override
  String get weatherTypesFoggy => 'Foggy';

  @override
  String get weatherTypesHazy => 'Hazy';

  @override
  String get weatherTypesDrought => 'Drought Conditions';

  @override
  String get weatherTypesHighTemp => 'High Temperature';

  @override
  String get weatherTypesLowTemp => 'Low Temperature';

  @override
  String get irrigationTypesDrip => 'Drip Irrigation';

  @override
  String get irrigationTypesSprinkler => 'Sprinkler Irrigation';

  @override
  String get irrigationTypesFlood => 'Flood Irrigation';

  @override
  String get irrigationTypesFurrow => 'Furrow Irrigation';

  @override
  String get irrigationTypesCenterPivot => 'Center Pivot Irrigation';

  @override
  String get irrigationTypesSubsurfaceDrip => 'Sub-surface Drip Irrigation';

  @override
  String get irrigationTypesMicroSprinkler => 'Micro-sprinkler System';

  @override
  String get irrigationTypesSurface => 'Surface Irrigation';

  @override
  String get irrigationTypesBasin => 'Basin Irrigation';

  @override
  String get irrigationTypesBorderStrip => 'Border Strip Irrigation';

  @override
  String get cropsWheat => 'Wheat';

  @override
  String get cropsRice => 'Rice';

  @override
  String get cropsCotton => 'Cotton';

  @override
  String get cropsSugarcane => 'Sugarcane';

  @override
  String get cropsMaize => 'Maize';

  @override
  String get cropsSoybean => 'Soybean';

  @override
  String get soilClay => 'Clay Soil';

  @override
  String get soilSandy => 'Sandy Soil';

  @override
  String get soilLoamy => 'Loamy Soil';

  @override
  String get soilSilt => 'Silty Soil';

  @override
  String get soilBlackCotton => 'Black Cotton Soil';

  @override
  String get soilRed => 'Red Soil';

  @override
  String get soilAlluvial => 'Alluvial Soil';

  @override
  String get weatherSunny => 'Sunny';

  @override
  String get weatherCloudy => 'Cloudy';

  @override
  String get weatherRainy => 'Rainy';

  @override
  String get weatherHotHumid => 'Hot and Humid';

  @override
  String get weatherCold => 'Cold';

  @override
  String get weatherWindy => 'Windy';

  @override
  String get weatherDrought => 'Drought';

  @override
  String get irrigationDrip => 'Drip Irrigation';

  @override
  String get irrigationSprinkler => 'Sprinkler Irrigation';

  @override
  String get irrigationFlood => 'Flood Irrigation';

  @override
  String get irrigationFurrow => 'Furrow Irrigation';

  @override
  String get irrigationBasin => 'Basin Irrigation';

  @override
  String get irrigationRainfed => 'Rainfed';

  @override
  String get stageSeedling => 'Seedling Stage';

  @override
  String get stageVegetative => 'Vegetative Stage';

  @override
  String get stageFlowering => 'Flowering Stage';

  @override
  String get stageFruiting => 'Fruiting Stage';

  @override
  String get stageMaturity => 'Maturity Stage';

  @override
  String get stageHarvest => 'Harvest Stage';

  @override
  String get soilTypeTitle => 'Soil Type';

  @override
  String get soilTypeDesc => 'Select the type of soil in your field';

  @override
  String get enterSoilType => 'Enter soil type';

  @override
  String get selectSoilType => 'Select soil type';

  @override
  String get weatherTitle => 'Weather Conditions';

  @override
  String get weatherDesc => 'Select the current weather conditions';

  @override
  String get enterWeather => 'Enter weather conditions';

  @override
  String get selectWeather => 'Select weather conditions';

  @override
  String get irrigationTitle => 'Irrigation Method';

  @override
  String get irrigationDesc => 'Select your irrigation method';

  @override
  String get enterIrrigation => 'Enter irrigation method';

  @override
  String get selectIrrigation => 'Select irrigation method';

  @override
  String get growthStageTitle => 'Crop Growth Stage';

  @override
  String get growthStageDesc => 'Select the current growth stage of your crop';

  @override
  String get enterGrowthStage => 'Enter growth stage';

  @override
  String get selectGrowthStage => 'Select growth stage';

  @override
  String get cropsPotato => 'Potato';

  @override
  String get cropsTomato => 'Tomato';

  @override
  String get cropsOnion => 'Onion';

  @override
  String get cropsGroundnut => 'Groundnut';

  @override
  String get cropsChickpea => 'Chickpea';

  @override
  String get cropsMustard => 'Mustard';

  @override
  String get cropsSunflower => 'Sunflower';

  @override
  String get cropsTurmeric => 'Turmeric';

  @override
  String get cropsGinger => 'Ginger';

  @override
  String get cropsGarlic => 'Garlic';

  @override
  String get cropsChili => 'Chili';

  @override
  String get cropsCauliflower => 'Cauliflower';

  @override
  String get cropsCabbage => 'Cabbage';

  @override
  String get cropsCarrot => 'Carrot';

  @override
  String get cropsPeas => 'Peas';

  @override
  String get cropsBeans => 'Beans';

  @override
  String get cropsCucumber => 'Cucumber';

  @override
  String get cropsEggplant => 'Eggplant';

  @override
  String get cropsOkra => 'Okra';

  @override
  String get appName => 'Agrow';

  @override
  String get services => 'Services';

  @override
  String get pesticides => 'Pesticide Advisory';

  @override
  String get marketPrices => 'Market Prices';

  @override
  String get currentTemp => 'Current Temperature';

  @override
  String get feelsLike => 'Feels Like';

  @override
  String get humidity => 'Humidity';

  @override
  String get windSpeed => 'Wind Speed';

  @override
  String get precipitation => 'Precipitation';

  @override
  String get weeklyForecast => 'Weekly Forecast';

  @override
  String get loading => 'Loading...';

  @override
  String get errorLoading => 'Error loading weather data';

  @override
  String get retry => 'Retry';

  @override
  String get kmh => 'km/h';

  @override
  String get percent => '%';

  @override
  String get mm => 'mm';

  @override
  String get clear => 'Clear';

  @override
  String get sunny => 'Sunny';

  @override
  String get cloudy => 'Cloudy';

  @override
  String get rainy => 'Rainy';

  @override
  String get thunderstorm => 'Thunderstorm';

  @override
  String get uv => 'UV';

  @override
  String get wind => 'Wind';

  @override
  String get day => 'Day';

  @override
  String get today => 'Today';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String get monday => 'Monday';

  @override
  String get tuesday => 'Tuesday';

  @override
  String get wednesday => 'Wednesday';

  @override
  String get thursday => 'Thursday';

  @override
  String get friday => 'Friday';

  @override
  String get saturday => 'Saturday';

  @override
  String get sunday => 'Sunday';

  @override
  String get min => 'Min';

  @override
  String get max => 'Max';

  @override
  String get threeDayForecast => '3 Day Forecast';

  @override
  String get cropDiseasePrediction => 'Crop Disease Prediction';

  @override
  String get uploadImage => 'Upload Image';

  @override
  String get takePhoto => 'Take Photo';

  @override
  String get chooseFromGallery => 'Choose from Gallery';

  @override
  String get analyzing => 'Analyzing...';

  @override
  String get uploadOrTakePhoto =>
      'Please upload or take a photo of the affected crop';

  @override
  String get diseaseDetected => 'Disease Detected';

  @override
  String get diseaseName => 'Disease Name';

  @override
  String get confidence => 'Confidence';

  @override
  String get treatment => 'Treatment';

  @override
  String get preventiveMeasures => 'Preventive Measures';

  @override
  String get noDisease => 'No Disease Detected';

  @override
  String get healthyPlant => 'Your plant appears to be healthy!';

  @override
  String get tryDifferentImage => 'Try with a different image';

  @override
  String get imageError => 'Error loading image';

  @override
  String get analysisFailed => 'Analysis failed';

  @override
  String get retryAnalysis => 'Retry Analysis';

  @override
  String get diagnostics => 'Diagnostics';

  @override
  String get uploadImageForResults => 'Upload an image to get results';

  @override
  String get pesticideAdvisory => 'Pesticide Advisory';

  @override
  String get searchPesticide => 'Search pesticides...';

  @override
  String get pesticideDetails => 'Pesticide Details';

  @override
  String get activeIngredient => 'Active Ingredient';

  @override
  String get targetPests => 'Target Pests';

  @override
  String get applicableCrops => 'Applicable Crops';

  @override
  String get dosage => 'Dosage';

  @override
  String get safetyPeriod => 'Safety Period';

  @override
  String get precautions => 'Precautions';

  @override
  String get application => 'Application Method';

  @override
  String get effectiveness => 'Effectiveness';

  @override
  String get alternatives => 'Organic Alternatives';

  @override
  String get filterBy => 'Filter by';

  @override
  String get allPesticides => 'All Pesticides';

  @override
  String get organic => 'Organic';

  @override
  String get chemical => 'Chemical';

  @override
  String get biological => 'Biological';

  @override
  String get noPesticidesFound => 'No pesticides found';

  @override
  String get tryDifferentFilter => 'Try a different filter or search term';

  @override
  String get pesticideAdvisoryDesc =>
      'Fill in the details below for customized pesticide advisory';

  @override
  String get issueType => 'Issue Type';

  @override
  String get issueTypeDesc => 'What issue are you facing with your crops?';

  @override
  String get enterIssueType => 'Enter Issue Type';

  @override
  String get additionalInfo => 'Additional Information';

  @override
  String get additionalInfoDesc => 'Any other details you would like to add?';

  @override
  String get additionalInfoHint => 'Enter any extra information...';

  @override
  String characterCount(int count) {
    return '$count/250 characters';
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
  String get cropType => 'Crop Type';

  @override
  String get cropTypeDesc => 'What crop are you growing?';

  @override
  String get enterCropType => 'Enter Crop Type';

  @override
  String get pestType => 'Pest Type';

  @override
  String get pestTypeDesc => 'What type of pest are you dealing with?';

  @override
  String get enterPestType => 'Enter Pest Type';

  @override
  String get region => 'Region';

  @override
  String get regionDesc => 'In which region is your farm located?';

  @override
  String get enterRegion => 'Enter Region';

  @override
  String get plantingMonth => 'Planting Month';

  @override
  String get plantingMonthDesc => 'When did you plant your crop?';

  @override
  String get enterPlantingMonth => 'Enter Planting Month';

  @override
  String get issueTypeTitle => 'Issue Type';

  @override
  String get issueTypePests => 'Pests';

  @override
  String get issueTypeDiseases => 'Diseases';

  @override
  String get issueTypeWeeds => 'Weeds';

  @override
  String get issueTypeNutrient => 'Nutrient Deficiency';

  @override
  String get issueTypeOther => 'Other';

  @override
  String get selectIssueType => 'Select issue type';

  @override
  String get selectCropType => 'Select crop type';

  @override
  String get selectPestType => 'Select pest type';

  @override
  String get selectRegion => 'Select region';

  @override
  String get selectPlantingMonth => 'Select planting month';

  @override
  String get pestsAphids => 'Aphids';

  @override
  String get pestsWeevils => 'Weevils';

  @override
  String get pestsBollworm => 'Bollworm';

  @override
  String get pestsStemborer => 'Stem Borer';

  @override
  String get pestsArmyworm => 'Armyworm';

  @override
  String get pestsLeafhopper => 'Leafhopper';

  @override
  String get pestsWhitefly => 'Whitefly';

  @override
  String get pestsGrasshopper => 'Grasshopper';

  @override
  String get pestsThrips => 'Thrips';

  @override
  String get pestsMites => 'Mites';

  @override
  String get regionsKonkan => 'Konkan';

  @override
  String get regionsWestern => 'Western Maharashtra';

  @override
  String get regionsMarathwada => 'Marathwada';

  @override
  String get regionsVidarbha => 'Vidarbha';

  @override
  String get regionsNorthern => 'Northern Maharashtra';

  @override
  String get regionsNagpur => 'Nagpur';

  @override
  String get regionsNashik => 'Nashik';

  @override
  String get regionsPune => 'Pune';

  @override
  String get regionsAmravati => 'Amravati';

  @override
  String get regionsLatur => 'Latur';

  @override
  String get monthsJanuary => 'January';

  @override
  String get monthsFebruary => 'February';

  @override
  String get monthsMarch => 'March';

  @override
  String get monthsApril => 'April';

  @override
  String get monthsMay => 'May';

  @override
  String get monthsJune => 'June';

  @override
  String get monthsJuly => 'July';

  @override
  String get monthsAugust => 'August';

  @override
  String get monthsSeptember => 'September';

  @override
  String get monthsOctober => 'October';

  @override
  String get monthsNovember => 'November';

  @override
  String get monthsDecember => 'December';

  @override
  String get govtSchemesTitle => 'Government Schemes & Subsidies';

  @override
  String get searchSchemes => 'Search schemes...';

  @override
  String get filterSchemes => 'Filter schemes';

  @override
  String get allSchemes => 'All Schemes';

  @override
  String get activeSchemes => 'Active';

  @override
  String get upcomingSchemes => 'Upcoming';

  @override
  String get expiredSchemes => 'Expired';

  @override
  String get schemeDetails => 'Scheme Details';

  @override
  String get eligibility => 'Eligibility';

  @override
  String get benefits => 'Benefits';

  @override
  String get requiredDocuments => 'Required Documents';

  @override
  String get applicationProcess => 'Application Process';

  @override
  String get lastDate => 'Last Date';

  @override
  String get status => 'Status';

  @override
  String get viewMore => 'View More';

  @override
  String get noSchemesFound => 'No schemes found';

  @override
  String get schemeTitle1 => 'Pradhan Mantri Fasal Bima Yojana';

  @override
  String get schemeDesc1 => 'Crop insurance scheme for farmers';

  @override
  String get schemeTitle2 => 'PM Kisan Samman Nidhi';

  @override
  String get schemeDesc2 => 'Direct income support for farmers';

  @override
  String get schemeTitle3 => 'Kisan Credit Card';

  @override
  String get schemeDesc3 => 'Credit facility for agricultural needs';

  @override
  String get ongoing => 'Ongoing';

  @override
  String get visitWebsite => 'Visit Website';

  @override
  String get searchCrops => 'Search crops, varieties, markets...';

  @override
  String get loadingLocation => 'Getting your location...';

  @override
  String get currentPrice => 'Current Price';

  @override
  String get marketName => 'Market';

  @override
  String get lastUpdated => 'Last Updated';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get noSearchResults => 'No crops match your search';

  @override
  String get noCropPrices => 'No crop prices available for your location';

  @override
  String get allStates => 'All States';

  @override
  String get maharashtra => 'Maharashtra';

  @override
  String get karnataka => 'Karnataka';

  @override
  String get gujarat => 'Gujarat';

  @override
  String get punjab => 'Punjab';

  @override
  String get uttarPradesh => 'Uttar Pradesh';

  @override
  String get madhyaPradesh => 'Madhya Pradesh';

  @override
  String get allDistricts => 'All Districts';

  @override
  String get mumbai => 'Mumbai';

  @override
  String get pune => 'Pune';

  @override
  String get nagpur => 'Nagpur';

  @override
  String get nashik => 'Nashik';

  @override
  String get aurangabad => 'Aurangabad';

  @override
  String get bangalore => 'Bangalore';

  @override
  String get mysore => 'Mysore';

  @override
  String get hubli => 'Hubli';

  @override
  String get mangalore => 'Mangalore';

  @override
  String get selectState => 'Select State';

  @override
  String get selectDistrict => 'Select District';

  @override
  String get showDefaultPrices => 'Show Default Market Prices';

  @override
  String get priceDetails => 'Price Details';

  @override
  String get minPrice => 'Min Price';

  @override
  String get modalPrice => 'Modal Price';

  @override
  String get maxPrice => 'Max Price';

  @override
  String get marketDetails => 'Market Details';

  @override
  String get market => 'Market';

  @override
  String get district => 'District';

  @override
  String get state => 'State';

  @override
  String get dateInformation => 'Date Information';

  @override
  String get arrivalDate => 'Arrival Date';

  @override
  String get cropDiseaseDetection => 'Crop Disease Detection';

  @override
  String get governmentSchemesAndSubsidies => 'Government Schemes & Subsidies';

  @override
  String get snow => 'Snow';

  @override
  String get mist => 'Mist';

  @override
  String get fog => 'Fog';

  @override
  String get haze => 'Haze';

  @override
  String get rain => 'Rain';

  @override
  String get drizzle => 'Drizzle';

  @override
  String get shower => 'Shower';

  @override
  String get locationMumbai => 'Mumbai';

  @override
  String get locationDelhi => 'Delhi';

  @override
  String get locationPune => 'Pune';

  @override
  String get locationBangalore => 'Bangalore';

  @override
  String get locationChennai => 'Chennai';

  @override
  String get locationKolkata => 'Kolkata';

  @override
  String get locationHyderabad => 'Hyderabad';

  @override
  String get locationAhmedabad => 'Ahmedabad';

  @override
  String get locationNagpur => 'Nagpur';

  @override
  String get overcast => 'Overcast';

  @override
  String get lightRain => 'Light Rain';

  @override
  String get heavyRain => 'Heavy Rain';

  @override
  String get getPesticideInfo => 'Get Pesticide Info';
}

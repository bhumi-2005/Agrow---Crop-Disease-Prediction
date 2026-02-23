import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_mr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('mr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Agrow'**
  String get appTitle;

  /// No description provided for @todaysWeather.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Weather'**
  String get todaysWeather;

  /// No description provided for @hourlyForecast.
  ///
  /// In en, this message translates to:
  /// **'Hourly Forecast'**
  String get hourlyForecast;

  /// No description provided for @currentTime.
  ///
  /// In en, this message translates to:
  /// **'Current Time: {time}'**
  String currentTime(String time);

  /// No description provided for @temperature.
  ///
  /// In en, this message translates to:
  /// **'{temp}°C'**
  String temperature(int temp);

  /// No description provided for @govtSchemes.
  ///
  /// In en, this message translates to:
  /// **'Govt. Schemes'**
  String get govtSchemes;

  /// No description provided for @govtSchemesDesc.
  ///
  /// In en, this message translates to:
  /// **'Check available government schemes and subsidies for farmers'**
  String get govtSchemesDesc;

  /// No description provided for @expertConsultation.
  ///
  /// In en, this message translates to:
  /// **'Expert Consultation'**
  String get expertConsultation;

  /// No description provided for @expertConsultationDesc.
  ///
  /// In en, this message translates to:
  /// **'Connect with agricultural experts for personalized advice'**
  String get expertConsultationDesc;

  /// No description provided for @warningAlert.
  ///
  /// In en, this message translates to:
  /// **'Thunderstorm warning'**
  String get warningAlert;

  /// No description provided for @partlyCloudy.
  ///
  /// In en, this message translates to:
  /// **'Partly Cloudy'**
  String get partlyCloudy;

  /// No description provided for @searchExperts.
  ///
  /// In en, this message translates to:
  /// **'Search experts by name or specialization...'**
  String get searchExperts;

  /// No description provided for @applyNow.
  ///
  /// In en, this message translates to:
  /// **'Apply Now'**
  String get applyNow;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @remind.
  ///
  /// In en, this message translates to:
  /// **'Remind'**
  String get remind;

  /// City name
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Weather condition
  ///
  /// In en, this message translates to:
  /// **'Partly Cloudy'**
  String get condition;

  /// No description provided for @forecast.
  ///
  /// In en, this message translates to:
  /// **'Forecast'**
  String forecast(String time);

  /// No description provided for @forecastTemp.
  ///
  /// In en, this message translates to:
  /// **'{temp}°C'**
  String forecastTemp(int temp);

  /// No description provided for @timeFormat.
  ///
  /// In en, this message translates to:
  /// **'{hour} {period}'**
  String timeFormat(int hour, String period);

  /// No description provided for @am.
  ///
  /// In en, this message translates to:
  /// **'AM'**
  String get am;

  /// No description provided for @pm.
  ///
  /// In en, this message translates to:
  /// **'PM'**
  String get pm;

  /// Weather warning message
  ///
  /// In en, this message translates to:
  /// **'Thunderstorm warning'**
  String get warningMessage;

  /// No description provided for @safe.
  ///
  /// In en, this message translates to:
  /// **'Safe'**
  String get safe;

  /// No description provided for @caution.
  ///
  /// In en, this message translates to:
  /// **'Caution'**
  String get caution;

  /// No description provided for @danger.
  ///
  /// In en, this message translates to:
  /// **'Danger'**
  String get danger;

  /// No description provided for @expertConsultationTitle.
  ///
  /// In en, this message translates to:
  /// **'Expert Consultation'**
  String get expertConsultationTitle;

  /// No description provided for @searchExpertsHint.
  ///
  /// In en, this message translates to:
  /// **'Search experts by name or specialization...'**
  String get searchExpertsHint;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterCrops.
  ///
  /// In en, this message translates to:
  /// **'Crops'**
  String get filterCrops;

  /// No description provided for @filterSoil.
  ///
  /// In en, this message translates to:
  /// **'Soil'**
  String get filterSoil;

  /// No description provided for @filterGovt.
  ///
  /// In en, this message translates to:
  /// **'Govt.'**
  String get filterGovt;

  /// No description provided for @noExpertsFound.
  ///
  /// In en, this message translates to:
  /// **'No experts found'**
  String get noExpertsFound;

  /// No description provided for @tryDifferentSearch.
  ///
  /// In en, this message translates to:
  /// **'Try different search terms or filters'**
  String get tryDifferentSearch;

  /// No description provided for @experienceLabel.
  ///
  /// In en, this message translates to:
  /// **'years of experience'**
  String get experienceLabel;

  /// No description provided for @feePerSession.
  ///
  /// In en, this message translates to:
  /// **'₹{amount}/30min'**
  String feePerSession(String amount);

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'{score}'**
  String rating(double score);

  /// No description provided for @chatButton.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chatButton;

  /// No description provided for @callButton.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get callButton;

  /// No description provided for @videoButton.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get videoButton;

  /// No description provided for @expertName1.
  ///
  /// In en, this message translates to:
  /// **'Dr. Rajesh Kumar'**
  String get expertName1;

  /// No description provided for @expertName2.
  ///
  /// In en, this message translates to:
  /// **'Dr. Priya Sharma'**
  String get expertName2;

  /// No description provided for @expertName3.
  ///
  /// In en, this message translates to:
  /// **'Amit Patel'**
  String get expertName3;

  /// No description provided for @expertSpec1.
  ///
  /// In en, this message translates to:
  /// **'Crop Disease Specialist'**
  String get expertSpec1;

  /// No description provided for @expertSpec2.
  ///
  /// In en, this message translates to:
  /// **'Soil Scientist'**
  String get expertSpec2;

  /// No description provided for @expertSpec3.
  ///
  /// In en, this message translates to:
  /// **'Government Scheme Advisor'**
  String get expertSpec3;

  /// No description provided for @expertExp1.
  ///
  /// In en, this message translates to:
  /// **'15 years of experience in crop disease management and prevention'**
  String get expertExp1;

  /// No description provided for @expertExp2.
  ///
  /// In en, this message translates to:
  /// **'Expert in soil health and fertility management with 12 years of experience'**
  String get expertExp2;

  /// No description provided for @expertExp3.
  ///
  /// In en, this message translates to:
  /// **'Specialized in agricultural schemes and subsidies for 10 years'**
  String get expertExp3;

  /// No description provided for @tagCrops.
  ///
  /// In en, this message translates to:
  /// **'Crops'**
  String get tagCrops;

  /// No description provided for @tagDisease.
  ///
  /// In en, this message translates to:
  /// **'Disease Control'**
  String get tagDisease;

  /// No description provided for @tagSoil.
  ///
  /// In en, this message translates to:
  /// **'Soil'**
  String get tagSoil;

  /// No description provided for @tagFertility.
  ///
  /// In en, this message translates to:
  /// **'Fertility'**
  String get tagFertility;

  /// No description provided for @tagGovt.
  ///
  /// In en, this message translates to:
  /// **'Government'**
  String get tagGovt;

  /// No description provided for @tagSubsidies.
  ///
  /// In en, this message translates to:
  /// **'Subsidies'**
  String get tagSubsidies;

  /// No description provided for @expertType1.
  ///
  /// In en, this message translates to:
  /// **'Crops'**
  String get expertType1;

  /// No description provided for @expertType2.
  ///
  /// In en, this message translates to:
  /// **'Soil'**
  String get expertType2;

  /// No description provided for @expertType3.
  ///
  /// In en, this message translates to:
  /// **'Govt.'**
  String get expertType3;

  /// No description provided for @cropAdvisory.
  ///
  /// In en, this message translates to:
  /// **'Crop Advisory'**
  String get cropAdvisory;

  /// No description provided for @cropAdvisoryDesc.
  ///
  /// In en, this message translates to:
  /// **'Get personalized crop recommendations based on your land and conditions'**
  String get cropAdvisoryDesc;

  /// No description provided for @cropDisease.
  ///
  /// In en, this message translates to:
  /// **'Crop Disease'**
  String get cropDisease;

  /// No description provided for @cropDiseaseDesc.
  ///
  /// In en, this message translates to:
  /// **'Take a photo or upload an image of your crop to identify diseases and get treatment recommendations'**
  String get cropDiseaseDesc;

  /// No description provided for @cropAdvisoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Crop Advisory'**
  String get cropAdvisoryTitle;

  /// No description provided for @getPersonalizedRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Get Personalized Crop Recommendations'**
  String get getPersonalizedRecommendations;

  /// No description provided for @fillDetailsBelow.
  ///
  /// In en, this message translates to:
  /// **'Fill in the details below for customized pesticide advisory'**
  String get fillDetailsBelow;

  /// No description provided for @cropSelection.
  ///
  /// In en, this message translates to:
  /// **'Crop Selection'**
  String get cropSelection;

  /// No description provided for @selectFromList.
  ///
  /// In en, this message translates to:
  /// **'Select from list'**
  String get selectFromList;

  /// No description provided for @enterManually.
  ///
  /// In en, this message translates to:
  /// **'Enter manually'**
  String get enterManually;

  /// No description provided for @selectCrop.
  ///
  /// In en, this message translates to:
  /// **'Select crop'**
  String get selectCrop;

  /// No description provided for @enterCropName.
  ///
  /// In en, this message translates to:
  /// **'Enter crop name'**
  String get enterCropName;

  /// No description provided for @landArea.
  ///
  /// In en, this message translates to:
  /// **'Land Area'**
  String get landArea;

  /// No description provided for @enterArea.
  ///
  /// In en, this message translates to:
  /// **'Enter area'**
  String get enterArea;

  /// No description provided for @irrigationMethod.
  ///
  /// In en, this message translates to:
  /// **'Irrigation Method'**
  String get irrigationMethod;

  /// No description provided for @selectIrrigationMethod.
  ///
  /// In en, this message translates to:
  /// **'Select irrigation method'**
  String get selectIrrigationMethod;

  /// No description provided for @enterIrrigationMethod.
  ///
  /// In en, this message translates to:
  /// **'Enter irrigation method'**
  String get enterIrrigationMethod;

  /// Weather condition translations
  ///
  /// In en, this message translates to:
  /// **'Weather Conditions'**
  String get weatherConditions;

  /// No description provided for @selectWeatherCondition.
  ///
  /// In en, this message translates to:
  /// **'Select weather condition'**
  String get selectWeatherCondition;

  /// No description provided for @enterWeatherCondition.
  ///
  /// In en, this message translates to:
  /// **'Enter weather condition'**
  String get enterWeatherCondition;

  /// No description provided for @getAdvisory.
  ///
  /// In en, this message translates to:
  /// **'Get Advisory'**
  String get getAdvisory;

  /// No description provided for @areaUnitsAcres.
  ///
  /// In en, this message translates to:
  /// **'Acres'**
  String get areaUnitsAcres;

  /// No description provided for @areaUnitsHectares.
  ///
  /// In en, this message translates to:
  /// **'Hectares'**
  String get areaUnitsHectares;

  /// No description provided for @areaUnitsSquareMeters.
  ///
  /// In en, this message translates to:
  /// **'Square Meters'**
  String get areaUnitsSquareMeters;

  /// No description provided for @areaUnitsSquareFeet.
  ///
  /// In en, this message translates to:
  /// **'Square Feet'**
  String get areaUnitsSquareFeet;

  /// No description provided for @areaUnitsGuntha.
  ///
  /// In en, this message translates to:
  /// **'Guntha'**
  String get areaUnitsGuntha;

  /// No description provided for @areaUnitsBigha.
  ///
  /// In en, this message translates to:
  /// **'Bigha'**
  String get areaUnitsBigha;

  /// No description provided for @weatherTypesSunny.
  ///
  /// In en, this message translates to:
  /// **'Sunny'**
  String get weatherTypesSunny;

  /// No description provided for @weatherTypesPartlyCloudy.
  ///
  /// In en, this message translates to:
  /// **'Partly Cloudy'**
  String get weatherTypesPartlyCloudy;

  /// No description provided for @weatherTypesOvercast.
  ///
  /// In en, this message translates to:
  /// **'Overcast'**
  String get weatherTypesOvercast;

  /// No description provided for @weatherTypesLightRain.
  ///
  /// In en, this message translates to:
  /// **'Light Rain'**
  String get weatherTypesLightRain;

  /// No description provided for @weatherTypesHeavyRain.
  ///
  /// In en, this message translates to:
  /// **'Heavy Rain'**
  String get weatherTypesHeavyRain;

  /// No description provided for @weatherTypesThunderstorm.
  ///
  /// In en, this message translates to:
  /// **'Thunderstorm'**
  String get weatherTypesThunderstorm;

  /// No description provided for @weatherTypesWindy.
  ///
  /// In en, this message translates to:
  /// **'Windy'**
  String get weatherTypesWindy;

  /// No description provided for @weatherTypesHotHumid.
  ///
  /// In en, this message translates to:
  /// **'Hot and Humid'**
  String get weatherTypesHotHumid;

  /// No description provided for @weatherTypesColdDry.
  ///
  /// In en, this message translates to:
  /// **'Cold and Dry'**
  String get weatherTypesColdDry;

  /// No description provided for @weatherTypesFoggy.
  ///
  /// In en, this message translates to:
  /// **'Foggy'**
  String get weatherTypesFoggy;

  /// No description provided for @weatherTypesHazy.
  ///
  /// In en, this message translates to:
  /// **'Hazy'**
  String get weatherTypesHazy;

  /// No description provided for @weatherTypesDrought.
  ///
  /// In en, this message translates to:
  /// **'Drought Conditions'**
  String get weatherTypesDrought;

  /// No description provided for @weatherTypesHighTemp.
  ///
  /// In en, this message translates to:
  /// **'High Temperature'**
  String get weatherTypesHighTemp;

  /// No description provided for @weatherTypesLowTemp.
  ///
  /// In en, this message translates to:
  /// **'Low Temperature'**
  String get weatherTypesLowTemp;

  /// No description provided for @irrigationTypesDrip.
  ///
  /// In en, this message translates to:
  /// **'Drip Irrigation'**
  String get irrigationTypesDrip;

  /// No description provided for @irrigationTypesSprinkler.
  ///
  /// In en, this message translates to:
  /// **'Sprinkler Irrigation'**
  String get irrigationTypesSprinkler;

  /// No description provided for @irrigationTypesFlood.
  ///
  /// In en, this message translates to:
  /// **'Flood Irrigation'**
  String get irrigationTypesFlood;

  /// No description provided for @irrigationTypesFurrow.
  ///
  /// In en, this message translates to:
  /// **'Furrow Irrigation'**
  String get irrigationTypesFurrow;

  /// No description provided for @irrigationTypesCenterPivot.
  ///
  /// In en, this message translates to:
  /// **'Center Pivot Irrigation'**
  String get irrigationTypesCenterPivot;

  /// No description provided for @irrigationTypesSubsurfaceDrip.
  ///
  /// In en, this message translates to:
  /// **'Sub-surface Drip Irrigation'**
  String get irrigationTypesSubsurfaceDrip;

  /// No description provided for @irrigationTypesMicroSprinkler.
  ///
  /// In en, this message translates to:
  /// **'Micro-sprinkler System'**
  String get irrigationTypesMicroSprinkler;

  /// No description provided for @irrigationTypesSurface.
  ///
  /// In en, this message translates to:
  /// **'Surface Irrigation'**
  String get irrigationTypesSurface;

  /// No description provided for @irrigationTypesBasin.
  ///
  /// In en, this message translates to:
  /// **'Basin Irrigation'**
  String get irrigationTypesBasin;

  /// No description provided for @irrigationTypesBorderStrip.
  ///
  /// In en, this message translates to:
  /// **'Border Strip Irrigation'**
  String get irrigationTypesBorderStrip;

  /// No description provided for @cropsWheat.
  ///
  /// In en, this message translates to:
  /// **'Wheat'**
  String get cropsWheat;

  /// No description provided for @cropsRice.
  ///
  /// In en, this message translates to:
  /// **'Rice'**
  String get cropsRice;

  /// No description provided for @cropsCotton.
  ///
  /// In en, this message translates to:
  /// **'Cotton'**
  String get cropsCotton;

  /// No description provided for @cropsSugarcane.
  ///
  /// In en, this message translates to:
  /// **'Sugarcane'**
  String get cropsSugarcane;

  /// No description provided for @cropsMaize.
  ///
  /// In en, this message translates to:
  /// **'Maize'**
  String get cropsMaize;

  /// No description provided for @cropsSoybean.
  ///
  /// In en, this message translates to:
  /// **'Soybean'**
  String get cropsSoybean;

  /// No description provided for @soilClay.
  ///
  /// In en, this message translates to:
  /// **'Clay Soil'**
  String get soilClay;

  /// No description provided for @soilSandy.
  ///
  /// In en, this message translates to:
  /// **'Sandy Soil'**
  String get soilSandy;

  /// No description provided for @soilLoamy.
  ///
  /// In en, this message translates to:
  /// **'Loamy Soil'**
  String get soilLoamy;

  /// No description provided for @soilSilt.
  ///
  /// In en, this message translates to:
  /// **'Silty Soil'**
  String get soilSilt;

  /// No description provided for @soilBlackCotton.
  ///
  /// In en, this message translates to:
  /// **'Black Cotton Soil'**
  String get soilBlackCotton;

  /// No description provided for @soilRed.
  ///
  /// In en, this message translates to:
  /// **'Red Soil'**
  String get soilRed;

  /// No description provided for @soilAlluvial.
  ///
  /// In en, this message translates to:
  /// **'Alluvial Soil'**
  String get soilAlluvial;

  /// No description provided for @weatherSunny.
  ///
  /// In en, this message translates to:
  /// **'Sunny'**
  String get weatherSunny;

  /// No description provided for @weatherCloudy.
  ///
  /// In en, this message translates to:
  /// **'Cloudy'**
  String get weatherCloudy;

  /// No description provided for @weatherRainy.
  ///
  /// In en, this message translates to:
  /// **'Rainy'**
  String get weatherRainy;

  /// No description provided for @weatherHotHumid.
  ///
  /// In en, this message translates to:
  /// **'Hot and Humid'**
  String get weatherHotHumid;

  /// No description provided for @weatherCold.
  ///
  /// In en, this message translates to:
  /// **'Cold'**
  String get weatherCold;

  /// No description provided for @weatherWindy.
  ///
  /// In en, this message translates to:
  /// **'Windy'**
  String get weatherWindy;

  /// No description provided for @weatherDrought.
  ///
  /// In en, this message translates to:
  /// **'Drought'**
  String get weatherDrought;

  /// No description provided for @irrigationDrip.
  ///
  /// In en, this message translates to:
  /// **'Drip Irrigation'**
  String get irrigationDrip;

  /// No description provided for @irrigationSprinkler.
  ///
  /// In en, this message translates to:
  /// **'Sprinkler Irrigation'**
  String get irrigationSprinkler;

  /// No description provided for @irrigationFlood.
  ///
  /// In en, this message translates to:
  /// **'Flood Irrigation'**
  String get irrigationFlood;

  /// No description provided for @irrigationFurrow.
  ///
  /// In en, this message translates to:
  /// **'Furrow Irrigation'**
  String get irrigationFurrow;

  /// No description provided for @irrigationBasin.
  ///
  /// In en, this message translates to:
  /// **'Basin Irrigation'**
  String get irrigationBasin;

  /// No description provided for @irrigationRainfed.
  ///
  /// In en, this message translates to:
  /// **'Rainfed'**
  String get irrigationRainfed;

  /// No description provided for @stageSeedling.
  ///
  /// In en, this message translates to:
  /// **'Seedling Stage'**
  String get stageSeedling;

  /// No description provided for @stageVegetative.
  ///
  /// In en, this message translates to:
  /// **'Vegetative Stage'**
  String get stageVegetative;

  /// No description provided for @stageFlowering.
  ///
  /// In en, this message translates to:
  /// **'Flowering Stage'**
  String get stageFlowering;

  /// No description provided for @stageFruiting.
  ///
  /// In en, this message translates to:
  /// **'Fruiting Stage'**
  String get stageFruiting;

  /// No description provided for @stageMaturity.
  ///
  /// In en, this message translates to:
  /// **'Maturity Stage'**
  String get stageMaturity;

  /// No description provided for @stageHarvest.
  ///
  /// In en, this message translates to:
  /// **'Harvest Stage'**
  String get stageHarvest;

  /// No description provided for @soilTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Soil Type'**
  String get soilTypeTitle;

  /// No description provided for @soilTypeDesc.
  ///
  /// In en, this message translates to:
  /// **'Select the type of soil in your field'**
  String get soilTypeDesc;

  /// No description provided for @enterSoilType.
  ///
  /// In en, this message translates to:
  /// **'Enter soil type'**
  String get enterSoilType;

  /// No description provided for @selectSoilType.
  ///
  /// In en, this message translates to:
  /// **'Select soil type'**
  String get selectSoilType;

  /// No description provided for @weatherTitle.
  ///
  /// In en, this message translates to:
  /// **'Weather Conditions'**
  String get weatherTitle;

  /// No description provided for @weatherDesc.
  ///
  /// In en, this message translates to:
  /// **'Select the current weather conditions'**
  String get weatherDesc;

  /// No description provided for @enterWeather.
  ///
  /// In en, this message translates to:
  /// **'Enter weather conditions'**
  String get enterWeather;

  /// No description provided for @selectWeather.
  ///
  /// In en, this message translates to:
  /// **'Select weather conditions'**
  String get selectWeather;

  /// No description provided for @irrigationTitle.
  ///
  /// In en, this message translates to:
  /// **'Irrigation Method'**
  String get irrigationTitle;

  /// No description provided for @irrigationDesc.
  ///
  /// In en, this message translates to:
  /// **'Select your irrigation method'**
  String get irrigationDesc;

  /// No description provided for @enterIrrigation.
  ///
  /// In en, this message translates to:
  /// **'Enter irrigation method'**
  String get enterIrrigation;

  /// No description provided for @selectIrrigation.
  ///
  /// In en, this message translates to:
  /// **'Select irrigation method'**
  String get selectIrrigation;

  /// No description provided for @growthStageTitle.
  ///
  /// In en, this message translates to:
  /// **'Crop Growth Stage'**
  String get growthStageTitle;

  /// No description provided for @growthStageDesc.
  ///
  /// In en, this message translates to:
  /// **'Select the current growth stage of your crop'**
  String get growthStageDesc;

  /// No description provided for @enterGrowthStage.
  ///
  /// In en, this message translates to:
  /// **'Enter growth stage'**
  String get enterGrowthStage;

  /// No description provided for @selectGrowthStage.
  ///
  /// In en, this message translates to:
  /// **'Select growth stage'**
  String get selectGrowthStage;

  /// No description provided for @cropsPotato.
  ///
  /// In en, this message translates to:
  /// **'Potato'**
  String get cropsPotato;

  /// No description provided for @cropsTomato.
  ///
  /// In en, this message translates to:
  /// **'Tomato'**
  String get cropsTomato;

  /// No description provided for @cropsOnion.
  ///
  /// In en, this message translates to:
  /// **'Onion'**
  String get cropsOnion;

  /// No description provided for @cropsGroundnut.
  ///
  /// In en, this message translates to:
  /// **'Groundnut'**
  String get cropsGroundnut;

  /// No description provided for @cropsChickpea.
  ///
  /// In en, this message translates to:
  /// **'Chickpea'**
  String get cropsChickpea;

  /// No description provided for @cropsMustard.
  ///
  /// In en, this message translates to:
  /// **'Mustard'**
  String get cropsMustard;

  /// No description provided for @cropsSunflower.
  ///
  /// In en, this message translates to:
  /// **'Sunflower'**
  String get cropsSunflower;

  /// No description provided for @cropsTurmeric.
  ///
  /// In en, this message translates to:
  /// **'Turmeric'**
  String get cropsTurmeric;

  /// No description provided for @cropsGinger.
  ///
  /// In en, this message translates to:
  /// **'Ginger'**
  String get cropsGinger;

  /// No description provided for @cropsGarlic.
  ///
  /// In en, this message translates to:
  /// **'Garlic'**
  String get cropsGarlic;

  /// No description provided for @cropsChili.
  ///
  /// In en, this message translates to:
  /// **'Chili'**
  String get cropsChili;

  /// No description provided for @cropsCauliflower.
  ///
  /// In en, this message translates to:
  /// **'Cauliflower'**
  String get cropsCauliflower;

  /// No description provided for @cropsCabbage.
  ///
  /// In en, this message translates to:
  /// **'Cabbage'**
  String get cropsCabbage;

  /// No description provided for @cropsCarrot.
  ///
  /// In en, this message translates to:
  /// **'Carrot'**
  String get cropsCarrot;

  /// No description provided for @cropsPeas.
  ///
  /// In en, this message translates to:
  /// **'Peas'**
  String get cropsPeas;

  /// No description provided for @cropsBeans.
  ///
  /// In en, this message translates to:
  /// **'Beans'**
  String get cropsBeans;

  /// No description provided for @cropsCucumber.
  ///
  /// In en, this message translates to:
  /// **'Cucumber'**
  String get cropsCucumber;

  /// No description provided for @cropsEggplant.
  ///
  /// In en, this message translates to:
  /// **'Eggplant'**
  String get cropsEggplant;

  /// No description provided for @cropsOkra.
  ///
  /// In en, this message translates to:
  /// **'Okra'**
  String get cropsOkra;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Agrow'**
  String get appName;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @pesticides.
  ///
  /// In en, this message translates to:
  /// **'Pesticide Advisory'**
  String get pesticides;

  /// No description provided for @marketPrices.
  ///
  /// In en, this message translates to:
  /// **'Market Prices'**
  String get marketPrices;

  /// No description provided for @currentTemp.
  ///
  /// In en, this message translates to:
  /// **'Current Temperature'**
  String get currentTemp;

  /// No description provided for @feelsLike.
  ///
  /// In en, this message translates to:
  /// **'Feels Like'**
  String get feelsLike;

  /// No description provided for @humidity.
  ///
  /// In en, this message translates to:
  /// **'Humidity'**
  String get humidity;

  /// No description provided for @windSpeed.
  ///
  /// In en, this message translates to:
  /// **'Wind Speed'**
  String get windSpeed;

  /// No description provided for @precipitation.
  ///
  /// In en, this message translates to:
  /// **'Precipitation'**
  String get precipitation;

  /// No description provided for @weeklyForecast.
  ///
  /// In en, this message translates to:
  /// **'Weekly Forecast'**
  String get weeklyForecast;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @errorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading weather data'**
  String get errorLoading;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @kmh.
  ///
  /// In en, this message translates to:
  /// **'km/h'**
  String get kmh;

  /// No description provided for @percent.
  ///
  /// In en, this message translates to:
  /// **'%'**
  String get percent;

  /// No description provided for @mm.
  ///
  /// In en, this message translates to:
  /// **'mm'**
  String get mm;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @sunny.
  ///
  /// In en, this message translates to:
  /// **'Sunny'**
  String get sunny;

  /// No description provided for @cloudy.
  ///
  /// In en, this message translates to:
  /// **'Cloudy'**
  String get cloudy;

  /// No description provided for @rainy.
  ///
  /// In en, this message translates to:
  /// **'Rainy'**
  String get rainy;

  /// No description provided for @thunderstorm.
  ///
  /// In en, this message translates to:
  /// **'Thunderstorm'**
  String get thunderstorm;

  /// No description provided for @uv.
  ///
  /// In en, this message translates to:
  /// **'UV'**
  String get uv;

  /// No description provided for @wind.
  ///
  /// In en, this message translates to:
  /// **'Wind'**
  String get wind;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tomorrow;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @min.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get min;

  /// No description provided for @max.
  ///
  /// In en, this message translates to:
  /// **'Max'**
  String get max;

  /// No description provided for @threeDayForecast.
  ///
  /// In en, this message translates to:
  /// **'3 Day Forecast'**
  String get threeDayForecast;

  /// No description provided for @cropDiseasePrediction.
  ///
  /// In en, this message translates to:
  /// **'Crop Disease Prediction'**
  String get cropDiseasePrediction;

  /// No description provided for @uploadImage.
  ///
  /// In en, this message translates to:
  /// **'Upload Image'**
  String get uploadImage;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// No description provided for @chooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get chooseFromGallery;

  /// No description provided for @analyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing...'**
  String get analyzing;

  /// No description provided for @uploadOrTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Please upload or take a photo of the affected crop'**
  String get uploadOrTakePhoto;

  /// No description provided for @diseaseDetected.
  ///
  /// In en, this message translates to:
  /// **'Disease Detected'**
  String get diseaseDetected;

  /// No description provided for @diseaseName.
  ///
  /// In en, this message translates to:
  /// **'Disease Name'**
  String get diseaseName;

  /// No description provided for @confidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence'**
  String get confidence;

  /// No description provided for @treatment.
  ///
  /// In en, this message translates to:
  /// **'Treatment'**
  String get treatment;

  /// No description provided for @preventiveMeasures.
  ///
  /// In en, this message translates to:
  /// **'Preventive Measures'**
  String get preventiveMeasures;

  /// No description provided for @noDisease.
  ///
  /// In en, this message translates to:
  /// **'No Disease Detected'**
  String get noDisease;

  /// No description provided for @healthyPlant.
  ///
  /// In en, this message translates to:
  /// **'Your plant appears to be healthy!'**
  String get healthyPlant;

  /// No description provided for @tryDifferentImage.
  ///
  /// In en, this message translates to:
  /// **'Try with a different image'**
  String get tryDifferentImage;

  /// No description provided for @imageError.
  ///
  /// In en, this message translates to:
  /// **'Error loading image'**
  String get imageError;

  /// No description provided for @analysisFailed.
  ///
  /// In en, this message translates to:
  /// **'Analysis failed'**
  String get analysisFailed;

  /// No description provided for @retryAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Retry Analysis'**
  String get retryAnalysis;

  /// No description provided for @diagnostics.
  ///
  /// In en, this message translates to:
  /// **'Diagnostics'**
  String get diagnostics;

  /// No description provided for @uploadImageForResults.
  ///
  /// In en, this message translates to:
  /// **'Upload an image to get results'**
  String get uploadImageForResults;

  /// No description provided for @pesticideAdvisory.
  ///
  /// In en, this message translates to:
  /// **'Pesticide Advisory'**
  String get pesticideAdvisory;

  /// No description provided for @searchPesticide.
  ///
  /// In en, this message translates to:
  /// **'Search pesticides...'**
  String get searchPesticide;

  /// No description provided for @pesticideDetails.
  ///
  /// In en, this message translates to:
  /// **'Pesticide Details'**
  String get pesticideDetails;

  /// No description provided for @activeIngredient.
  ///
  /// In en, this message translates to:
  /// **'Active Ingredient'**
  String get activeIngredient;

  /// No description provided for @targetPests.
  ///
  /// In en, this message translates to:
  /// **'Target Pests'**
  String get targetPests;

  /// No description provided for @applicableCrops.
  ///
  /// In en, this message translates to:
  /// **'Applicable Crops'**
  String get applicableCrops;

  /// No description provided for @dosage.
  ///
  /// In en, this message translates to:
  /// **'Dosage'**
  String get dosage;

  /// No description provided for @safetyPeriod.
  ///
  /// In en, this message translates to:
  /// **'Safety Period'**
  String get safetyPeriod;

  /// No description provided for @precautions.
  ///
  /// In en, this message translates to:
  /// **'Precautions'**
  String get precautions;

  /// No description provided for @application.
  ///
  /// In en, this message translates to:
  /// **'Application Method'**
  String get application;

  /// No description provided for @effectiveness.
  ///
  /// In en, this message translates to:
  /// **'Effectiveness'**
  String get effectiveness;

  /// No description provided for @alternatives.
  ///
  /// In en, this message translates to:
  /// **'Organic Alternatives'**
  String get alternatives;

  /// No description provided for @filterBy.
  ///
  /// In en, this message translates to:
  /// **'Filter by'**
  String get filterBy;

  /// No description provided for @allPesticides.
  ///
  /// In en, this message translates to:
  /// **'All Pesticides'**
  String get allPesticides;

  /// No description provided for @organic.
  ///
  /// In en, this message translates to:
  /// **'Organic'**
  String get organic;

  /// No description provided for @chemical.
  ///
  /// In en, this message translates to:
  /// **'Chemical'**
  String get chemical;

  /// No description provided for @biological.
  ///
  /// In en, this message translates to:
  /// **'Biological'**
  String get biological;

  /// No description provided for @noPesticidesFound.
  ///
  /// In en, this message translates to:
  /// **'No pesticides found'**
  String get noPesticidesFound;

  /// No description provided for @tryDifferentFilter.
  ///
  /// In en, this message translates to:
  /// **'Try a different filter or search term'**
  String get tryDifferentFilter;

  /// No description provided for @pesticideAdvisoryDesc.
  ///
  /// In en, this message translates to:
  /// **'Fill in the details below for customized pesticide advisory'**
  String get pesticideAdvisoryDesc;

  /// No description provided for @issueType.
  ///
  /// In en, this message translates to:
  /// **'Issue Type'**
  String get issueType;

  /// No description provided for @issueTypeDesc.
  ///
  /// In en, this message translates to:
  /// **'What issue are you facing with your crops?'**
  String get issueTypeDesc;

  /// No description provided for @enterIssueType.
  ///
  /// In en, this message translates to:
  /// **'Enter Issue Type'**
  String get enterIssueType;

  /// No description provided for @additionalInfo.
  ///
  /// In en, this message translates to:
  /// **'Additional Information'**
  String get additionalInfo;

  /// No description provided for @additionalInfoDesc.
  ///
  /// In en, this message translates to:
  /// **'Any other details you would like to add?'**
  String get additionalInfoDesc;

  /// No description provided for @additionalInfoHint.
  ///
  /// In en, this message translates to:
  /// **'Enter any extra information...'**
  String get additionalInfoHint;

  /// No description provided for @characterCount.
  ///
  /// In en, this message translates to:
  /// **'{count}/250 characters'**
  String characterCount(int count);

  /// No description provided for @pestIssue.
  ///
  /// In en, this message translates to:
  /// **'Pests'**
  String get pestIssue;

  /// No description provided for @diseaseIssue.
  ///
  /// In en, this message translates to:
  /// **'Diseases'**
  String get diseaseIssue;

  /// No description provided for @weedIssue.
  ///
  /// In en, this message translates to:
  /// **'Weeds'**
  String get weedIssue;

  /// No description provided for @nutrientDeficiencyIssue.
  ///
  /// In en, this message translates to:
  /// **'Soil Nutrient Deficiency'**
  String get nutrientDeficiencyIssue;

  /// No description provided for @otherIssue.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get otherIssue;

  /// No description provided for @cropSugarcane.
  ///
  /// In en, this message translates to:
  /// **'Sugarcane'**
  String get cropSugarcane;

  /// No description provided for @cropCotton.
  ///
  /// In en, this message translates to:
  /// **'Cotton'**
  String get cropCotton;

  /// No description provided for @cropSoybean.
  ///
  /// In en, this message translates to:
  /// **'Soybeans'**
  String get cropSoybean;

  /// No description provided for @cropRice.
  ///
  /// In en, this message translates to:
  /// **'Rice'**
  String get cropRice;

  /// No description provided for @cropWheat.
  ///
  /// In en, this message translates to:
  /// **'Wheat'**
  String get cropWheat;

  /// No description provided for @cropMaize.
  ///
  /// In en, this message translates to:
  /// **'Maize'**
  String get cropMaize;

  /// No description provided for @cropOnion.
  ///
  /// In en, this message translates to:
  /// **'Onions'**
  String get cropOnion;

  /// No description provided for @cropChickpea.
  ///
  /// In en, this message translates to:
  /// **'Chickpeas'**
  String get cropChickpea;

  /// No description provided for @cropPulses.
  ///
  /// In en, this message translates to:
  /// **'Pulses'**
  String get cropPulses;

  /// No description provided for @cropGroundnut.
  ///
  /// In en, this message translates to:
  /// **'Groundnut'**
  String get cropGroundnut;

  /// No description provided for @cropMillet.
  ///
  /// In en, this message translates to:
  /// **'Millets'**
  String get cropMillet;

  /// No description provided for @pestAphids.
  ///
  /// In en, this message translates to:
  /// **'Aphids'**
  String get pestAphids;

  /// No description provided for @pestWeevils.
  ///
  /// In en, this message translates to:
  /// **'Weevils'**
  String get pestWeevils;

  /// No description provided for @pestBollworm.
  ///
  /// In en, this message translates to:
  /// **'Bollworm'**
  String get pestBollworm;

  /// No description provided for @pestArmyworm.
  ///
  /// In en, this message translates to:
  /// **'Armyworm'**
  String get pestArmyworm;

  /// No description provided for @pestLeafhopper.
  ///
  /// In en, this message translates to:
  /// **'Leafhopper'**
  String get pestLeafhopper;

  /// No description provided for @regionWestern.
  ///
  /// In en, this message translates to:
  /// **'Western Maharashtra'**
  String get regionWestern;

  /// No description provided for @regionVidarbha.
  ///
  /// In en, this message translates to:
  /// **'Vidarbha'**
  String get regionVidarbha;

  /// No description provided for @regionMarathwada.
  ///
  /// In en, this message translates to:
  /// **'Marathwada'**
  String get regionMarathwada;

  /// No description provided for @regionNorth.
  ///
  /// In en, this message translates to:
  /// **'North Maharashtra'**
  String get regionNorth;

  /// No description provided for @regionKonkan.
  ///
  /// In en, this message translates to:
  /// **'Konkan'**
  String get regionKonkan;

  /// No description provided for @monthJanuary.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get monthJanuary;

  /// No description provided for @monthFebruary.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get monthFebruary;

  /// No description provided for @monthMarch.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get monthMarch;

  /// No description provided for @monthApril.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get monthApril;

  /// No description provided for @monthMay.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get monthMay;

  /// No description provided for @monthJune.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get monthJune;

  /// No description provided for @monthJuly.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get monthJuly;

  /// No description provided for @monthAugust.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get monthAugust;

  /// No description provided for @monthSeptember.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get monthSeptember;

  /// No description provided for @monthOctober.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get monthOctober;

  /// No description provided for @monthNovember.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get monthNovember;

  /// No description provided for @monthDecember.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get monthDecember;

  /// No description provided for @cropType.
  ///
  /// In en, this message translates to:
  /// **'Crop Type'**
  String get cropType;

  /// No description provided for @cropTypeDesc.
  ///
  /// In en, this message translates to:
  /// **'What crop are you growing?'**
  String get cropTypeDesc;

  /// No description provided for @enterCropType.
  ///
  /// In en, this message translates to:
  /// **'Enter Crop Type'**
  String get enterCropType;

  /// No description provided for @pestType.
  ///
  /// In en, this message translates to:
  /// **'Pest Type'**
  String get pestType;

  /// No description provided for @pestTypeDesc.
  ///
  /// In en, this message translates to:
  /// **'What type of pest are you dealing with?'**
  String get pestTypeDesc;

  /// No description provided for @enterPestType.
  ///
  /// In en, this message translates to:
  /// **'Enter Pest Type'**
  String get enterPestType;

  /// No description provided for @region.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get region;

  /// No description provided for @regionDesc.
  ///
  /// In en, this message translates to:
  /// **'In which region is your farm located?'**
  String get regionDesc;

  /// No description provided for @enterRegion.
  ///
  /// In en, this message translates to:
  /// **'Enter Region'**
  String get enterRegion;

  /// No description provided for @plantingMonth.
  ///
  /// In en, this message translates to:
  /// **'Planting Month'**
  String get plantingMonth;

  /// No description provided for @plantingMonthDesc.
  ///
  /// In en, this message translates to:
  /// **'When did you plant your crop?'**
  String get plantingMonthDesc;

  /// No description provided for @enterPlantingMonth.
  ///
  /// In en, this message translates to:
  /// **'Enter Planting Month'**
  String get enterPlantingMonth;

  /// No description provided for @issueTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Issue Type'**
  String get issueTypeTitle;

  /// No description provided for @issueTypePests.
  ///
  /// In en, this message translates to:
  /// **'Pests'**
  String get issueTypePests;

  /// No description provided for @issueTypeDiseases.
  ///
  /// In en, this message translates to:
  /// **'Diseases'**
  String get issueTypeDiseases;

  /// No description provided for @issueTypeWeeds.
  ///
  /// In en, this message translates to:
  /// **'Weeds'**
  String get issueTypeWeeds;

  /// No description provided for @issueTypeNutrient.
  ///
  /// In en, this message translates to:
  /// **'Nutrient Deficiency'**
  String get issueTypeNutrient;

  /// No description provided for @issueTypeOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get issueTypeOther;

  /// No description provided for @selectIssueType.
  ///
  /// In en, this message translates to:
  /// **'Select issue type'**
  String get selectIssueType;

  /// No description provided for @selectCropType.
  ///
  /// In en, this message translates to:
  /// **'Select crop type'**
  String get selectCropType;

  /// No description provided for @selectPestType.
  ///
  /// In en, this message translates to:
  /// **'Select pest type'**
  String get selectPestType;

  /// No description provided for @selectRegion.
  ///
  /// In en, this message translates to:
  /// **'Select region'**
  String get selectRegion;

  /// No description provided for @selectPlantingMonth.
  ///
  /// In en, this message translates to:
  /// **'Select planting month'**
  String get selectPlantingMonth;

  /// No description provided for @pestsAphids.
  ///
  /// In en, this message translates to:
  /// **'Aphids'**
  String get pestsAphids;

  /// No description provided for @pestsWeevils.
  ///
  /// In en, this message translates to:
  /// **'Weevils'**
  String get pestsWeevils;

  /// No description provided for @pestsBollworm.
  ///
  /// In en, this message translates to:
  /// **'Bollworm'**
  String get pestsBollworm;

  /// No description provided for @pestsStemborer.
  ///
  /// In en, this message translates to:
  /// **'Stem Borer'**
  String get pestsStemborer;

  /// No description provided for @pestsArmyworm.
  ///
  /// In en, this message translates to:
  /// **'Armyworm'**
  String get pestsArmyworm;

  /// No description provided for @pestsLeafhopper.
  ///
  /// In en, this message translates to:
  /// **'Leafhopper'**
  String get pestsLeafhopper;

  /// No description provided for @pestsWhitefly.
  ///
  /// In en, this message translates to:
  /// **'Whitefly'**
  String get pestsWhitefly;

  /// No description provided for @pestsGrasshopper.
  ///
  /// In en, this message translates to:
  /// **'Grasshopper'**
  String get pestsGrasshopper;

  /// No description provided for @pestsThrips.
  ///
  /// In en, this message translates to:
  /// **'Thrips'**
  String get pestsThrips;

  /// No description provided for @pestsMites.
  ///
  /// In en, this message translates to:
  /// **'Mites'**
  String get pestsMites;

  /// No description provided for @regionsKonkan.
  ///
  /// In en, this message translates to:
  /// **'Konkan'**
  String get regionsKonkan;

  /// No description provided for @regionsWestern.
  ///
  /// In en, this message translates to:
  /// **'Western Maharashtra'**
  String get regionsWestern;

  /// No description provided for @regionsMarathwada.
  ///
  /// In en, this message translates to:
  /// **'Marathwada'**
  String get regionsMarathwada;

  /// No description provided for @regionsVidarbha.
  ///
  /// In en, this message translates to:
  /// **'Vidarbha'**
  String get regionsVidarbha;

  /// No description provided for @regionsNorthern.
  ///
  /// In en, this message translates to:
  /// **'Northern Maharashtra'**
  String get regionsNorthern;

  /// No description provided for @regionsNagpur.
  ///
  /// In en, this message translates to:
  /// **'Nagpur'**
  String get regionsNagpur;

  /// No description provided for @regionsNashik.
  ///
  /// In en, this message translates to:
  /// **'Nashik'**
  String get regionsNashik;

  /// No description provided for @regionsPune.
  ///
  /// In en, this message translates to:
  /// **'Pune'**
  String get regionsPune;

  /// No description provided for @regionsAmravati.
  ///
  /// In en, this message translates to:
  /// **'Amravati'**
  String get regionsAmravati;

  /// No description provided for @regionsLatur.
  ///
  /// In en, this message translates to:
  /// **'Latur'**
  String get regionsLatur;

  /// No description provided for @monthsJanuary.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get monthsJanuary;

  /// No description provided for @monthsFebruary.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get monthsFebruary;

  /// No description provided for @monthsMarch.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get monthsMarch;

  /// No description provided for @monthsApril.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get monthsApril;

  /// No description provided for @monthsMay.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get monthsMay;

  /// No description provided for @monthsJune.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get monthsJune;

  /// No description provided for @monthsJuly.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get monthsJuly;

  /// No description provided for @monthsAugust.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get monthsAugust;

  /// No description provided for @monthsSeptember.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get monthsSeptember;

  /// No description provided for @monthsOctober.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get monthsOctober;

  /// No description provided for @monthsNovember.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get monthsNovember;

  /// No description provided for @monthsDecember.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get monthsDecember;

  /// No description provided for @govtSchemesTitle.
  ///
  /// In en, this message translates to:
  /// **'Government Schemes & Subsidies'**
  String get govtSchemesTitle;

  /// No description provided for @searchSchemes.
  ///
  /// In en, this message translates to:
  /// **'Search schemes...'**
  String get searchSchemes;

  /// No description provided for @filterSchemes.
  ///
  /// In en, this message translates to:
  /// **'Filter schemes'**
  String get filterSchemes;

  /// No description provided for @allSchemes.
  ///
  /// In en, this message translates to:
  /// **'All Schemes'**
  String get allSchemes;

  /// No description provided for @activeSchemes.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activeSchemes;

  /// No description provided for @upcomingSchemes.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcomingSchemes;

  /// No description provided for @expiredSchemes.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get expiredSchemes;

  /// No description provided for @schemeDetails.
  ///
  /// In en, this message translates to:
  /// **'Scheme Details'**
  String get schemeDetails;

  /// No description provided for @eligibility.
  ///
  /// In en, this message translates to:
  /// **'Eligibility'**
  String get eligibility;

  /// No description provided for @benefits.
  ///
  /// In en, this message translates to:
  /// **'Benefits'**
  String get benefits;

  /// No description provided for @requiredDocuments.
  ///
  /// In en, this message translates to:
  /// **'Required Documents'**
  String get requiredDocuments;

  /// No description provided for @applicationProcess.
  ///
  /// In en, this message translates to:
  /// **'Application Process'**
  String get applicationProcess;

  /// No description provided for @lastDate.
  ///
  /// In en, this message translates to:
  /// **'Last Date'**
  String get lastDate;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @viewMore.
  ///
  /// In en, this message translates to:
  /// **'View More'**
  String get viewMore;

  /// No description provided for @noSchemesFound.
  ///
  /// In en, this message translates to:
  /// **'No schemes found'**
  String get noSchemesFound;

  /// No description provided for @schemeTitle1.
  ///
  /// In en, this message translates to:
  /// **'Pradhan Mantri Fasal Bima Yojana'**
  String get schemeTitle1;

  /// No description provided for @schemeDesc1.
  ///
  /// In en, this message translates to:
  /// **'Crop insurance scheme for farmers'**
  String get schemeDesc1;

  /// No description provided for @schemeTitle2.
  ///
  /// In en, this message translates to:
  /// **'PM Kisan Samman Nidhi'**
  String get schemeTitle2;

  /// No description provided for @schemeDesc2.
  ///
  /// In en, this message translates to:
  /// **'Direct income support for farmers'**
  String get schemeDesc2;

  /// No description provided for @schemeTitle3.
  ///
  /// In en, this message translates to:
  /// **'Kisan Credit Card'**
  String get schemeTitle3;

  /// No description provided for @schemeDesc3.
  ///
  /// In en, this message translates to:
  /// **'Credit facility for agricultural needs'**
  String get schemeDesc3;

  /// No description provided for @ongoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get ongoing;

  /// No description provided for @visitWebsite.
  ///
  /// In en, this message translates to:
  /// **'Visit Website'**
  String get visitWebsite;

  /// No description provided for @searchCrops.
  ///
  /// In en, this message translates to:
  /// **'Search crops, varieties, markets...'**
  String get searchCrops;

  /// No description provided for @loadingLocation.
  ///
  /// In en, this message translates to:
  /// **'Getting your location...'**
  String get loadingLocation;

  /// No description provided for @currentPrice.
  ///
  /// In en, this message translates to:
  /// **'Current Price'**
  String get currentPrice;

  /// No description provided for @marketName.
  ///
  /// In en, this message translates to:
  /// **'Market'**
  String get marketName;

  /// No description provided for @lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get lastUpdated;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @noSearchResults.
  ///
  /// In en, this message translates to:
  /// **'No crops match your search'**
  String get noSearchResults;

  /// No description provided for @noCropPrices.
  ///
  /// In en, this message translates to:
  /// **'No crop prices available for your location'**
  String get noCropPrices;

  /// No description provided for @allStates.
  ///
  /// In en, this message translates to:
  /// **'All States'**
  String get allStates;

  /// No description provided for @maharashtra.
  ///
  /// In en, this message translates to:
  /// **'Maharashtra'**
  String get maharashtra;

  /// No description provided for @karnataka.
  ///
  /// In en, this message translates to:
  /// **'Karnataka'**
  String get karnataka;

  /// No description provided for @gujarat.
  ///
  /// In en, this message translates to:
  /// **'Gujarat'**
  String get gujarat;

  /// No description provided for @punjab.
  ///
  /// In en, this message translates to:
  /// **'Punjab'**
  String get punjab;

  /// No description provided for @uttarPradesh.
  ///
  /// In en, this message translates to:
  /// **'Uttar Pradesh'**
  String get uttarPradesh;

  /// No description provided for @madhyaPradesh.
  ///
  /// In en, this message translates to:
  /// **'Madhya Pradesh'**
  String get madhyaPradesh;

  /// No description provided for @allDistricts.
  ///
  /// In en, this message translates to:
  /// **'All Districts'**
  String get allDistricts;

  /// No description provided for @mumbai.
  ///
  /// In en, this message translates to:
  /// **'Mumbai'**
  String get mumbai;

  /// No description provided for @pune.
  ///
  /// In en, this message translates to:
  /// **'Pune'**
  String get pune;

  /// No description provided for @nagpur.
  ///
  /// In en, this message translates to:
  /// **'Nagpur'**
  String get nagpur;

  /// No description provided for @nashik.
  ///
  /// In en, this message translates to:
  /// **'Nashik'**
  String get nashik;

  /// No description provided for @aurangabad.
  ///
  /// In en, this message translates to:
  /// **'Aurangabad'**
  String get aurangabad;

  /// No description provided for @bangalore.
  ///
  /// In en, this message translates to:
  /// **'Bangalore'**
  String get bangalore;

  /// No description provided for @mysore.
  ///
  /// In en, this message translates to:
  /// **'Mysore'**
  String get mysore;

  /// No description provided for @hubli.
  ///
  /// In en, this message translates to:
  /// **'Hubli'**
  String get hubli;

  /// No description provided for @mangalore.
  ///
  /// In en, this message translates to:
  /// **'Mangalore'**
  String get mangalore;

  /// No description provided for @selectState.
  ///
  /// In en, this message translates to:
  /// **'Select State'**
  String get selectState;

  /// No description provided for @selectDistrict.
  ///
  /// In en, this message translates to:
  /// **'Select District'**
  String get selectDistrict;

  /// No description provided for @showDefaultPrices.
  ///
  /// In en, this message translates to:
  /// **'Show Default Market Prices'**
  String get showDefaultPrices;

  /// No description provided for @priceDetails.
  ///
  /// In en, this message translates to:
  /// **'Price Details'**
  String get priceDetails;

  /// No description provided for @minPrice.
  ///
  /// In en, this message translates to:
  /// **'Min Price'**
  String get minPrice;

  /// No description provided for @modalPrice.
  ///
  /// In en, this message translates to:
  /// **'Modal Price'**
  String get modalPrice;

  /// No description provided for @maxPrice.
  ///
  /// In en, this message translates to:
  /// **'Max Price'**
  String get maxPrice;

  /// No description provided for @marketDetails.
  ///
  /// In en, this message translates to:
  /// **'Market Details'**
  String get marketDetails;

  /// No description provided for @market.
  ///
  /// In en, this message translates to:
  /// **'Market'**
  String get market;

  /// No description provided for @district.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get district;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @dateInformation.
  ///
  /// In en, this message translates to:
  /// **'Date Information'**
  String get dateInformation;

  /// No description provided for @arrivalDate.
  ///
  /// In en, this message translates to:
  /// **'Arrival Date'**
  String get arrivalDate;

  /// No description provided for @cropDiseaseDetection.
  ///
  /// In en, this message translates to:
  /// **'Crop Disease Detection'**
  String get cropDiseaseDetection;

  /// No description provided for @governmentSchemesAndSubsidies.
  ///
  /// In en, this message translates to:
  /// **'Government Schemes & Subsidies'**
  String get governmentSchemesAndSubsidies;

  /// No description provided for @snow.
  ///
  /// In en, this message translates to:
  /// **'Snow'**
  String get snow;

  /// No description provided for @mist.
  ///
  /// In en, this message translates to:
  /// **'Mist'**
  String get mist;

  /// No description provided for @fog.
  ///
  /// In en, this message translates to:
  /// **'Fog'**
  String get fog;

  /// No description provided for @haze.
  ///
  /// In en, this message translates to:
  /// **'Haze'**
  String get haze;

  /// No description provided for @rain.
  ///
  /// In en, this message translates to:
  /// **'Rain'**
  String get rain;

  /// No description provided for @drizzle.
  ///
  /// In en, this message translates to:
  /// **'Drizzle'**
  String get drizzle;

  /// No description provided for @shower.
  ///
  /// In en, this message translates to:
  /// **'Shower'**
  String get shower;

  /// No description provided for @locationMumbai.
  ///
  /// In en, this message translates to:
  /// **'Mumbai'**
  String get locationMumbai;

  /// No description provided for @locationDelhi.
  ///
  /// In en, this message translates to:
  /// **'Delhi'**
  String get locationDelhi;

  /// No description provided for @locationPune.
  ///
  /// In en, this message translates to:
  /// **'Pune'**
  String get locationPune;

  /// No description provided for @locationBangalore.
  ///
  /// In en, this message translates to:
  /// **'Bangalore'**
  String get locationBangalore;

  /// No description provided for @locationChennai.
  ///
  /// In en, this message translates to:
  /// **'Chennai'**
  String get locationChennai;

  /// No description provided for @locationKolkata.
  ///
  /// In en, this message translates to:
  /// **'Kolkata'**
  String get locationKolkata;

  /// No description provided for @locationHyderabad.
  ///
  /// In en, this message translates to:
  /// **'Hyderabad'**
  String get locationHyderabad;

  /// No description provided for @locationAhmedabad.
  ///
  /// In en, this message translates to:
  /// **'Ahmedabad'**
  String get locationAhmedabad;

  /// No description provided for @locationNagpur.
  ///
  /// In en, this message translates to:
  /// **'Nagpur'**
  String get locationNagpur;

  /// No description provided for @overcast.
  ///
  /// In en, this message translates to:
  /// **'Overcast'**
  String get overcast;

  /// No description provided for @lightRain.
  ///
  /// In en, this message translates to:
  /// **'Light Rain'**
  String get lightRain;

  /// No description provided for @heavyRain.
  ///
  /// In en, this message translates to:
  /// **'Heavy Rain'**
  String get heavyRain;

  /// No description provided for @getPesticideInfo.
  ///
  /// In en, this message translates to:
  /// **'Get Pesticide Info'**
  String get getPesticideInfo;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi', 'mr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'mr':
      return AppLocalizationsMr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

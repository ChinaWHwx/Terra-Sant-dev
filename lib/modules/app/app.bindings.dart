import 'package:flutter_application_1/modules/app/auth/SignIn/ForgetPassword/forget.controller.dart';
import 'package:flutter_application_1/modules/app/auth/SignIn/ForgetPassword/forgotPasswordSmsVerification/forgotPasswordSmsVerification.controller.dart';
import 'package:flutter_application_1/modules/app/auth/SignIn/ResetPassword/resetPassword.controller.dart';
import 'package:flutter_application_1/modules/app/auth/SignIn/signin.controller.dart';
import 'package:flutter_application_1/modules/app/auth/SignUp/Email/email.controller.dart';
import 'package:flutter_application_1/modules/app/auth/SignUp/EmailVerification/emailverification.controller.dart';
import 'package:flutter_application_1/modules/app/auth/SignUp/Infos/info.controller.dart';
import 'package:flutter_application_1/modules/app/auth/SignUp/Password/password.controller.dart';
import 'package:flutter_application_1/modules/app/auth/SignUp/Position/google_place_api.controller.dart';
import 'package:flutter_application_1/modules/app/auth/SignUp/SmsVerification/smsverification.controller.dart';
import 'package:flutter_application_1/modules/app/auth/SignUp/Telephone/telephone.controller.dart';
import 'package:flutter_application_1/modules/app/auth/Splash/splach.controller.dart';
import 'package:flutter_application_1/modules/app/auth/auth.controller.dart';
import 'package:flutter_application_1/modules/app/auth/SignUp/Status/Candidate/candidate.controller.dart';
import 'package:flutter_application_1/modules/app/auth/SignUp/Status/Recruiter/recruiter.controller.dart';
import 'package:flutter_application_1/modules/app/error/Network/network_error.controller.dart';
import 'package:flutter_application_1/modules/app/error/NothingFound/nothing_found.controller.dart';
import 'package:flutter_application_1/modules/app/error/SignIn/signin_error.controller.dart';
import 'package:flutter_application_1/modules/app/error/SmsVerification/sms_error.controller.dart';
import 'package:flutter_application_1/modules/app/error/access/Camera/camera_access.controller.dart';
import 'package:flutter_application_1/modules/app/error/access/File/file_access.controller.dart';
import 'package:flutter_application_1/modules/app/error/access/GPS/gps_access.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Basic/basic_exemple.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Candidate/Candidate_calendar.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Candidate/addCandidateAvailability.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Candidate/candidateAvailability.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Complex/complex_exemple.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Recruiter/PharmacieInfo/PharmacieInfo.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Recruiter/ajouterPharmacie/RecuAjouterPharmacie.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Recruiter/besoin/Recruiter_calendar.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Recruiter/declaration.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Recruiter/recruAvailability/recruAvailability.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Drawer/Contact/contact.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Drawer/GoogleMap/SearchingAddress/searching_address.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Drawer/GoogleMap/ViewingMap/viewing_map.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Drawer/GoogleMap/google_map.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Drawer/Recommend/recommend.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Drawer/Settings/setting.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_candidate/Details/Future/detail_future_candidate.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_candidate/Details/Now/detail_now_candidate.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_candidate/Details/Pass/detail_pass.candidate.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_candidate/dutyCandidate.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_recruiter/Description/description.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_recruiter/Details/Future/ajouteMission/ajoute_mission.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_recruiter/Details/Future/detail_future_recruiter.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_recruiter/Details/Now/detail_now_recruiter.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_recruiter/Details/Pass/detail_pass_recruiter.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_recruiter/dutyRecruiter.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/my_recruiter.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/pharmacie/EditMyPharmacy/editMyPharmacy.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/pharmacie/ajouterPharmacie/ajouterPharmacie.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/pharmacie/pharmacie.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/profile/modify/modify_profile.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/ability/ability.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/document/document.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/experience/experience.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/favorite/Pharmacie/pharmacie_favotite.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/my.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/profile/profile.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Search/allPharmacy.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Search/search.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Welcome/welcome.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/homepage.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/homepagePhar.controller.dart';
import 'package:flutter_application_1/modules/app/timeout/SignIn/signin_timeout.controller.dart';
import 'package:flutter_application_1/repositories/availabilityPhar.repository.dart';
import 'package:flutter_application_1/repositories/availabilityUser.repository.dart';
import 'package:flutter_application_1/repositories/candidate.repository.dart';
import 'package:flutter_application_1/repositories/demande.repository.dart';
import 'package:flutter_application_1/repositories/login.repository.dart';
import 'package:flutter_application_1/repositories/offer.repository.dart';
import 'package:flutter_application_1/repositories/pharmacy.repository.dart';
import 'package:flutter_application_1/repositories/recruiter.repository.dart';
import 'package:flutter_application_1/repositories/signUp.repository.dart';
import 'package:flutter_application_1/services/availabilityPhar.service.dart';
import 'package:flutter_application_1/services/availabilityUser.service.dart';
import 'package:flutter_application_1/services/candidate.service.dart';
import 'package:flutter_application_1/services/demande.service.dart';
import 'package:flutter_application_1/services/login.service.dart';
import 'package:flutter_application_1/services/offer.service.dart';
import 'package:flutter_application_1/services/pharmacy.service.dart';
import 'package:flutter_application_1/services/recruiter.service.dart';
import 'package:flutter_application_1/services/signUp.service.dart';
import 'package:flutter_application_1/shared/widgets/drawer/navigation_drawer.controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => TelephoneController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => CandidateController(), fenix: true);
    Get.lazyPut(() => RecruiterController(), fenix: true);
    Get.lazyPut(() => SmsVerificationController(), fenix: true);
    Get.lazyPut(() => EmailController(), fenix: true);
    Get.lazyPut(() => EmailVerificationController(), fenix: true);
    Get.lazyPut(() => InfoController(), fenix: true);
    Get.lazyPut(() => HomepageController(), fenix: true);
    Get.lazyPut(() => WelcomeController(), fenix: true);
    Get.lazyPut(() => MyController(), fenix: true);
    Get.lazyPut(() => DocumentController(), fenix: true);
    Get.lazyPut(() => ExperienceController(), fenix: true);
    Get.lazyPut(() => AbilityController(), fenix: true);
    Get.lazyPut(() => SmsErrorController(), fenix: true);
    Get.lazyPut(() => SignInErrorController(), fenix: true);
    Get.lazyPut(() => PasswordController(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => ContactController(), fenix: true);
    Get.lazyPut(() => MapController(), fenix: true);
    //Get.lazyPut(() => GoogleMapPositionController(), fenix: true);
    Get.lazyPut(() => RecommendController(), fenix: true);
    Get.lazyPut(() => DutyRecruiterController(), fenix: true);
    Get.lazyPut(() => DutyCandidateController(), fenix: true);
    Get.lazyPut(() => GooglePlaceApiController(), fenix: true);
    Get.lazyPut(() => SettingController(), fenix: true);
    Get.lazyPut(() => SearchController(), fenix: true);
    Get.lazyPut(() => NothingFoundController(), fenix: true);
    Get.lazyPut(() => NetWorkErrorController(), fenix: true);
    Get.lazyPut(() => GpsAccessController(), fenix: true);
    Get.lazyPut(() => CameraAccessController(), fenix: true);
    Get.lazyPut(() => FileAccessController(), fenix: true);
    Get.lazyPut(() => SignInTimeOutController(), fenix: true);
    Get.lazyPut(() => ResetPasswordController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => ForgotPasswordSmsVerificationController(), fenix: true);
    Get.lazyPut(() => PharmacieController(), fenix: true);
    Get.lazyPut(() => CandidateController(), fenix: true);
    Get.lazyPut(() => PharmacieFavoriteController(), fenix: true);
    Get.lazyPut(() => NavigationDrawerController(), fenix: true);
    Get.lazyPut(() => CandidateCalendarController(), fenix: true);
    Get.lazyPut(() => RecruiterCalendarController(), fenix: true);
    Get.lazyPut(() => DeclarationController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => ModifiyProfileController(), fenix: true);
    Get.lazyPut(() => SearchingAddressController(), fenix: true);
    Get.lazyPut(() => ViewingMapController(), fenix: true);
    Get.lazyPut(() => BasicExempleController(), fenix: true);
    Get.lazyPut(() => ComplexExempleController(), fenix: true);
    Get.lazyPut(() => DetailFutureRecruiterController(), fenix: true);
    Get.lazyPut(() => DetailNowRecruiterController(), fenix: true);
    Get.lazyPut(() => DetailPassRecruiterController(), fenix: true);
    Get.lazyPut(() => DescriptionController(), fenix: true);
    Get.lazyPut(() => DetailFutureCandidateController(), fenix: true);
    Get.lazyPut(() => DetailNowCandidateController(), fenix: true);
    Get.lazyPut(() => DetailPassCandidateController(), fenix: true);
    Get.lazyPut(() => PharmacieInfoController(), fenix: true);
    Get.lazyPut(() => PharmacieController(), fenix: true);
    Get.lazyPut(() => MyRecruiterController(), fenix: true);
    Get.lazyPut(() => AjouterPharmacieController(), fenix: true);
    Get.lazyPut(() => AjouterMissionController(), fenix: true);
    Get.lazyPut(() => HomepagePharController(), fenix: true);
    Get.lazyPut(() => AllPharmacyController(), fenix: true);
    Get.lazyPut(() => CandidateAvailabilityController(), fenix: true);
    Get.lazyPut(() => AddCandidateAvailabilityController(), fenix: true);
    Get.lazyPut(() => RecuAjouterPharmacieController(), fenix: true);
    Get.lazyPut(() => RecruAvailabilityController(), fenix: true);
    Get.lazyPut(() => EditMyPharmacyController(), fenix: true);

    //Services
    Get.lazyPut(() => LoginService(), fenix: true);
    Get.lazyPut(() => AvailabilityUserService(), fenix: true);
    Get.lazyPut(() => SignUpService(), fenix: true);
    Get.lazyPut(() => DemandeService(), fenix: true);
    Get.lazyPut(() => AvailabilityPharService(), fenix: true);
    Get.lazyPut(() => CandidateService(), fenix: true);
    Get.lazyPut(() => OfferService(), fenix: true);
    Get.lazyPut(() => PharmacyService(), fenix: true);
    Get.lazyPut(() => RecruiterService(), fenix: true);
    //Repositories
    Get.lazyPut(() => LoginRepository(), fenix: true);
    Get.lazyPut(() => AvailabilityUserRepository(), fenix: true);
    Get.lazyPut(() => AvailabilityPharRepository(), fenix: true);
    Get.lazyPut(() => SignUpRepository(), fenix: true);
    Get.lazyPut(() => BasicExempleController(), fenix: true);
    Get.lazyPut(() => ComplexExempleController(), fenix: true);
    Get.lazyPut(() => DemandeRepository(), fenix: true);
    Get.lazyPut(() => CandidateRepository(), fenix: true);
    Get.lazyPut(() => OfferRepository(), fenix: true);
    Get.lazyPut(() => PharmacyRepository(), fenix: true);
    Get.lazyPut(() => RecruiterRepository(), fenix: true);
  }
}

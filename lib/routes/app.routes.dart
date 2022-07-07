part of 'app.pages.dart';

class Routes {
  static const auth = '/auth';
  static const signIn = '/signin';
  static const telephone = '/telephone';
  static const forgetPassword = '/forgetpassword';
  static const candidate = '/candidate';
  static const recruiter = '/recruiter';
  static const smsVerification = '/smsverification';
  static const email = '/email';
  static const emailVerification = '/emailverification';
  static const infos = '/infos';
  static const position = '/position';
  static const homepage = '/homepage';
  static const welcome = '/welcome';
  static const calendar = '/calendar';
  static const menu = '/menu';
  static const document = '/document';
  static const logout = '/logout';
  static const ability = '/ability';
  static const remuneration = '/remuneration';
  static const experience = '/experience';
  static const smserror = '/smserror';
  static const signinerror = '/signinerror';
  static const password = '/password';
  static const splash = '/splash';
  static const profile = '/profile';
  static const contact = '/contact';
  static const googleMap = '/googleMap';
  static const googleMapPosition = '/googleMapPosition';
  static const recommend = '/recommend';
  static const my = '/my';
  static const duty = '/duty';
  static const googlePlaceApi = '/googlePlaceApi';
  static const setting = '/setting';
  static const search = '/search';
  static const nothingFound = '/nothingFound';
  static const signInError = '/signInError';
  static const networkError = '/networkError';
  static const gpsAccess = '/gpsAccess';
  static const cameraAccess = '/cameraAccess';
  static const fileAccess = '/fileAccess';
  static const signInTimeOut = '/signInTimeOut';
  static const emailVerificationTimeOut = '/emailVerificationTimeOut';
  static const resetPassword = '/resetPassword';
  static const forgotPasswordSmsVerification = '/forgotPasswordSmsVerification';
  static const favorite = '/favorite';
  static const pharmacieFavorite = '/pharmacieFavorite';
  static const bookmarksPage = '/bookmarksPage';
  static const candidateFavorite = '/candidateFavorite';

  static const candidateRoute = auth + candidate;
  static const recruiterRoute = auth + recruiter;
  static const signInRoute = auth + signIn;
  static const signUpRoute = auth + telephone;
  static const infoRoute = auth + infos;
  static const forgetPasswordRoute = auth + signIn + forgetPassword;
  static const smsVerificationRoute = auth + telephone + smsVerification;
  static const emailVerificationRoute =
      auth + telephone + smsVerification + email + emailVerification;
  static const emailRoute = auth + telephone + smsVerification + email;
  static const positionRoute = position;
  static const homepageRoute = homepage;
  static const welcomeRoute = welcome;
  static const passwordRoute = password;
  static const calendarRoute = calendar;
  static const menuRoute = menu;
  static const documentRoute = document;
  static const logoutRoute = logout;
  static const abilityRoute = ability;
  static const remunerationRoute = remuneration;
  static const experienceRoute = experience;
  static const smserrorRoute = smserror;
  static const signinerrorRoute = signinerror;
  static const splashRoute = splash;
  static const profileRoute = profile;
  static const contactRoute = contact;
  static const googleMapRoute = googleMap;
  static const googleMapPositionRoute = googleMapPosition;
  static const recommendRoute = recommend;
  static const myRoute = my;
  static const dutyRoute = duty;
  static const googleplaceapiRoute = googlePlaceApi;
  static const settingRoute = setting;
  static const searchRoute = search;
  static const nothingFoundRoute = nothingFound;
  static const signInErrorRoute = signInError;
  static const networkErrorRoute = networkError;
  static const gpsAccessRoute = gpsAccess;
  static const cameraAccessRoute = cameraAccess;
  static const fileAccessRoute = fileAccess;
  static const sigiInTimeOutRoute = signInTimeOut;
  static const emailVerificationTimeOutRoute = emailVerificationTimeOut;
  static const resetPasswordRoute = resetPassword;
  static const forgotPasswordSmsVerificationRoute =
      forgotPasswordSmsVerification;
  static const favoriteRoute = favorite;
  static const pharmacieFavoriteRoute = pharmacieFavorite;
  static const candidateFavoriteRoute = candidateFavorite;
}

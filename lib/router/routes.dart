part of 'router.dart';

const String Home = '/';
const String AppLoader = '/app-loader';
const String OnBoarding = '/on-boarding';
const String Login = '/login';
const String Register = '/register';
const String Study = '/study';
const String Profile = '/profile';

final routes = [
  GetPage(name: AppLoader, page: () => AppLoaderPage()),
  GetPage(name: OnBoarding, page: () => OnBoardingPage()),
  GetPage(name: '$Login/:userType', page: () => LoginPage()),
  GetPage(name: '$Register/:userType', page: () => RegisterPage()),
  GetPage(name: Home, page: () => HomePage()),
  GetPage(name: Study, page: () => StudyPage()),
  GetPage(name: Profile, page: () => ProfilePage()),
];

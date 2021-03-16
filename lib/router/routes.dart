part of 'router.dart';

const String Home = '/';
const String AppLoader = '/app-loader';
const String OnBoarding = '/on-boarding';
const String Login = '/login';
const String Register = '/register';
const String Study = '/study';

final routes = [
  GetPage(name: AppLoader, page: () => AppLoaderPage()),
  GetPage(name: OnBoarding, page: () => OnBoardingPage()),
  GetPage(name: '$Login/:userType', page: () => LoginPage()),
  GetPage(name: '$Register/:userType', page: () => RegisterPage()),
  GetPage(name: Study, page: () => StudyPage()),
  GetPage(name: Home, page: () => HomePage()),
];

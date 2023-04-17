import 'package:get/get.dart';
import '../Modules/Home/Home_binding.dart';
import '../Modules/Home/Home_page.dart';
import '../Modules/Login/Login_binding.dart';
import '../Modules/Login/Login_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const Homepage(),
      binding: HomeBinding(),
    ),
  ];
}

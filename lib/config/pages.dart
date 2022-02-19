import 'package:get/get.dart';
import './routes.dart';
import '../resources/views/dashboard/dashboard_page.dart';
import '../app/bindings/dashboard_binding.dart';

class PagesConfig {
  static final pages = [
    GetPage(
      name: RoutesConfig.dashboardPage,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    )
  ];
}

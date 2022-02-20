import 'package:get/get.dart';
import './routes.dart';
import '../resources/views/dashboard/dashboard_page.dart';
import '../resources/views/category/category_page.dart';
import '../app/bindings/dashboard_binding.dart';
import '../app/bindings/category_binding.dart';

class PagesConfig {
  static final pages = [
    GetPage(
      name: RoutesConfig.dashboardPage,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: RoutesConfig.categoryPage,
      page: () => const CategoryPage(),
      binding: CategoryBinding(),
    )
  ];
}

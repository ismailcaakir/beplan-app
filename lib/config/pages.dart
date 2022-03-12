import 'package:get/get.dart';
import 'package:beplan/config/routes.dart';
import 'package:beplan/resources/views/dashboard/dashboard_page.dart';
import 'package:beplan/resources/views/category/category_page.dart';
import 'package:beplan/app/bindings/dashboard_binding.dart';
import 'package:beplan/app/bindings/category_binding.dart';

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

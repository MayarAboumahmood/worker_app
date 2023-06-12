import 'package:get/get.dart';
import 'package:worker_app/view/screens/bar/bar_page.dart';
import 'package:worker_app/view/screens/bar/bar_page_binding.dart';
import 'package:worker_app/view/screens/landing/landing_page.dart';
import 'package:worker_app/view/screens/settings/theme_binding.dart';

appRoutes() => [
      GetPage(name: '/', page: () => Landing(), binding: ThemeBinding()),
      GetPage(
          name: '/Bar', page: () => const BarPage(), binding: BarPageBinding()),
    ];

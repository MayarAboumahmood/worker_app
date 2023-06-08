import 'package:get/get.dart';
import 'package:worker_app/view/screens/landing/landing_page.dart';
import 'package:worker_app/view/screens/settings/theme_binding.dart';

appRoutes() => [
      GetPage(name: '/Home', page: () => Landing(), binding: ThemeBinding()),
    ];

import 'package:get/get.dart';
import 'package:worker_app/view/screens/bar/bar_page.dart';
import 'package:worker_app/view/screens/bar/bar_page_binding.dart';
import 'package:worker_app/view/screens/cart/cart_page.dart';
import 'package:worker_app/view/screens/event_info/event_binding.dart';
import 'package:worker_app/view/screens/event_info/event_info_page.dart';
import 'package:worker_app/view/screens/event_page/event_page.dart';
import 'package:worker_app/view/screens/event_page/event_page_binding.dart';
import 'package:worker_app/view/screens/landing/landing_page.dart';
import 'package:worker_app/view/screens/settings/theme_binding.dart';
import 'package:worker_app/view/screens/stock/stock_page.dart';

import 'view/screens/stock/stock_binding.dart';

appRoutes() => [
      GetPage(name: '/', page: () => Landing(), binding: ThemeBinding()),
      GetPage(
          name: '/Bar', page: () => const BarPage(), binding: BarPageBinding()),
      GetPage(
          name: '/EventPage',
          page: () => EventPage(),
          binding: EventPageBinding()),
      GetPage(
          name: '/EventInfo',
          page: () => EventInfo(),
          binding: EventInfoBinding()),
      GetPage(name: '/Cart', page: () => const CartPage()),
      GetPage(name: '/StockPage', page: () => Stock(), binding: StockBinding()),
    ];

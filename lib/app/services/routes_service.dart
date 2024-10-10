import 'package:get/route_manager.dart';
import 'package:ripen/app/ui/onboarding/intro_page.dart';

class RoutesClass {
  static String intro = '/';

  static List<GetPage> routes = [
    GetPage(name: intro, page: () => AppIntroPage()),
  ];
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:reative_template_app_flutter/src/modules/home/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
}

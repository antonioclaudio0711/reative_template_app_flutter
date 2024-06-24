import 'package:flutter_modular/flutter_modular.dart';
import 'package:reative_template_app_flutter/src/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.module('/home', module: HomeModule());
  }
}

import 'numerology_controller.dart';
import 'repositories/numerology_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'numerology_page.dart';

class NumerologyModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NumerologyController()),
        Bind((i) => NumerologyRepository(Dio())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => NumerologyPage()),
      ];

  static Inject get to => Inject<NumerologyModule>.of();
}

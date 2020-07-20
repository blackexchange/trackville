import 'coaching_controller.dart';
import 'detail_page.dart';
import 'repositories/coaching_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'coaching_page.dart';

class CoachingModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CoachingController()),
        Bind((i) => CoachingRepository(Dio())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CoachingPage()),

      ];

  static Inject get to => Inject<CoachingModule>.of();
}

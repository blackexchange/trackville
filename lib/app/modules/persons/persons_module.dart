import 'repositories/persons_repository.dart';
import 'persons_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'persons_page.dart';

class PersonsModule extends ChildModule {
  @override
  List<Bind> get binds => [
      //  Bind((i) => PersonsRepository(Dio())),
        Bind((i) => PersonsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PersonsPage()),
      ];

  static Inject get to => Inject<PersonsModule>.of();
}

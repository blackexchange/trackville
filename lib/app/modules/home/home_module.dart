import 'package:trackville/app/modules/home/widgets/home_drawer/home_drawer_widget.dart';
import 'package:trackville/app/modules/persons/persons_controller.dart';
import 'package:trackville/app/modules/persons/repositories/persons_repository.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeDrawerWidget()),
       // Bind((i) => PersonsController(i.get<PersonsRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}

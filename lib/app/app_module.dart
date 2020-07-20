import 'package:trackville/app/auth/auth_controller.dart';
import 'package:trackville/app/auth/repositories/auth_repository.dart';
import 'package:trackville/app/auth/repositories/auth_repository_interface.dart';
import 'package:trackville/app/modules/coaching/detail_page.dart';
import 'package:trackville/app/modules/home/home_controller.dart';
import 'package:trackville/app/modules/home/widgets/home_drawer/home_drawer_widget.dart';
import 'package:trackville/app/modules/login/login_module.dart';
import 'package:trackville/app/modules/numerology/numerology_controller.dart';
import 'package:trackville/app/modules/numerology/numerology_module.dart';
import 'package:trackville/app/modules/numerology/repositories/local_storage_service.dart';
import 'package:trackville/app/modules/persons/persons_controller.dart';
import 'package:trackville/app/modules/persons/persons_module.dart';
import 'package:trackville/app/pages/about_screen.dart';
import 'package:trackville/app/pages/help_screen.dart';
import 'package:trackville/app/pages/splash/splash_page.dart';
import 'package:trackville/app/shared/repositories/local_storage_hive.dart';
import 'package:trackville/app/shared/repositories/local_storage_interface.dart';

import 'modules/coaching/coaching_module.dart';
import 'pages/splash/splash_controller.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:trackville/app/app_widget.dart';
import 'package:trackville/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
        Bind((i) => HomeController()),
        Bind((i) => PersonsController()),
       // Bind<ILocalStorage>((i) => LocalStorageHive()),
        Bind((i) => LocalStorageService()),
       // Bind((i) => NumerologyController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,child: (_,args)=>SplashPage()),
        Router("/login",module: LoginModule(), transition: TransitionType.noTransition),
        Router("/home", module: HomeModule()),
        Router("/numerology", module: NumerologyModule()),
        Router("/coaching", module: CoachingModule()),
        Router("/persons", module: PersonsModule()),
        Router("/about", child:(_,args)=>HelpScreen()),
        Router("/detail/:lecture", child:(_,args)=>DetailPage(
            lecture:args.params["lecture"],
        )),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

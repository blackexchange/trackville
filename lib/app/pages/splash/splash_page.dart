import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:trackville/app/auth/auth_controller.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller
  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();


    disposer = autorun((_) async{
      final auth = Modular.get<AuthController>();

      if (auth.status == AuthStatus.login) {
        await Future.delayed(Duration(seconds: 1));
        Modular.to.pushReplacementNamed("/home");
      }
      else if (auth.status == AuthStatus.logoff) {
        await Future.delayed(Duration(seconds: 1));
        Modular.to.pushReplacementNamed("/login");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }


}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:trackville/app/auth/auth_controller.dart';
import 'package:trackville/app/modules/persons/persons_controller.dart';
import 'package:trackville/app/shared/repositories/local_storage_hive.dart';
import 'package:trackville/app/shared/repositories/local_storage_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
 // final ILocalStorage _storage = Modular.get();

  final PersonsController personsController = Modular.get();


  @action
  removePerson(int id) async {

    await Modular.get<PersonsController>().remove(id);
    Modular.to.pushReplacementNamed("/home");

  }

  @action
  FirebaseUser getUser()  {
    return Modular.get<AuthController>().user;
  }

  @action
  logoff() async{
    await Modular.get<AuthController>().logOut();
    Modular.to.pushReplacementNamed("/login");
  }
}

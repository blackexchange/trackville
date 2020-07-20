import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../model/person_model.dart';

class LocalStorageService extends Disposable {
  Completer<Box> completer = Completer<Box>();

  LocalStorageService(){
    _initDB();
  }

  _initDB() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    final box = await Hive.openBox("personsDb");

   // box.deleteFromDisk();
    if (!completer.isCompleted)
      completer.complete(box);
  }

  Future <List<PersonModel>> getAll() async{
    final box = await completer.future;
    return box.values.map((e) => PersonModel.fromJson(e)).toList();

  }


  Future <PersonModel> getDoc(int id) async{
    final box = await completer.future;
    return PersonModel.fromJson(box.get(id) );

  }

  Future<PersonModel> add (PersonModel model) async{

    final box = await completer.future;
    model.id = box.values.length;
    print (model.toJson());

    await box.put (box.values.length, model.toJson());
    return model;
  }

  Future<PersonModel> update (PersonModel model) async{
    final box = await completer.future;
    await box.put (model.id, model.toJson());
    return model;
  }

  remove (int id) async{
    print (id);
    final box = await completer.future;
    await box.delete(id);
  }

  //dispose will be called automatically
  @override
  void dispose() async {
    final box = await completer.future;
    box.close();
  }
}

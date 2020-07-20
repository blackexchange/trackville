import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:trackville/app/modules/persons/model/person_model.dart';
import 'package:trackville/app/modules/persons/repositories/local_storage_service.dart';

class PersonsRepository {

  LocalStorageService service;

  PersonsRepository(){
    _init();
  }

  _init() async{
    final allList = await service.getAll();
  //  list.addAll(allList);
  }


  Dio dio = Dio();

  Future <PersonModel> fetchPersons() async {
     var res = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
     Map data = res.data;
  //  return PersonModel.fromJson(data);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'local_storage_interface.dart';

class FireBaseStorage implements ILocalStorage{

  Firestore firestore;
  _init ()async{

  }

  @override
  Future delete(String key) async {
  }

  @override
  Future<List<String>> get(String key) async {
 //   return Firestore.instance.collection("numerology").getDocuments();
  }

  @override
  Future put(String key, List<String> value) async {
  }

}
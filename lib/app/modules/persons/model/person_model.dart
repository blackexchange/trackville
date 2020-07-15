import '../../numerology/model/numerology_model.dart';
class PersonModel {
  PersonModel();
  String name;
  String dateBorn;
  String hourBorn;
  String phone;
  String email;
  NumerologyModel numerologyMap;

  //NumerologyModel numerology;

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
        //field: json[''],
        );
  }

  Map<String, dynamic> toJson() => {};
}

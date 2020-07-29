// To parse this JSON data, do
//
//     final personModel = personModelFromMap(jsonString);

import 'dart:convert';

class PersonModel {

  PersonModel({
    this.id,
    this.name,
    this.title,
    this.bornDate,
    this.bornHour,
    this.phone,
    this.email,
    this.localBorn,
    this.grupo,
    this.numerologyMap,
  });

  int id;
  String name;
  String title;
  String bornDate;
  String bornHour;
  String phone;
  String email;
  String localBorn;
  String grupo;
  NumerologyMap numerologyMap;

  factory PersonModel.fromJson(String str) => PersonModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PersonModel.fromMap(Map<String, dynamic> json) => PersonModel(
    id: json["id"],
    name: json["name"],
    title: json["title"],
    bornDate: json["bornDate"],
    bornHour: json["bornHour"],
    phone: json["phone"],
    email: json["email"],
    localBorn: json["localBorn"],
    grupo: json["grupo"],
    numerologyMap: NumerologyMap.fromMap(json["numerologyMap"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "title": title,
    "bornDate": bornDate,
    "bornHour": bornHour,
    "phone": phone,
    "email": email,
    "localBorn": localBorn,
    "grupo": grupo,
    "numerologyMap": numerologyMap.toMap(),
  };
}

class NumerologyMap {
  NumerologyMap({
    this.psiquico,
    this.motivacao,
    this.missao,
    this.destino,
    this.expressao,
    this.impressao,
    this.tendenciasOcultas,
    this.dividasCarmicas,
    this.personalYear,
    this.lessons,
    this.subconscious,
    this.cicle1,
    this.cicle2,
    this.cicle3,


  });

  String psiquico;
  List<dynamic> dividasCarmicas;
  List<dynamic> tendenciasOcultas;
  List<dynamic> lessons;
  String motivacao;
  String missao;
  String destino;
  String expressao;
  String impressao;
  String personalYear;
  String subconscious;
  List<dynamic> cicle1;
  List<dynamic> cicle2;
  List<dynamic> cicle3;

  factory NumerologyMap.fromJson(String str) => NumerologyMap.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NumerologyMap.fromMap(Map<String, dynamic> json) => NumerologyMap(
    psiquico: json["psiquico"] ?? json["psiquico"],
    motivacao: json["motivacao"] ?? json["motivacao"],
    missao: json["missao"] ?? json["missao"],
    destino: json["destino"] ?? json["destino"],
    expressao: json["expressao"] ?? json["expressao"],
    impressao: json["impressao"] ?? json["impressao"],
    personalYear: json["personalYear"] ?? json["personalYear"],
    subconscious: json["subconscious"] ?? json["subconscious"],
    tendenciasOcultas: List<dynamic>.from(json["tendenciasOcultas"].map((x) => x)),
    dividasCarmicas: List<dynamic>.from(json["dividasCarmicas"].map((x) => x)),
    lessons: json["lessons"] ?? List<dynamic>.from(json["lessons"].map((x) => x)),
    cicle1: json["cicle1"] ?? List<dynamic>.from(json["cicle1"].map((x) => x)),
    cicle2: json["cicle2"] ?? List<dynamic>.from(json["cicle2"].map((x) => x)),
    cicle3: json["cicle3"] ?? List<dynamic>.from(json["cicle3"].map((x) => x)),

  );

  Map<String, dynamic> toMap() => {
    "psiquico": psiquico,
    "dividasCarmicas": List<dynamic>.from(dividasCarmicas.map((x) => x)),
    "tendenciasOcultas": List<dynamic>.from(tendenciasOcultas.map((x) => x)),
    "lessons": List<dynamic>.from(lessons.map((x) => x)),
    "motivacao": motivacao,
    "missao": missao,
    "destino": destino,
    "expressao": expressao,
    "impressao": impressao,
    "personalYear": personalYear,
    "subconscious": subconscious,
    "cicle1": List<dynamic>.from(cicle1.map((x) => x)),
    "cicle2": List<dynamic>.from(cicle2.map((x) => x)),
    "cicle3": List<dynamic>.from(cicle3.map((x) => x)),

  };
}

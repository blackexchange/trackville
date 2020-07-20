import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:trackville/app/modules/persons/model/person_model.dart';
import 'package:trackville/app/modules/persons/persons_controller.dart';

part 'coaching_controller.g.dart';

class CoachingController = _CoachingControllerBase with _$CoachingController;

abstract class _CoachingControllerBase with Store {

  final PersonsController _personsController = Modular.get();

  @observable
  PersonModel personModel;

  Map resultados;

  @observable
  List leitureValues = [];

  _CoachingControllerBase(){
    personModel = _personsController.actualPerson;
    //print (personModel.toString());
    resultados = personModel.numerologyMap.toMap();
print (resultados);
    resultados.forEach((key, value) {

      leitureValues.add(value.toString());
     // print (selectedLeiture);
    });


  }

  @action
  void openDetail(){
    var params = [lectureCode,lectureValues];
    Modular.to.pushNamed("/detail/$params");
  }

  @observable
  String lectureCode = "";

  @observable
  String lectureValues = "";

  @observable
  int indexValue;

  @action
  void setLectureCode (String value) => this.lectureCode = value;

  @action
  void setLectureValue (String value) => this.lectureValues = value;

  @action
  void setIndexValue (int value ) => this.indexValue = value;

  @computed
  Function get sharePressed => shareData ;

  @action
  void shareData(){

  }

  @observable
  List leitureTitle = ["Psíquico", "Dívidas Cármicas","Tendências Ocultas",
    "Motivação", "Missão",
    "Destino", "Expressão","Impressão", "Ano Pessoal", "Lições Cármicas","Respostas Subconsciente"];

  @observable
  List lectureCodes = ["psychic", "carmic","hidden",
    "motivation", "mission",
    "destiny", "expression","impression", "year", "lessons","subconscious" ];

 // psiquico: 8, dividasCarmicas: [14, 19], tendenciasOcultas: [],
  // lessons: [3, 6, 9], motivacao: 1, missao: 4,
  // destino: 8, expressao: 5, impressao: 4,
  // personalYear: 1, subconscious: 6}

  @observable
  Map lectureMap = {
    "psychic":"Psíquico",
    "carmic":"Dívidas Cármicas",
    "hidden":"Tendências Ocultas",
    "lessons":"Lições Cármicas",
    "motivation":"Motivação",
    "mission": "Missão",
    "destiny":"Destino",
    "expression": "Expressão",
    "impression": "Impressão",
    "year": "Ano Pessoal",
    "subconscious":"Resposta Subconsciente"

  };

  @observable
  List leitureResume = ["Atitudes",
    "Transgressões passadas.",
    "Desejos das vidas passadas.",
    "Lições de vida",
    "Motivos.",
    "Missãao de vida na terra.",
    "Caminho a seguir.",
    "Talentos Internos.",
    "COMO o outro te enxerga.",
    "Ano Pessoal.",
    "Respostas automáticas"];

  @observable
  Map numbers = {

    "1": { "keywords": ["Criativo, intelectual, original, inventivo, liderar, dominar, autoritário..."],
            "description":""},
    "2": {"keywords":["Compreensão, amor, dedicação, companheirismo, gentil, passivo"],
            "description":""},
    "3":{"keywords":["Popular, entusiasta, artes, sociável, sincero, platéia, altruísta..."],"description":""},
    "4":{"keywords":["Ordem, normas, trabalho, métodos, conservador, realista, equilibrado, detalhista, prático..."],"description":""},
    "5":{"keywords":["Mutável, variedades, curioso, perspicaz, antenado, moderno, adaptável, desenrolado,"],"description":""},
    "6":{"keywords":["Harmonia, social, idealismo, criativo, visão, compaixão, conciliador, família, fertilidade, elegância, conforto..."],"description":""},
    "7":{"keywords":["Observador, curioso, questionador, conforto, silêncio, paz, introspectivo, intuicão, mental, espiritual, intelectual, justiça, sabedoria..."],"description":""},
    "8":{"keywords":["Materialista, Negócios, luta, ambição, determinado, inteligente, observador, instintivo, resolvedor, frio, valoriza amigos, analítico..."],"description":""},
    "9":{"keywords":["Intelectual, Espiritual, aconselhar, servir, subconsciente, carismático, magnético, minimalista, vaidoso, psíquico..."],"description":""},
    "11":{"keywords":["Visionário, indivisualista, gosta de ser admirado, atrativo, persuasão, sensível..."],"description":""},
    "22":{"keywords":["Carinhoso, humanitário, pragmático, centrado, potencial, lider, cordial, honesto, organizador..."],"description":""},
  };



}

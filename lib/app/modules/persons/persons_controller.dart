import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:trackville/app/modules/persons/repositories/local_storage_service.dart';
import '../persons/model/person_model.dart';

part 'persons_controller.g.dart';

enum enumStatus {LOADING, FAIL, SUCCESS, IDDLE}

class PersonsController = _PersonsControllerBase with _$PersonsController;

abstract class _PersonsControllerBase with Store {

  final LocalStorageService service = LocalStorageService();

  _PersonsControllerBase(){
    _init();
  }

  _init() async{
    final allPersons = await service.getAll();
    personsList.addAll(allPersons);

  }

  ///Cast de variavel ObservableList<String> list =  <String>[].asObservable

  @observable
  enumStatus status = enumStatus.IDDLE;


  /// Variáveis Simples
  @observable
    String name = "";
  @observable
    String bornDate = "";
  @observable
    String bornHour = "";
  @observable
    String phone = "";
  @observable
    String email = "";
  @observable
    String localBorn = "";
  @observable
    String grupo = "";
  @observable
    String title = "";


  ///Listas
  @observable
    ObservableList<PersonModel> personsList = ObservableList<PersonModel>();

  @observable
  PersonModel actualPerson = PersonModel();

  ///Form actions
  ///
  @action
    setTitle (String value) => title = value;
  @action
    setName (String value) => name = value;
  @action
    setBornDate (String value) => bornDate = value;
  @action
    setBornHour (String value) => bornHour = value;
  @action
    setPhone (String value) => phone = value;
  @action
    setEmail (String value) => email = value;
  @action
  setGrupo (String value) => grupo = value;
  @action
    setLocalBorn (String value) => localBorn = value;


  //Computed

  @computed
  bool get isNameValid => name != null && name.length > 5;


  @computed
  bool get isBornDateValid {

    RegExp regData = new RegExp(r"\d{2}/\d{2}/\d{4}");
    Iterable<Match> matches = regData.allMatches(bornDate);

    return (matches.length > 0);
  }

  @computed
  Function get savePressed =>
      (isNameValid && isBornDateValid) ? saveData : null;


  //Functions
  @action
  Future <ObservableList<PersonModel>> getPersons() async{
    final allPersons = await service.getAll();
    return personsList;
  }

  @action
  void setActualPerson(PersonModel p){
      this.actualPerson = p;
  }


  @action
  Future<void> saveData () async {

    PersonModel p = PersonModel();

    p.name=name;
    p.title = title;
    p.grupo = grupo;
    p.bornDate=bornDate;
    p.bornHour=bornHour;
    p.phone=phone;
    p.email=email;
    p.localBorn=localBorn;
    p.numerologyMap = NumerologyMap();


    await calcularData(p);
    p = await service.add(p);

    //getPersons();
    //personsList.add(p);
   // getPersons();
    status = enumStatus.SUCCESS;


    Modular.to.pushReplacementNamed("/home");
  }

  @action
  Future <void> remove(int id) async {

    await service.remove(id);
  }

  @observable
  ObservableList<PersonModel> list = ObservableList<PersonModel>();

  @action
  Future <void> calcularData(PersonModel model) async {
    model.numerologyMap.motivacao = "";
    model.numerologyMap.impressao = "";
    model.numerologyMap.psiquico = "";
    model.numerologyMap.destino = "";
    model.numerologyMap.expressao = "";
    model.numerologyMap.missao = "";
    model.numerologyMap.dividasCarmicas = [];
    model.numerologyMap.tendenciasOcultas = [];
    model.numerologyMap.lessons = [];
    model.numerologyMap.personalYear = "";
    model.numerologyMap.subconscious = "";


    const Map tabela = {
      "1": {"aijqy"},
      "2": {"bkr`'àìäï"},
      "3": {"cgls~áí"},
      "4": {"dmtã"},
      "5": {"ehn"},
      "6": {"uvxwç"},
      "7": {"ozé"},
      "8": {"fpâîúñ"},
      "9": {"ó"},
      "10": {"èëõ"},
      "12": {"êùü"},
      "13": {"û"},
      "14": {"öò"},
      "15": {"ô"},
      "vogais": {"áàâãäéèêëíïîìóôõöúüùûaeiouy"},
      "consoantes": {"bcdfghjklmnpqrstvwxzñç"}
    };

    var data = model.bornDate.split("/");

    RegExp exp = new RegExp(r"[\S]");
    String str = model.name.toLowerCase();
    Iterable<Match> matches = exp.allMatches(str);

    matches = exp.allMatches(str);
    int sum = 0;
    int sumVogais = 0;
    int sumConsoantes = 0;

    var vogais = "";
    var todasLetras = "";
    var consoantes = "";
    var destino = "";
    var missao = "";
    var conversao = "";
    var personalYear = "";

    var dia = data[0];
    var mes = data[1];
    var ano = data[2];
    int sumAux;
    var numeros = [];

    for (Match m in matches) {
      var aux = m.group(0);
      for (int i = 1; i <= tabela.length; i++) {
        if (i <= 15) {
          String tab = tabela["$i"].toString();
          if (tab.contains(aux)) {
            conversao += i.toString();
            sum += i;
            if (tabela["vogais"].toString().contains(aux)) {
              sumVogais += i;
            } else if (tabela["consoantes"].toString().contains(aux)) {
              sumConsoantes += i;
            }
            break;
          }

        }
      }
    }

    vogais = sumVogais.toString();
    consoantes = sumConsoantes.toString();
    todasLetras = sum.toString();
    destino = dia + mes + ano;
    personalYear = dia + mes + DateTime.now().year.toString();
    missao = destino + todasLetras;


    numeros = [vogais, consoantes, dia, mes, ano, destino, todasLetras, missao, personalYear];
    for (int i = 0; i < numeros.length; i++) {
      var cadeia = numeros[i];

      while (cadeia.length > 1 && ( cadeia != "11" && cadeia != "22" || i == 1)  ) {
        sumAux = 0;
        for (int a = 0; a < cadeia.length; a++) {
          sumAux += int.parse(cadeia.substring(a, a + 1));
        }
        cadeia = sumAux.toString();
      }
      numeros[i] = cadeia;
    }

    if (dia == "13" || dia == "14" || dia == "16" || dia == "19")
      model.numerologyMap.dividasCarmicas != null ? model.numerologyMap.dividasCarmicas.add(dia) : model
          .numerologyMap.dividasCarmicas = [dia];

    var res = ["4", "5", "7", "1"];
    var carmicas = ["13", "14", "16", "19"];

    for (int a = 0; a < res.length; a++) {
      if (numeros[0] == res[a] || numeros[6] == res[a] || numeros[5] == res[a])
        model.numerologyMap.dividasCarmicas != null ? model.numerologyMap.dividasCarmicas.add(carmicas[a])
            : "";
    }

    //tendencia oculta

    exp = new RegExp(r"(1{3,})|(2{3,})|(3{3,})|(4{3,})|(5{3,})|(6{3,})|(7{3,})|(8{3,})|(9{3,})");
    matches = exp.allMatches(conversao);

    for (Match m in matches) {
      model.numerologyMap.tendenciasOcultas != null ? model.numerologyMap.tendenciasOcultas.add(
          m.group(0).substring(0, 1))
          : "";
    }


    //Lições

    exp = new RegExp(r"[^"+conversao+"]");
    matches = exp.allMatches("123456789");

    for (Match m in matches) {
      model.numerologyMap.lessons != null ? model.numerologyMap.lessons.add(
          m.group(0).substring(0, 1))
          : "";
    }

    model.numerologyMap.motivacao = numeros[0];
    model.numerologyMap.impressao = numeros[1];
    model.numerologyMap.psiquico = numeros[2];
    model.numerologyMap.destino = numeros[5];
    model.numerologyMap.expressao = numeros[6];
    model.numerologyMap.missao = numeros[7];
    model.numerologyMap.personalYear = numeros[8];
    model.numerologyMap.subconscious = (9 - model.numerologyMap.lessons.length).toString();


  }
}

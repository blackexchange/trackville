import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'model/numerology_model.dart';
part 'numerology_controller.g.dart';

class NumerologyController = _NumerologyBase with _$NumerologyController;

abstract class _NumerologyBase with Store {

  //final LocalStorageService service;

 // final LocalStorageService service = Modular.get();

//
//  _NumerologyBase(this.service){
//    _init();
//  }
//
//  _init() async{
//    final allList = await service.getAll();
//    list.addAll(allList);
//  }

//
//  @action
//  add (NumerologyModel model) async {
//
//    await calcularData(model);
//
//    model = await service.add(model);
//
//
//    list.add(model);
//  }
//
//  @observable
//  ObservableList<NumerologyModel> list = ObservableList<NumerologyModel>();
//
//  @action
//  Future <void> calcularData(NumerologyModel model) async{
//
//    model.motivacao = "";
//    model.impressao = "";
//    model.psiquico = "";
//    model.destino = "";
//    model.expressao = "";
//    model.missao = "";
//    model.dividasCarmicas = [];
//
//
//    const Map tabela = {
//      "1": {"aijqy"},
//      "2": {"bkr`'àìäï"},
//      "3": {"cgls~áí"},
//      "4": {"dmtã"},
//      "5": {"ehn"},
//      "6": {"uvxwç"},
//      "7": {"ozé"},
//      "8": {"fpâîúñ"},
//      "9": {"ó"},
//      "10":{"èëõ"},
//      "12":{"êùü"},
//      "13":{"û"},
//      "14":{"öò"},
//      "15":{"ô"},
//      "vogais": {"áàâãäéèêëíïîìóôõöúüùûaeiouy"},
//      "consoantes":{"bcdfghjklmnpqrstvwxzñç"}
//    };
//
//    var data = model.nascimento.split("/");
//
//    RegExp exp = new RegExp(r"[\S]");
//    String str = model.nome.toLowerCase();
//    Iterable<Match> matches = exp.allMatches(str);
//
//    matches = exp.allMatches(str);
//    int sum = 0;
//    int sumVogais = 0;
//    int sumConsoantes = 0;
//
//    var vogais ="";
//    var todasLetras = "";
//    var consoantes = "";
//    var destino = "";
//    var missao = "";
//    var conversao = "";
//
//    var dia = data[0];
//    var mes = data[1];
//    var ano = data[2];
//    int sumAux;
//    var numeros=[];
//
//    for (Match m in matches) {
//      var aux = m.group(0);
//
//      for (int i = 1 ; i <= tabela.length ; i++){
//        if (i<=14) {
//          String tab = tabela["$i"].toString();
//          if (tab.contains(aux)) {
//            conversao += i.toString();
//            sum += i;
//            if (tabela["vogais"].toString().contains(aux)){
//              sumVogais += i;
//            }else if (tabela["consoantes"].toString().contains(aux)){
//              sumConsoantes += i;
//            }
//            break;
//          }
//        }
//      }
//    }
//
//    vogais = sumVogais.toString();
//    consoantes = sumConsoantes.toString();
//    todasLetras = sum.toString();
//    destino = dia+mes+ano;
//    missao = destino + todasLetras;
//
//    numeros = [vogais, consoantes, dia, mes, ano, destino, todasLetras, missao];
//
//    for (int i = 0; i < numeros.length ; i++) {
//      var cadeia = numeros[i];
//      while (cadeia.length > 1 && cadeia !="11" && cadeia !="22") {
//
//        sumAux = 0;
//        for (int a = 0; a < cadeia.length ; a++) {
//          sumAux += int.parse(cadeia.substring(a, a + 1));
//        }
//        cadeia = sumAux.toString();
//      }
//      numeros[i] = cadeia;
//
//    }
//
//    if ( dia == "13" ||  dia == "14" ||  dia == "16" ||  dia == "19")
//      model.dividasCarmicas != null ? model.dividasCarmicas.add(dia) : model.dividasCarmicas = [dia];
//
//    var res = ["4","5","7","1"];
//    var carmicas = ["13","14", "16","19"];
//
//    for (int a = 0; a < res.length ; a++) {
//      if (numeros[0]==res[a] || numeros[6]==res[a] || numeros[5]==res[a])
//        model.dividasCarmicas != null ? model.dividasCarmicas.add(carmicas[a])
//            : model.dividasCarmicas = [carmicas[a]];
//
//      //  model.dividasCarmicas.add(carmicas[a]);
//    }
//
//    //tendencia oculta
//    var tend = [];
//    exp = new RegExp(r"[1|2|3|4|5|6|7|8|8]{3}");
//    matches = exp.allMatches(conversao);
//
//    for (Match m in matches) {
//      model.tendenciasOcultas !=null ? model.tendenciasOcultas.add(m.group(0).substring(0,1))
//          : model.tendenciasOcultas = [m.group(0).substring(0,1)];
//    }
//
//    matches = exp.allMatches(conversao);
//    exp = new RegExp(r"\d{3,}");
//    for (Match m in matches) {
//      var aux = m.group(0);
//
//    }
//
//
//    model.motivacao = numeros[0];
//    model.impressao = numeros[1];
//    model.psiquico = numeros[2];
//    model.destino = numeros[5];
//    model.expressao = numeros[6];
//    model.missao = numeros[7];
//

    @observable
    String idNumber = "";
    @observable
    String contextoNumber ="";
    @observable
    String descricaoNumber ="";

    @action
    setIdNumber (String value) => idNumber = value;
    @action
    setContextoNumber (String value) => contextoNumber = value;
    @action
    setDescricaoNumber (String value) => descricaoNumber = value;


    final databaseReference =  Firestore.instance;

    @action
     Future createRecord() async {
       databaseReference.collection("numbers")
          .document(idNumber)
          .setData({
        contextoNumber: descricaoNumber});
    }
}

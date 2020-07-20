
class NumerologyModel{
  int id;
  String nome = "";
  String nascimento = "";
  String destino = "";
  String missao ="";
  String psiquico = "";
  List <String> dividasCarmicas = [];
  List <String> tendenciasOcultas = [];
  String motivacao = "";
  String expressao= "";
  String impressao= "";

  NumerologyModel({this.id, this.nome,this.nascimento, this.psiquico, this.dividasCarmicas,
    this.tendenciasOcultas,this.motivacao, this.missao, this.destino, this.expressao, this.impressao});

  toJson(){
    return {
      "nome": nome,
      "nascimento": nascimento,
      "psiquico":psiquico,
      "dividasCarmicas":dividasCarmicas,
      "tendenciasOcultas":tendenciasOcultas,
      "motivacao ":motivacao,
      "missao":missao,
      "destino":destino,
      "expressao":expressao,
      "impressao":impressao

    };
  }

  factory NumerologyModel.fromJson(Map json){
    return NumerologyModel(
        id: json["id"],
        nome: json["nome"],
        nascimento: json["nascimento"],
        psiquico: json["psiquico"],
        dividasCarmicas:json["dividasCarmicas"],
        tendenciasOcultas:json["tendenciasOcultas"],
        motivacao :json["motivacao"],
        missao:json["missao"],
        destino:json["destino"],
        expressao:json["expressao"],
        impressao:json["impressao"]

    );
  }
}
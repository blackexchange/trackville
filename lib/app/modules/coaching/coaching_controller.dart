import 'dart:io';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:trackville/app/modules/persons/model/person_model.dart';
import 'package:trackville/app/modules/persons/persons_controller.dart';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:esys_flutter_share/esys_flutter_share.dart';

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
    "Destino", "Expressão","Impressão", "Ano Pessoal", "Lições Cármicas","Respostas Subconsciente",
  "1º Ciclo",
  "2º Ciclo",
  "3º Ciclo", ];

  @observable
  List lectureCodes = ["psychic", "carmic","hidden",
    "motivation", "mission",
    "destiny", "expression","impression", "year", "lessons","subconscious",
  "cicle1","cicle2","cicle3"];

 // psiquico: 8, dividasCarmicas: [14, 19], tendenciasOcultas: [],
  // lessons: [3, 6, 9], motivacao: 1, missao: 4,
  // destino: 8, expressao: 5, impressao: 4,
  // personalYear: 1, subconscious: 6}

  @observable
  Map lectureMap = {
    "psychic":["Psíquico","Atitudes e comportamentos."],
    "carmic":["Dívidas Cármicas","Transgressões passadas."],
    "hidden":["Tendências Ocultas","Desejos das vidas passadas."],
    "lessons":["Lições Cármicas","Lições de vida"],
    "motivation":["Motivação", "Tração."],
    "mission":["Missão","Missão de vida na terra."],
    "destiny":["Destino","Caminho, obstáculos."],
    "expression":["Expressão", "Talentos Internos."],
    "impression": ["Impressão", "COMO o outro te enxerga."],
    "year": ["Ano Pessoal","Ano Pessoal"],
    "subconscious":["Resposta Subconsciente","Respostas automáticas"],
    "cicle1":["1º Ciclo","1º Ciclo"],
    "cicle2":["2º Ciclo","2º Ciclo"],
    "cicle3":["3º Ciclo","3º Ciclo"],

  };

  @observable
  List leitureResume = ["Atitudes",
    "Transgressões passadas.",
    "Desejos das vidas passadas.",
    "Lições de vida",
    "Motivos.",
    "Misão de vida na terra.",
    "Caminho a seguir.",
    "Talentos Internos.",
    "COMO o outro te enxerga.",
    "Ano Pessoal.",
    "Respostas automáticas",
    "1º Ciclo de vida",
    "2º Ciclo de vida",
    "3º Ciclo de vida"];

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

  final firestoreInstance = Firestore.instance;


  @observable
  Future <List <QuerySnapshot>> listData ;

  Future<DocumentSnapshot> getDocument(String doc) async {
    firestoreInstance.collection("numbers").document(doc).get().then((value) => value.data);
  }

  Future<void> generateDocument(PersonModel p) async {
    var myTheme = ThemeData(
     // defaultTextStyle: TextStyle(fontStyle: fon)
      //base: Font.ttf(await rootBundle.load("assets/fonts/Roboto-Regular.ttf")),
      //bold: Font.ttf(await rootBundle.load("assets/OpenSans-Bold.ttf")),
      // italic: Font.ttf(await rootBundle.load("assets/OpenSans-Italic.ttf")),
      // boldItalic: Font.ttf(await rootBundle.load("assets/OpenSans-BoldItalic.ttf")),
    );


    final pw.Document doc = pw.Document(
     // theme: myTheme
    );


    final PdfImage logoImage = PdfImage.file(
      doc.document,

      bytes: (await rootBundle.load('assets/images/logo5.png')).buffer.asUint8List(),
    );

    List<pw.Widget>pLecture=[];
      int i = 0;

    var data = await rootBundle.load("assets/fonts/OpenSans-Regular.ttf");
    var font = Font.ttf(data);
    var style = TextStyle(font: font);

    Future <QuerySnapshot> snapshot = firestoreInstance.collection("numbers").getDocuments();

    List <DocumentSnapshot> docs =[];
    List numbers = [];
    await  snapshot.then((query) => query.documents.forEach((element) {
      docs.add(element);
      numbers.add(element.documentID);
    }));



    for (var i = 0; i < lectureMap.length; i++) {
      var titleTheme = lectureMap.values.elementAt(i)[0];
      var keyTheme = lectureMap.keys.elementAt(i);

      var descTheme = lectureMap.values.elementAt(i)[1];
      var aux = "";

      List lectureVar = leitureValues[i].toString().replaceAll("[", "")
          .replaceAll("]", "").replaceAll(" ", "").replaceAll("*", "")
          .split(",");
      lectureVar.forEach((number) {

        docs.where((element) => element.documentID == number).forEach((e) {
          if (keyTheme != aux) {
            pLecture.add(pw.Header(level: 1, text: titleTheme));
            pLecture.add(pw.Paragraph(text: descTheme, style: style));
            aux = keyTheme;
          }
          pLecture.add(pw.Header(level: 2, text: "Seu Número: $number",textStyle: style));
         // print (e.documentID);
          if (e.data[keyTheme] != null) {
            //print ("Gerando texto $number");
            pLecture.add(pw.Paragraph(text: e.data[keyTheme],
                textAlign: pw.TextAlign.justify,
                style: style));
          }
        });

      });


    }


    doc.addPage(pw.MultiPage(
        pageFormat:
        PdfPageFormat.a4.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        header: (pw.Context context) {
          if (context.pageNumber == 1) {
            return null;
          }
          return pw.Container(
              alignment: pw.Alignment.centerRight,
              margin: const pw.EdgeInsets.only(bottom: 2.0 * PdfPageFormat.mm),
              padding: const pw.EdgeInsets.only(bottom: 2.0 * PdfPageFormat.mm),
              decoration: const pw.BoxDecoration(
                  border: pw.BoxBorder(
                      bottom: true, width: 0.5, color: PdfColors.grey)),
              child: pw.Text('Mapa Numerológico ',
                  style: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(color: PdfColors.grey)));
        },
        footer: (pw.Context context) {
          return pw.Container(
              alignment: pw.Alignment.centerRight,
              margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
              child: pw.Text(
                  'Página ${context.pageNumber} de ${context.pagesCount}',
                  style: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(color: PdfColors.grey)));
        },
        build: (pw.Context context) => <pw.Widget>[
          pw.Header(
              level: 0,
              child: Column(
                children: <pw.Widget>[
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text('Mapa Numerológico', textScaleFactor: 2),
                      pw.SizedBox(
                        height: 40
                      ),
                      pw.Image(logoImage,height: 20)
                    ]),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.Text(p.name.toUpperCase(), textScaleFactor: 1.6),
                        pw.Text(p.bornDate, textScaleFactor: 1.6),
                      ]),

                ]

              )
          ),
          pw.Column(
            //mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: <pw.Widget>[
                pw.Paragraph(text:"O objetivo de trabalhar com números é economizar energia. As pessoas que agem sem uma compreensão adequada do momento certo para começar um trabalho desperdiçam muita energia fazendo os movimentos errados. A numerologia fornece o conhecimento de coisas como selecionar o momento certo, o relacionamento certo, a morada certa - economizando energia."),
                pw.Paragraph(text: "Seguir as prescrições dadas ajudará a criar um ambiente melhor para os microorganismos que vivem em nossos corpos. Como receptores de energia cósmica, eles servem para criar harmonia em sua vida e promover:"),
                pw.Bullet(
                    text:
                    'uma melhor compreensão dos nossos lados bons e ruins' ),
                pw.Bullet(
                    text:    'um método de aceitar nossas fraquezas e as dos outros'),
                pw.Bullet(
                    text:'um veículo para discutir essas fraquezas' ),
                pw.Bullet(
                    text:'uma maneira alegre de passar o tempo' ),
                pw.Bullet(
                    text:'liberdade e fuga de nossas próprias preocupações pessoais' ),
                pw.Bullet(
                    text:'um bom ponto focal ou método de prestar atenção e obter atenção'  ),
                pw.Bullet(
                    text:'popularidade e respeito' ),
                pw.Bullet(
                    text:'uma ferramenta para entrar no desconhecido'),
                pw.Bullet(
                    text:'interações amigáveis.' ),
                pw.Paragraph(text: ""),
                pw.Paragraph(text: "A seguir serão apresentados em tópicos os números calculados com base em seus dados referente a cada aspecto."),

              ]),
          pw.Column(
            children: pLecture
          ),
          pw.Padding(padding: const pw.EdgeInsets.all(10)),
          pw.Paragraph(
              text:
              'Todos os direitos reservados para Trackville Systems.')
        ]));


    //return doc.save();

    final output = await getTemporaryDirectory();
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyyMMddHms');
    var aliasFile = formatter.format(now);

    final fileName  = output.path+"/$aliasFile.pdf";
    final file = File(fileName);

    if (FileSystemEntity.typeSync(fileName) == FileSystemEntityType.notFound)
      try {
       await file.delete();
      }catch(e){

      }

    try{
      var ret = await file.writeAsBytes(doc.save());

      final ByteData bytes = await rootBundle.load(fileName);

      await Share.file('Mapa Numerológico', "Mapa $aliasFile.pdf", bytes.buffer.asUint8List(),
        'application/pdf', text: 'Seu Mapa Numerológico está pronto!!');

      }catch(e){
        print(e.toString());
    }

  }

}

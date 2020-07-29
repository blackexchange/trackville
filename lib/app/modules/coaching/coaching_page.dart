import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trackville/app/modules/persons/model/person_model.dart';
import 'coaching_controller.dart';
import 'package:flutter/cupertino.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:esys_flutter_share/esys_flutter_share.dart';

class CoachingPage extends StatefulWidget {
  final String title;

  const CoachingPage({Key key, this.title = "Coaching"}) : super(key: key);

  @override
  _CoachingPageState createState() => _CoachingPageState();
}

class _CoachingPageState
    extends ModularState<CoachingPage, CoachingController> {
  PersonModel personModel;

  _CoachingPageState() {
    personModel = controller.personModel;

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //print(personModel.toJson());
 //   print(controller.lectureMap.values.elementAt(0)[0]);
  }

  @override
  void initState() {
  //  controller.getData();

  }


  //use 'controller' variable to access controller
  int _selectedIndex = 0;

  //List leituras[];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      elevation: 2,
      margin: EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          backgroundColor: Colors.white,
          title: Text("controller.numbers[index]"),
          trailing: SizedBox(),
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text("ads"),
                    Spacer(),
                    InkWell(
                      child: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Modular.to.pushReplacementNamed("/coaching");

                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Modular.to.pushReplacementNamed("/home");
          },
        ),
        title: Text(personModel.name.toUpperCase()),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert),
            onPressed: () async {
            await controller.generateDocument(personModel);
            },
          )],
      ),

      //drawer: HomeDrawerWidget(),
      body: Container(
        child: ListView.builder(
          itemCount: controller.lectureMap.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  elevation: 2,
                  margin: EdgeInsets.all(12.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      backgroundColor: Colors.white,
                      title:
                      _buildTitle(
                         // controller.lectureMap.keys.elementAt(index),
                          controller.lectureMap.values.elementAt(index)[0],
                          controller.leitureValues[index].toString(),
                          controller.lectureMap.values.elementAt(index)[1]),
                       //   controller.numbers[controller.leitureValues[index]]),
                          //controller.leitureValues[index] !="[]" ? controller.leitureValues[index].toString() :"",

                      trailing: SizedBox(),
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Text(controller.lectureMap.values.elementAt(index)[1]),
                                Spacer(),
                                Observer(
                                  builder: ((_) {
                                    return InkWell(
                                      child: Icon(Icons.keyboard_arrow_right),
                                      onTap: () {
                                        controller.setLectureCode(controller.lectureMap.keys.elementAt(index));
                                        controller.setLectureValue(controller.leitureValues[index].toString());
                                        controller.openDetail();
                                        //var params = [controller.lectureCode[index],controller.leitureValues[index]];
                                        //Modular.to.pushNamed("/detail/$params");
                                      },
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(),
                Container()
                //  _widgetOptions.elementAt(_selectedIndex),
              ],
            );
          },
        ),
      ),
//
//      Center(
//        child: _widgetOptions.elementAt(_selectedIndex),
//      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Numerologia'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.highlight_off),
            title: Text('Astrologia'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pan_tool),
            title: Text('Tarô'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
//  _generatePDF(PersonModel p) async{
//
//    controller.generateDocument(PdfPageFormat.a4);
//
//    final pdf = pw.Document();
//    final Uint8List fontData = File('open-sans.ttf').readAsBytesSync();
//    final ttf = pw.Font.ttf(fontData.buffer.asByteData());
//
//    pdf.addPage(pw.Page(
//        pageFormat: PdfPageFormat.a4,
//        build: (pw.Context context) {
//          return pw.Center(
//            child: pw.Text("Mapa Numerológico",
//                style: pw.TextStyle(font: ttf, fontSize: 40)),
//          ); // Center
//        })
//    );
//    final output = await getTemporaryDirectory();
//    final fileName  = output.path+"/"+p.name+".pdf";
//    final file = File(fileName);
//    await file.writeAsBytes(pdf.save());
//
//    final ByteData bytes = await rootBundle.load(fileName);
//    await Share.file('Mapa Numerológico', "Mapa ${p.name}.pdf", bytes.buffer.asUint8List(),
//        'application/pdf', text: 'Seu Mapa Numerológico está pronto!!');
//
//  }
}

Widget _buildTitle(String title, String value, String description) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          Text(title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold)),
          Spacer(),
          Text(value,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.redAccent,
                  fontStyle: FontStyle.italic)),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        description,
        style: TextStyle(fontStyle: FontStyle.italic, fontFamily: "Roboto"),
      ),
      Row(
        children: <Widget>[
          Text(""),
        ],
      ),
    ],
  );


}

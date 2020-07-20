import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trackville/app/modules/home/widgets/home_drawer/home_drawer_widget.dart';
import 'package:trackville/app/modules/home/widgets/home_drawer/home_drawer_widget.dart';
import 'package:trackville/app/modules/persons/model/person_model.dart';
import 'package:trackville/app/modules/persons/persons_controller.dart';
import '../../app_module.dart';
import 'coaching_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


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
            onPressed: (){
            _generatePDF();
//            const   text ="test0";
//              final RenderBox box = context.findRenderObject();
//
//              Share.share(_generatePDF(),
//                  sharePositionOrigin:
//                  box.localToGlobal(Offset.zero) &
//                  box.size);
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
                          controller.lectureMap.values.elementAt(index),
                          controller.leitureValues[index].toString(),
                          controller.numbers[controller.leitureValues[index]]),
                          //controller.leitureValues[index] !="[]" ? controller.leitureValues[index].toString() :"",

                      trailing: SizedBox(),
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Text(controller.leitureResume[index]),
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
  _generatePDF() async{
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          ); // Center
        }));
    final output = await getTemporaryDirectory();
    print("gerando arquivo...");
    final file = File("${output.path}/example.pdf");
    //final file = File("example.pdf");
    await file.writeAsBytes(pdf.save());
    print("Salvo! ${output.path}/example.pdf");
  }
}

Widget _buildTitle(String title, String value, Map key) {
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
        key != null ? key["keywords"].toString() : "",
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
      Row(
        children: <Widget>[
          Text(""),
        ],
      ),
    ],
  );


}

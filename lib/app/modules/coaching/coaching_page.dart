import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:trackville/app/modules/home/widgets/home_drawer/home_drawer_widget.dart';
import 'coaching_controller.dart';
import 'package:flutter/cupertino.dart';

class CoachingPage extends StatefulWidget {
  final String title;

  const CoachingPage({Key key, this.title = "Coaching"}) : super(key: key);

  @override
  _CoachingPageState createState() => _CoachingPageState();
}

class _CoachingPageState
    extends ModularState<CoachingPage, CoachingController> {
  //use 'controller' variable to access controller
  int _selectedIndex = 0;
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
          title: _buildTitle(),
          trailing: SizedBox(),
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text("Resumo Osíquico"),
                    Spacer(),
                    InkWell(
                      child:Icon(Icons.keyboard_arrow_right),
                      onTap: (){
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
        leading: IconButton(icon: Icon(Icons.arrow_left),
          onPressed: (){
            Modular.to.pushReplacementNamed("/home");
          },
        ),
        title: const Text('Aleksander Marcus'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert))
        ],
      ),

      //drawer: HomeDrawerWidget(),
      body: Container(

        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                _widgetOptions.elementAt(_selectedIndex),

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

}

Widget _buildTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          Text("PSÍQUICO"),
          Spacer(),
          Text("1"),
        ],
      ),
      Text("Liderança"),
      Row(
        children: <Widget>[
          Text("6 Aufgaben"),

        ],
      ),
    ],
  );
}

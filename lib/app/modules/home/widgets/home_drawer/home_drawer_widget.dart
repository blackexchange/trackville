import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:trackville/app/modules/home/home_controller.dart';
import 'package:trackville/app/modules/home/home_page.dart';

class HomeDrawerWidget extends StatefulWidget {

  @override
  _HomeDrawerWidgetState createState() => _HomeDrawerWidgetState();
}

class _HomeDrawerWidgetState extends ModularState<HomeDrawerWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            Column(

              children: <Widget>[

                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Modular.to.pushReplacementNamed("/");
                    //Navigator.pop(context);
                  },
                ),

                ListTile(
                  title: Text('Pessoas'),
                  leading: Icon(Icons.person_outline),
                  onTap: () {
                    Modular.to.pushReplacementNamed("/persons");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lightbulb_outline),
                  title: Text('Idea Maker'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  title: Text('Interpretações'),
                  leading: Icon(Icons.library_books),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 80),
            Divider(),
            ListTile(
              title: Text('Sair'),
              trailing: Icon(Icons.power_settings_new, color: Colors.green,),
              onTap: () {
                controller.logoff();
                Navigator.pop(context);
              },
            ),
          ]
      ),
    );
  }
}

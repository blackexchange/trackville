import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:trackville/app/modules/home/home_controller.dart';
import 'package:trackville/app/modules/home/home_page.dart';

class HomeDrawerWidget extends StatefulWidget {

  @override
  _HomeDrawerWidgetState createState() => _HomeDrawerWidgetState();
}

class _HomeDrawerWidgetState extends ModularState<HomeDrawerWidget, HomeController> {

  FirebaseUser user;

  @override
  void initState() {
    user  = controller.getUser();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
          margin: new EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  //borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: NetworkImage(user.photoUrl),
                    fit: BoxFit.fill,

                  ),
                //  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(2.0, 4.0), blurRadius: 8),

                  ],
                ),
                child: InkWell(
                 // customBorder: CircleBorder(),
                  onTap: (){
                    Modular.to.pushReplacementNamed("/about");
                  },
//                  child: ClipRRect(
//
//                    borderRadius: const BorderRadius.all(Radius.circular(100.0)),
//                    child: Container(
////                      width: 20,
////                        height: 20,
//                        child: Image.network(user.photoUrl,fit: BoxFit.cover,)),
//                  ),
                ),
              ),
//              child: Text(controller.getUser().displayName),
//              decoration: BoxDecoration(
//                color: Colors.blue,
//              ),
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
                ListTile(
                  title: Text('Sobre'),
                  leading: Icon(Icons.help_outline),
                  onTap: () {
                    Modular.to.pushReplacementNamed("/about");
                  },
                ),
                ListTile(
                  title: Text('Mapa dos Números'),
                  leading: Icon(Icons.add),
                  onTap: () {
                    Modular.to.pushReplacementNamed("/numerology");
                  },
                ),
              ],
            ),
            SizedBox(height: 80),
            Divider(),
            ListTile(
              title: Text('Sair'),
              subtitle: Text(user.displayName),
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

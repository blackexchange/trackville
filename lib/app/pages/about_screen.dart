import 'package:flutter/material.dart';
import 'package:trackville/app/modules/home/widgets/home_drawer/home_drawer_widget.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
      ),
      drawer: HomeDrawerWidget(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 70, bottom: 32),
                      child: Image.asset("assets/images/tickicon.png",
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                    RaisedButton( child: Text("asd"),

                    )
                  ],
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}

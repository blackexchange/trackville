import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:trackville/app/modules/home/widgets/home_drawer/home_drawer_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  List items=["a","b","c","r"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: HomeDrawerWidget(),
      body: Container(
        child:ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Dismissible(
                  key: Key(items[index]),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction){
                    //print("a");
                  },
                  background: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    color: Colors.red,
                      child: Icon(CupertinoIcons.delete, color: Colors.white,size: 40.0,),
                  ),
                  child: ListTile(
                    title: Text('Aleksander'),
                    subtitle: Text('Escola'),
                    trailing: Text("01/02/2009"),
                    onTap: (){
                      Modular.to.pushReplacementNamed("/coaching");
                    },
                  ),
                ),
                Divider()
              ],
            );
          },
        ),

        )


    );
  }
}

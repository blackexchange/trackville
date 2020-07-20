import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:trackville/app/modules/home/widgets/home_drawer/home_drawer_widget.dart';
import 'package:trackville/app/modules/persons/model/person_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: HomeDrawerWidget(),
        body: Container(
          child: FutureBuilder<ObservableList<PersonModel>>(
            future: controller.personsController.getPersons(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return const SizedBox();
              return Observer(
                builder: (_) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text("Clientes", style: TextStyle(fontSize: 16),),
                            Dismissible(
                              key: Key(snapshot.data.name),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                controller.removePerson(snapshot.data[index].id);
                              },
                              background: Container(
                                alignment: AlignmentDirectional.centerEnd,
                                color: Colors.red,
                                child: Icon(
                                  CupertinoIcons.delete,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ),
                              child: ListTile(
                                title: Text(snapshot.data[index].name.toUpperCase(),
                                  style: TextStyle(fontSize: 16, color: Colors.blueGrey)),
                                subtitle: Text(snapshot.data[index].bornDate + "\n" + snapshot.data[index].title,
                                  style: TextStyle(fontSize: 14)),
                                  trailing: Text(snapshot.data[index].grupo),
                                onTap: () {
                                  controller.personsController.setActualPerson(snapshot.data[index]);

                                  Modular.to.pushReplacementNamed("/coaching");
                                },
                              ),
                            ),
                            Divider()
                          ],
                        ),
                      );
                    }
                  );
                }
              );
            },
          ),
        ));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:trackville/app/modules/home/widgets/home_drawer/home_drawer_widget.dart';
import 'numerology_controller.dart';

class NumerologyPage extends StatefulWidget {
  final String title;
  const NumerologyPage({Key key, this.title = "Numerology"}) : super(key: key);

  @override
  _NumerologyPageState createState() => _NumerologyPageState();
}

class _NumerologyPageState
    extends ModularState<NumerologyPage, NumerologyController> {
  //use 'controller' variable to access controller


  _NumerologyPageState( ){

   }

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: DefaultTabController(
          length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.group),text: "Lista",),
                Tab(icon: Icon(Icons.group_add), text: "Cadastro",),

              ],
            ),
          ),
          drawer: HomeDrawerWidget(),
          body: TabBarView(
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection("numbers")
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return const Text('Carregando...');
                  final int messageCount = snapshot.data.documents.length;
                  return ListView.builder(
                    itemCount: messageCount,
                    itemBuilder: (_, int index) {
                      final DocumentSnapshot document = snapshot.data.documents[index];
                      final dynamic message = document.documentID;
                      return ListTile(
                        trailing: IconButton(
                          onPressed: () => document.reference.delete(),
                          icon: Icon(Icons.delete),
                        ),
                        title: Text(
                          message != null ? "Número ${message.toString()}" : '<Sem itens>',
                        ),
                        //subtitle: Text('Mensagens ${index + 1} de $messageCount'),
                      );
                    },
                  );
                },

              ),
              Container(
                padding: new EdgeInsets.all(20.0),
                child: new Form(
                    child: ListView (
                    children: <Widget>[
                      Observer(
                          builder: (_) {
                            return new Container(
                              // width: screenSize.width,
                              child: new RaisedButton(

                                child: new Text(
                                  'SALVAR',
                                  style: new TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                onPressed: controller.createRecord,
                                color: Colors.blue,
                              ),
                              margin: new EdgeInsets.only(
                                  top: 20.0
                              ),
                            );
                          }
                      ),
                      Observer(
                          builder:(_) {
                            return TextFormField(
                              onChanged: controller.setIdNumber,
                                decoration: new InputDecoration(
                                    hintText: '1',
                                    labelText: 'Number'

                                )
                            );
                          }
                      ),
                      Observer(
                          builder:(_) {
                            return TextFormField(
                                onChanged: controller.setContextoNumber,
                              // keyboardType: TextInputType.datetime,
                                decoration: new InputDecoration(
                                    hintText: 'vibration',
                                    labelText: 'Contexto'
                                )
                            );
                          }
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                         // controller: ageController,
                          decoration: InputDecoration(
                            labelText: "Enter Pet Age",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Pet Age';
                            }
                            return null;
                          },
                        ),
                      ),

                      new TextFormField(
                          onChanged: controller.setDescricaoNumber,
                          maxLines: 20,
                          decoration: new InputDecoration(
                              hintText: 'Orientado para...',
                              labelText: 'Descrição'


                          )
                      ),

                    ],
                  )

                ),
              )
            ],

          ),
        ),
      )
    );
    }

  }
void createRecord(String id, String contexto, String descricao ) async {

  final databaseReference = Firestore.instance;

  await databaseReference.collection("numbers")
      .document(id)
      .setData({
    contexto: descricao});


}


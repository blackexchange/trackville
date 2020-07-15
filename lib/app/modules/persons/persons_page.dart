import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:trackville/app/modules/home/widgets/home_drawer/home_drawer_widget.dart';
import 'persons_controller.dart';

class PersonsPage extends StatefulWidget {
  final String title;

  const PersonsPage({Key key, this.title = "Persons"}) : super(key: key);

  @override
  _PersonsPageState createState() => _PersonsPageState();
}

class _PersonsPageState extends ModularState<PersonsPage, PersonsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: HomeDrawerWidget(),
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.group),text: "Cadastro de Pessoas",),
                Tab(icon: Icon(Icons.group_add), text: "Cadastro de Grupos",),

              ],
            ),
            title: Text('Pessoas'),
          ),
          body: TabBarView(
            children: [

                Container(
                  padding: new EdgeInsets.all(20.0),
                  child: new Form(
                   // key: this._formKey,
                    child: new ListView(
                      children: <Widget>[
                        new TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            // Use email input type for emails.
                            decoration: new InputDecoration(
                                hintText: 'you@example.com',
                                labelText: 'E-mail Address'
                            )
                        ),
                        new TextFormField(
                            decoration: new InputDecoration(
                                hintText: 'Password',
                                labelText: 'Grupo'
                            )
                        ),
                        new TextFormField(
                            decoration: new InputDecoration(
                                hintText: 'Password',
                                labelText: 'Data de Nascimento'
                            )
                        ),
                        new TextFormField(
                            decoration: new InputDecoration(
                                hintText: 'Password',
                                labelText: 'Hora de Nascimento'
                            )
                        ),
                        new TextFormField(
                            decoration: new InputDecoration(
                                hintText: 'Password',
                                labelText: 'Local de Nascimento'
                            )
                        ),
                        new TextFormField(
                            decoration: new InputDecoration(
                                hintText: 'Password',
                                labelText: 'Enter your password'
                            )
                        ),
                        new Container(
                         // width: screenSize.width,
                          child: new RaisedButton(
                            child: new Text(
                              'SALVAR',
                              style: new TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            onPressed: () => null,
                            color: Colors.blue,
                          ),
                          margin: new EdgeInsets.only(
                              top: 20.0
                          ),
                        )
                      ],
                    ),
                  )
              ),

              Container(
                padding: new EdgeInsets.all(20.0),

                child: Form(
                  // key: this._formKey,
                  child: new ListView(
                    children: <Widget>[
                      new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          // Use email input type for emails.
                          decoration: new InputDecoration(
                              hintText: 'you@example.com',
                              labelText: 'Nome do Grupo'
                          )
                      ),

                      new Container(
                        // width: screenSize.width,
                        child: new RaisedButton(
                          child: new Text(
                            'SALVAR',
                            style: new TextStyle(
                                color: Colors.white
                            ),
                          ),
                          onPressed: () => null,
                          color: Colors.blue,
                        ),
                        margin: new EdgeInsets.only(
                            top: 20.0
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

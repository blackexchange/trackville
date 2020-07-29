import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:trackville/app/modules/home/home_controller.dart';
import 'package:trackville/app/modules/home/widgets/home_drawer/home_drawer_widget.dart';

class TrizScreen extends StatefulWidget {
  final String title;

  const TrizScreen({Key key, this.title = "Idea Maker"}) : super(key: key);

  @override
  _TrizScreenState createState() => _TrizScreenState();
}

class _TrizScreenState extends ModularState<TrizScreen, HomeController>
    with SingleTickerProviderStateMixin {
  //use 'controller' variable to access controller
  int _featureIndex = 0;
  int _undesiredIndex = 0;

  TabController _tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    autorun((_){

//      print (controller.listUndesired);
    });
  }

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
   // featureList = controller.principles;
   // undesiredList = controller.principles;
    controller.listFeature = controller.principles;
    controller.listUndesired = controller.principles;
//    autorun((_){
//      //print (controller.searchFeature);
//     // featureList.
//    //  print("inic");
//    //  print (controller.searchFeature);
//    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: HomeDrawerWidget(),
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  icon: Icon(Icons.report_problem),
                  text: "Feature",
                ),
                Tab(
                  icon: Icon(Icons.sync_problem),
                  text: "Undesired",
                ),
                Tab(
                  icon: Icon(Icons.lightbulb_outline),
                  text: "Principles",
                ),
              ],
            ),
            title: Text('Idea Maker'),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              Column(
                children: <Widget>[
//                  DropdownButton<String>(
//                      items : principleList.map(( dropDownStringItem) {
//                        return DropdownMenuItem<String>(
//                          value: dropDownStringItem,
//                          child: Text(dropDownStringItem),
//                        );
//                      }).toList(),
//                      onChanged: ( String novoItemSelecionado) {
//                        //_dropDownItemSelected(novoItemSelecionado);
//                        setState(() {
//                        //  this._itemSelecionado =  novoItemSelecionado;
//                        });
//                      },
//                      //value: _itemSelecionado
//                  ),
//                  Text("A cidade selecionada foi \n",
//                    style: TextStyle(fontSize: 20.0),
//                  ),
                  Observer(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                      //  initialValue: controller.searchFeature,
                        onChanged: controller.getFeatures,
                        decoration: new InputDecoration(
                            hintText: 'Speed...',
                            labelText: 'Feature To Change',
                            labelStyle: TextStyle(color: Colors.blueGrey),
                            border: OutlineInputBorder()),
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }),
                  Observer(
                    builder:(_){
                    return Expanded(

                      child: ListView.builder(
                          itemCount: controller.listFeature.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(controller.listFeature[index],
                              style: TextStyle(fontFamily: 'Roboto',fontSize: 18.0),),
                              onTap: () {
                                setState(() {
                                  _featureIndex = controller.principles.indexOf(controller.listFeature[index]);

                                  _tabController.index = 1;
                                });
                              },
                            );
                          }),
                    );
                    }
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Observer(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: controller.getUndesired,
                        decoration: new InputDecoration(
                            hintText: 'Undesired Results...',
                            labelText: 'Length of moving object',
                            labelStyle: TextStyle(color: Colors.blueGrey),
                            border: OutlineInputBorder()),
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }),
                  Observer(
                    builder: (_) {
                      return Expanded(
                          child: ListView.builder(
                              itemCount: controller.listUndesired.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(controller.listUndesired[index],
                                  style: TextStyle(fontSize: 18.0, fontFamily:'roboto' ),),
                                  onTap: () {
                                    setState(() {
                                      _undesiredIndex =controller.principles.indexOf(controller.listUndesired[index]);
                                      _tabController.index = 2;

                                    });
                                  },
                                );
                              }
                              )
                      );}
                  )
                ],
              ),
              Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    color: Colors.greenAccent,
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_featureIndex !=null ? controller.principles[_featureIndex] : "Not selected.",
                        style: TextStyle(fontSize: 16.0, color: Colors.indigo),),
                    ),
                  ),
                  Card(
                    color: Colors.yellowAccent,
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_undesiredIndex !=null ? controller.principles[_undesiredIndex] : "Not selected.",
                          style: TextStyle(fontSize: 16.0, color: Colors.indigo)),
                    ),
                  ),
                  Container(
                    child: Text(controller.triz.values
                        .elementAt(_featureIndex)[_undesiredIndex] !=""?
                    "" : "Not Match.",
                        style: TextStyle(fontSize: 20.0, color: Colors.redAccent), textAlign: TextAlign.center,),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount:controller.getListRes(controller.triz.values
                          .elementAt(_featureIndex)[_undesiredIndex]).length,
                      itemBuilder: (context, index){

                      return  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(

                            border: Border.all(
                              color: Colors.blueGrey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(20.0),
                            title: Text(
                              controller.resMatrix.elementAt(index)[0],
                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),),
                            subtitle: Text(controller.resMatrix.elementAt(index)[1],
                                style: TextStyle(fontSize: 16.0, color: Colors.black)),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        ),
                      );
                      }
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

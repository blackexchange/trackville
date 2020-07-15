import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: HomeDrawerWidget(),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}

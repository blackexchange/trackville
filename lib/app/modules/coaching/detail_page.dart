import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:share/share.dart';
import 'package:trackville/app/modules/coaching/coaching_controller.dart';
import 'package:trackville/app/modules/home/widgets/home_drawer/home_drawer_widget.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String lecture;

  const DetailPage({Key key, this.title = "Numerology", this.lecture}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState
    extends ModularState<DetailPage, CoachingController> {
  //use 'controller' variable to access controller

  _DetailPageState( ){


  }

  @override
  void initState() {


  }

  @override
  Widget build(BuildContext context) {
    List lectureVar = widget.lecture.replaceAll("[", "").replaceAll("]", "").replaceAll(" ","").split(",");
    String lectureCode = lectureVar[0];

    return Scaffold(

        body: DefaultTabController(
          length: 1,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () {
                  Modular.to.pop();
                },
              ),
              title: Text(controller.lectureMap[lectureCode]),

            ),
            drawer: HomeDrawerWidget(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<QuerySnapshot>(
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
                      final dynamic id = document.documentID;
                      final dynamic lecture = document[lectureCode];

                      if (!lectureVar.contains(id))
                        return Container();
                      return ListTile(
                        onLongPress: (){
                          final RenderBox box = context.findRenderObject();
                          final doc = lecture ?? lecture.toString();
                          Share.share(doc,
                              sharePositionOrigin:
                              box.localToGlobal(Offset.zero) &
                              box.size);
                      },
                        title: Text(
                          lecture != null ? "${lecture.toString()}" : '<Sem interpretação>',
                          style: TextStyle(fontSize: 20,),
                        ),
                        subtitle: Text("--------------------"),
                      );

                    },
                  );
                },

              ),
            ),
          ),
        )
    );
  }

}


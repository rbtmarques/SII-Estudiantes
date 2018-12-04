import 'package:flutter/material.dart';
import 'package:sii_patm/connection/HttpHandler.dart';
import 'package:sii_patm/models/teacherGroup.dart';
import 'package:sii_patm/utils/settings.dart';
import 'package:sii_patm/utils/my_navigator.dart';

class DashBoardTeach extends StatefulWidget {
  @override
  _DashBoardTeachState createState() => new _DashBoardTeachState();
 }

class _DashBoardTeachState extends State<DashBoardTeach> {

  //List<TeacherGroup> _lista = new List();
  List<TeacherGroup> _lista = new List();
  void initState(){
    super.initState();
    loadCursos();
  }

  void loadCursos() async{
    var  data = await HttpHandler().fetchTeacherGroup(Settings.cadenaCon+"wsteachergroup/getTeacherGroup/"+Settings.iduser+"/"+Settings.token);
    setState(() {
          _lista.addAll(data);
        });
  }

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(
       title: Text("SII-Profesores"),
     ),
     body: ListView.builder(
       itemCount: _lista.length,
       itemBuilder: (BuildContext context, int index){
         return ListTile(
           title: Text(
             _lista[index].name,
             style: //Theme.of(context).textTheme.headline,
                TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                  fontFamily: 'Nunito'
                  )
           ),
           subtitle: Text(_lista[index].name),
           leading: Column(
             children: <Widget>[
               CircleAvatar(
                 backgroundColor: Colors.blueAccent,
                 radius: 18,
                 child: Text(
                   _lista[index].name[0],
                   style: TextStyle(
                     fontSize: 13.0,
                     color: Colors.white
                   ),
                 ),
               ),
             ],
           ),
           onTap: (){
             setState(() {
                Settings.keymatter = _lista[index].keymatter;
                MyNavigator.goToAlumnos(context);
                //Settings.teacherMail = _lista[index].grupo.teacher.email;
                //print(Settings.teacherMail);
                //MyNavigator.goToSendMail(context, "/sendMail");
                //SendMail().main(); 
              });
           },
         );
       },
     ),
   );
  }
}
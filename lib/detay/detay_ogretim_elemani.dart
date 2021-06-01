import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:hizli_randevu_sistemi/api_services.dart';
import 'package:hizli_randevu_sistemi/model/Akadamisyenler.dart';
import 'package:hizli_randevu_sistemi/model/util.dart';
import 'package:hizli_randevu_sistemi/pages/randevu_detay.dart';
import 'package:http/http.dart' as http;
class Akademisyen extends StatefulWidget {
  @override
  _AkademisyenState createState() => _AkademisyenState();

  getProcedureSelectedandList(String string) {}
}

class _AkademisyenState extends State<Akademisyen> {
  String a = "";
  String b = "";
  int _selectedIndex = -1;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  List<bool> inputs = new List<bool>();
  ApiServices api = ApiServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğretim Elemanları"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
       /* appBar: AppBar(
          title: Text("Öğretim Elemanları"),
        ),*/
        child: FutureBuilder(future:api.listele(),builder: (BuildContext context, AsyncSnapshot<List<OgretimElemani>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context, index){

                 //onTap: () => snapshot.data[index].toString() & _isSelected(),
                 //
                   //  Navigator.pushNamed(context, "/detaySayfa");
              return GestureDetector(
                onTap: () {
                  _onSelected(index);
                  Util.ogrMail = snapshot.data[index].email;
                  Util.ogru = snapshot.data[index].unvan + " "+ snapshot.data[index].adSoyad;
                  Navigator.pushNamed(context, "/detaySayfa");
                  //snapshot.data[index].unvan +" "+ snapshot.data[index].adSoyad;
               },
                child: Card(
                     elevation: 2,
                     child: Container(
                       color: _selectedIndex != null && _selectedIndex == index ? Colors.blue : Colors.white,
                       padding: EdgeInsets.all(25.0),
                       child:Column(
                         children: <Widget>[
                           Column(
                             children: [Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                  Text(snapshot.data[index].unvan),
                                 SizedBox(
                                   width: 3,
                                 ),
                                 Text(snapshot.data[index].adSoyad),
                                 SizedBox(
                                   height: 5,
                                 ),
                               ],
                             ),
                             Text(snapshot.data[index].email),
                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
              );
            });
          }else
            return Center(child: SingleChildScrollView(),);
        }),
        color:  Colors.grey.shade100,

      ),
    );

  }
  
}


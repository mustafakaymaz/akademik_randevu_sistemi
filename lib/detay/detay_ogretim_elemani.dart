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
}

class _AkademisyenState extends State<Akademisyen> {
  List<bool> inputs = new List<bool>();
  ApiServices api = ApiServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
     /* appBar: AppBar(
        title: Text("Öğretim Elemanları"),
      ),*/
      child: FutureBuilder(future:api.listele(),builder: (BuildContext context, AsyncSnapshot<List<OgretimElemani>> snapshot){
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context, index){

           return GestureDetector(
               onTap: (){
                 //for(int i=0 ; i<=snapshot.data.length; i++){
                  // if(snapshot.data[i] == snapshot.data[index]){
                     Util.ogru = snapshot.data[index].unvan + " " + snapshot.data[index].adSoyad ;
                  // Navigator.pop(context);
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RandevuDetay()));
                 //  }
                // }
               },
               child :Card(
                 elevation: 2,
                 child: Container(
                   padding: EdgeInsets.all(25.0),
                   child:Column(
                     children: <Widget>[
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(snapshot.data[index].unvan),
                           SizedBox(
                             width: 3,
                           ),
                           Text(snapshot.data[index].adSoyad),
                         ],

                       ),

                     ],
                   ),
                 ),
               ));
          });
        }else
          return Center(child: SingleChildScrollView(),);
      }),
      color:  Colors.grey.shade100,

    );

  }
  
}


import 'package:flutter/material.dart';
import 'package:hizli_randevu_sistemi/model/Randevularim.dart';
import 'package:hizli_randevu_sistemi/model/util.dart';
import 'dart:convert';
import '../api_services.dart';

class RandevularimDetay extends StatefulWidget {
  @override
  _RandevularimDetayState createState() => _RandevularimDetayState();
}

class _RandevularimDetayState extends State<RandevularimDetay> {
  ApiServices api = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      /* appBar: AppBar(
        title: Text("Öğretim Elemanları"),
      ),*/
      child: FutureBuilder(future:api.Randevulistele(),builder: (BuildContext context, AsyncSnapshot<List<Randevular>> snapshot){
        if(snapshot.hasData ){
          return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context, index){
                  return Card(
                    elevation: 2,
                    child:snapshot.data[index].email == Util.mail ? Container(
                      padding: EdgeInsets.all(25.0),
                      child: Column(
                        children: <Widget>[

                           Text(snapshot.data[index].tarih),
                            SizedBox(
                              height: 7,
                            ),
                            Text(snapshot.data[index].saat),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text(snapshot.data[index].adSoyad),
                              ],

                            ),
                        ],
                      ),
                    ): null,
                  );

          });
        }else
          return Center(child: SingleChildScrollView(),);
      }),
      color:  Colors.grey.shade100,

    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hizli_randevu_sistemi/model/util.dart';
import 'package:hizli_randevu_sistemi/pages/randevu_detay.dart';
import 'package:hizli_randevu_sistemi/pages/randevu_olustur.dart';
class AciklamaDetay extends StatefulWidget {
  @override
  _AciklamaDetayState createState() => _AciklamaDetayState();
}

class _AciklamaDetayState extends State<AciklamaDetay> {
  final FocusNode metin = FocusNode();
  var metinKontrolu = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        titleSpacing: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.clear),
                  color: Colors.black,
                  onPressed: (){
                    Navigator.pop(context);
                  }
                ),
              ],
            ),
            Expanded(
              child: Center(child: Text('Açıklama')),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        //centerTitle: true,
        actions: <Widget>[
          IconButton(
           icon: Icon(Icons.done, color: Colors.blue,),
            onPressed: (){
             var metin = metinKontrolu.text;
               Util.aciklama = metin;
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RandevuDetay()));
              },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            padding: EdgeInsets.fromLTRB(0,0,0,0),
             height: 100,
            width: double.maxFinite,
            child: Column(
                    children: [ 
                      Expanded(
                        child: Center(
                            child: Text("Açıklamalarınızı aşağıdaki alana ekleyebilirsiniz.",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)),
                      ),
                      Expanded(
                        child: Center(
                            child: Text("Açıklama Alanı",style: TextStyle(fontSize: 14, color: Colors.grey),),),
                      ),
                      
                    ]),

            color: Colors.white,
          ),
            Container(
              padding: EdgeInsets.fromLTRB(0,0,0,0),
              height: 600,
              width: double.maxFinite,
              child:TextField(
                style: TextStyle(
                  //height: 10,
                  //backgroundColor: Colors.grey,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                ),
                focusNode: metin,
                controller: metinKontrolu,
                maxLines: 150,
              ),
              color: Colors.grey.shade100,

            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );

  }
}
/* Card(
                elevation: 3.0,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Container(
                  height:100,
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0, top:0,right:180,bottom: 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("ffvfvfvf"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
              ),*/
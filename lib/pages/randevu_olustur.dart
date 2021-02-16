import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hizli_randevu_sistemi/model/Randevularim.dart';
import 'package:hizli_randevu_sistemi/model/User.dart';
import 'package:hizli_randevu_sistemi/model/util.dart';
import 'package:hizli_randevu_sistemi/pages/randevu_detay.dart';

import '../api_services.dart';
class RandevuOlustur extends StatefulWidget {
  @override
  _RandevuOlusturState createState() => _RandevuOlusturState();
}

class _RandevuOlusturState extends State<RandevuOlustur> {
  ApiServices nsn = new ApiServices();
  RandevuDetay rnd= RandevuDetay();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //color: Colors.pink,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           Container(
              height: 65.0,
              //color: Colors.blue.shade50,
              padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Text("M",style: TextStyle(color: Colors.black),),
                    backgroundColor: Colors.grey,
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Util.adsoyad),
                          Text(Util.mail,style:TextStyle(color: Colors.blue,),),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              //height: 160,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: ClipPath(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RandevuDetay()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 8.0,
                            color: Colors.yellow,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: Stack(children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(left: 10, top: 5,right: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 35,
                                                ),
                                                Text("BİRE-BİR TOPLANTI"),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    Icon(Icons.calendar_today,color: Colors.black),
                                                  SizedBox(width: 5,),
                                                    Util.tarih != null ? Text("Randevu Tarihi:" + " " +Util.tarih,style: TextStyle(fontWeight: FontWeight.bold), ) : null,
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: 10,
                                                ),
                                               Util.saat != null ?  Row(
                                                  children: [
                                                    Icon(Icons.access_time,color: Colors.black),
                                                    SizedBox(width: 5,),
                                                    Text("Randevu Saati:" + " " +Util.saat,style: TextStyle(fontWeight: FontWeight.bold), ),
                                                  ],
                                                ) : null,
                                                SizedBox(
                                                  height: 10,
                                                ),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                   Icon(Icons.person),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("Danışman:"+" "+Util.ogru,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                  ],
                                                ) ,
                                              ],
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Container(
                                            width: 350,
                                            padding:  EdgeInsets.fromLTRB(10, 5, 10,10),
                                            color: Util.aciklama == null ? Colors.white  : Colors.grey.shade100,
                                            child: Text("${Util.aciklama}" ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                            Divider(
                                            height: 8.0,
                                            color: Colors.black,
                                          ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        IntrinsicHeight(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              RaisedButton(
                                                child: Text("Göder",style: TextStyle(color: Colors.blue),),
                                                onPressed: () async{
                                                  Randevular u =  Randevular();
                                                  Randevular object = Randevular(
                                                      id: null,
                                                      adSoyad: Util.ogru,
                                                      email: Util.mail,
                                                      tarih: Util.tarih,
                                                      saat: Util.saat,);
                                                  var body = json.encode(object.toJson());
                                                    object = await nsn.addRandevu(body);
                                                  //print(Util.mail);
                                                },
                                                color: Colors.white,
                                                elevation: 0,
                                              ),
                                              VerticalDivider(
                                                width: 5.0,
                                                color: Colors.black,
                                              ),
                                              RaisedButton(
                                                child: Text("Düzenle/Oluştur",style: TextStyle(color: Colors.blue),),
                                                onPressed: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RandevuDetay()));
                                                },
                                                color: Colors.white,
                                                elevation: 0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              //height: 160,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: ClipPath(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (contex)=>RandevuDetay()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 8.0,
                            color: Colors.red,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: Stack(children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(left: 10, top: 5,right: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                              children: [
                                                Text("BİRE-BİR TOPLANTI"),
                                                Text("Randevu Saati. 09.00 - 17.00"),
                                              ],
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Card(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(10, 5, 10,10),
                                            color: Colors.grey,
                                            child: Text("scsdjdshcdscssdcjsvhsdbvjdsvcsdcvdscshcvcvdschdsvcvchcdscdshcgccghsvcdashbjshcvshcvvcfyuwefefewfbubshbcscdscshbcjcuydvsvsvctwyvewtvewfwebwucdshasdhashdasjdsajbssfsgsdcudsbcysbdcysyucy"),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Divider(
                                          height: 2.0,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        IntrinsicHeight(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text('abc'),
                                              VerticalDivider(
                                                width: 5.0,
                                                color: Colors.black,
                                              ),
                                              Text('abc'),
                                              VerticalDivider(
                                                width: 5.0,
                                                color: Colors.black,
                                              ),
                                              Text('abc'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10 , 10, 0),
             // height: 160,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: ClipPath(
                  child: InkWell(
                    onTap: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RandevuDetay()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 8.0,
                            color: Colors.blueAccent,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: Stack(children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(left: 10, top: 5,right: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                              children: [
                                                Text("BİRE-BİR TOPLANTI"),
                                                Text("Randevu Saati. 09.00 - 17.00"),
                                              ],
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Card(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(10, 5, 10,10),
                                            color: Colors.grey,
                                            child: Text("scsdjdshcdscssdcjsvhsdbvjdsvcsdcvdscshcvcvdschdsvcvchcdscdshcgccghsvcdashbjshcvshcvvcfyuwefefewfbubshbcscdscshbcjcuydvsvsvctwyvewtvewfwebwucds"),
                                          ),

                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Divider(
                                          height: 8.0,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        IntrinsicHeight(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text('abc'),
                                              VerticalDivider(
                                                width: 5.0,
                                                color: Colors.black,
                                              ),
                                              Text('abc'),
                                              VerticalDivider(
                                                width: 5.0,
                                                color: Colors.black,
                                              ),
                                              Text('abc'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}

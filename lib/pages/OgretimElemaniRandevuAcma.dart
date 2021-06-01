import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hizli_randevu_sistemi/model/Randevularim.dart';
import 'package:hizli_randevu_sistemi/model/User.dart';
import 'package:hizli_randevu_sistemi/model/util.dart';
import 'package:hizli_randevu_sistemi/pages/randevu_detay.dart';

import '../api_services.dart';
class OgrRandevuAcma extends StatefulWidget {
  @override
  _OgrRandevuAcmaState createState() => _OgrRandevuAcmaState();
}

class _OgrRandevuAcmaState extends State<OgrRandevuAcma> {
  DateTime pickedDate;
  ApiServices nsn = new ApiServices();
  RandevuDetay rnd= RandevuDetay();
  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      /*Container(
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
                          Text(Util.mail,style:TextStyle(color: Colors.blue,fontSize: 16),),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      )*/
    );

  }
}

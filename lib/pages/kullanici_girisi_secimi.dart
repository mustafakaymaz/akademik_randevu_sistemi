import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class KullaniciGirisSecimi extends StatefulWidget {
  @override
  _KullaniciGirisSecimiState createState() => _KullaniciGirisSecimiState();
}

class _KullaniciGirisSecimiState extends State<KullaniciGirisSecimi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children:[
          Container(
            padding: EdgeInsets.only(top: 40),
          child : Image.asset('assets/img/sdu_logo.jpg',
              fit: BoxFit.cover),
        ),
         Container(
           decoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [
                 Colors.red.withOpacity(0.2),
                 Colors.grey.withOpacity(0.6),
               ],
               stops: [1.1, 0.0],
               begin: Alignment.topCenter,
             )
           ),

           ),

          Container(
            padding: EdgeInsets.only(top: 500, left: 10, bottom: 10),
            child: Column(
              children:[
               Container(
                 height: 40,
                  width: 390,
                child: RaisedButton(
                   child: Text('Öğrenci Girişi',style: TextStyle(fontSize: 20,color: Colors.white),),
                   color: Colors.blue.shade500,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(16.0))),
                   onPressed: () {
                     Navigator.pushNamed(context, "/girisSayfasi");
                   },
                 ),
               ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: 390,
                child:   RaisedButton(
                  child: Text('Öğretim Üyesi Girişi',style: TextStyle(fontSize: 20,color: Colors.white)),
                  color: Colors.blue.shade500,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  onPressed: () {
                    Navigator.pushNamed(context, "/girisSayfasiOgretimUyesi");
                  },
                ),
              ),
              ],
            ),
          ),]
      ),
      color: Colors.white,
    );
  }
}

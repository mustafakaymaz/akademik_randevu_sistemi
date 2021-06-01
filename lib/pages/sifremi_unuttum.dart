import 'dart:convert';
import 'dart:math';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hizli_randevu_sistemi/api_services.dart';
import 'package:flutter/services.dart';
import 'package:hizli_randevu_sistemi/pages/mail_sifre_dogrulama.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class SifremiUnuttumSayfasi extends StatefulWidget {

  @override
  _SifremiUnuttumSayfasiState createState() => _SifremiUnuttumSayfasiState();
}

class _SifremiUnuttumSayfasiState extends State<SifremiUnuttumSayfasi> {
  final FocusNode EmailGirisFocusNode= FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController resetEmailKontrolu = TextEditingController();
  ApiServices aps = new ApiServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    resetEmailKontrolu.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,),
      key:  scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height
                : 755.0,
             child: Column(
               mainAxisSize: MainAxisSize.max,
               children: [
                 Padding(
                   padding: EdgeInsets.only(top: 15.0),
                   child: Image(
                     width: 250.0,
                     height: 191.0,
                     fit: BoxFit.fill,
                     image: AssetImage('assets/img/sdu_logo.jpg'),
                   ),

                 ),
                 SizedBox (height: 20,),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text("Parola Yenileme Sayfası",style: TextStyle(fontSize: 20),),
                 ),
                 Container(
                   padding: EdgeInsets.only(top: 23.0),
                   child: Column(
                     children: [
                       Stack(
                         alignment: Alignment.topCenter,
                         overflow: Overflow.visible,
                         children: [
                           Card(
                             elevation: 2.0,
                             color: Colors.white,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(8.0),
                             ),
                             child: Container(
                               width: 300.0,
                               height: 150.0,
                               child: Column(
                                 children: [
                                   Padding(
                                     padding: EdgeInsets.only(
                                         top: 20,bottom: 20, left: 25, right: 25
                                     ),
                                     child: TextField(
                                       focusNode: EmailGirisFocusNode,
                                       controller: resetEmailKontrolu,
                                       keyboardType: TextInputType.emailAddress,
                                       style: TextStyle(
                                           fontSize: 16.0,
                                           color:  Colors.black),
                                       decoration: InputDecoration(
                                         border: InputBorder.none,
                                         icon: Icon(FontAwesomeIcons.envelope,
                                           color: Colors.black,size: 22.0,
                                         ),
                                         hintText: "Email Adresi",
                                         hintStyle: TextStyle(fontSize: 17.0),
                                       ),
                                     ),
                                   ),
                                   Container(
                                     width: 250.0,
                                     height: 1.0,
                                     color: Colors.grey[400],
                                   ),
                                 ],
                               ),
                             ),
                           ),
                           Container(
                             margin: EdgeInsets.only(top: 130.0),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.all(Radius.circular(5.0)),
                               boxShadow: <BoxShadow>[
                                 BoxShadow(
                                   color: Theme.of(context).accentColor.withOpacity(0.2),
                                   offset: Offset(1.0, 6.0),
                                   blurRadius: 20.0,
                                 ),
                                 BoxShadow(
                                   color: Theme.of(context).accentColor.withOpacity(0.2),
                                   offset: Offset(1.0, 6.0),
                                   blurRadius: 20.0,
                                 ),
                               ],
                               color:  Colors.grey,
                             ),
                             child: MaterialButton(
                               highlightColor: Colors.transparent,
                               splashColor: Colors.redAccent,
                               child: Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                                 child: Text("Mail Gönder",style: TextStyle(color: Colors.white,
                                     fontSize: 25.0),
                                 ),
                               ),
                               onPressed: () async{
                                var email = resetEmailKontrolu.text;
                                var rsp = await aps.resetPasword(email);
                                if(rsp['email'] == email){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DogrulamaSayfasi()));
                                     Alert(
                                       context: context,
                                       type: AlertType.success,
                                       title: "SİSTEM MESAJI",
                                       desc: "Mailiniz Başarı ile Gönderilmiştir",
                                       buttons: [
                                         DialogButton(
                                           child: Text(
                                             "TAMAM",
                                             style: TextStyle(color: Colors.white, fontSize: 20),
                                           ),
                                           onPressed: () =>  Navigator.pop(context),
                                           width: 120,
                                         ),
                                       ],
                                     ).show();
                                }else{

                                   }

                               },
                           ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               ],
             ),
            color: Colors.white,
          ),
      ),
      backgroundColor:Colors.white ,
    );
  }



}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hizli_randevu_sistemi/api_services.dart';
import 'package:hizli_randevu_sistemi/model/util.dart';
import 'package:hizli_randevu_sistemi/pages/login_page.dart';
import 'package:hizli_randevu_sistemi/pages/login_page_ogretim_uyesi.dart';
import 'package:hizli_randevu_sistemi/pages/sifre_yenileme_sayfasi.dart';

class OgrDogrulamaSayfasi extends StatefulWidget {
  @override
  _OgrDogrulamaSayfasiState createState() => _OgrDogrulamaSayfasiState();
}

class _OgrDogrulamaSayfasiState extends State<OgrDogrulamaSayfasi> {

  final FocusNode EmailGelenSifreFocusNode= FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController sifreDogrulamaKontrolu = TextEditingController();
  ApiServices aps = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                child: Text("Onay Kodu Sayfasi",style: TextStyle(fontSize: 20),),
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
                                    focusNode: EmailGelenSifreFocusNode,
                                    controller: sifreDogrulamaKontrolu,
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color:  Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(FontAwesomeIcons.lock,
                                        color: Colors.black,size: 22.0,
                                      ),
                                      hintText: "Doğrulama Şifresi",
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
                              child: Text("Doğrula",style: TextStyle(color: Colors.white,
                                  fontSize: 25.0),
                              ),
                            ),
                            onPressed: ()async {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>GirisSayfasiOgretimUyesi()));
                              var confirmationToken = sifreDogrulamaKontrolu.text;
                              var rsp = await aps.OgrDogrulama(confirmationToken);
                              print(rsp);

                             /* if(rsp['confirmationToken'] == confirmationToken){
                                Util.ConfirmationToken = confirmationToken;
                                showDialog(
                                    context: context,
                                    barrierDismissible: false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return new AlertDialog(
                                        title: Text("Kaydınız başarı ile oluşturulmuştur"),
                                        actions: [
                                          FlatButton(
                                            child: const Text('TAMAM'),
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>GirisSayfasiOgretimUyesi()));
                                            },
                                          ),

                                        ],
                                      );

                                    });
                              }else if(rsp['confirmationToken'] != confirmationToken){
                                showDialog(
                                    context: context,
                                    barrierDismissible: false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return new AlertDialog(
                                        title: Text("Şifre Yanlış Mailinizi Kontrol Ediniz"),
                                        actions: [
                                          FlatButton(
                                            child: const Text('TAMAM'),
                                            onPressed: () {
                                              Navigator.of(context).pop(true);
                                            },
                                          ),

                                        ],
                                      );

    });
                              }*/
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
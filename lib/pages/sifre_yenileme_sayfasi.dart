import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hizli_randevu_sistemi/api_services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'login_page.dart';

class SifreYenilemeFormu extends StatefulWidget {
  @override
  _SifreYenilemeFormuState createState() => _SifreYenilemeFormuState();
}

class _SifreYenilemeFormuState extends State<SifreYenilemeFormu> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode yeniSifreFocusNode= FocusNode();
  final FocusNode yeniSifreTekrarFocusNode= FocusNode();
  TextEditingController yeniSifre = TextEditingController();
  TextEditingController yeniSifreTekrar = TextEditingController();
  ApiServices aps = new ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,),
      key:  scaffoldKey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height >= 775.0
            ? MediaQuery.of(context).size.height
            : 755.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
                Text("Şifre Yenileme Sayfası",style: TextStyle(fontSize: 27),),
            Container(
              padding: EdgeInsets.only(top: 120.0),
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
                          height: 190.0,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 20,bottom: 20, left: 25, right: 25
                                ),
                                child: TextField(
                                  focusNode: yeniSifreFocusNode,
                                  controller: yeniSifre,
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
                                    hintText: "Yeni Şifre",
                                    hintStyle: TextStyle(fontSize: 17.0),

                                  ),
                                ),
                              ),
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 20, left: 25, right: 25
                                ),
                                child: TextField(
                                  focusNode: yeniSifreTekrarFocusNode,
                                  controller: yeniSifreTekrar,
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(FontAwesomeIcons.lock,
                                      color: Colors.black, size: 22.0,
                                    ),
                                    hintText: "Yeni Şifre Tekrar",
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
                        margin: EdgeInsets.only(top: 190.0),
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
                            child: Text("GÖNDER",style: TextStyle(color: Colors.white,
                                fontSize: 25.0),
                            ),
                          ),
                          onPressed: () async {
                            var newPass = yeniSifre.text;
                            var newPassCon= yeniSifreTekrar.text;
                            if(newPass == newPassCon){
                              var sifre = newPass;
                              await aps.newPassword(sifre);
                              Alert(
                                context: context,
                                type: AlertType.success,
                                title: "SİSTEM MESAJI",
                                desc: "Şifreniz Başarı ile Değiştirildi",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "TAMAM",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () =>  Navigator.push(context, MaterialPageRoute(builder: (contex)=>GirisSayfasi())),
                                    width: 120,
                                  ),
                                ],
                              ).show();
                            }else if (newPass != newPassCon){
                              
                            }

                          }
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
      backgroundColor:Colors.white ,
    );
  }
}


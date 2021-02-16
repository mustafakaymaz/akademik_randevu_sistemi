import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hizli_randevu_sistemi/api_services.dart';
import 'package:hizli_randevu_sistemi/model/User.dart';
import 'package:hizli_randevu_sistemi/model/util.dart';
import 'package:hizli_randevu_sistemi/pages/home_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:math';
import 'package:hizli_randevu_sistemi/pages/sifremi_unuttum.dart';

class GirisSayfasi extends StatefulWidget {
  GirisSayfasi({Key key}) : super(key: key);

  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNodeEmailGiris = FocusNode();
  final FocusNode myFocusNodeSifreGiris = FocusNode();
  final FocusNode myFocusNodeSifre = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeIsim = FocusNode();
  final FocusNode myFocusNodeFkulte = FocusNode();
  final FocusNode myfocusNodeBolum = FocusNode();

  TextEditingController girisEmailKontrolu = TextEditingController();
  TextEditingController girisSifreKontrolu = TextEditingController();

  bool _obscureTextLogin = false;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  var kaydolEmailKontrolu = TextEditingController();
  var kaydolIsimKontrolu = TextEditingController();
  var kaydolSifreKontrolu = TextEditingController();
  var kaydolFakulteKontrolu = TextEditingController();
  var kaydolBolumKontrolu = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _pageController;
  Color left = Colors.black;
  Color right = Colors.white;
  ApiServices nsn = new ApiServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body:SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height
                : 755.0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 75.0),
                  child: Image(
                      width: 250.0,
                      height: 191.0,
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/img/sdu_logo.jpg')),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _buildMenuBar(context),
                ),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (i) {
                      if (i == 0) {
                        setState(() {
                          right = Colors.white;
                          left = Colors.black;
                        });
                      } else if (i == 1) {
                        setState(() {
                          right = Colors.black;
                          left = Colors.white;
                        });
                      }
                    },
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _buildSingIn(context),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _buildSingUp(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
            color: Colors.white,
          ),
        ),

    );
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    scaffoldKey.currentState?.removeCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }

  _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: MyTabIndicatorPainter(safyaKontrolu: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSingInButtonPress,
                child: Text(
                  "Giriş Ekranı",
                  style: TextStyle(
                    color: left,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "Yeni Kullanıcı",
                  style: TextStyle(
                    color: right,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingIn(BuildContext context) {
    return Container(
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
                    height: 190.0,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20, bottom: 20, left: 25, right: 25),
                            child: TextFormField(
                              focusNode: myFocusNodeEmailGiris,
                              controller: girisEmailKontrolu,
                              keyboardType: TextInputType.emailAddress,
                              style:
                                  TextStyle(fontSize: 16.0, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.envelope,
                                  color: Colors.black,
                                  size: 22.0,
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
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                            child: TextFormField(
                              focusNode: myFocusNodeSifreGiris,
                              controller: girisSifreKontrolu,
                              obscureText: _obscureTextLogin,
                              style:
                                  TextStyle(fontSize: 16.0, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.lock,
                                  size: 22.0,
                                  color: Colors.black,
                                ),
                                hintText: "Şifre",
                                hintStyle: TextStyle(fontSize: 17.0),
                                suffixIcon: GestureDetector(
                                  onTap: _toggleLogin,
                                  child: Icon(
                                    _obscureTextLogin
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    size: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

              ),
              Container(
                margin: EdgeInsets.only(top: 170.0),
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
                  color: Colors.grey,
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "Giriş",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                    onPressed: () async {
                      User u = User();
                      var email = girisEmailKontrolu.text;
                      var sifre = girisSifreKontrolu.text;
                      var rsp = await nsn.loginUser(email, sifre);
                      print(rsp);
                      if (rsp['email'] == email && rsp['sifre'] == sifre) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        Util.mail= email;
                      } else {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "SİSTEM MESAJI",
                          desc: "Email veya şifre yanlış",
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
                      }
                    }),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SifremiUnuttumSayfasi()));
                },
                child: Text(
                  "Şifremi Unuttum",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.red,
                    fontSize: 16.0,
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white10,
                        Colors.white,
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white10,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildSingUp(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                    height: 460.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            focusNode: myFocusNodeIsim,
                            controller: kaydolIsimKontrolu,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.user,
                                color: Colors.black,
                              ),
                              hintText: "AdSoyad",
                              hintStyle: TextStyle(fontSize: 16.0),
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
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            focusNode: myFocusNodeEmail,
                            controller: kaydolEmailKontrolu,
                            keyboardType: TextInputType.text,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.envelope,
                                color: Colors.black,
                              ),
                              hintText: "E-posta Adresi",
                              hintStyle:TextStyle(fontSize: 16.0),


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
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            focusNode: myFocusNodeSifre,
                            controller: kaydolSifreKontrolu,
                            obscureText: _obscureTextSignup,
                            keyboardType: TextInputType.text,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.lock,
                                color: Colors.black,
                              ),
                              hintText: "şifre",
                              hintStyle: TextStyle(fontSize: 16.0),
                              suffixIcon: GestureDetector(
                                onTap: _toggleSignup,
                                child: Icon(
                                  _obscureTextSignup
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  size: 15.0,
                                  color: Colors.black,
                                ),
                              ),
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
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            controller: kaydolFakulteKontrolu,
                            keyboardType: TextInputType.text,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.home,
                              ),
                              hintText: "Fakulte",
                              hintStyle: TextStyle(fontSize: 16.0),
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
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            controller: kaydolBolumKontrolu,
                            keyboardType: TextInputType.text,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.school),
                              hintText: "Bolum",
                              hintStyle: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 440.0),
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
                    color: Colors.grey,
                  ),
                  child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 42.0),
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      onPressed: () async {
                       User u =  User();
                        User object = User(
                            id: null,
                            adSoyad: kaydolIsimKontrolu.text.trim(),
                            email: kaydolEmailKontrolu.text.trim(),
                            fakulte: kaydolFakulteKontrolu.text.trim(),
                            bolum: kaydolBolumKontrolu.text.trim(),
                            sifre: kaydolSifreKontrolu.text.trim());
                        var body = json.encode(object.toJson());
                        object = await nsn.addUser(body);
                          Alert(
                            context: context,
                            type: AlertType.success,
                            title: "SİSTEM MESAJI",
                            desc: "Kaydınız Başarı ile Oluşturulmuştur",
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
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onSingInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin =!_obscureTextLogin;
    });
  }
}

class MyTabIndicatorPainter extends CustomPainter {
  Paint painter;
  final double dxHedef;
  final double dxGiris;
  final double radius;
  final double dy;

  final PageController safyaKontrolu;

  MyTabIndicatorPainter(
      {this.dxHedef = 125.0,
      this.dxGiris = 25.0,
      this.radius = 21.0,
      this.dy = 25.0,
      this.safyaKontrolu})
      : super(repaint: safyaKontrolu) {
    painter = Paint()
      ..color = Color(0xFFFFFFFF)
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final pos = safyaKontrolu.position;
    double fullExtent =
        (pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension);

    double pageOffset = pos.extentBefore / fullExtent;

    bool left2right = dxGiris < dxHedef;
    Offset entry = new Offset(left2right ? dxGiris : dxHedef, dy);
    Offset target = new Offset(left2right ? dxHedef : dxGiris, dy);

    Path path = new Path();
    path.addArc(
        new Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
    path.addRect(
        new Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
    path.addArc(
        new Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);

    canvas.translate(size.width * pageOffset, 0.0);
    canvas.drawShadow(path, Color(0xFFfbab66), 3.0, true);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(MyTabIndicatorPainter oldDelegate) => true;
}

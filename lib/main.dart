import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hizli_randevu_sistemi/detay/aciklama.dart';
import 'package:hizli_randevu_sistemi/detay/detay_ogretim_elemani.dart';
import 'package:hizli_randevu_sistemi/model/Akadamisyenler.dart';
import 'package:hizli_randevu_sistemi/pages/home_page.dart';
import 'package:hizli_randevu_sistemi/pages/login_page.dart';
import 'package:hizli_randevu_sistemi/pages/login_page.dart';
import 'package:hizli_randevu_sistemi/pages/randevu_detay.dart';
import 'package:hizli_randevu_sistemi/pages/randevu_olustur.dart';
import 'package:hizli_randevu_sistemi/pages/sifre_yenileme_sayfasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('tr'),
        const Locale('en')
      ],
      title: 'Giriş Sayfası',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primaryColor: Colors.grey,
      ),
      home: GirisSayfasi(),
     /* initialRoute: "/",
      routes: {
        '/' : (context)=> GirisSayfasi(),
        '/anaSayfa': (context)=>RandevuOlustur(),
        '/detaySayfa': (context)=>RandevuDetay(),
        '/detayOelmDetay':(context)=>Akademisyen(),
        '/aciklamaDetay': (context)=>AciklamaDetay(),
        '/anaSayfa/detayOelmDetay': (context)=> RandevuDetay(),
        '/anaSayfa/aciklamaDetay': (context)=> RandevuDetay(),
        '/detaySayfa/anaSayfa':(context)=>RandevuOlustur(),


      },*/
    );
  }
}



/*primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
        ),
        accentColor: Colors.redAccent,

        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, color: Colors.redAccent),
          headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700,
          color: Colors.redAccent,),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.blueAccent,
          )
        )*/


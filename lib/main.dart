import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hizli_randevu_sistemi/detay/aciklama.dart';
import 'package:hizli_randevu_sistemi/detay/detay_ogretim_elemani.dart';
import 'package:hizli_randevu_sistemi/model/Akadamisyenler.dart';
import 'package:hizli_randevu_sistemi/pages/home_page.dart';
import 'package:hizli_randevu_sistemi/pages/kullanici_girisi_secimi.dart';
import 'package:hizli_randevu_sistemi/pages/login_page.dart';
import 'package:hizli_randevu_sistemi/pages/login_page.dart';
import 'package:hizli_randevu_sistemi/pages/login_page_ogretim_uyesi.dart';
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
     // home: GirisSayfasi(),
      initialRoute: "/",
      routes: {
        '/': (context) => KullaniciGirisSecimi(),
        '/girisSayfasiOgretimUyesi': (contex)=>GirisSayfasiOgretimUyesi(),
        '/girisSayfasi' : (context)=> GirisSayfasi(),
        '/home': (context)=>HomePage(),
        '/anaSayfa': (context)=>RandevuOlustur(),
        '/detaySayfa': (context)=>RandevuDetay(),
        '/detayOelmDetay':(context)=>Akademisyen(),
        '/aciklamaDetay': (context)=>AciklamaDetay(),
        '/anaSayfa/detayOelmDetay/anasayfa': (context)=> RandevuDetay(),
        '/anaSayfa/aciklamaDetay': (context)=> RandevuDetay(),
        '/detaySayfa/anaSayfa':(context)=>RandevuOlustur(),
      },
     /* onGenerateRoute: (RouteSettings settings){
        List<String> eleman = settings.name.split("/");
        if(eleman[1]=='detay'){
          return MaterialPageRoute(builder: (context)=>RandevuDetay());
        }
        return null;
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


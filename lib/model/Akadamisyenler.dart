import 'dart:convert';

class OgretimElemani {
  int id;
  String adSoyad;
  String email;
  String bolum;
  String fakulte;
  String sifre;
  String token;
  String unvan;
  String anabilimdali;
  OgretimElemani({this.id,this.adSoyad, this.email, this.bolum, this.fakulte, this.sifre,this.token,this.unvan, this.anabilimdali});

  OgretimElemani.fromJson(Map<String, dynamic> map)
      : id = map['id'] ,
        adSoyad = map['adSoyad'] ,
        email = map['email'] ,
        bolum = map['bolum'] ,
        fakulte = map['fakulte'] ,
        sifre = map['sifre'] ,
        token = map['token'] ,
        unvan = map['unvan'] ,
        anabilimdali= map['anabilimdali'];


  Map<String , dynamic> toJson(){
    final Map < String , dynamic > data = new Map < String , dynamic > ();
    data[ 'Id' ] = id;
    data[ 'adSoyad' ] = adSoyad;
    data[ 'email' ] = email;
    data[ 'bolum' ] = bolum;
    data[ 'fakulte' ] = fakulte;
    data[ 'sifre' ] = sifre;
    data['token']=token;
    data['unvan']= unvan;
    data['anabilimdali']=anabilimdali;
    return data;
  }
}
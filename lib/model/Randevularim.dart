import 'dart:convert';

class Randevular {
  int id;
  String adSoyad;
  String email;
  String tarih;
  String saat;

  Randevular({this.id,this.adSoyad, this.email, this.tarih, this.saat});

  Randevular.fromJson(Map<String, dynamic> map)
      : id = map['id'] ,
        adSoyad = map['adSoyad'] ,
        email = map['email'] ,
        tarih = map['tarih'] ,
        saat = map['saat'];


  Map<String , dynamic> toJson(){
    final Map < String , dynamic > data = new Map < String , dynamic > ();
    data[ 'Id' ] = id;
    data[ 'adSoyad' ] = adSoyad;
    data[ 'email' ] = email;
    data[ 'tarih' ] = tarih;
    data[ 'saat' ] = saat;
    return data;
  }
}
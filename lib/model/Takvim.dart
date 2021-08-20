import 'dart:convert';

class Takvimler {
  int id;
  String tarih;
  String adSoyad;


  Takvimler({this.id, this.tarih, this.adSoyad});

  Takvimler.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        tarih = map['tarih'],
        adSoyad= map['adSoyad'];


  Map<String , dynamic> toJson(){
    final Map < String , dynamic > data = new Map < String , dynamic > ();
    data[ 'id' ] = id;
    data[ 'tarih' ] = tarih;
    data[ 'adSoyad' ] = adSoyad;
    return data;
  }
}
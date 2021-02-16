import 'dart:convert';

class User {
   int id;
   String adSoyad;
   String email;
   String bolum;
   String fakulte;
   String sifre;
   String token;
   User({this.id,this.adSoyad, this.email, this.bolum, this.fakulte, this.sifre,this.token});

  User.fromJson(Map<String, dynamic> map)
      : id = map['id'] ,
        adSoyad = map['adSoyad'] ,
        email = map['email'] ,
        bolum = map['bolum'] ,
        fakulte = map['fakulte'] ,
        sifre = map['sifre'] ,
        token = map['token'] ;

  Map<String , dynamic> toJson(){
    Map < String , dynamic > data = new Map < String , dynamic > ();
    data[ 'Id' ] = id;
    data[ 'adSoyad' ] = adSoyad;
    data[ 'email' ] = email;
    data[ 'bolum' ] = bolum;
    data[ 'fakulte' ] = fakulte;
    data[ 'sifre' ] = sifre;
    data['token']=token;
    return data;
  }
}

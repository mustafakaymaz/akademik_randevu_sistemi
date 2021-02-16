import 'dart:convert';
import 'package:hizli_randevu_sistemi/model/Akadamisyenler.dart';
import 'package:hizli_randevu_sistemi/model/Randevularim.dart';
import 'package:hizli_randevu_sistemi/model/User.dart';
import 'package:hizli_randevu_sistemi/model/util.dart';
import 'package:http/http.dart' as http;


class ApiServices {
  Future<List<User>>Userlistele() async {
    final api = 'http://192.168.1.101:8080/api/users';
    var response = await http
        .get(api, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return (json.decode(response.body)as List).map((listeMap) =>User.fromJson(listeMap)).toList();
    } else {
      return null;
    }
  }

  Future<User> addUser(String body) async {
    final api = 'http://192.168.1.101:8080/api/users';
    var response = await http
        .post(api, body: body, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<Randevular> addRandevu(String body) async {
    final api = 'http://192.168.1.101:8080/api/users/randevu';
    var response = await http
        .post(api, body: body, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return Randevular.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future loginUser(String email, String sifre) async {

    User u = User(email: email,sifre: sifre );
    final api = 'http://192.168.1.101:8080/api/users/login';
    var response = await http.post(api,
       headers: {'Content-Type': 'application/json'},
        body: json.encode(u.toJson())
    );
   var convertDataJson = jsonDecode(response.body);
    //print(convertDataJson);
    return convertDataJson;

  }

  Future resetPasword (String email) async{
    User u = User(email: email);
    final api = 'http://192.168.1.101:8080/api/users/forgot-password?email=$email';
    var response = await http.post(api ,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(u.toJson())
    );
    print(response.body);
    var convertDataJson = jsonDecode(response.body);
    return convertDataJson;
  }
  Future mailDogrula(String token) async {
    User u = User(token: token);
    final api = 'http://192.168.1.101:8080/api/users/newPass1?token=$token';
        var response = await http.post(api,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(u.toJson())
    );
     print(response.body);
    var convertDataJson = jsonDecode(response.body);
    return convertDataJson;
  }

 Future newPassword (String sifre) async{
    User u = User(sifre:sifre);
    final api = 'http://192.168.1.101:8080/api/users/newPass?token=${Util.token}&sifre=$sifre';
    var response = await http.post( api,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(u.toJson())
    );
    print(response.body);

  }
  Future<List<OgretimElemani>> listele() async {
    final api = 'http://192.168.1.101:8080/api/ogretimelemani';
    var response = await http
        .get(api, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return (json.decode(response.body)as List).map((listeMap) =>OgretimElemani.fromJson(listeMap)).toList();
    } else {
      return null;
    }
  }
  Future<List<Randevular>> Randevulistele() async {
    final api = 'http://192.168.1.101:8080/api/rands';
    var response = await http
        .get(api, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return (json.decode(response.body)as List).map((listeMap) =>Randevular.fromJson(listeMap)).toList();
    } else {
      return null;
    }
  }



}

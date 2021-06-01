import 'dart:convert';

class ConfirmToken {
  int token_id;
  String confirmationToken;
  String createdDate;


  ConfirmToken({this.token_id, this.confirmationToken, this.createdDate});

  ConfirmToken.fromJson(Map<String, dynamic> map)
      : token_id = map['token_id'],
        confirmationToken = map['confirmationToken'],
        createdDate = map['createdDate'];


  Map<String , dynamic> toJson(){
    final Map < String , dynamic > data = new Map < String , dynamic > ();
    data[ 'token_id' ] = token_id;
    data[ 'confirmationToken' ] = confirmationToken;
    data[ 'createdDate' ] = createdDate;
    return data;
  }
}
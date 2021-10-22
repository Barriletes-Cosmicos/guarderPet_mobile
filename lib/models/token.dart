import 'package:guarderpet_mobile/models/document_type.dart';
import 'package:guarderpet_mobile/models/user.dart';

class Token {
  String token = '';
  String expiration = '';
  User user = User(
      firstName: '',
      lastName: '',
      document: '',
      documentType: DocumentType(id: 0, type: ''),
      userType: 0,
      address: '',
      fullName: '',
      petsCount: 0,
      id: '',
      userName: '',
      email: '',
      phoneNumber: '');

  Token({required this.token, required this.expiration, required this.user});

  Token.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiration = json['expiration'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['expiration'] = expiration;
    return data;
  }
}

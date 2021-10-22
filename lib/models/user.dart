import 'document_type.dart';

class User {
  String firstName = '';
  String lastName = '';
  String document = '';
  DocumentType documentType = DocumentType(id: 0, type: '');
  int userType = 0;
  String address = '';
  String fullName = '';
  int petsCount = 0;
  String id = '';
  String userName = '';
  String email = '';
  String phoneNumber = '';

  User({
    required this.firstName,
    required this.lastName,
    required this.document,
    required this.documentType,
    required this.userType,
    required this.address,
    required this.fullName,
    required this.petsCount,
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
  });

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    document = json['document'];
    documentType = DocumentType.fromJson(json['documentType']);
    userType = json['userType'];
    address = json['address'];
    fullName = json['fullName'];
    petsCount = json['petsCount'];
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['document'] = document;
    data['userType'] = userType;
    data['address'] = address;
    data['fullName'] = fullName;
    data['petsCount'] = petsCount;
    data['id'] = id;
    data['userName'] = userName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}

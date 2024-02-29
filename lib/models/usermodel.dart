// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? username;
  String? userId;
  String? name;
  String? surname;
  String? email;
  String? phone;
  String? profilephoto;
  String? biography;
  UserModel({
    this.username,
    this.userId,
    this.name,
    this.surname,
    this.email,
    this.phone,
    this.profilephoto,
    this.biography,
  });

  // ----------- haritalar çekilir
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map["userId"] ?? "",
      name: map["name"] ?? "",
      surname: map["surname"] ?? "",
      email: map["email"] ?? "",
      phone: map["phone"] ?? "",
      username: map["username"] ?? "",
      profilephoto: map["profilephoto"] ?? "",
      biography: map["biography"] ?? "",
    );
  }

// ------------  veriler aktarılır (haritanladıralarak)

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "name": name,
      "surname": surname,
      "email": email,
      "phone": phone,
      "username": username,
      "profilephoto": profilephoto,
      "biography": biography,
    };
  }
}

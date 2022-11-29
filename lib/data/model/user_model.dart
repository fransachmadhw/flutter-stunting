class UserModel {
  UserModel({
    required this.fullName,
    required this.email,
    required this.nik,
    required this.dateOfBirth,
    required this.address,
  });

  final String fullName;
  final String email;
  final String nik;
  final String dateOfBirth;
  final String address;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json["fullName"],
        email: json["email"],
        nik: json["nik"],
        dateOfBirth: json["dateOfBirth"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "nik": nik,
        "dateOfBirth": dateOfBirth,
        "address": address,
      };
}

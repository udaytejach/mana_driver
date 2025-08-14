class UserModel {
  final String id;
  final String firstName;
  final String lastName;

  final String email;
  final String phone;
  final String countryCode;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,

    required this.email,
    required this.phone,
    required this.countryCode,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,

    'email': email,
    'phone': phone,
    'countryCode': countryCode,
    'createdAt': createdAt.toIso8601String(),
  };

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      firstName: map['firstlName'] ?? '',
      lastName: map['lastName'] ?? '',

      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      countryCode: map['countryCode'] ?? '',
      createdAt: DateTime.parse(
        map['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }
}

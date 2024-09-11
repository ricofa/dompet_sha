class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final int? verified;
  final String? profilePict;
  final int? balance;
  final String? cardNumber;
  final String? pin;
  final String? token;
  final String? password;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.verified,
      this.profilePict,
      this.balance,
      this.cardNumber,
      this.pin,
      this.token,
      this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        verified: json['verified'],
        profilePict: json['profile_picture'],
        balance: json['balance'],
        cardNumber: json['card_number'],
        pin: json['pin'],
        token: json['token'],
      );

  UserModel copyWith({
    String? username,
    String? name,
    String? email,
    String? pin,
    String? password,
    int? balance,
  }) =>
      UserModel(
        id: id,
        username: username ?? this.username,
        name: name ?? this.name,
        email: email ?? this.email,
        pin: pin ?? this.pin,
        password: password ?? this.password,
        balance: balance ?? this.balance,
        verified: verified,
        profilePict: profilePict,
        cardNumber: cardNumber,
        token: token,
      );
}

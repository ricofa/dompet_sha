class SignUpModel {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePict;
  final String? ktp;

  SignUpModel(
      {this.name,
      this.email,
      this.password,
      this.pin,
      this.profilePict,
      this.ktp});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'pin': pin,
      'profile_picture': profilePict,
      'ktp': ktp,
    };
  }

  SignUpModel copyWith({
    String? pin,
    String? profilePict,
    String? ktp,
  }) =>
      SignUpModel(
          name: name,
          email: email,
          password: password,
          pin: pin ?? this.pin,
          profilePict: profilePict ?? this.profilePict,
          ktp: ktp ?? this.ktp);
}

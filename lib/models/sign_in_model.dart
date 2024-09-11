class SignInModel{
  final String? email;
  final String? password;

  SignInModel({this.email, this.password});

  Map<String, dynamic> toJson(){
    return{
      'email': email,
      'password': password,
    };
  }
}
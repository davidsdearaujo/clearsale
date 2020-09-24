class CredentialsModel {
  CredentialsModel(this.userName, this.password);
  final String userName;
  final String password;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CredentialsModel &&
        o.userName == userName &&
        o.password == password;
  }

  @override
  int get hashCode => userName.hashCode ^ password.hashCode;

  @override
  String toString() =>
      'CredentialsModel(userName: $userName, password: $password)';
}

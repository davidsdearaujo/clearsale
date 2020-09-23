class TokenModel {
  TokenModel(this.token, this.expirationDate);

  final String token;
  final DateTime expirationDate;
  
  bool get isExpired => DateTime.now().isAfter(expirationDate);
}

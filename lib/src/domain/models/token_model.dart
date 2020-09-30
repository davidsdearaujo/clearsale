class TokenModel {
  TokenModel(this.token, this.expirationDate);

  final String token;
  final DateTime expirationDate;

  bool get isExpired =>
      expirationDate != null && DateTime.now().isAfter(expirationDate);
}

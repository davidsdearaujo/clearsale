class TokenModel {
  TokenModel(this.token, this.expirationDate);

  final String token;
  final DateTime? expirationDate;

  bool get isExpired => expirationDate != null && DateTime.now().isAfter(expirationDate!);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TokenModel && o.token == token;
  }

  @override
  int get hashCode => token.hashCode ^ expirationDate.hashCode;

  @override
  String toString() => 'TokenModel(token: $token, expirationDate: $expirationDate)';
}

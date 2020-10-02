///### Objeto socialNetwork
///https://api.clearsale.com.br/docs/total-totalGarantido-application#socialNetwork-object
class SocialNetworkModel {
  SocialNetworkModel({
    this.optInCompreConfie,
    this.typeSocialNetwork,
    this.authenticationToken,
  });

  ///Cliente aceita ingressar no movimento Compre e Confie
  int optInCompreConfie;

  ///ID da rede social
  int typeSocialNetwork;

  ///Token retornado pela Rede Social
  String authenticationToken;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SocialNetworkModel &&
        o.optInCompreConfie == optInCompreConfie &&
        o.typeSocialNetwork == typeSocialNetwork &&
        o.authenticationToken == authenticationToken;
  }

  @override
  int get hashCode =>
      optInCompreConfie.hashCode ^
      typeSocialNetwork.hashCode ^
      authenticationToken.hashCode;

  @override
  String toString() =>
      'SocialNetworkModel(optInCompreConfie: $optInCompreConfie, typeSocialNetwork: $typeSocialNetwork, authenticationToken: $authenticationToken)';
}

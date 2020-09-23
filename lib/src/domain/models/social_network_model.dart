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
}

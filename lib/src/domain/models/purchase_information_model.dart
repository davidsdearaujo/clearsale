///### purchaseInformation
///https://api.clearsale.com.br/docs/total-totalGarantido-application#purchaseInformation-object
class PurchaseInformationModel {
  PurchaseInformationModel({
    this.lastDateInsertedMail,
    this.lastDateChangePassword,
    this.lastDateChangePhone,
    this.lastDateChangeMobilePhone,
    this.lastDateInsertedAddress,
    this.purchaseLogged,
    this.email,
    this.login,
  });

  ///Data da última alteração do e-mail
  DateTime lastDateInsertedMail;

  ///Data da última alteração da senha
  DateTime lastDateChangePassword;

  ///Data da última alteração do telefone
  DateTime lastDateChangePhone;

  ///Data da última alteração do telefone móvel
  DateTime lastDateChangeMobilePhone;

  ///Data da última alteração do endereço
  DateTime lastDateInsertedAddress;

  ///Compra logado
  bool purchaseLogged;

  ///### E-mail de Cadastro
  ///Tamanho: 200
  String email;

  ///### Login de Acesso
  ///Tamanho: 200
  String login;
}

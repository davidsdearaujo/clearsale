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
  DateTime? lastDateInsertedMail;

  ///Data da última alteração da senha
  DateTime? lastDateChangePassword;

  ///Data da última alteração do telefone
  DateTime? lastDateChangePhone;

  ///Data da última alteração do telefone móvel
  DateTime? lastDateChangeMobilePhone;

  ///Data da última alteração do endereço
  DateTime? lastDateInsertedAddress;

  ///Compra logado
  bool? purchaseLogged;

  ///### E-mail de Cadastro
  ///Tamanho: 200
  String? email;

  ///### Login de Acesso
  ///Tamanho: 200
  String? login;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PurchaseInformationModel && o.lastDateInsertedMail == lastDateInsertedMail && o.lastDateChangePassword == lastDateChangePassword && o.lastDateChangePhone == lastDateChangePhone && o.lastDateChangeMobilePhone == lastDateChangeMobilePhone && o.lastDateInsertedAddress == lastDateInsertedAddress && o.purchaseLogged == purchaseLogged && o.email == email && o.login == login;
  }

  @override
  int get hashCode {
    return lastDateInsertedMail.hashCode ^ lastDateChangePassword.hashCode ^ lastDateChangePhone.hashCode ^ lastDateChangeMobilePhone.hashCode ^ lastDateInsertedAddress.hashCode ^ purchaseLogged.hashCode ^ email.hashCode ^ login.hashCode;
  }

  @override
  String toString() {
    return 'PurchaseInformationModel(lastDateInsertedMail: $lastDateInsertedMail, lastDateChangePassword: $lastDateChangePassword, lastDateChangePhone: $lastDateChangePhone, lastDateChangeMobilePhone: $lastDateChangeMobilePhone, lastDateInsertedAddress: $lastDateInsertedAddress, purchaseLogged: $purchaseLogged, email: $email, login: $login)';
  }
}

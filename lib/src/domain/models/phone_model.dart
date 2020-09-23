import 'package:meta/meta.dart';

import '../enums/person_type_enum.dart';

///### Objeto phones
///https://api.clearsale.com.br/docs/total-totalGarantido-application#address-object
class PhoneModel {
  PhoneModel({
    @required this.type,
    this.ddi,
    @required this.ddd,
    @required this.number,
    this.extension,
  });

  ///Tipo de Telefone
  PersonTypeEnum type;

  ///DDI do Telefone
  int ddi;

  ///DDD do Telefone
  int ddd;

  ///Número do Telefone
  int number;

  ///Ramal do Telefone
  String extension;
}

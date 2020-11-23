import 'package:meta/meta.dart';

import '../enums/phone_type_enum.dart';

export '../enums/phone_type_enum.dart';

class PhoneModel {
  ///Tipo de Telefone
  PhoneTypeEnum type;

  ///DDI do Telefone
  int ddi;

  ///DDD do Telefone
  int ddd;

  ///Número do Telefone
  int number;

  ///Ramal do Telefone
  String extension;
  PhoneModel({
    @required this.type,
    this.ddi,
    @required this.ddd,
    @required this.number,
    this.extension,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PhoneModel &&
        o.type == type &&
        o.ddi == ddi &&
        o.ddd == ddd &&
        o.number == number &&
        o.extension == extension;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        ddi.hashCode ^
        ddd.hashCode ^
        number.hashCode ^
        extension.hashCode;
  }

  @override
  String toString() {
    return 'PhoneModel(type: $type, ddi: $ddi, ddd: $ddd, number: $number, extension: $extension)';
  }
}

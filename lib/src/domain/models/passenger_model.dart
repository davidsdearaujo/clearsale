import 'package:meta/meta.dart';

import '../enums/gender_enum.dart';
import '../enums/identification_type_enum.dart';

export '../enums/gender_enum.dart';
export '../enums/identification_type_enum.dart';

class PassengerModel {
  ///### Nome do Passageiro
  ///Tamanho: 100
  String name;

  ///### Companhia de Milhagem (Fidelidade)
  ///Tamanho: 50
  String companyMileCard;

  ///### Cartão de Milhagem (Fidelidade)
  ///Tamanho: 50
  String mileCard;

  ///### Tipo de Documento de Identificação
  IdentificationTypeEnum identificationType;

  ///### Número do Documento
  ///Tamanho: 50
  String identificationNumber;

  ///### Sexo do Passageiro
  GenderEnum gender;

  ///### Data de nascimento
  DateTime birthdate;

  ///### CPF do Passageiro
  ///Tamanho: 50
  String cpf;

  PassengerModel({
    @required this.name,
    this.companyMileCard,
    this.mileCard,
    this.identificationType,
    this.identificationNumber,
    this.gender,
    this.birthdate,
    this.cpf,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PassengerModel &&
        o.name == name &&
        o.companyMileCard == companyMileCard &&
        o.mileCard == mileCard &&
        o.identificationType == identificationType &&
        o.identificationNumber == identificationNumber &&
        o.gender == gender &&
        o.birthdate == birthdate &&
        o.cpf == cpf;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        companyMileCard.hashCode ^
        mileCard.hashCode ^
        identificationType.hashCode ^
        identificationNumber.hashCode ^
        gender.hashCode ^
        birthdate.hashCode ^
        cpf.hashCode;
  }

  @override
  String toString() {
    return 'PassengerModel(name: $name, companyMileCard: $companyMileCard, mileCard: $mileCard, identificationType: $identificationType, identificationNumber: $identificationNumber, gender: $gender, birthdate: $birthdate, cpf: $cpf)';
  }
}

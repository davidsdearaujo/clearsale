import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import '../enums/gender_enum.dart';
import '../enums/person_type_enum.dart';
import 'address_model.dart';
import 'phone_model.dart';

export '../enums/gender_enum.dart';
export '../enums/person_type_enum.dart';
export 'address_model.dart';
export 'phone_model.dart';

class BillingModel {
  BillingModel({
    this.clientId,
    @required this.type,
    @required this.primaryDocument,
    this.secondaryDocument,
    @required this.name,
    this.birthDate,
    this.email,
    this.gender,
    this.address,
    @required this.phones,
  });

  ///Código do cliente
  String clientId;

  ///Pessoa Física ou Jurídica
  PersonTypeEnum type;

  ///CPF ou CNPJ
  String primaryDocument;

  ///RG ou Inscrição Estadual
  String secondaryDocument;

  ///Nome do cliente
  String name;

  ///Data de Nascimento
  DateTime birthDate;

  ///Email
  String email;

  ///Sexo
  GenderEnum gender;

  ///Endereço
  ///**Importante**: O envio do endereço não é obrigatório, porém caso tenha essa informação para envio, deverá respeitar a obrigatoriedade mínima dos campos informados.
  ///
  ///Em caso de empresas de passagens aéreas o endereço de entrega **não** é obrigatório.
  ///
  ///Se em sua regra de negócio existir a entrega física de produtos, os dados de entrega (shipping), incluindo os dados do endereço (shipping.address), deverão ser informados.
  AddressModel address;

  ///### Telefones
  ///**Importante**: É obrigatório o envio de pelo menos 1 telefone.
  List<PhoneModel> phones;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is BillingModel &&
        o.clientId == clientId &&
        o.type == type &&
        o.primaryDocument == primaryDocument &&
        o.secondaryDocument == secondaryDocument &&
        o.name == name &&
        o.birthDate == birthDate &&
        o.email == email &&
        o.gender == gender &&
        o.address == address &&
        listEquals(o.phones, phones);
  }

  @override
  int get hashCode {
    return clientId.hashCode ^
        type.hashCode ^
        primaryDocument.hashCode ^
        secondaryDocument.hashCode ^
        name.hashCode ^
        birthDate.hashCode ^
        email.hashCode ^
        gender.hashCode ^
        address.hashCode ^
        phones.hashCode;
  }

  @override
  String toString() {
    return 'BillingModel(clientId: $clientId, type: $type, primaryDocument: $primaryDocument, secondaryDocument: $secondaryDocument, name: $name, birthDate: $birthDate, email: $email, gender: $gender, address: $address, phones: $phones)';
  }
}

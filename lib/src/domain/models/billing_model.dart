import 'package:meta/meta.dart';

import '../enums/gender_enum.dart';
import '../enums/person_type_enum.dart';
import 'address_model.dart';
import 'phone_model.dart';

///### Objeto billing
///https://api.clearsale.com.br/docs/total-totalGarantido-application#billing-object
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
}

import 'package:meta/meta.dart';

import '../enums/delivery_type_enum.dart';
import '../enums/gender_enum.dart';
import '../enums/person_type_enum.dart';
import 'address_model.dart';
import 'phone_model.dart';

///### Objeto shipping
///https://api.clearsale.com.br/docs/total-totalGarantido-application#shipping-object
class ShippingModel {
  ShippingModel({
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
    this.deliveryType,
    this.deliveryTime,
    this.price,
    this.pickUpStoreDocument,
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

  ///Gênero
  GenderEnum gender;

  ///Endereço
  AddressModel address;

  ///Telefones
  List<PhoneModel> phones;

  ///ID do Tipo de entrega
  DeliveryTypeEnum deliveryType;

  ///Prazo de Entrega
  String deliveryTime;

  ///Valor do Frete
  double price;

  ///### CPF para retirada em loja
  ///(caso o pedido seja de algum tipo de entrega “Retirada”)
  ///
  ///Tamanho: 30
  String pickUpStoreDocument;
}

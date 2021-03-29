import 'package:collection/collection.dart';

import '../enums/delivery_type_enum.dart';
import '../enums/gender_enum.dart';
import '../enums/person_type_enum.dart';
import 'address_model.dart';
import 'phone_model.dart';

export '../enums/delivery_type_enum.dart';
export '../enums/gender_enum.dart';
export '../enums/person_type_enum.dart';
export 'address_model.dart';
export 'phone_model.dart';

class ShippingModel {
  ///Código do cliente
  String? clientId;

  ///Pessoa Física ou Jurídica
  PersonTypeEnum? type;

  ///CPF ou CNPJ
  String primaryDocument;

  ///RG ou Inscrição Estadual
  String? secondaryDocument;

  ///Nome do cliente
  String name;

  ///Data de Nascimento
  DateTime? birthDate;

  ///Email
  String? email;

  ///Gênero
  GenderEnum? gender;

  ///Endereço
  AddressModel? address;

  ///Telefones
  List<PhoneModel> phones;

  ///ID do Tipo de entrega
  DeliveryTypeEnum? deliveryType;

  ///Prazo de Entrega
  String? deliveryTime;

  ///Valor do Frete
  double? price;

  ///### CPF para retirada em loja
  ///(caso o pedido seja de algum tipo de entrega “Retirada”)
  ///
  ///Tamanho: 30
  String? pickUpStoreDocument;

  ShippingModel({
    this.clientId,
    required this.type,
    required this.primaryDocument,
    this.secondaryDocument,
    required this.name,
    this.birthDate,
    this.email,
    this.gender,
    this.address,
    required this.phones,
    this.deliveryType,
    this.deliveryTime,
    this.price,
    this.pickUpStoreDocument,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is ShippingModel && o.clientId == clientId && o.type == type && o.primaryDocument == primaryDocument && o.secondaryDocument == secondaryDocument && o.name == name && o.birthDate == birthDate && o.email == email && o.gender == gender && o.address == address && listEquals(o.phones, phones) && o.deliveryType == deliveryType && o.deliveryTime == deliveryTime && o.price == price && o.pickUpStoreDocument == pickUpStoreDocument;
  }

  @override
  int get hashCode {
    return clientId.hashCode ^ type.hashCode ^ primaryDocument.hashCode ^ secondaryDocument.hashCode ^ name.hashCode ^ birthDate.hashCode ^ email.hashCode ^ gender.hashCode ^ address.hashCode ^ phones.hashCode ^ deliveryType.hashCode ^ deliveryTime.hashCode ^ price.hashCode ^ pickUpStoreDocument.hashCode;
  }

  @override
  String toString() {
    return 'ShippingModel(clientId: $clientId, type: $type, primaryDocument: $primaryDocument, secondaryDocument: $secondaryDocument, name: $name, birthDate: $birthDate, email: $email, gender: $gender, address: $address, phones: $phones, deliveryType: $deliveryType, deliveryTime: $deliveryTime, price: $price, pickUpStoreDocument: $pickUpStoreDocument)';
  }
}

import 'package:meta/meta.dart';

///### Objeto address
///**Importante**: O envio do endereço não é obrigatório, porém caso tenha essa informação para envio, deverá respeitar a obrigatoriedade mínima dos campos informados como ‘S’.
///
///Em caso de empresas de passagens aéreas o endereço de entrega não é obrigatório.
///
///Se em sua regra de negócio existir a entrega física de produtos, os dados de entrega (shipping), incluindo os dados do endereço (shipping.address), deverão ser informados.
class AddressModel {
  AddressModel({
    @required this.street,
    @required this.number,
    this.additionalInformation,
    @required this.county,
    @required this.city,
    @required this.state,
    this.country,
    @required this.zipcode,
    this.reference,
  });

  ///Nome do logradouro
  String street;

  ///Número do Endereço
  String number;

  ///Complemento do Endereço
  String additionalInformation;

  ///Bairro do Endereço
  String county;

  ///Cidade do Endereço
  String city;

  ///Sigla do Estado do Endereço - UF
  String state;

  ///País do Endereço
  String zipcode;

  ///CEP do Endereço
  String country;

  ///Referência do Endereço
  String reference;
}

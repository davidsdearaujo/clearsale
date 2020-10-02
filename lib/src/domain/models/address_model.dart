import 'package:meta/meta.dart';

class AddressModel {
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

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AddressModel &&
        o.street == street &&
        o.number == number &&
        o.additionalInformation == additionalInformation &&
        o.county == county &&
        o.city == city &&
        o.state == state &&
        o.zipcode == zipcode &&
        o.country == country &&
        o.reference == reference;
  }

  @override
  int get hashCode {
    return street.hashCode ^
        number.hashCode ^
        additionalInformation.hashCode ^
        county.hashCode ^
        city.hashCode ^
        state.hashCode ^
        zipcode.hashCode ^
        country.hashCode ^
        reference.hashCode;
  }

  @override
  String toString() {
    return 'AddressModel(street: $street, number: $number, additionalInformation: $additionalInformation, county: $county, city: $city, state: $state, zipcode: $zipcode, country: $country, reference: $reference)';
  }
}

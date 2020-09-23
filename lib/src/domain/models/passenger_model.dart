import 'package:meta/meta.dart';

import '../enums/gender_enum.dart';
import '../enums/identification_type_enum.dart';

///### Objeto passengers
///https://api.clearsale.com.br/docs/total-totalGarantido-application#passengers-object
///
///**Importante**: Os objetos passengers e connections são utilizados somente em empresas de passagens aéreas.
///
///Caso **não** seja o seu caso, favor omitir essas propriedades.
///
///No objeto connections informar somente os dados de origem e destino, não informar escalas e conexões.
///
///**Por exemplo**:
///
///Para um vôo de São Paulo (Guarulhos) para Londres, via New York (JFK), você irá informar apenas GRU-LHR, ao invés de GRU-JFK e JFK-LHR.
class PassengerModel {
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
}

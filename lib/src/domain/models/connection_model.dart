import 'package:meta/meta.dart';

///### Objeto connections
///
///https://api.clearsale.com.br/docs/total-totalGarantido-application#connections-object
///
///**Importante**: Os objetos passengers e connections são utilizados somente em empresas de passagens aéreas.
///
///Caso não seja o seu caso, favor omitir essas propriedades no json de sua requisição.
///
///No objeto connections informar somente os dados de origem e destino, não informar escalas e conexões.
///
///**Por exemplo**:
///
///Para um vôo de São Paulo (Guarulhos) para Londres, via New York (JFK), você irá informar apenas GRU-LHR, ao invés de GRU-JFK e JFK-LHR.
class ConnectionModel {
  ConnectionModel({
    this.company,
    this.identificationNumber,
    @required this.date,
    this.seatClass,
    @required this.origin,
    @required this.destination,
    @required this.boarding,
    @required this.arriving,
    this.fareClass,
  });

  ///Nome da Companhia Aérea
  String company;

  ///Número do Voo
  int identificationNumber;

  ///Data do Voo
  DateTime date;

  ///Classe do Assento
  String seatClass;

  ///Origem
  String origin;

  ///Destino
  String destination;

  ///Data de Embarque
  DateTime boarding;

  ///Data de Desembarque
  DateTime arriving;

  ///Classe Tarifária
  String fareClass;
}

import 'package:meta/meta.dart';

import '../enums/card_brand_enum.dart';

///### Objeto card
///https://api.clearsale.com.br/docs/total-totalGarantido-application#card-object
class CardModel {
  CardModel({
    this.number,
    this.hash,
    @required this.bin,
    @required this.end,
    this.type,
    this.validityDate,
    @required this.ownerName,
    this.document,
    this.nsu,
  });

  ///### Número do Cartão com Máscara
  ///Tamanho: 200
  String number;

  ///### Hash do número do cartão
  ///Tamanho: 128
  String hash;

  ///### 6 Primeiros Números do Cartão de Crédito
  ///Tamanho: 6
  String bin;

  ///### 4 últimos digitos do número de cartão
  ///Tamanho: 4
  String end;

  ///### Bandeira do Cartão
  CardBrandEnum type;

  ///###Data da Expiração
  ///Tamanho: 50
  String validityDate;

  ///### Nome de Cobrança
  ///Tamanho: 150
  String ownerName;

  ///### Documento da Pessoa de Cobrança
  ///Tamanho: 100
  String document;

  ///### Número identificador único de uma transação de cartão
  ///Tamanho: 50
  String nsu;
}

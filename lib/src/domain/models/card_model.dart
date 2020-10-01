import 'package:meta/meta.dart';

import '../enums/card_brand_enum.dart';

export '../enums/card_brand_enum.dart';

class CardModel {
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

  ///### Data da Expiração
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

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CardModel &&
        o.number == number &&
        o.hash == hash &&
        o.bin == bin &&
        o.end == end &&
        o.type == type &&
        o.validityDate == validityDate &&
        o.ownerName == ownerName &&
        o.document == document &&
        o.nsu == nsu;
  }

  @override
  int get hashCode {
    return number.hashCode ^
        hash.hashCode ^
        bin.hashCode ^
        end.hashCode ^
        type.hashCode ^
        validityDate.hashCode ^
        ownerName.hashCode ^
        document.hashCode ^
        nsu.hashCode;
  }

  @override
  String toString() {
    return 'CardModel(number: $number, hash: $hash, bin: $bin, end: $end, type: $type, validityDate: $validityDate, ownerName: $ownerName, document: $document, nsu: $nsu)';
  }
}

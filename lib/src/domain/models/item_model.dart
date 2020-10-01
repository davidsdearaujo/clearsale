import 'package:meta/meta.dart';

class ItemModel {
  ///### Código do Produto
  ///Tamanho: 50
  String code;

  ///### Nome do Produto
  ///Tamanho: 150
  String name;

  ///### EAN (Código de barras) do produto
  ///Tamanho: 200
  String barCode;

  ///### Valor Unitário
  ///Tamanho: 20,4
  double value;

  ///### Quantidade
  int amount;

  ///### Valor Unitário
  int categoryId;

  ///### 	Código da Categoria do Produto
  String categoryName;

  ///### Identifica se o item é um presente (true ou false)
  bool isGift;

  ///### Nome do seller
  ///Tamanho: 200
  String sellerName;

  ///### CNPJ do seller
  ///Tamanho: 14
  String sellerDocument;

  ///### Identifica se o item é de um Marketplace (Informar “true” ou “false”)
  ///Tamanho: 5
  String isMarketPlace;

  ///### Nome da Transportadora
  ///Tamanho: 200
  String shippingCompany;

  ItemModel({
    this.code,
    @required this.name,
    this.barCode,
    this.value,
    this.amount,
    this.categoryId,
    this.categoryName,
    this.isGift,
    this.sellerName,
    this.sellerDocument,
    this.isMarketPlace,
    this.shippingCompany,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ItemModel &&
        o.code == code &&
        o.name == name &&
        o.barCode == barCode &&
        o.value == value &&
        o.amount == amount &&
        o.categoryId == categoryId &&
        o.categoryName == categoryName &&
        o.isGift == isGift &&
        o.sellerName == sellerName &&
        o.sellerDocument == sellerDocument &&
        o.isMarketPlace == isMarketPlace &&
        o.shippingCompany == shippingCompany;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        name.hashCode ^
        barCode.hashCode ^
        value.hashCode ^
        amount.hashCode ^
        categoryId.hashCode ^
        categoryName.hashCode ^
        isGift.hashCode ^
        sellerName.hashCode ^
        sellerDocument.hashCode ^
        isMarketPlace.hashCode ^
        shippingCompany.hashCode;
  }

  @override
  String toString() {
    return 'ItemModel(code: $code, name: $name, barCode: $barCode, value: $value, amount: $amount, categoryId: $categoryId, categoryName: $categoryName, isGift: $isGift, sellerName: $sellerName, sellerDocument: $sellerDocument, isMarketPlace: $isMarketPlace, shippingCompany: $shippingCompany)';
  }
}

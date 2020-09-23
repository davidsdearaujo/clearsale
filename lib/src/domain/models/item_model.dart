import 'package:meta/meta.dart';

///### Objeto items
///**Importante**: Em caso de empresas de passagens aéreas os dados de item não são obrigatórios.
///
///https://api.clearsale.com.br/docs/total-totalGarantido-application#items-object
class ItemModel {
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
}

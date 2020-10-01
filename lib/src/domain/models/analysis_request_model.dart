import 'package:meta/meta.dart';

import '../enums/product_type_enum.dart';
import '../enums/request_status_enum.dart';
import 'billing_model.dart';
import 'connection_model.dart';
import 'hotel_model.dart';
import 'item_model.dart';
import 'list_class_model.dart';
import 'passenger_model.dart';
import 'payment_model.dart';
import 'purchase_information_model.dart';
import 'shipping_model.dart';
import 'social_network_model.dart';

export '../enums/product_type_enum.dart';
export '../enums/request_status_enum.dart';
export 'billing_model.dart';
export 'connection_model.dart';
export 'hotel_model.dart';
export 'item_model.dart';
export 'list_class_model.dart';
export 'passenger_model.dart';
export 'payment_model.dart';
export 'purchase_information_model.dart';
export 'shipping_model.dart';
export 'social_network_model.dart';

class AnalisysRequestModel {
  AnalisysRequestModel({
    @required this.code,
    @required this.sessionId,
    @required this.date,
    @required this.email,
    this.b2BB2C,
    this.itemValue,
    @required this.totalValue,
    this.numberOfInstallments,
    this.ip,
    this.isGift,
    this.giftMessage,
    this.observation,
    this.status,
    this.origin,
    this.channelId,
    this.reservationDate,
    this.country,
    this.nationality,
    this.product,
    this.customSla,
    this.bankAuthentication,
    this.subAcquirer,
    this.list,
    this.purchaseInformation,
    this.socialNetwork,
    @required this.billing,
    this.shipping,
    @required this.payments,
    @required this.items,
    this.passengers,
    this.connections,
    this.hotels,
  });

  ///Código do pedido
  String code;

  ///Identificador único da sessão do usuário
  String sessionId;

  ///Data do pedido
  DateTime date;

  ///Email do pedido
  String email;

  ///Tipo do ecommerce
  String b2BB2C;

  ///Valor Total dos Itens
  double itemValue;

  ///Valor Total do Pedido. Composto pelo Valor Total dos Itens + Valor do Frete + Eventual Valor de Juros da Compra
  double totalValue;

  ///Quantidade de Parcelas
  int numberOfInstallments;

  ///IP do Pedido
  String ip;

  ///Identifica se o pedido é presente
  bool isGift;

  ///Mensagem de Presente
  String giftMessage;

  ///Observação do Pedido
  String observation;

  ///### Status do Pedido
  ///
  ///**Atenção**: Ao enviar o status no pedido é importante ressaltar que este pedido será incluso como histórico e não será analisado pela ClearSale.
  RequestStatusEnum status;

  ///Canal de Origem do Pedido (ex: TELEVENDAS, WEBSITE, APP, etc.)
  String origin;

  ///Canal de Origem complementar, se houver. (ex: ANDROID, IOS, etc.)
  String channelId;

  ///Data do Primeiro Voo do Pedido (em caso de aéreas)
  DateTime reservationDate;

  ///Nome do País
  String country;

  ///Nome da Nacionalidade
  String nationality;

  ///Tipo do produto
  ProductTypeEnum product;

  ///Valor em Minutos de SLA máximo de Análise do Pedido, se houver
  int customSla;

  ///Tipo de autenticação do banco
  String bankAuthentication;

  ///Nome do sub adquirente
  String subAcquirer;

  ///tipo de lista
  ListClassModel list;

  ///Dados de cobrança
  PurchaseInformationModel purchaseInformation;

  ///socialNetwork
  SocialNetworkModel socialNetwork;

  ///Dados de cobrança
  BillingModel billing;

  ///Dados de entrega
  ShippingModel shipping;

  ///Dados de pagamento
  List<PaymentModel> payments;

  ///### Itens
  ///**Importante**: Em caso de empresas de passagens aéreas os dados de item não são obrigatórios.
  List<ItemModel> items;

  ///### Passageiros
  ///**Importante**: Os objetos passengers e connections são utilizados somente em empresas de passagens aéreas.
  ///
  ///Caso **não** seja o seu caso, favor omitir essas propriedades.
  ///
  ///No objeto connections informar somente os dados de origem e destino, não informar escalas e conexões.
  ///
  ///**Por exemplo**:
  ///
  ///Para um vôo de São Paulo (Guarulhos) para Londres, via New York (JFK), você irá informar apenas GRU-LHR, ao invés de GRU-JFK e JFK-LHR.
  List<PassengerModel> passengers;

  ///### Conexões
  ///**Importante**: Os objetos passengers e connections são utilizados somente em empresas de passagens aéreas.
  ///
  ///Caso **não** seja o seu caso, favor omitir essas propriedades.
  ///
  ///No objeto connections informar somente os dados de origem e destino, não informar escalas e conexões.
  ///
  ///**Por exemplo**:
  ///
  ///Para um vôo de São Paulo (Guarulhos) para Londres, via New York (JFK), você irá informar apenas GRU-LHR, ao invés de GRU-JFK e JFK-LHR.
  List<ConnectionModel> connections;

  //Hotéis
  List<HotelModel> hotels;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is AnalisysRequestModel && o.code == code;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        sessionId.hashCode ^
        date.hashCode ^
        email.hashCode ^
        b2BB2C.hashCode ^
        itemValue.hashCode ^
        totalValue.hashCode ^
        numberOfInstallments.hashCode ^
        ip.hashCode ^
        isGift.hashCode ^
        giftMessage.hashCode ^
        observation.hashCode ^
        status.hashCode ^
        origin.hashCode ^
        channelId.hashCode ^
        reservationDate.hashCode ^
        country.hashCode ^
        nationality.hashCode ^
        product.hashCode ^
        customSla.hashCode ^
        bankAuthentication.hashCode ^
        subAcquirer.hashCode ^
        list.hashCode ^
        purchaseInformation.hashCode ^
        socialNetwork.hashCode ^
        billing.hashCode ^
        shipping.hashCode ^
        payments.hashCode ^
        items.hashCode ^
        passengers.hashCode ^
        connections.hashCode ^
        hotels.hashCode;
  }

  @override
  String toString() {
    return 'AnalisysRequestModel(code: $code, sessionId: $sessionId, date: $date, email: $email, b2BB2C: $b2BB2C, itemValue: $itemValue, totalValue: $totalValue, numberOfInstallments: $numberOfInstallments, ip: $ip, isGift: $isGift, giftMessage: $giftMessage, observation: $observation, status: $status, origin: $origin, channelId: $channelId, reservationDate: $reservationDate, country: $country, nationality: $nationality, product: $product, customSla: $customSla, bankAuthentication: $bankAuthentication, subAcquirer: $subAcquirer, list: $list, purchaseInformation: $purchaseInformation, socialNetwork: $socialNetwork, billing: $billing, shipping: $shipping, payments: $payments, items: $items, passengers: $passengers, connections: $connections, hotels: $hotels)';
  }
}

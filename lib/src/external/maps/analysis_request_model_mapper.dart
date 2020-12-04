import 'dart:convert';

import 'package:clearsale/src/domain/models/analysis_request_model.dart';

import 'billing_model_mapper.dart';
import 'connection_model_mapper.dart';
import 'hotel_model_mapper.dart';
import 'item_model_mapper.dart';
import 'list_class_model_mapper.dart';
import 'passenger_model_mapper.dart';
import 'payment_model_mapper.dart';
import 'purchase_information_model_mapper.dart';
import 'shipping_model_mapper.dart';
import 'social_network_model_mapper.dart';

class AnalysisRequestModelMapper {
  static Map<String, dynamic> toMap(AnalysisRequestModel model) {
    if (model == null) return null;
    return {
      if (model.code != null) 'code': model?.code,
      if (model.sessionId != null) 'sessionID': model?.sessionId,
      if (model.date != null) 'date': model?.date?.toIso8601String(),
      if (model.email != null) 'email': model?.email,
      if (model.b2BB2C != null) 'b2bB2c': model?.b2BB2C,
      if (model.itemValue != null) 'itemValue': model?.itemValue,
      if (model.totalValue != null) 'totalValue': model?.totalValue,
      if (model.numberOfInstallments != null)
        'numberOfInstallments': model?.numberOfInstallments,
      if (model.ip != null) 'ip': model?.ip,
      if (model.isGift != null) 'isGift': model?.isGift,
      if (model.giftMessage != null) 'giftMessage': model?.giftMessage,
      if (model.observation != null) 'observation': model?.observation,
      if (model.status != null) 'status': model?.status?.toMap(),
      if (model.origin != null) 'origin': model?.origin,
      if (model?.channelId != null) 'channelID': model?.channelId,
      if (model.reservationDate != null)
        'reservationDate': model?.reservationDate?.toIso8601String(),
      if (model.country != null) 'country': model?.country,
      if (model.nationality != null) 'nationality': model?.nationality,
      if (model.product != null) 'product': model?.product?.toMap(),
      if (model.customSla != null) 'customSla': model?.customSla,
      if (model.bankAuthentication != null)
        'bankAuthentication': model?.bankAuthentication,
      if (model.subAcquirer != null) 'subAcquirer': model?.subAcquirer,
      if (model.list != null) 'list': ListClassModelMapper.toMap(model?.list),
      if (model.purchaseInformation != null)
        'purchaseInformation':
            PurchaseInformationModelMapper.toMap(model?.purchaseInformation),
      if (model.socialNetwork != null)
        'socialNetwork': SocialNetworkModelMapper.toMap(model?.socialNetwork),
      if (model.billing != null)
        'billing': BillingModelMapper.toMap(model?.billing),
      if (model.shipping != null)
        'shipping': ShippingModelMapper.toMap(model?.shipping),
      if (model.payments != null)
        'payments':
            model?.payments?.map((x) => PaymentModelMapper.toMap(x))?.toList(),
      if (model.items != null)
        'items': model?.items?.map((x) => ItemModelMapper.toMap(x))?.toList(),
      if (model.passengers != null)
        'passengers': model?.passengers
            ?.map((x) => PassengerModelMapper.toMap(x))
            ?.toList(),
      if (model.connections != null)
        'connections': model?.connections
            ?.map((x) => ConnectionModelMapper.toMap(x))
            ?.toList(),
      if (model.hotels != null)
        'hotels':
            model?.hotels?.map((x) => HotelModelMapper.toMap(x))?.toList(),
    };
  }

  static AnalysisRequestModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AnalysisRequestModel(
      code: map['code'],
      sessionId: map['sessionID'],
      date: DateTime.tryParse(map['date']),
      email: map['email'],
      b2BB2C: map['b2bB2c'],
      itemValue: map['itemValue'],
      totalValue: map['totalValue'],
      numberOfInstallments: map['numberOfInstallments'],
      ip: map['ip'],
      isGift: map['isGift'],
      giftMessage: map['giftMessage'],
      observation: map['observation'],
      status: RequestStatusEnumExtension.fromMap(map['status']),
      origin: map['origin'],
      channelId: map['channelID'],
      reservationDate: DateTime.tryParse(map['reservationDate']),
      country: map['country'],
      nationality: map['nationality'],
      product: ProductTypeEnumExtension.fromMap(map['product']),
      customSla: map['customSla'],
      bankAuthentication: map['bankAuthentication'],
      subAcquirer: map['subAcquirer'],
      list: ListClassModelMapper.fromMap(map['list']),
      purchaseInformation:
          PurchaseInformationModelMapper.fromMap(map['purchaseInformation']),
      socialNetwork: SocialNetworkModelMapper.fromMap(map['socialNetwork']),
      billing: BillingModelMapper.fromMap(map['billing']),
      shipping: ShippingModelMapper.fromMap(map['shipping']),
      payments: List<PaymentModel>.from(
          map['payments']?.map((x) => PaymentModelMapper.fromMap(x))),
      items: List<ItemModel>.from(
          map['items']?.map((x) => ItemModelMapper.fromMap(x))),
      passengers: List<PassengerModel>.from(
          map['passengers']?.map((x) => PassengerModelMapper.fromMap(x))),
      connections: List<ConnectionModel>.from(
          map['connections']?.map((x) => ConnectionModelMapper.fromMap(x))),
      hotels: List<HotelModel>.from(
          map['hotels']?.map((x) => HotelModelMapper.fromMap(x))),
    );
  }

  static String toJson(AnalysisRequestModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static AnalysisRequestModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}

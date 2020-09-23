///Tipo de Entrega (shipping.deliveryType)
///https://api.clearsale.com.br/docs/total-totalGarantido-application#delivery-type
enum DeliveryTypeEnum {
  ///Outros
  outros,

  ///normal
  normal,

  ///Garantida
  garantida,

  ///ExpressaBR
  expressaBR,

  ///ExpressaSP
  expressaSP,

  ///Alta
  alta,

  ///Econômica
  economica,

  ///Agendada
  agendada,

  ///Extra Rápida
  extraRapida,

  ///Impresso
  impresso,

  ///Aplicativo
  aplicativo,

  ///Correio
  correio,

  ///Motoboy
  motoboy,

  ///Retirada Bilheteria
  retiradaBilheteria,

  ///Retirada Loja Parceira
  retiradaLojaParceira,

  ///Cartão de Crédito Ingresso
  cartaoDeCreditoIngresso,

  ///Retirada Loja
  retiradaLoja,

  ///Retirada via Lockers (Parceiros)
  retiradaViaLockers,

  ///Retirada em Agencia dos Correios
  retiradaAgenciaCorreios,

  ///Entrega Garantida no mesmo dia da compra
  entregaGarantidaMesmoDia,

  ///Entrega Garantida no dia seguinte da compra
  entregaGarantidaDiaSeguinte,

  ///Retirada em loja - Expresso
  retiradaLojaExpresso,
}

extension DeliveryTypeEnumExtension on DeliveryTypeEnum {
  Map<DeliveryTypeEnum, int> get _values => const {
        DeliveryTypeEnum.outros: 0,
        DeliveryTypeEnum.normal: 1,
        DeliveryTypeEnum.garantida: 2,
        DeliveryTypeEnum.expressaBR: 3,
        DeliveryTypeEnum.expressaSP: 4,
        DeliveryTypeEnum.alta: 5,
        DeliveryTypeEnum.economica: 6,
        DeliveryTypeEnum.agendada: 7,
        DeliveryTypeEnum.extraRapida: 8,
        DeliveryTypeEnum.impresso: 9,
        DeliveryTypeEnum.aplicativo: 10,
        DeliveryTypeEnum.correio: 11,
        DeliveryTypeEnum.motoboy: 12,
        DeliveryTypeEnum.retiradaBilheteria: 13,
        DeliveryTypeEnum.retiradaLojaParceira: 14,
        DeliveryTypeEnum.cartaoDeCreditoIngresso: 15,
        DeliveryTypeEnum.retiradaLoja: 16,
        DeliveryTypeEnum.retiradaViaLockers: 17,
        DeliveryTypeEnum.retiradaAgenciaCorreios: 18,
        DeliveryTypeEnum.entregaGarantidaMesmoDia: 19,
        DeliveryTypeEnum.entregaGarantidaDiaSeguinte: 20,
        DeliveryTypeEnum.retiradaLojaExpresso: 21,
      };
  int toMap() => _values[this];
}

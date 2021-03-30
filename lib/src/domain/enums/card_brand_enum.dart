///### Bandeira do Cartão
///https://api.clearsale.com.br/docs/total-totalGarantido-application#card-brand
enum CardBrandEnum {
  ///Diners
  diners,

  ///MasterCard
  masterCard,

  ///Visa
  visa,

  ///Outros
  others,

  ///American Express
  americanExpress,

  ///HiperCard
  hiperCard,

  ///Aura
  aura,

  ///Cartão Elo
  elo,

  ///LeaderCard
  leaderCard,

  ///Fortbrasil
  fortbrasil,

  ///Sorocred
  sorocred,

  ///A Vista
  inCash,

  ///Cartão Mais
  cartaoMais,

  ///Cartão C&A
  cartaoC_A
}

extension CardBrandEnumExtension on CardBrandEnum {
  static Map<CardBrandEnum, int> get _values => const {
        CardBrandEnum.diners: 1,
        CardBrandEnum.masterCard: 2,
        CardBrandEnum.visa: 3,
        CardBrandEnum.others: 4,
        CardBrandEnum.americanExpress: 5,
        CardBrandEnum.hiperCard: 6,
        CardBrandEnum.aura: 7,
        CardBrandEnum.elo: 10,
        CardBrandEnum.leaderCard: 50,
        CardBrandEnum.fortbrasil: 100,
        CardBrandEnum.sorocred: 101,
        CardBrandEnum.inCash: 102,
        CardBrandEnum.cartaoMais: 103,
        CardBrandEnum.cartaoC_A: 105,
      };
  int toMap() => _values[this]!;
  static CardBrandEnum? fromMap(int? val) {
    if (val == null) return null;
    return _values.entries.firstWhere((e) => e.value == val, orElse: () => _values.entries.first).key;
  }
}

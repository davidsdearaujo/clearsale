///### Tipo pessoa (billing/shipping.type)
///https://api.clearsale.com.br/docs/total-totalGarantido-application#phone-type
enum PersonTypeEnum {
  ///Não definido
  undefined,

  ///Residencial
  residential,

  ///Comercial
  commercial,

  ///Recados
  scraps,

  ///Cobrança
  collection,

  ///Temporário
  temporary,

  ///Celular
  cellPhone,
}

extension PersonTypeEnumExtension on PersonTypeEnum {
  static Map<PersonTypeEnum, int> get _values => const {
        PersonTypeEnum.undefined: 0,
        PersonTypeEnum.residential: 1,
        PersonTypeEnum.commercial: 2,
        PersonTypeEnum.scraps: 3,
        PersonTypeEnum.collection: 4,
        PersonTypeEnum.temporary: 5,
        PersonTypeEnum.cellPhone: 6,
      };
  int toMap() => _values[this];
  static PersonTypeEnum fromMap(int val) {
    if (val == null) return null;
    return _values.entries
        .firstWhere((e) => e.value == val, orElse: () => _values.entries.first)
        .key;
  }
}

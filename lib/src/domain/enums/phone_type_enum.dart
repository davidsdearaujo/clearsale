///### Objeto phones
///**Importante**: É obrigatório o envio de pelo menos 1 telefone.
enum PhoneTypeEnum {
  ///Indefinido
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
  cell_phone,
}

extension PhoneTypeEnumExtension on PhoneTypeEnum {
  static Map<PhoneTypeEnum, int> get _values => const {
        PhoneTypeEnum.undefined: 0,
        PhoneTypeEnum.residential: 1,
        PhoneTypeEnum.commercial: 2,
        PhoneTypeEnum.scraps: 3,
        PhoneTypeEnum.collection: 4,
        PhoneTypeEnum.temporary: 5,
        PhoneTypeEnum.cell_phone: 6,
      };
  int toMap() => _values[this]!;
  static PhoneTypeEnum? fromMap(int? val) {
    if (val == null) return null;
    return _values.entries.firstWhere((e) => e.value == val, orElse: () => _values.entries.first).key;
  }
}

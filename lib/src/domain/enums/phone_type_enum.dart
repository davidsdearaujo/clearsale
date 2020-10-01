///### Objeto phones
///**Importante**: É obrigatório o envio de pelo menos 1 telefone.
enum PhoneTypeEnum {
  ///Pessoa Física
  physicalPhone,

  ///Pessoa Jurídica
  legalEntity,
}

extension PhoneTypeEnumExtension on PhoneTypeEnum {
  static Map<PhoneTypeEnum, int> get _values => const {
        PhoneTypeEnum.physicalPhone: 1,
        PhoneTypeEnum.legalEntity: 2,
      };
  int toMap() => _values[this];
  static PhoneTypeEnum fromMap(int val) {
    if (val == null) return null;
    return _values.entries
        .firstWhere((e) => e.value == val, orElse: () => _values.entries.first)
        .key;
  }
}

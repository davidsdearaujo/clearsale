///### Tipo pessoa (billing/shipping.type)
///https://api.clearsale.com.br/docs/total-totalGarantido-application#person-type
enum PersonTypeEnum {
  ///Pessoa Física
  individual_person,

  ///Pessoa Jurídica
  corporate_entity,
}

extension PersonTypeEnumExtension on PersonTypeEnum {
  static Map<PersonTypeEnum, int> get _values => const {
        PersonTypeEnum.individual_person: 1,
        PersonTypeEnum.corporate_entity: 2,
      };
  int toMap() => _values[this]!;
  static PersonTypeEnum? fromMap(int? val) {
    if (val == null) return null;
    return _values.entries.firstWhere((e) => e.value == val, orElse: () => _values.entries.first).key;
  }
}

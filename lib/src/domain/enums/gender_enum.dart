///Tipo de sexo (billing/shipping.gender)
enum GenderEnum {
  ///Masculino
  male,

  ///Feminino
  female,
}

extension GenderEnumExtension on GenderEnum {
  static Map<GenderEnum, String> get _values => const {
        GenderEnum.male: "M",
        GenderEnum.female: "F",
      };
  String toMap() => _values[this];
  static GenderEnum fromMap(String val) {
    if (val == null) return null;
    return _values.entries
        .firstWhere((e) => e.value == val, orElse: () => _values.entries.first)
        .key;
  }
}

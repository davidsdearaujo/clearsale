///Tipo de sexo (billing/shipping.gender)
enum GenderEnum {
  ///Masculino
  male,

  ///Feminino
  female,
}

extension GenderEnumExtension on GenderEnum {
  Map<GenderEnum, String> get _values => const {
        GenderEnum.male: "M",
        GenderEnum.female: "F",
      };
  String toMap() => _values[this];
}

///### Objeto phones
///**Importante**: É obrigatório o envio de pelo menos 1 telefone.
enum PhoneTypeEnum {
  ///Pessoa Física
  physicalPhone,

  ///Pessoa Jurídica
  legalEntity,
}

extension PhoneTypeEnumExtension on PhoneTypeEnum {
  Map<PhoneTypeEnum, int> get _values => const {
        PhoneTypeEnum.physicalPhone: 1,
        PhoneTypeEnum.legalEntity: 2,
      };
  int toMap() => _values[this];
}

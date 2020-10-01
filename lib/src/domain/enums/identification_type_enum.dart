///### Tipo de identificação (passanger.identificationType)
///https://api.clearsale.com.br/docs/total-totalGarantido-application#identification-type
enum IdentificationTypeEnum {
  ///(CPF) Cadastro de Pessoas Físicas
  cpf,

  ///(CNPJ) Cadastro Nacional da Pessoa Jurídica
  cnpj,

  ///(RG) Registro Geral
  rg,

  ///Inscrição Estadual
  ie,

  ///Passaporte
  passport,

  ///Carteira de Trabalho e Previdência Social
  ctps,

  ///Título Eleitor
  voterTitle
}

extension IdentificationTypeEnumExtension on IdentificationTypeEnum {
  static Map<IdentificationTypeEnum, int> get _values => const {
        IdentificationTypeEnum.cpf: 1,
        IdentificationTypeEnum.cnpj: 2,
        IdentificationTypeEnum.rg: 3,
        IdentificationTypeEnum.ie: 4,
        IdentificationTypeEnum.passport: 5,
        IdentificationTypeEnum.ctps: 6,
        IdentificationTypeEnum.voterTitle: 7,
      };
  int toMap() => _values[this];
  static IdentificationTypeEnum fromMap(int val) {
    if (val == null) return null;
    return _values.entries
        .firstWhere((e) => e.value == val, orElse: () => _values.entries.first)
        .key;
  }
}

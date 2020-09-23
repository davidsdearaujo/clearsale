///Tipo de lista (order.list.typeID)
enum ListTypeEnum {
  ///Lista Não Cadastrada
  unregistered,

  ///Lista de chá de bebê
  babyTea,

  ///Lista de Casamento
  marriage,

  ///Lista de Desejos
  wishlist,

  ///Lista de Aniversário
  birthday,

  ///Chá de Panela
  bridalShower
}

extension ListTypeEnumExtension on ListTypeEnum {
  Map<ListTypeEnum, int> get _values => const {
        ListTypeEnum.unregistered: 1,
        ListTypeEnum.babyTea: 2,
        ListTypeEnum.marriage: 3,
        ListTypeEnum.wishlist: 4,
        ListTypeEnum.birthday: 5,
        ListTypeEnum.bridalShower: 6,
      };
  int toMap() => _values[this];
}

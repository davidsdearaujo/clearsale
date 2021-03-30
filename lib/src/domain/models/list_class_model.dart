import '../enums/list_type_enum.dart';

export '../enums/list_type_enum.dart';

class ListClassModel {
  ListTypeEnum? typeId;
  String id;

  ListClassModel({
    this.typeId,
    required this.id,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ListClassModel && o.typeId == typeId && o.id == id;
  }

  @override
  int get hashCode => typeId.hashCode ^ id.hashCode;

  @override
  String toString() => 'ListClassModel(typeId: $typeId, id: $id)';

  ListClassModel copyWith({
    ListTypeEnum? typeId,
    String? id,
  }) {
    return ListClassModel(
      typeId: typeId ?? this.typeId,
      id: id ?? this.id,
    );
  }
}

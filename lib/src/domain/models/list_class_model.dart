import 'package:meta/meta.dart';

import '../enums/list_type_enum.dart';

class ListClassModel {
  ListClassModel({
    @required this.typeId,
    @required this.id,
  });

  ListTypeEnum typeId;
  String id;
}

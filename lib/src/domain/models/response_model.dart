class ResponseModel<T> {
  final String? requestId;
  final T? data;

  ResponseModel({this.requestId, this.data});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ResponseModel<T> && o.requestId == requestId && o.data == data;
  }

  @override
  int get hashCode => requestId.hashCode ^ data.hashCode;

  @override
  String toString() => 'ResponseModel(requestId: $requestId, data: $data)';
}

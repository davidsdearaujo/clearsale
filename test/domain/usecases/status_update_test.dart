import 'package:clearsale/src/domain/errors/usecases.dart';
import 'package:clearsale/src/domain/models/message_model.dart';
import 'package:clearsale/src/domain/models/response_model.dart';
import 'package:clearsale/src/domain/repositories/guarantee_repository.dart';
import 'package:clearsale/src/domain/usecases/status_update.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockGaranteeRepository extends Mock implements GuaranteeRepository {}

void main() {
  late MockGaranteeRepository repository;
  late StatusUpdate usecase;
  setUp(() {
    repository = MockGaranteeRepository();
    usecase = StatusUpdate(repository);
  });

  final successResponse = ResponseModel(
    data: MessageModel(
      status: "ok",
      message: "success",
    ),
  );
  test("success", () async {
    when(() => repository.statusUpdate(any(), any())).thenAnswer((realInvocation) async => right(successResponse));
    final response = await usecase("mock-code", "APR");
    expect(response.fold(id, id), successResponse);
  });

  group("InvalidFieldFailure", () {
    group("analysisRequestCode", () {
      // Não pode ser nulo
      // test("null", () async {
      //   ;
      //   when(() => repository.statusUpdate(any(), any()))
      //       .thenAnswer((realInvocation) async => right(successResponse));
      //   final response =
      //       await usecase(null, "APR").then((value) => value.fold(id, id));
      //   expect(response, InvalidFieldFailure("analysisRequestCode"));
      // });
      test("empty", () async {
        ;
        when(() => repository.statusUpdate(any(), any())).thenAnswer((realInvocation) async => right(successResponse));
        final response = await usecase("", "APR").then((value) => value.fold(id, id));
        expect(response, InvalidFieldFailure("analysisRequestCode"));
      });
    });
    // Não pode ser nulo
    // group("analysisNewStatusCode", () {
    //   test("null", () async {
    //     ;
    //     when(() => repository.statusUpdate(any(), any()))
    //         .thenAnswer((realInvocation) async => right(successResponse));
    //     final response = await usecase("mock-code", null)
    //         .then((value) => value.fold(id, id));
    //     expect(response, InvalidFieldFailure("analysisNewStatusCode"));
    //   });
    // });
  });
}

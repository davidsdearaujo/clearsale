# clearsale
Esse package é a de integração com a aplicação **Total - Total Garantido** da Clearsale.
Código baseado na [documentação oficial](https://api.clearsale.com.br/docs/total-totalGarantido-application#billing-object).

## Arquitetura
O código desse package segue o padrão do Clean Dart, uma proposta de implementação do Clean Architeture para Dart [[doc]](https://github.com/flutterando/clean-dart)

## import
pubspec.yaml
```yaml
dependencies:
  clearsale: <last version>
```
```dart
import 'package:clearsale/clearsale.dart';
```

## Autenticação
A autenticação é baseada em dois parâmetros, `name` e `password`;
Esses parâmetros são recebidos no construtor da classe `ClearSale`:
```dart
final clearsale = ClearSale(
    userName: "username", 
    password: "password",
);
```

É possível realizar a autenticação de duas maneiras:

 - No construtor
```dart
final clearsale = ClearSale(
    userName: "username", 
    password: "password",
    automaticAuthenticate: true,
);
```

 - Método `authenticate`
```dart
final clearsale = ClearSale(
    userName: "username", 
    password: "password",
    automaticAuthenticate: false,
);
clearsale.authenticate();
```
**NOTA:** A autenticação no construtor é realizada por padrão caso a propriedade `automaticAuthenticate` não seja informada.

## Ações
O package permite realizar as seguintes ações:

|Método|Descrição|
|---|---|
|analysisRequest|Solicitação de análise|
|reanalysisRequest|Solicitação de reanálise|
|chargebackMarking|Marcação de estorno|
|statusConsult|Consulta de status de uma solicitação|
|statusUpdate|Alteração de status de uma solicitação. Importante: Os status de atualização devem ser combinados com a equipe de integração.|

## Fingerprint
O campo `sessionID` do objeto `AnalysisRequestModel` (utilizado nas ações de Análise e Reanálise) deve ser preenchido com a fingerprint do dispositivo.

O package para gerar esse código está sendo desenvolvido.

## Resiliência de autenticação
Esse é o fluxo de autenticação executado em todas as ações:

![image](https://user-images.githubusercontent.com/16373553/94909391-77a83b80-0479-11eb-97b9-4bace08d2ffd.png)

## Erros Tratados
Todos os erros recebem por herança a estrutura da classe `Failure`, que tem 3 propriedades principais:
 - `code`: Código para identificar o erro;
 - `message`: Mensagem padrão do erro;
 - `innerException`: Exceção que causou o erro;

## Esses são os erros tratados:

### Validação de parâmetros
|Código|Erro|Mensagem|Descrição|
|---|---|---|---|
|null-token-failure|`NullTokenFailure`|`É necessário preencher o token para continuar.`|Token nulo|
|empty-token-failure|`EmptyTokenFailure`|`É necessário preencher o token para continuar.`|Token vazio|
|invalid-field-${fieldName}-failure|`InvalidFieldFailure`|`É necessário preencher o campo $fieldName para continuar.`|Algum parâmetro informado está vazio ou nulo|

<br/>

### Tratamento retorno Clearsale
|Código|Erro|Mensagem|Descrição|
|---|---|---|---|
|empty-datasource-response|`EmptyDatasourceResponseFailure`|`Endereço não encontrado`|Clearsale não encontrou nenhum endereço|
|null-datasource-response|`NullDatasourceResponseFailure`|null|Clearsale não retornou nada no body do response|
|endpoint-message-failure|`EndpointMessageFailure`|Mensagem de erro retornada pelo endpoint|Erro tratado pela Clearsale. Tem a propriedade `status` com o status do erro.|
|endpoint-invalid-statuscode-failure|`EndpointInvalidStatusCodeFailure`|null|Resposta não tratada pelo package. Tem as propriedades `int statusCode` e `String body`.|

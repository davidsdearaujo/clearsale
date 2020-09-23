///### Objeto hotels
///https://api.clearsale.com.br/docs/total-totalGarantido-application#hotels-object
class HotelModel {
  HotelModel({
    this.name,
    this.city,
    this.state,
    this.country,
    this.reservationDate,
    this.reserveExpirationDate,
    this.checkInDate,
    this.checkOutDate,
  });

  ///Nome do Hotel (tamanho 200)
  String name;

  ///Cidade (tamanho 150)
  String city;

  ///Estado (tamanho 150)
  String state;

  ///País (tamanho 150)
  String country;

  ///Data da Reserva
  DateTime reservationDate;

  ///Data da Expiração da Reserva
  DateTime reserveExpirationDate;

  ///Data da Chegada
  DateTime checkInDate;

  ///Data da Saída
  DateTime checkOutDate;
}

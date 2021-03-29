///### Objeto hotels
///https://api.clearsale.com.br/docs/total-totalGarantido-application#hotels-object
class HotelModel {
  ///Nome do Hotel (tamanho 200)
  String? name;

  ///Cidade (tamanho 150)
  String? city;

  ///Estado (tamanho 150)
  String? state;

  ///País (tamanho 150)
  String? country;

  ///Data da Reserva
  DateTime? reservationDate;

  ///Data da Expiração da Reserva
  DateTime? reserveExpirationDate;

  ///Data da Chegada
  DateTime? checkInDate;

  ///Data da Saída
  DateTime? checkOutDate;

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

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HotelModel && o.name == name && o.city == city && o.state == state && o.country == country && o.reservationDate == reservationDate && o.reserveExpirationDate == reserveExpirationDate && o.checkInDate == checkInDate && o.checkOutDate == checkOutDate;
  }

  @override
  int get hashCode {
    return name.hashCode ^ city.hashCode ^ state.hashCode ^ country.hashCode ^ reservationDate.hashCode ^ reserveExpirationDate.hashCode ^ checkInDate.hashCode ^ checkOutDate.hashCode;
  }

  @override
  String toString() {
    return 'HotelModel(name: $name, city: $city, state: $state, country: $country, reservationDate: $reservationDate, reserveExpirationDate: $reserveExpirationDate, checkInDate: $checkInDate, checkOutDate: $checkOutDate)';
  }
}

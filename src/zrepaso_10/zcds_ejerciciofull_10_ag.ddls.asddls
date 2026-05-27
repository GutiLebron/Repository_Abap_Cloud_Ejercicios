@AbapCatalog.sqlViewName: 'ZCDS_COMPLETO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ejercicio de vistas completo'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS_EJERCICIOFULL_10_AG
  as select from /dmo/flight     as flight
    inner join   /dmo/carrier    as carrier on carrier.carrier_id = flight.carrier_id
    inner join   /dmo/connection as conn    on  conn.carrier_id    = flight.carrier_id
                                            and conn.connection_id = flight.connection_id
{

  key flight.carrier_id,
  key flight.connection_id,
  key flight.flight_date,

      flight.currency_code                        as CurrencyCode,
      carrier.name                                as CarrierName,

      conn.airport_from_id                        as AirportFrom,
      conn.airport_to_id                          as AirportTo,
      conn.departure_time                         as DepartureTime,
      conn.arrival_time                           as ArrivalTime,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight.price                                as price,
      //Precio con descuento
      division( flight.price * 80, 100, 2 )       as PriceWithDiscount,
      //Dinero descontado TRABAJO CON CASTEO Y DIVISION
      cast(flight.price as abap.decfloat16) -
      (   division( flight.price * 80, 100, 2 ) ) as DiscountAmount,
      // TRABAJO CON CONCAT
      concat_with_space(
      conn.airport_from_id,
      concat('->', conn.airport_to_id),
      1 )                                         as Text,
      // USO DE CASES PARA MOSTRAR VALORES
      case
      when flight.price < 300 then 'BARATO'
      when flight.price between 300 and 700 then 'MEDIO'
      when flight.price > 700 then 'CARO'
      else '-'
      end                                         as PriceCategory
     
}

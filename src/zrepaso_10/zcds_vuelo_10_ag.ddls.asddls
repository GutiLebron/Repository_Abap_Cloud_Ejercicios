@AbapCatalog.sqlViewName: 'ZCDS_CAMCALC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Campos calculados'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS_VUELO_10_AG
  as select from /dmo/flight  as flight
    join         /dmo/carrier as carrier on flight.carrier_id = carrier.carrier_id
{
  flight.carrier_id,
  carrier.name,
  flight.price,
  division( flight.price * 80, 100, 2 )                as precio_descuento,
  flight.price - division( flight.price * 80, 100, 2 ) as dinero_descontado,

  case flight.currency_code
  when 'EUR' then 'Europa'
  else 'Resto del mundo'
  end                                                  as moneda

}

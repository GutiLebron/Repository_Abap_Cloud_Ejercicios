@AbapCatalog.sqlViewName: 'ZCDS_GROUPBY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fucniones de agrupación en vistas'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS_VUE_10_AG
  as select from /dmo/flight
{
  //TRABAJO CON AGRUPACION EN VISTA Y FUNCIONES DE AGRUPACIÓN
  carrier_id,
  currency_code,
  //  MEDIA DE PRICE
  avg( price as abap.dec(16,2) ) as precio_medio,
  // SUMA TOTAL
  sum ( price )                  as suma_precio,
  // PRECIO MÁXIMO
  max( price )                   as precio_maximo,
  // PRECIO MINIMO
  min( price )                   as precio_minimo,
  // NUM VUELOS
  count( * )                     as total_vuelos

}
group by
  carrier_id,
  currency_code

@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZPLAYERS_10_AG'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_PLAYERS_10_AG
  as select from zplayers_10_ag
{
  key idplayer as Idplayer,
  apellidos as Apellidos,
  nombre as Nombre,
  demarcacion as Demarcacion,
  salario as Salario,
  inicio_contrato as InicioContrato,
  fin_contrato as FinContrato,  
  estado as Estado,
  ingresos_venta as IngresosVenta,
  gasto_compra as GastoCompra,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
}

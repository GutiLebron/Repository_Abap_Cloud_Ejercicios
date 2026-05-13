@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_PLAYERS_10_AG
  provider contract transactional_query
  as projection on ZR_PLAYERS_10_AG
  association [1..1] to ZR_PLAYERS_10_AG as _BaseEntity on $projection.Idplayer = _BaseEntity.Idplayer
{
  key Idplayer,
  Apellidos,
  Nombre,

  @UI.selectionField: [{ position: 10 }]
  @UI.lineItem: [{ position: 10 }]
  Demarcacion,
  Salario,
  InicioContrato,
  FinContrato,
  
  @UI.selectionField: [{ position: 40 }]
  @UI.lineItem: [{ position: 40 }]
  Estado,
  IngresosVenta,
  GastoCompra,
  @Semantics: {
    user.createdBy: true
  }
  CreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  CreatedAt,
  @Semantics: {
    user.lastChangedBy: true
  }
  LastChangedBy,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LastChangedAt,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChangedAt,
  _BaseEntity
}

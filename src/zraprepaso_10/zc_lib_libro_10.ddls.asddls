@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZLIB_LIBRO_10'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_LIB_LIBRO_10
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_LIB_LIBRO_10
  association [1..1] to ZR_LIB_LIBRO_10 as _BaseEntity on $projection.LIBROID = _BaseEntity.LIBROID
{
  key LibroID,
  Titulo,
  Autor,
  Genero,
  NumPaginas,
  Disponible,
  Estado,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Lastchangedby: true
  }
  LastChangedBy,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  _BaseEntity
}

@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZLIB_LIBRO_10'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_LIB_LIBRO_10
  as select from ZLIB_LIBRO_10
{
  key libro_id as LibroID,
  titulo as Titulo,
  autor as Autor,
  genero as Genero,
  num_paginas as NumPaginas,
  disponible as Disponible,
  estado as Estado,
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

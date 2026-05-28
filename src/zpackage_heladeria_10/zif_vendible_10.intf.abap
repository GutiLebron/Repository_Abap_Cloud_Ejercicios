INTERFACE zif_vendible_10
  PUBLIC .

  METHODS calcular_precio
    RETURNING
      VALUE(rt_precio) TYPE decfloat16.

  METHODS describir
    RETURNING
      VALUE(rt_descripcion) TYPE string.

ENDINTERFACE.

CLASS zcl_caja_registradora_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

METHODS:
agregar_producto
  IMPORTING
    i_producto TYPE REF TO zif_vendible_10,

calcular_total
  RETURNING
    VALUE(rv_total) TYPE decfloat16,

listar_productos
    RETURNING
        VALUE(rv_descripciones) type string.


  PROTECTED SECTION.
  PRIVATE SECTION.
  "Puedo crear una tabla interna que haga referencia o a la interfaz o a la clase común
  DATA lt_productos_helados TYPE TABLE OF REF TO zif_vendible_10.
  DATA lt_descripciones TYPE STANDARD TABLE OF string.

ENDCLASS.



CLASS zcl_caja_registradora_10 IMPLEMENTATION.
  METHOD agregar_producto.
    APPEND i_producto TO me->lt_productos_helados.
  ENDMETHOD.

  METHOD calcular_total.

    DATA lcl_producto type ref to zif_vendible_10.

    LOOP AT lt_productos_helados INTO DATA(producto).
      rv_total = rv_total + lcl_producto->calcular_precio( ).
    ENDLOOP.

  ENDMETHOD.

  METHOD listar_productos.


    LOOP AT lt_productos_helados INTO DATA(producto).

      DATA lcl_producto type ref to zif_vendible_10.
      rv_descripciones = lcl_producto->describir( ).
      APPEND rv_descripciones TO me->lt_descripciones.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

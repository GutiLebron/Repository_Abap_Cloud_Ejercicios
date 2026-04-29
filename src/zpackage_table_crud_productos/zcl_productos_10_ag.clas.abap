CLASS zcl_productos_10_ag DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
*CREACIÓN DE TIPO DE TABLA AUXILIAR
    TYPES type_tabla TYPE TABLE OF zproductos_10_ag WITH EMPTY KEY.

    METHODS:

*MÉTODO QUE INSERTA UNA ESTRUCTURA Y DEVUELVE UN BOOL PARA VALIDAR
      insertar
        IMPORTING i_ls_registro TYPE zproductos_10_ag
        EXPORTING o_valido      TYPE abap_bool,

*MÉTODO QUE BUSCA UN REGISTRO INSERTANDO UN ID POR PARÁMETROS
*DEVUELVE UN BOOL PARA VALIDAR LA OPERACIÓN
      buscar_por_id
        IMPORTING
          i_id_producto TYPE i
        EXPORTING
          e_ls_registro TYPE zproductos_10_ag
          o_valido      TYPE abap_bool,

*MÉTODO QUE MODIFICA UNA ESTRUCTURA Y DEVUELVE UN BOOL PARA VALIDAR
      modificar
        IMPORTING
          i_ls_registro TYPE zproductos_10_ag
        EXPORTING
          o_valido      TYPE abap_bool,

*MÉTODO QUE BORRA UN REGISTRO INSERTANDO UN ID POR PARÁMETROS
*DEVUELVE UN BOOL PARA VALIDAR LA OPERACIÓN
      borrar
        IMPORTING
          i_id_borrado TYPE i
        EXPORTING
          o_valido     TYPE abap_bool,

*MÉTODO QUE USA UNA TABLA INTERNA AUXILIAR PARA
*HACER EL RETURNING DE LOS DATOS Y QUE PUEDAN SER
*CAPTURADOS POR UNA TABLA INTERNA Y PODER SER LEÍDA
      mostrar_todos
        RETURNING VALUE(r_lt_tabla) TYPE type_tabla.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_productos_10_ag IMPLEMENTATION.

  METHOD insertar.
    INSERT zproductos_10_ag FROM @i_ls_registro.
    IF sy-subrc = 0.
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD buscar_por_id.
    SELECT SINGLE *
    FROM zproductos_10_ag
    WHERE id = @i_id_producto
    INTO @e_ls_registro.
    IF sy-subrc = 0.
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD modificar.
    UPDATE zproductos_10_ag FROM @i_ls_registro.
    IF sy-subrc = 0.
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD borrar.
    DELETE FROM zproductos_10_ag WHERE id = @i_id_borrado.
    IF sy-subrc = 0.
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD mostrar_todos.
    SELECT * FROM zproductos_10_ag INTO TABLE @r_lt_tabla.
  ENDMETHOD.



ENDCLASS.

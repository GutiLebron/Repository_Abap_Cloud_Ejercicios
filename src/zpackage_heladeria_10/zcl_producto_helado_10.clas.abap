CLASS zcl_producto_helado_10 DEFINITION
  ABSTRACT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_vendible_10.

    METHODS:

      constructor
        IMPORTING
          i_nombre      TYPE string
          i_precio_base TYPE decfloat16
        RAISING
          zcx_producto_invalido_10_ag,

      get_info
        EXPORTING
          o_nombre TYPE string
          o_fecha  TYPE d,

      get_date
        RETURNING
          VALUE(rt_fecha) TYPE d,

      get_tipo ABSTRACT
        RETURNING
          VALUE(rt_tipo_producto) TYPE string.

  PROTECTED SECTION.
    DATA:
      nombre_producto TYPE string,
      precio_base     TYPE decfloat16.
  PRIVATE SECTION.
    DATA:
        fecha_creacion TYPE d.

ENDCLASS.



CLASS zcl_producto_helado_10 IMPLEMENTATION.

  "CONSTRUCTOR MARCA LA FECHA SEGÚN LA INSTANCIACIÓN"
  METHOD constructor.
    IF i_precio_base <= 0.
      RAISE EXCEPTION TYPE zcx_producto_invalido_10_ag
        EXPORTING
          i_textid = zcx_producto_invalido_10_ag=>precio_invalido.
    ENDIF.
    me->fecha_creacion = cl_abap_context_info=>get_system_date( ).
    me->nombre_producto = i_nombre.
    me->precio_base = i_precio_base.
  ENDMETHOD.

  "MÉTODO AUXILIAR PARA OBTENER LA FECHA"
  METHOD get_date.
    rt_fecha = me->fecha_creacion.
  ENDMETHOD.


  METHOD get_info.
    o_nombre = me->nombre_producto.
    o_fecha = get_date(  ).
  ENDMETHOD.


  "Método de la interfaz"
  METHOD zif_vendible_10~calcular_precio.

  ENDMETHOD.


  "Método de la interfaz"
  METHOD zif_vendible_10~describir.

  ENDMETHOD.

ENDCLASS.

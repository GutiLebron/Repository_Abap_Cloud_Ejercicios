CLASS zcl_tarta_helada_10 DEFINITION
  INHERITING FROM zcl_producto_helado_10
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      constructor
        IMPORTING
          i_nombre          TYPE string
          i_precio_base     TYPE decfloat16
          i_numero_raciones TYPE i
          i_sabor_especial  TYPE abap_bool,
      		
      zif_vendible_10~calcular_precio REDEFINITION,

      zif_vendible_10~describir REDEFINITION,

      get_tipo REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
      numero_raciones TYPE i,
      sabor_especial  TYPE abap_bool.

ENDCLASS.



CLASS zcl_tarta_helada_10 IMPLEMENTATION.

  METHOD constructor.
    super->constructor(
        i_nombre = i_nombre
        i_precio_base   = i_precio_base ).
    me->numero_raciones = i_numero_raciones.
    me->sabor_especial = i_sabor_especial.
  ENDMETHOD.


  METHOD get_tipo.
    rt_tipo_producto = cl_abap_classdescr=>get_class_name( me ).
  ENDMETHOD.

  METHOD zif_vendible_10~calcular_precio.
    rt_precio = me->precio_base * me->numero_raciones.
    IF me->numero_raciones > 8.
      rt_precio = rt_precio * '0.9'.
    ENDIF.
  ENDMETHOD.

  METHOD zif_vendible_10~describir.
    DATA(lv_full) = get_tipo( ).
    DATA(lv_len)  = strlen( lv_full ).

    DATA(lv_tipo_limpio) = substring(
                              val = lv_full
                              off = 11       " saltar 'ZCL_'
*                            len = lv_len - 7 " quitar '_10'
                           ).
    rt_descripcion =
      |{ me->nombre_producto } es un { lv_tipo_limpio } sabor { me->sabor_especial } compró { me->numero_raciones } raciones |.

  ENDMETHOD.

ENDCLASS.

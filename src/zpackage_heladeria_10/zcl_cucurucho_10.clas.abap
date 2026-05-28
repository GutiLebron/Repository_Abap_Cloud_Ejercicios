CLASS zcl_cucurucho_10 DEFINITION
    INHERITING FROM zcl_producto_helado_10
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
        constructor
            IMPORTING
                i_nombre              TYPE string
                i_precio_base         TYPE decfloat16
                i_numero_bolas        TYPE i
                i_barquillo_chocolate TYPE abap_bool,

        get_tipo REDEFINITION,

        zif_vendible_10~calcular_precio REDEFINITION,

        zif_vendible_10~describir REDEFINITION.


  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
      numero_bolas        TYPE i,
      barquillo_chocolate TYPE abap_bool.
"constructor
"get_tipo
"calcular_precio
"describir nombre y tipo de producto

ENDCLASS.



CLASS zcl_cucurucho_10 IMPLEMENTATION.

"Metodo constructor heredado"
METHOD constructor.
    super->constructor(
        i_nombre = i_nombre
        i_precio_base = i_precio_base
        ).
    me->numero_bolas        = i_numero_bolas.
    me->barquillo_chocolate = i_barquillo_chocolate.
ENDMETHOD.

"Método Abstracto de clase Abstracta"
  METHOD get_tipo.
    rt_tipo_producto = cl_abap_classdescr=>get_class_name( me ).
  ENDMETHOD.


  "METODOS DE LA INTERFACE QUE REDEFINO"

  METHOD zif_vendible_10~calcular_precio.
    rt_precio = me->precio_base + ( me->numero_bolas * '0.5' ).
    IF barquillo_chocolate.
        rt_precio = rt_precio + '0.3'.
    ENDIF.

  ENDMETHOD.

 METHOD zif_vendible_10~describir.

  DATA(lv_full) = get_tipo( ).          "ZCL_CUCURUCHO_10
  DATA(lv_len)  = strlen( lv_full ).

  DATA(lv_tipo_limpio) = substring(
                            val = lv_full
                            off = 11       " saltar 'ZCL_'
*                            len = lv_len - 7 " quitar '_10'
                         ).
  rt_descripcion =
    |{ me->nombre_producto } es un { lv_tipo_limpio } con { me->numero_bolas } bolas y { COND string( WHEN barquillo_chocolate = abap_true THEN 'tiene' ELSE 'no tiene' ) } barquillo de chocolate|.

ENDMETHOD.

ENDCLASS.

CLASS zcl_granizado_10 DEFINITION
    INHERITING FROM zcl_producto_helado_10
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    METHODS:
      constructor
        IMPORTING
          i_nombre      TYPE string
          i_precio_base TYPE decfloat16
          i_tipo_fruta  TYPE string
          i_tamanyo     TYPE zde_tamano_granizado_10
          RAISING
            zcx_producto_invalido_10_ag,

      get_tipo REDEFINITION,

      zif_vendible_10~calcular_precio REDEFINITION,

      zif_vendible_10~describir REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
      tipo_fruta TYPE string,
      tamanyo    TYPE zde_tamano_granizado_10.

ENDCLASS.



CLASS zcl_granizado_10 IMPLEMENTATION.

  METHOD constructor.

    super->constructor(
        i_nombre = i_nombre
        i_precio_base   = i_precio_base ).
    me->tipo_fruta = i_tipo_fruta.
    me->tamanyo = i_tamanyo.


  ENDMETHOD.


  METHOD get_tipo.
    rt_tipo_producto = cl_abap_classdescr=>get_class_name( me ).
  ENDMETHOD.


  METHOD zif_vendible_10~calcular_precio.
    CASE me->tamanyo.
      	WHEN 'p'.
        	    rt_precio = me->precio_base.
      	WHEN 'm'.
        	    rt_precio = me->precio_base * '1.3'.
      	WHEN 'g'.
        	    rt_precio = me->precio_base * '1.6'.
      	WHEN OTHERS.
        rt_precio = me->precio_base.
    	ENDCASE.
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
      |{ me->nombre_producto } es un { lv_tipo_limpio } sabor { me->tipo_fruta } tamaño { me->tamanyo } |.

  ENDMETHOD.

ENDCLASS.

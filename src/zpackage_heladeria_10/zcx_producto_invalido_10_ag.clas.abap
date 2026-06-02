CLASS zcx_producto_invalido_10_ag DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CONSTANTS:
        precio_invalido TYPE string value 'PRECIO_INVALIDO',
        bolas_invalidas TYPE string value 'BOLAS_INVALIDAS',
        raciones_invalidas TYPE string value 'RACIONES_INVALIDAS'.

      methods            constructor
                   IMPORTING
                     i_textid TYPE string OPTIONAL
                     i_mensaje TYPE string OPTIONAL
                     previous TYPE REF TO cx_root OPTIONAL.

    DATA mv_mensaje TYPE string READ-ONLY.

ENDCLASS.

CLASS zcx_producto_invalido_10_ag IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    case i_textid.
        when precio_invalido.
            mv_mensaje = 'El precio base no puede ser negativo o cero'.
        when bolas_invalidas.
            mv_mensaje = 'El numero de bolas no puede ser negativo o cero'.
        when raciones_invalidas.
            mv_mensaje = 'El numero de raciones no puede ser negativo o cero'.
        when others.
            mv_mensaje = i_mensaje.
    endcase.
  ENDMETHOD.
ENDCLASS.

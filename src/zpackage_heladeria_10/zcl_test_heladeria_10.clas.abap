CLASS zcl_test_heladeria_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_heladeria_10 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lv_nombre TYPE string.
    DATA lv_fecha TYPE d.
    out->write( 'DEBE SALTA EXCEPCION' ).
**********************************************************************
*CONTROLO LAS DOS EXCEPCIONES
**********************************************************************
    out->write( 'DEBE SALTA EXCEPCION' ).
    TRY.
        DATA(lcl_heladoCucurucho2) = NEW zcl_cucurucho_10(
        i_nombre = 'Dos Sabores'
        i_precio_base = '0'
        i_numero_bolas = 1
        i_barquillo_chocolate = abap_true ).
      CATCH zcx_producto_invalido_10_ag INTO DATA(lx_error).
        out->write( lx_error->mv_mensaje ).
    ENDTRY.

    TRY.
        DATA(lcl_heladoCucurucho) = NEW zcl_cucurucho_10(
        i_nombre = 'Dos Sabores'
        i_precio_base = '2.50'
        i_numero_bolas = 0
        i_barquillo_chocolate = abap_true ).
      CATCH zcx_producto_invalido_10_ag INTO DATA(lx_error2).
        out->write( lx_error2->mv_mensaje ).

    ENDTRY.

    OUT->WRITE( 'CREACIÓN CUCURUCHO CORRECTA' ).
    TRY.
    DATA(lcl_heladoCucuruchoCorrecto) = new zcl_cucurucho_10(
        i_nombre = 'dos Sabores'
        i_precio_base = '2.50'
        i_numero_bolas = 1
        i_barquillo_chocolate = abap_true ).
     CATCH zcx_producto_invalido_10_ag.
        out->write( lx_error->mv_mensaje ).
        out->write( lx_error2->mv_mensaje ).
     ENDTRY.
    lv_nombre = lcl_heladoCucuruchoCorrecto->get_tipo( ).
    out->write( lv_nombre ).
    out->write( lcl_heladoCucuruchoCorrecto->get_date( ) ).


  ENDMETHOD.
ENDCLASS.

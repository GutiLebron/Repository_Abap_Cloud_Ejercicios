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

**********************************************************************
*COMIENZO INSTANCIANDO LA CAJA REGISTRADORA QUE NOS AYUDARÁ CON NUESTRO PROGRAMA
**********************************************************************
    DATA(lcl_cajaRegistradora) = NEW zcl_caja_registradora_10(  ).

**********************************************************************
*CONTROLO LAS DOS EXCEPCIONES
**********************************************************************
    out->write( 'CUCURUCHO UN MENSAJE EN CATCH' ).
    TRY.
        DATA(lcl_heladoCucurucho2) = NEW zcl_cucurucho_10(
        i_nombre = 'Dos Sabores'
        i_precio_base = '0'
        i_numero_bolas = 1
        i_barquillo_chocolate = abap_true ).
      CATCH zcx_producto_invalido_10_ag INTO DATA(lx_err)."CREA AL VUELO LA VARIABLE LX_ERR
        IF lx_err->mt_errores IS INITIAL."EN CASO DE MT_ERRORES ESTAR VACIO
          out->write( lx_err->mv_mensaje )."USA LA VARIABLE DE LA EXCEPCIÓN MV_MENSAJE PARA DEVOLVER UN SOLO MENSAJE
        ELSE.
          LOOP AT lx_err->mt_errores INTO DATA(lv_err)."EN CASO DE TENER MAS ERRORES EN LA TABLA INTERNA
            out->write( lv_err )."RECORRE LA TABLA INTERNA Y DEVUELVE ERORES
          ENDLOOP.
        ENDIF.
    ENDTRY.

    out->write( 'CUCURUCHO DOS MENSAJES' ).
    TRY.
        DATA(lcl_heladoCucurucho) = NEW zcl_cucurucho_10(
        i_nombre = 'Dos Sabores'
        i_precio_base = '0'
        i_numero_bolas = 0
        i_barquillo_chocolate = abap_true ).
      CATCH zcx_producto_invalido_10_ag INTO DATA(lx_err1).
        IF lx_err1->mt_errores IS INITIAL.
          out->write( lx_err1->mv_mensaje ).
        ELSE.
          LOOP AT lx_err1->mt_errores INTO DATA(lv_err1).
            out->write( lv_err1 ).
          ENDLOOP.
        ENDIF.
    ENDTRY.

    out->write( 'SALTA EXCEPCIÓN EN GRANIZADO' ).
    TRY.
        DATA(lcl_granizado) = NEW zcl_granizado_10(
            i_nombre = 'Granizado'
            i_precio_base = '-1'
            i_tipo_fruta = 'Limón'
            i_tamanyo = 'p'
         ).
      CATCH zcx_producto_invalido_10_ag INTO DATA(lx_err2).
        IF lx_err2->mt_errores IS INITIAL.
          out->write( lx_err2->mv_mensaje ).
        ELSE.
          LOOP AT lx_err2->mt_errores INTO DATA(lv_err2).
            out->write( lv_err2 ).
          ENDLOOP.
        ENDIF.
    ENDTRY.

    out->write( 'SALTA EXCEPCIÓN EN TARTA HELADA 2 MENSAJES' ).
    TRY.
        DATA(lcl_tartaHeladaExcepion) = NEW zcl_tarta_helada_10(
            i_nombre = 'Fresas con nata'
            i_precio_base = '0'
            i_numero_raciones = 0
            i_sabor_especial = abap_false
            ).
      CATCH zcx_producto_invalido_10_ag INTO DATA(lx_err3).
        IF lx_err3->mt_errores IS INITIAL.
          out->write( lx_err3->mv_mensaje ).
        ELSE.
          LOOP AT lx_err3->mt_errores INTO DATA(lv_err3).
            out->write( lv_err3 ).
          ENDLOOP.
        ENDIF.
    ENDTRY.

    out->write( '*************************************' ).
    out->write( '*************************************' ).
    out->write( 'CREACIÓN CUCURUCHO CORRECTA' ).
    TRY.
        DATA(lcl_heladoCucuruchoCorrecto) = NEW zcl_cucurucho_10(
            i_nombre = 'dos Sabores'
            i_precio_base = '2.50'
            i_numero_bolas = 1
            i_barquillo_chocolate = abap_true ).
      CATCH zcx_producto_invalido_10_ag INTO DATA(lx_err4).
        IF lx_err4->mt_errores IS INITIAL.
          out->write( lx_err4->mv_mensaje ).
        ELSE.
          LOOP AT lx_err4->mt_errores INTO DATA(lv_err4).
            out->write( lv_err4 ).
          ENDLOOP.
        ENDIF.
    ENDTRY.
    out->write( '*TIPO PRODUCTO*' ).
    lv_nombre = lcl_heladoCucuruchoCorrecto->get_tipo( ).
    out->write( lv_nombre ).
    out->write( '*FECHA CREACIÓN*' ).
    out->write( lcl_heladoCucuruchoCorrecto->get_date( ) ).
    out->write( '*DESCRIPCIÓN*' ).
    out->write( lcl_heladocucuruchocorrecto->zif_vendible_10~describir(  ) ).

    out->write( '*************************************' ).
    out->write( '*************************************' ).
    out->write( 'CREACIÓN GRANIZADO CORRECTA' ).
    TRY.
        DATA(lcl_granizadoCorrecto) = NEW zcl_granizado_10(
            i_nombre = 'Granizado'
            i_precio_base = '2.30'
            i_tipo_fruta = 'Naranja'
            i_tamanyo = 'p'
         ).
      CATCH zcx_producto_invalido_10_ag INTO DATA(lx_err5).
        IF lx_err5->mt_errores IS INITIAL.
          out->write( lx_err5->mv_mensaje ).
        ELSE.
          LOOP AT lx_err5->mt_errores INTO DATA(lv_err5).
            out->write( lv_err5 ).
          ENDLOOP.
        ENDIF.
    ENDTRY.
    out->write( '*TIPO PRODUCTO*' ).
    lv_nombre = lcl_granizadoCorrecto->get_tipo( ).
    out->write( lv_nombre ).
    out->write( '*FECHA CREACIÓN*' ).
    out->write( lcl_granizadocorrecto->get_date( ) ).
    out->write( '*DESCRIPCIÓN*' ).
    out->write( lcl_granizadocorrecto->zif_vendible_10~describir(  ) ).

    out->write( '*************************************' ).
    out->write( '*************************************' ).
    out->write( 'CREACIÓN TARTA HELADA CORRECTA' ).
    TRY.
        DATA(lcl_tartaHeladaCorrecta) = NEW zcl_tarta_helada_10(
            i_nombre = 'Fresas con nata'
            i_precio_base = '5'
            i_numero_raciones = 3
            i_sabor_especial = abap_false
            ).
      CATCH zcx_producto_invalido_10_ag INTO DATA(lx_err6).
        IF lx_err3->mt_errores IS INITIAL.
          out->write( lx_err6->mv_mensaje ).
        ELSE.
          LOOP AT lx_err6->mt_errores INTO DATA(lv_err6).
            out->write( lv_err6 ).
          ENDLOOP.
        ENDIF.
    ENDTRY.
 out->write( '*TIPO PRODUCTO*' ).
    lv_nombre = lcl_tartaheladacorrecta->get_tipo( ).
    out->write( lv_nombre ).
    out->write( '*FECHA CREACIÓN*' ).
    out->write( lcl_tartaheladacorrecta->get_date( ) ).
    out->write( '*DESCRIPCIÓN*' ).
    out->write( lcl_tartaheladacorrecta->zif_vendible_10~describir(  ) ).
**********************************************************************
*USO DE CAJA REGISTRADORA
**********************************************************************
out->write( '*USO DE CAJA REGISTRADORA CON 2 PRODUCTOS*' ).
*AÑADO DOS PRODUCTOS
lcl_cajaregistradora->agregar_producto( lcl_granizadocorrecto ).
lcl_cajaregistradora->agregar_producto( lcl_heladocucuruchocorrecto ).
out->write( lcl_cajaregistradora->listar_productos(  ) ).
out->write( '*USO DE CAJA REGISTRADORA TOTAL PRECIO 2 PRODUCTOS*' ).
out->write( lcl_cajaregistradora->calcular_total(  ) ).
out->write( '*USO DE CAJA REGISTRADORA TOTAL PRECIO 3 PRODUCTOS*' ).
*AÑADO UN PRODUCTO MÁS
lcl_cajaregistradora->agregar_producto( lcl_tartaheladacorrecta ).
out->write( lcl_cajaregistradora->listar_productos(  ) ).
out->write( '*USO DE CAJA REGISTRADORA TOTAL PRECIO 3 PRODUCTOS*' ).
out->write( lcl_cajaregistradora->calcular_total(  ) ).


  ENDMETHOD.
ENDCLASS.

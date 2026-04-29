CLASS zcl_productostest_10_ag DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_productostest_10_ag IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

**********************************************************************
*ESTRUCTURAS AUXILIARES PARA INSERTAR

    DATA ls_insertar_registro1 TYPE zproductos_10.
    DATA ls_insertar_registro2 TYPE zproductos_10.
    DATA ls_insertar_registro3 TYPE zproductos_10.
**********************************************************************
*ESTRUCTURAS AUXILIARES PARA MODIFICAR

    DATA ls_modificar_registro TYPE zproductos_10.
    DATA ls_modificar_registro2 TYPE zproductos_10.

    ls_insertar_registro3-id = 3.
    ls_insertar_registro3-nombre = 'Head Xtreme MP'.
    ls_insertar_registro3-categoria = 'Raqueta tenis'.
    ls_insertar_registro3-precio = 120.
    ls_insertar_registro3-stock = 10.
    ls_insertar_registro3-activo = 'X'.

    ls_insertar_registro2-id = 2.
    ls_insertar_registro2-nombre = 'Head Speed MP'.
    ls_insertar_registro2-categoria = 'Raqueta tenis'.
    ls_insertar_registro2-precio = 140.
    ls_insertar_registro2-stock = 8.
    ls_insertar_registro2-activo = 'X'.

    ls_insertar_registro1-id = 1.
    ls_insertar_registro1-nombre = 'ML 10 Cup'.
    ls_insertar_registro1-categoria = 'Pala Pádel'.
    ls_insertar_registro1-precio = 150.
    ls_insertar_registro1-stock = 12.
    ls_insertar_registro1-activo = ''.

    ls_modificar_registro-id = 1.
    ls_modificar_registro-nombre = 'NOX ML 10 Cup'.
    ls_modificar_registro-categoria = 'Pala Pádel'.
    ls_modificar_registro-precio = 160.
    ls_modificar_registro-stock = 14.
    ls_modificar_registro-activo = 'X'.
*ESTRUCTURA INTERNA PARA PROBAR FALLO EN MODIFICAR
    ls_modificar_registro2-id = 15.
    ls_modificar_registro2-nombre = 'NOX ML 10 Cup'.
    ls_modificar_registro2-categoria = 'Pala Pádel'.
    ls_modificar_registro2-precio = 160.
    ls_modificar_registro2-stock = 14.
    ls_modificar_registro2-activo = 'X'.

**********************************************************************
*VARIABLES AUXILIARES PARA USAR METODOS CRUD

    DATA ls_registro TYPE zproductos_10.
    DATA lv_valido TYPE abap_boolean.
    DATA lt_tabla_productos type table of zproductos_10.

*INSTANCIACIÓN DE LA CLASE ZCL_PRODUCTOS_10
    DATA(lo_prod) = NEW zcl_productos_10_AG( ).

**********************************************************************
*PROBAMOS MÉTODO INSERTAR
**********************************************************************
    lo_prod->insertar(
    EXPORTING i_ls_registro = ls_insertar_registro1
    IMPORTING o_valido = lv_valido ).
    IF ( lv_valido = abap_true ).
      out->write( 'El registro se ha insertado correctamente' ).
    ELSE.
      out->write( 'El registro NO se ha insertado correctamente' ).
    ENDIF.
    lo_prod->insertar(
    EXPORTING i_ls_registro = ls_insertar_registro2
    IMPORTING o_valido = lv_valido ).
    IF ( lv_valido = abap_true ).
      out->write( 'El registro se ha insertado correctamente' ).
    ELSE.
      out->write( 'El registro NO se ha insertado correctamente' ).
    ENDIF.
    lo_prod->insertar(
    EXPORTING i_ls_registro = ls_insertar_registro3
    IMPORTING o_valido = lv_valido ).
    IF ( lv_valido = abap_true ).
      out->write( 'El registro se ha insertado correctamente' ).
    ELSE.
      out->write( 'El registro NO se ha insertado correctamente' ).
    ENDIF.
**********************************************************************
*PROBAMOS METODO BUSCAR POR ID
**********************************************************************
    lo_prod->buscar_por_id(
    EXPORTING
    i_id_producto = 2
    IMPORTING
    e_ls_registro = ls_registro
    o_valido = lv_valido
    ).
    IF ( lv_valido = abap_true ).
      out->write( 'El registro se ha RECUPERADO correctamente' ).
    ELSE.
      out->write( 'El registro NO se ha RECUPERADO correctamente' ).
    ENDIF.
    out->write( ls_registro ).
**********************************************************************
*PROBAMOS METODO MODIFICAR CON LA ESTRUCTURA LS_MODIFICAR_REGISTRO
**********************************************************************
    lo_prod->modificar(
    EXPORTING
    i_ls_registro = ls_modificar_registro
    IMPORTING
    o_valido = lv_valido ).
     IF ( lv_valido = abap_true ).
      out->write( 'El registro se ha MODIFICADO correctamente' ).
    ELSE.
      out->write( 'El registro NO se ha MODIFICADO correctamente' ).
    ENDIF.
**********************************************************************
*PROBAMOS EL MÉTODO BUSCAR_POR_ID
**********************************************************************
    lo_prod->buscar_por_id(
    EXPORTING
    i_id_producto = 1
    IMPORTING
    e_ls_registro = ls_registro
    o_valido = lv_valido
    ).
    IF ( lv_valido = abap_true ).
      out->write( 'El registro se ha RECUPERADO correctamente' ).
    ELSE.
      out->write( 'El registro NO se ha RECUPERADO correctamente' ).
    ENDIF.
    out->write( ls_registro ).
**********************************************************************
*PROBAMOS EL MÉTODO BORRAR
**********************************************************************
    lo_prod->borrar(
    EXPORTING
    i_id_borrado = 1
    IMPORTING
    o_valido = lv_valido ).
    IF ( lv_valido = abap_true ).
      out->write( 'El registro se ha BORRADO correctamente' ).
    ELSE.
      out->write( 'El registro NO se ha BORRADO correctamente' ).
    ENDIF.

**********************************************************************
*PROBAMOS METODO MOSTRAR TODOS CON LA TABLA INTERNA AUXILIAR
**********************************************************************
    lt_tabla_productos = lo_prod->mostrar_todos(  ).
    out->write( lt_tabla_productos ).


    out->write( '****PROBAMOS MÉTODOS DEL CRUD FORZANDO ERROR****' ).
**********************************************************************
*PROBAMOS FALLO EN RECUPERACIÓN DE INFO POR METODO BUSCAR_POR_ID
**********************************************************************
  lo_prod->buscar_por_id(
    EXPORTING
    i_id_producto = 10
    IMPORTING
    e_ls_registro = ls_registro
    o_valido = lv_valido
    ).
    IF ( lv_valido = abap_true ).
      out->write( 'El registro se ha RECUPERADO correctamente' ).
    ELSE.
      out->write( 'El registro NO se ha RECUPERADO correctamente' ).
    ENDIF.
**********************************************************************
*PROBAMOS FALLO AL INTENTAR BORRAR UN REGISTRO QUE NO EXISTE
**********************************************************************
lo_prod->borrar(
    EXPORTING
    i_id_borrado = 10
    IMPORTING
    o_valido = lv_valido ).
    IF ( lv_valido = abap_true ).
      out->write( 'El registro se ha BORRADO correctamente' ).
    ELSE.
      out->write( 'El registro NO se ha BORRADO correctamente' ).
    ENDIF.
**********************************************************************
*PROBAMOS MÉTODO MODIFICAR CON LA ESTRUCTURA LS_MODIFICAR_REGISTRO2 FALLO
**********************************************************************
    lo_prod->modificar(
    EXPORTING
    i_ls_registro = ls_modificar_registro2
    IMPORTING
    o_valido = lv_valido ).
     IF ( lv_valido = abap_true ).
      out->write( 'El registro se ha MODIFICADO correctamente' ).
    ELSE.
      out->write( 'El registro NO se ha MODIFICADO correctamente' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.

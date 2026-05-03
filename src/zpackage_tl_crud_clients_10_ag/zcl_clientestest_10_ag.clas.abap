CLASS zcl_clientestest_10_ag DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES  if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_clientestest_10_ag IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "ESTRUCTURAS AUXILIARES"
    DATA ls_cliente_insertar1 TYPE zclientes_10_ag.
    DATA ls_cliente_insertar2 TYPE zclientes_10_ag.
    DATA ls_cliente_insertar3 TYPE zclientes_10_ag.

    ls_cliente_insertar1-cliente_id = 1.
    ls_cliente_insertar1-nombre = 'Antonio Gutiérrez'.
    ls_cliente_insertar1-telefono = '66666666'.
    ls_cliente_insertar1-email = 'anto@gmail.com'.
    ls_cliente_insertar1-activo = 'A'.

    ls_cliente_insertar2-cliente_id = 2.
    ls_cliente_insertar2-nombre = 'Cris Rojas'.
    ls_cliente_insertar2-telefono = '2222222'.
    ls_cliente_insertar2-email = 'cris@gmail.com'.
    ls_cliente_insertar2-activo = 'A'.

    ls_cliente_insertar3-cliente_id = 3.
    ls_cliente_insertar3-nombre = 'Diego Coen'.
    ls_cliente_insertar3-telefono = '3333333'.
    ls_cliente_insertar3-email = 'coen@gmail.com'.
    ls_cliente_insertar3-activo = 'A'.

    "VARIABLES AUXILIARES"
    DATA lv_valido TYPE abap_boolean.
    DATA ls_cliente_encontrado type zclientes_10_ag.
    DATA lv_cliente_id type zclientes_10_ag-cliente_id.

**********************************************************************
*COMPROBAR MÉTODO INSERTAR

out->write( 'DEBE INSERTAR CORRECTO PRIMERA EJECUCIÓN' ).
    DATA(lo_cliente) = NEW zcl_clientes_10_ag(  ).
    lo_cliente->create_client(
        EXPORTING
        i_ls_cliente = ls_cliente_insertar1
        IMPORTING
        e_lv_valido = lv_valido ).

    IF ( lv_valido = abap_true ).
      out->write( 'Has insertado un REGISTRO' ).
    ELSE.
      out->write( 'ERROR al insertar' ).
    ENDIF.
*SEGUNDA EJECUCIÓN DA ERROR
out->write( 'DEBE SER INCORRECTO' ).
    lo_cliente->create_client(
        EXPORTING
        i_ls_cliente = ls_cliente_insertar1
        IMPORTING
        e_lv_valido = lv_valido ).

    IF ( lv_valido = abap_true ).
      out->write( 'Has insertado un REGISTRO' ).
    ELSE.
      out->write( 'ERROR al insertar' ).
    ENDIF.
**********************************************************************
*PROBANDO SEARCH BY EMAIL

     out->write( 'Registro encontrado' ).
    ls_cliente_encontrado = lo_cliente->search_by_email(
        EXPORTING
            i_lv_email = 'anto@gmail.com' ).

    out->write( ls_cliente_encontrado ).
     out->write( 'Registro por email no encontrado' ).
    ls_cliente_encontrado = lo_cliente->search_by_email(
        EXPORTING
            i_lv_email = 'to@gmail.com' ).

    out->write( ls_cliente_encontrado ).

**********************************************************************
*PROBANDO UPDATE_PHONE
    lo_cliente->update_phone(
        EXPORTING
            i_lv_id_cliente = 1
            i_lv_phone = '76665556'
        IMPORTING
            e_lv_actualizado = lv_valido
            ).
      IF ( lv_valido = abap_true ).
      out->write( 'Has ACTUALIZADO un REGISTRO' ).
    ELSE.
      out->write( |ERROR al ACTUALIZAR el registro | ).
    ENDIF.

    lo_cliente->create_client(
        EXPORTING
            i_ls_cliente = ls_cliente_insertar2
        IMPORTING
            e_lv_valido = lv_valido ).

    lo_cliente->create_client(
        EXPORTING
            i_ls_cliente = ls_cliente_insertar3
        IMPORTING
            e_lv_valido = lv_valido ).
**********************************************************************
*PROBANDO CLIENTE_OFF
    lo_cliente->off_client(
        EXPORTING
            i_lv_cliente_id = 3
  ).

            if lv_valido = abap_true.
            out->write( 'El cliente ha sido desactivado' ). "debería dar el id que ha desactivado"
            else.
            out->write( 'El cliente sigue activo' ). "debería dar el id que ha desactivado"
            endif.

**********************************************************************
*PROVANDO MOSTRAR CLIENTES ACTIVOS

    DATA lt_clientes_activos TYPE STANDARD TABLE OF zclientes_10_ag.

    lt_clientes_activos = lo_cliente->search_active_clients( ).

    out->write( lt_clientes_activos ).
    ENDMETHOD.

ENDCLASS.

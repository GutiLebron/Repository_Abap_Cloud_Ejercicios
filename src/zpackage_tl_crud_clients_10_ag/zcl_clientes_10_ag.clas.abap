CLASS zcl_clientes_10_ag DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  TYPES ty_clientes TYPE TABLE OF zclientes_10_ag WITH EMPTY KEY.

    METHODS:
      create_client
        IMPORTING
          i_ls_cliente TYPE zclientes_10_ag
        EXPORTING
          e_lv_valido TYPE abap_bool,

      search_by_email
        IMPORTING
          i_lv_email          TYPE String
        RETURNING
          VALUE(r_ls_cliente) TYPE zclientes_10_ag,

      update_phone
        IMPORTING
          i_lv_id_cliente  TYPE zclientes_10_ag-cliente_id
          i_lv_phone       TYPE zclientes_10_ag-telefono
        EXPORTING
          e_lv_actualizado TYPE abap_boolean,

       off_client
        IMPORTING
            i_lv_cliente_id TYPE zclientes_10_ag-cliente_id
        EXPORTING
            e_lv_valido     TYPE abap_boolean,

       search_active_clients
        RETURNING
            VALUE(rt_lt_clientes_activos) TYPE ty_clientes.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_clientes_10_ag IMPLEMENTATION.
  "Método: create_client"
  "Propósito: inserta un cliente y devuelve validación de acción exitosa"
  METHOD create_client.
    INSERT
        zclientes_10_ag
    FROM
        @i_ls_cliente. "variable estructura IMPORTING"

    IF sy-subrc = 0.
      e_lv_valido = abap_true. "variable bool EXPORTING"
    ELSE.
      e_lv_valido = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD search_by_email.
    SELECT *
    FROM zclientes_10_ag
    WHERE email = @i_lv_email
    INTO @r_ls_cliente.
    ENDSELECT.
  ENDMETHOD.

  METHOD update_phone.
    SELECT SINGLE cliente_id
    FROM zclientes_10_ag
    WHERE cliente_id = @i_lv_id_cliente
    INTO @DATA(e_lv_cliente_id).
    IF sy-subrc = 0.
      UPDATE zclientes_10_ag
       SET telefono = @i_lv_phone
      WHERE cliente_id = @i_lv_id_cliente.
      e_lv_actualizado = abap_true.
    ELSE.
      e_lv_actualizado = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD off_client.
    UPDATE zclientes_10_ag
    SET activo = ''
    WHERE cliente_id = @i_lv_cliente_id.
    if sy-subrc = 0.
      e_lv_valido = abap_true.
    else.
      e_lv_valido = abap_false.
    endif.
  ENDMETHOD.

  METHOD search_active_clients.
    SELECT *
    FROM zclientes_10_ag
    WHERE activo = 'A'
    INTO TABLE @rt_lt_clientes_activos.
  ENDMETHOD.
ENDCLASS.

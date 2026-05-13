CLASS lhc_zr_players_10_ag DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrPlayers10Ag
        RESULT result,
      calcular_amortizacion FOR MODIFY
        IMPORTING keys   FOR ACTION ZrPlayers10Ag~calcular_amortizacion.
ENDCLASS.

CLASS lhc_zr_players_10_ag IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.


  METHOD calcular_amortizacion.

    READ ENTITIES OF zr_players_10_ag IN LOCAL MODE
      ENTITY ZrPlayers10Ag
        FIELDS ( Idplayer Nombre Apellidos GastoCompra InicioContrato FinContrato )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_players).

    LOOP AT lt_players INTO DATA(ls_player).

      DATA(years) = ls_player-FinContrato(4) - ls_player-InicioContrato(4).


      IF years <= 0.
        DATA(amort) = 0.
      ELSE.
        amort = ls_player-GastoCompra / years.
      ENDIF.

      APPEND VALUE #(
        %tky = ls_player-%tky
       %msg = new_message(
            id = 'SABP_BEHV'
            number = 100
           severity = if_abap_behv_message=>severity-information
           v1     = |Amortización anual de { amort }|
         )
       )
         TO reported-ZrPlayers10Ag.

    ENDLOOP.


  ENDMETHOD.

ENDCLASS.

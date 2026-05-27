CLASS zcl_accionescrud_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_accionescrud_10 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
"trunco tabla"
  DELETE FROM zdrepaso_10.
"inserto 5 registros"
    INSERT zdrepaso_10 FROM @( VALUE #(
        id_torneo   = '1'
        nombre      = 'Roland Garros'
        ciudad      = 'Paris'
        prize_money = 2000000
        tipo_torneo = 'Grand Slam'
    )
    ).
    INSERT zdrepaso_10 FROM @( VALUE #(
        id_torneo   = '1'
        nombre      = 'Australian Open'
        ciudad      = 'Melbourne'
        prize_money = 5000000
        tipo_torneo = 'Grand Slam'
    )
    ).
    INSERT zdrepaso_10 FROM @( VALUE #(
        id_torneo   = '2'
        nombre      = 'Roland Garros'
        ciudad      = 'Paris'
        prize_money = 2000000
        tipo_torneo = 'Grand Slam'
    )
    ).
    INSERT zdrepaso_10 FROM @( VALUE #(
        id_torneo   = '3'
        nombre      = 'US Open'
        ciudad      = 'New York'
        prize_money = 2000000
        tipo_torneo = 'Grand Slam'
    )
    ).
    INSERT zdrepaso_10 FROM @( VALUE #(
        id_torneo   = '4'
        nombre      = 'Wimbledon'
        ciudad      = 'Londres'
        prize_money = 2550000
        tipo_torneo = 'Grand Slam'
    )
    ).
    INSERT zdrepaso_10 FROM @( VALUE #(
        id_torneo   = '5'
        nombre      = 'Queens'
        ciudad      = 'Queens'
        prize_money = 855000
        tipo_torneo = 'M500'
    )
    ).

    if sy-subrc = 0.
      out->write( 'Se han insertado los torneos' ).
    else.
      out->write( 'Error al insertar los torneos' ).
    endif.
"hago un borrado"
    delete from zdrepaso_10 where id_torneo = '1'.
    if sy-subrc = 0.
      out->write( 'Se han eliminado los torneos' ).
    else.
      out->write( 'Error al eliminar los torneos' ).
    endif.
"actualizo un registro"
    Update zdrepaso_10
    set nombre = 'Australian'
    where id_torneo = '5'.

    if sy-subrc = 0.
      out->write( 'Se han actualizado los torneos' ).
    else.
      out->write( 'Error al actualizar los torneos' ).
    endif.
"modifico un registro en caso de no existir se crea"
    MODIFY zdrepaso_10 FROM @( VALUE zdrepaso_10(
    id_torneo   = '1'
    nombre      = 'Roland Garros'
    ciudad      = 'Paris'
    prize_money = 3000000
    tipo_torneo = 'Grand Slam'
) ).
  ENDMETHOD.
ENDCLASS.

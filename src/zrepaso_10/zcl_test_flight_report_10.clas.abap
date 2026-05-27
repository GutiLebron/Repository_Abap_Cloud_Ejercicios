CLASS zcl_test_flight_report_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_test_flight_report_10 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( 'ORDENACIONES DE TABLA' ).

    SELECT FROM zcds_ejerciciofull_10_ag
        FIELDS *
        ORDER BY CarrierName ASCENDING
        INTO TABLE @DATA(lt_orden_name).

    out->write( '<----------->' ).
    out->write( 'ORDENADO POR NOMBRE DE CARRIER' ).
    out->write( lt_orden_name ).

    SELECT FROM zcds_ejerciciofull_10_ag
        FIELDS *
        ORDER BY connection_id ASCENDING
        INTO TABLE @DATA(lt_orden_connection).

    out->write( '<----------->' ).
    out->write( 'ORDENADO POR CONEXIÓN' ).
    out->write( lt_orden_connection ).

    SELECT FROM zcds_ejerciciofull_10_ag
        FIELDS *
        ORDER BY DepartureTime ASCENDING
        INTO TABLE @DATA(lt_orden_fechaVuelo).

    out->write( '<----------->' ).
    out->write( 'ORDENADO POR FECHA VUELO' ).
    out->write( lt_orden_fechaVuelo ).


    SELECT FROM zcds_ejerciciofull_10_ag
    FIELDS
    price,
    CASE
    WHEN price < 300 THEN 'BARATO'
    WHEN price BETWEEN 300 AND 700  THEN 'MEDIO'
    WHEN price > 700 THEN 'CARO'
    END AS price_category
    INTO TABLE @DATA(lt_valor_esperado).

    out->write( '<----------->' ).
    out->write( 'VALORES ESPERADOS' ).
    out->write( lt_valor_esperado ).

*TYPES: BEGIN OF ty_flight_time,
*         departure TYPE /dmo/flight_departure_time,
*         arrival   TYPE /dmo/flight_arrival_time,
*
*       END OF ty_flight_time.
*
*DATA lt_flight_times TYPE STANDARD TABLE OF ty_flight_time.
*data lt_durations type standard table of STRING.
*
*    SELECT FROM zcds_ejerciciofull_10_ag
*    FIELDS
*    DepartureTime, ArrivalTime
*    INTO table @lt_flight_times.
*
*
*    out->write( '<----------->' ).
*    out->write( 'VALORES ESPERADOS' ).
*
*    out->write( lt_flight_times ).
*
*LOOP at lt_flight_times into data(ls_times).
*
*data(lv_diff) = ls_times-arrival - ls_times-departure.
*
*data(hours) = lv_diff / 3600.
*data(minutes) = ( lv_diff - hours * 3600 ) / 60.
*data(seconds) = lv_diff - hours * 3600 - minutes * 60.
*
*APPEND |{ hours }h { minutes }m { seconds }s| TO lt_durations.
*
*endloop.
*
* out->write( '<----------->' ).
*    out->write( 'DURACIONES' ).
*
*    out->write( lt_durations ).


*    DATA(lv_diff) = lv_arrival - lv_departure.
*
*    data(hours) = lv_diff / 3600.
*    data(minutes) = ( lv_diff - hours * 3600 ) / 60.
*    data(seconds) = lv_diff - hours * 3600 - minutes * 60.
*
*    out->write( hours && 'h' && minutes && 'm' && seconds && 's' ).

*    TYPES: BEGIN OF ty_flight_time,
*             departure TYPE /dmo/flight_departure_time,
*             arrival   TYPE /dmo/flight_arrival_time,
*           END OF ty_flight_time.
*
*    DATA lt_flight_times TYPE STANDARD TABLE OF ty_flight_time.
*
*    " OJO: ahora string, no hora
*    DATA lt_durations TYPE STANDARD TABLE OF string.
*
*    SELECT FROM zcds_ejerciciofull_10_ag
*      FIELDS
*        DepartureTime,
*        ArrivalTime
*      INTO TABLE @lt_flight_times.
*
*    out->write( '<----------->' ).
*    out->write( 'VALORES ESPERADOS' ).
*    out->write( lt_flight_times ).
*
*    LOOP AT lt_flight_times INTO DATA(ls_times).
*
*      " Aseguramos tipos numéricos
*      DATA lv_dep   TYPE c LENGTH 6.
*      DATA lv_arr    TYPE c LENGTH 6.
*      DATA lv_diff   TYPE i.
*      DATA hours     TYPE i.
*      DATA minutes  TYPE i.
*      DATA seconds  TYPE i.
*
*      lv_dep = ls_times-departure.
*      lv_arr = ls_times-arrival.
*
*      " Diferencia en segundos (TIME sí permite esta resta)
*      lv_diff = lv_arr - lv_dep.
*
*      hours   = lv_diff / 3600.
*      minutes = ( lv_diff MOD 3600 ) / 60.
*      seconds = lv_diff MOD 60.
*
*      APPEND |{ hours }h { minutes }m { seconds }s| TO lt_durations.
*
*    ENDLOOP.

*    out->write( '<----------->' ).
*    out->write( 'DURACIONES' ).
*    out->write( lt_durations ).


  ENDMETHOD.

ENDCLASS.

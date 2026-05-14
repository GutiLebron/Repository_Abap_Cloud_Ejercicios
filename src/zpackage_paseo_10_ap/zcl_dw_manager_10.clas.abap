CLASS zcl_dw_manager_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES ty_servicios TYPE STANDARD TABLE OF zdw_servicio_10 WITH EMPTY KEY.

    METHODS:

      "METODOS CREATE"

      create_dueno
        IMPORTING
          is_dueno     TYPE zdw_dueno_10_ap
        RETURNING
          VALUE(rv_ok) TYPE abap_bool,

      create_perro
        IMPORTING
          is_perro     TYPE zdw_perro_10_ap
        RETURNING
          VALUE(rv_ok) TYPE abap_bool,

      create_paseador
        IMPORTING
          is_paseador  TYPE zdw_paseador_10
        RETURNING
          VALUE(rv_ok) TYPE abap_bool,

      create_servicio
        IMPORTING
          is_servicio  TYPE zdw_servicio_10
        RETURNING
          VALUE(rv_ok) TYPE abap_bool,

      create_valoracion
        IMPORTING
          is_valoracion TYPE zdw_valora_10
        RETURNING
          VALUE(rv_ok)  TYPE abap_bool,

      "GETTERS"

      get_servicios_paseador
        IMPORTING
          i_id_paseador                TYPE zdw_paseador-id_paseador
        RETURNING
          VALUE(tb_servicios_paseador) TYPE ty_servicios,

      get_servicios_perro
        IMPORTING
          i_id_perro                TYPE zdw_perro_10_ap-id_perro
        RETURNING
          VALUE(tb_servicios_perro) TYPE ty_servicios,

      get_media_valoracion_paseador
        IMPORTING
          i_id_paseador              TYPE zdw_paseador_10-id_paseador
        RETURNING
          VALUE(rv_valoracion_media) TYPE decfloat34.


  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS:

      "CHECK COMPROBACIÓN SI EXISTEN REGISTROS"

      check_dueno_exists
        IMPORTING
          i_id_dueno       TYPE ZDW_dueno_10_ap-id_dueno
        RETURNING
          VALUE(rv_exists) TYPE abap_bool,

      check_perro_exists
        IMPORTING
          i_id_perro       TYPE zdw_perro_10_ap-id_perro
        RETURNING
          VALUE(rv_exists) TYPE abap_bool,

      check_paseador_exists
        IMPORTING
          i_id_paseador    TYPE zdw_paseador_10-id_paseador
        RETURNING
          VALUE(rv_exists) TYPE abap_bool,

      check_servicio_exists
        IMPORTING
          i_id_servicio    TYPE zdw_servicio_10-id_servicio
        RETURNING
          VALUE(rv_exists) TYPE abap_bool,

      "CHECK PARA SERVICIO COMPLETADO"

      check_servicio_completado
        IMPORTING
          i_id_servicio        TYPE zdw_servicio_10-id_servicio
        RETURNING
          VALUE(rv_completado) TYPE abap_bool,

      "CHECKS AUXILIARES"

      check_estado_servicio
        IMPORTING
          i_estado_servicio TYPE zdw_servicio_10-estado
        RETURNING
          VALUE(rv_estado)  TYPE abap_bool,


      check_tipo_servicio
        IMPORTING
          i_tipo_servicio TYPE zdw_servicio_10-tipo_servicio
        RETURNING
          VALUE(rv_tipo)  TYPE abap_bool.


ENDCLASS.



CLASS zcl_dw_manager_10 IMPLEMENTATION.

  "METODO CHECK ESTADO SERVICIO"

  METHOD check_estado_servicio.

    SELECT SINGLE * FROM ddcds_customer_domain_value_t(
                            p_domain_name = 'ZDD_ESTADO' )
        WHERE value_low = @i_estado_servicio
        INTO @DATA(ls_test).
    IF sy-subrc = 0.
      rv_estado = abap_true.
    ELSE.
      rv_estado = abap_false.
    ENDIF.

  ENDMETHOD.

  "METODO CHECK TIPO SERVICO"
  METHOD check_tipo_servicio.

    SELECT SINGLE * FROM ddcds_customer_domain_value_t(
                            p_domain_name = 'ZDD_TIPO_SERVICIO' )
        WHERE value_low = @i_tipo_servicio
        INTO @DATA(ls_test).
    IF sy-subrc = 0.
      rv_tipo = abap_true.
    ELSE.
      rv_tipo = abap_false.
    ENDIF.

  ENDMETHOD.

  "CHECK DUEÑO EXISTE"

  METHOD check_dueno_exists.
    SELECT SINGLE id_dueno
    FROM ZDW_dueno_10_ap
    WHERE id_dueno = @i_id_dueno
    INTO @DATA(lv_dummy).

    IF sy-subrc = 0.
      rv_exists = abap_true.
    ELSE.
      rv_exists = abap_false.
    ENDIF.

  ENDMETHOD.

  "CHECK PERRO EXISTE"

  METHOD check_perro_exists.

    SELECT SINGLE id_perro
        FROM ZDW_perro_10_ap
        WHERE id_perro = @i_id_perro
        INTO @DATA(lv_dummy).

    IF sy-subrc = 0.
      rv_exists = abap_true.
    ELSE.
      rv_exists = abap_false.
    ENDIF.

  ENDMETHOD.

  "CHECK PASEADOR EXISTE"

  METHOD check_paseador_exists.

    SELECT SINGLE id_paseador
    FROM ZDW_paseador_10
    WHERE id_paseador = @i_id_paseador
    INTO @DATA(lv_dummy).

    IF sy-subrc = 0.
      rv_exists = abap_true.
    ELSE.
      rv_exists = abap_false.
    ENDIF.


  ENDMETHOD.

  "CHECK SERVICIO EXISTE"

  METHOD check_servicio_exists.

    SELECT SINGLE id_servicio
    FROM ZDW_servicio_10
    WHERE id_servicio = @i_id_servicio
    INTO @DATA(lv_dummy).

    IF sy-subrc = 0.
      rv_exists = abap_true.
    ELSE.
      rv_exists = abap_false.
    ENDIF.


  ENDMETHOD.

  "CHECK SERVICIO COMPLETADO"

  METHOD check_servicio_completado.
    SELECT SINGLE id_servicio
    FROM ZDW_servicio_10
    WHERE id_servicio = @i_id_servicio
    AND estado = 'CO'
    INTO @DATA(lv_dummy).

    IF sy-subrc = 0.
      rv_completado = abap_true.
    ELSE.
      rv_completado = abap_false.
    ENDIF.

  ENDMETHOD.

  "CREAR DUEÑO"

  METHOD create_dueno.

    rv_ok = abap_false.

    IF check_dueno_exists( is_dueno-id_dueno ) = abap_false AND is_dueno-nombre IS NOT INITIAL.

      INSERT zdw_dueno_10_ap FROM @is_dueno.

      rv_ok = abap_true.

    ENDIF.

  ENDMETHOD.

  "CREAR PERRO"

  METHOD create_perro.

    rv_ok = abap_false.

    IF check_perro_exists( is_perro-id_perro ) = abap_false
    AND check_dueno_exists( is_perro-id_dueno )
    AND is_perro-nombre IS NOT INITIAL.

      INSERT ZDW_perro_10_ap FROM @is_perro.

      rv_ok = abap_true.

    ENDIF.

  ENDMETHOD.

  "CREAR PASEADOR"

  METHOD create_paseador.

    rv_ok = abap_false.
    IF check_paseador_exists( is_paseador-id_paseador ) = abap_false.

      INSERT ZDW_paseador_10 FROM @is_paseador.

      rv_ok = abap_true.

    ENDIF.

  ENDMETHOD.

  "CREAR SERVICIO"

  METHOD create_servicio.

    IF check_paseador_exists( is_servicio-id_paseador ) = abap_false.
      rv_ok = abap_false.
      RETURN.
    ENDIF.
    IF check_perro_exists( is_servicio-id_perro ) = abap_false.
      rv_ok = abap_false.
      RETURN.
    ENDIF.
    IF is_servicio-fecha_fin < is_servicio-fecha_inicio.
      rv_ok = abap_false.
      RETURN.
    ENDIF.
    IF check_estado_servicio( is_servicio-estado ) = abap_false.
      rv_ok = abap_false.
      RETURN.
    ENDIF.
    IF check_tipo_servicio( is_servicio-tipo_servicio ) = abap_false.
      rv_ok = abap_false.
      RETURN.
    ENDIF.

    INSERT zdw_servicio_10 FROM @is_servicio.

    rv_ok = abap_true.

  ENDMETHOD.

  "CREAR VALORACIÓN"

  METHOD create_valoracion.

    "comprobamos si el servicio existe"
    IF check_servicio_exists( is_valoracion-id_servicio ) = abap_false.
      rv_ok = abap_false.
      RETURN.
    ENDIF.

    "comprobamos que el servicio esté COMPLETADO"
    SELECT SINGLE estado
    FROM zdw_servicio_10
    WHERE id_servicio = @is_valoracion-id_servicio
    AND estado = 'CO'
    INTO
    @DATA(lv_data).

    IF sy-subrc <> 0 .
      rv_ok = abap_false.
      RETURN.
    ENDIF.

    "que el servicio NO tenga una valoración"
    SELECT SINGLE id_valoracion
    FROM zdw_valora_10
    WHERE id_servicio = @is_valoracion-id_servicio
    INTO
    @DATA(lv_data2).

    IF sy-subrc = 0.
      rv_ok = abap_false.
      RETURN.
    ENDIF.

    "valoración está comprendida entre 1-5"
    IF is_valoracion-puntuacion < 1 OR is_valoracion-puntuacion > 5.
      rv_ok = abap_false.
      RETURN.
    ENDIF.


    INSERT zdw_valora_10 FROM @is_valoracion.

    rv_ok = abap_true.

  ENDMETHOD.


  METHOD get_servicios_paseador.

    SELECT *
    FROM zdw_servicio_10
    WHERE id_paseador = @i_id_paseador
    INTO TABLE @tb_servicios_paseador.

  ENDMETHOD.



  METHOD get_servicios_perro.

    SELECT *
    FROM zdw_servicio_10
    WHERE id_perro = @i_id_perro
    INTO TABLE @tb_servicios_perro.

  ENDMETHOD.

  METHOD get_media_valoracion_paseador.

    SELECT AVG( puntuacion )
      FROM zdw_valora_10 AS valoracion
      JOIN zdw_servicio_10 AS servicio
        ON valoracion~id_servicio = servicio~id_servicio
      WHERE servicio~id_paseador = @i_id_paseador
      INTO @rv_valoracion_media.

  ENDMETHOD.


ENDCLASS.



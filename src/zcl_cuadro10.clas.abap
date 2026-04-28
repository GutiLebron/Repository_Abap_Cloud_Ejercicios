CLASS zcl_cuadro10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF ty_ficha,
             titulo TYPE string,
             anio   TYPE i,
             expuesto type string,
           END OF ty_ficha.

    METHODS:

      constructor
        IMPORTING
          i_titulo TYPE string
          i_anio   TYPE i,


      get_titulo
        RETURNING
          VALUE(rt_titulo) TYPE string,

      get_anio
        RETURNING
          VALUE(rt_anio) TYPE i,

      set_titulo
        IMPORTING
          i_titulo TYPE string,

      set_anio
        IMPORTING
          i_anio TYPE i,

      esta_exposicion
        RETURNING
          VALUE(rv_status) TYPE abap_bool,

      mostrar_ficha
        RETURNING
          VALUE(rt_ls_ficha) TYPE ty_ficha.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA titulo   TYPE string.
    DATA anio      TYPE i.
    DATA ls_ficha TYPE ty_ficha.
ENDCLASS.



CLASS zcl_cuadro10 IMPLEMENTATION.

  METHOD
  constructor.
    titulo = i_titulo.
    anio = i_anio.
  ENDMETHOD.

  METHOD
  get_titulo.
    rt_titulo = titulo.
  ENDMETHOD.

  METHOD
  get_anio.
    rt_anio = anio.
  ENDMETHOD.

  METHOD
  set_titulo.
    titulo = i_titulo.
  ENDMETHOD.

  METHOD
  set_anio.
    anio = i_anio.
  ENDMETHOD.


  METHOD esta_exposicion.
    IF ( 1800 > anio ).
      rv_status = abap_false.
    ELSE.
      rv_status = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD
    mostrar_ficha.
    ls_ficha-titulo = titulo.
    ls_ficha-anio = anio.
    if ( 1800 > anio ).
    ls_ficha-expuesto = 'Expuesto'.
    else.
    ls_ficha-expuesto = 'Almacenado'.
    endif.


    rt_ls_ficha = ls_ficha.
  ENDMETHOD.

ENDCLASS.

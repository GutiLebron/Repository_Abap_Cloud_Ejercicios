CLASS zcl_class_lslt_ag DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_class_lslt_ag IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

**********************************************************************
*CREAR TIPO DE ESTRUCTURA LOCAL
**********************************************************************
    TYPES: BEGIN OF ty_torneo,
             nombre      TYPE string,
             categoria   TYPE string,
             prizeMoney  TYPE p LENGTH 10 DECIMALS 2,
             pais        TYPE string,
             ciudad      TYPE string,
             superficie  TYPE string,
             fechaInicio TYPE d,
           END OF ty_torneo.

**********************************************************************
*ASIGNAR VALORES A ESTRUCTURA LOCAL
**********************************************************************
    DATA ls_Madrid TYPE ty_torneo. "DELCARO ESTRUCTURA LOCAL Y SU TIPO

    ls_Madrid-nombre       = 'Madrid'. "NOMBRE DE ESTRUCTURA SEGUIDO DEL NOMBRE DEL CAMPO
    ls_Madrid-categoria    = 'M1000'.
    ls_Madrid-prizeMoney   = '8235000.23'.
    ls_Madrid-pais         = 'España'.
    ls_Madrid-ciudad       = 'Madrid'.
    ls_Madrid-superficie   = 'Tierra Batida'.
    ls_Madrid-fechaInicio  = '20260420'.

    out->write( ls_Madrid ). "PINTAR ESTRUCTURA

    DATA ls_Barcelona TYPE ty_torneo.

    ls_Barcelona-nombre       = 'Conde Godó'.
    ls_Barcelona-categoria    = 'M500'.
    ls_Barcelona-prizeMoney   = '823520.84'.
    ls_Barcelona-pais         = 'España'.
    ls_Barcelona-ciudad       = 'Barcelona'.
    ls_Barcelona-superficie   = 'Tierra Batida'.
    ls_Barcelona-fechaInicio  = '20260412'.

    out->write( ls_Barcelona ).

    DATA ls_Castilla TYPE ty_torneo.

    ls_Castilla-nombre       = 'Open Castilla y León El Espinar'.
    ls_Castilla-categoria    = 'ATP Challenger'.
    ls_Castilla-prizeMoney   = '90000.00'.
    ls_Castilla-pais         = 'España'.
    ls_Castilla-ciudad       = 'El Espinar'.
    ls_Castilla-superficie   = 'Pista dura'.
    ls_Castilla-fechaInicio  = '20260719'.

    out->write( ls_Castilla ).



    out->write( '******************************************************************' ).
    out->write( '******************************************************************' ).
    out->write( '******************************************************************' ).


**********************************************************************
*DECLARAR UNA TABLA LOCAL Y AÑADIR ESTRUCTURAS
**********************************************************************
    DATA lt_torneos TYPE TABLE OF ty_torneo. "DECLARO LA TABLA Y LE DIGO QUE TIPO DE ESTRUCTURAS CONTIENE

    APPEND ls_Madrid TO lt_torneos. "CON APPEND PODEMOS AÑADIR UNA ESCTRUCTURA A LA TABLA
    APPEND ls_Barcelona TO lt_torneos.
    APPEND ls_Castilla TO lt_torneos.

    out->write( lt_torneos ).

    out->write( '******************************************************************' ).
    out->write( '******************************************************************' ).
    out->write( '******************************************************************' ).

**********************************************************************
*RECUPERAR DATOS DE UNA TABLA INTERNA Y MOSTRARLOS EN OTRA TABLA
**********************************************************************
    TYPES: BEGIN OF ty_prizeCategory, "CREO UNA ESTRUCTURA CON LOS TIPOS QUE VOY A GUARDAR
             ty_categoria  TYPE string,
             ty_prizeMoney TYPE p LENGTH 8 DECIMALS 2,
           END OF ty_prizeCategory.

    DATA lt_prizeCategory TYPE TABLE OF ty_prizeCategory. "DECLARO LA TABLA Y LE DIGO QUE TIPO DE ESTRUCTURAS CONTIENE

    LOOP AT lt_torneos INTO DATA(ls_torneo).      "HACEMOS UN LOOP PARA RECORRER TABLA ORIGINAL
      APPEND VALUE ty_prizeCategory(              "AÑADIMOS A LA ESTRUCTURA
          ty_categoria = ls_torneo-categoria      "EN EL TYPO CATEGORIA AÑADIMOS LA CATEGORIA DE LA TABLA ORIGINAL
          ty_prizemoney = ls_torneo-prizeMoney    "EN EL TYPO PRIZEMONEY AÑADIMOS EL PRIZEMONEY DE LA TABLA ORIGINAL
      ) TO lt_prizeCategory.                      "AÑADIMOS A LA TABLA LA ESTRUCTURA CREADA
    ENDLOOP.

    out->write( lt_prizeCategory ).                 "PINTAMOS LA NUEVA TABLA

    out->write( '******************************************************************' ).
    out->write( '******************************************************************' ).
    out->write( '******************************************************************' ).

**********************************************************************
*CALCULAR LA MEDIA DE PRIZE MONEY ECONÓMICO QUE TIENEN LOS TORNEOS
**********************************************************************
    DATA prizemoneymedia TYPE p LENGTH 8 DECIMALS 2.
    DATA numerotorneos TYPE i.

    LOOP AT lt_prizecategory INTO DATA(ls_prize).
      numerotorneos += 1.
      prizemoneymedia += ls_prize-ty_prizemoney.
    ENDLOOP.

    prizemoneymedia /= numerotorneos.

    out->write( |La media de los Prize Money es:| ).
    out->write( prizemoneymedia ).

    out->write( '******************************************************************' ).
    out->write( '******************************************************************' ).
    out->write( '******************************************************************' ).

**********************************************************************
*PINTAR LOS PRIZE MONEY MAYORES DE X MONTO
**********************************************************************


    out->write( |Torneos mayores a 1000000:| ).
    LOOP AT lt_torneos INTO ls_torneo.
      IF ls_torneo-PrizeMoney > 1000000.
        out->write( ls_torneo ).
      ENDIF.
    ENDLOOP.

**********************************************************************
*RECOGER CAMPOS DE LA TABLA PARCIAL CON CONDICIONES
**********************************************************************

    TYPES: BEGIN OF ty_nombreprizecuidad, "CREO UNA ESTRUCTURA CON LOS TIPOS QUE VOY A GUARDAR
             ty_nombre     TYPE string,
             ty_prizemoney TYPE p LENGTH 8 DECIMALS 2,
             ty_cuidad     TYPE string,
           END OF ty_nombreprizecuidad.

    DATA lt_torneosmayores TYPE TABLE OF ty_nombreprizecuidad. "DECLARO LA TABLA Y LE DIGO QUE TIPO DE ESTRUCTURAS CONTIENE
 out->write( |Torneos mayores a 700000 y data personalizada:| ).
    LOOP AT lt_torneos INTO ls_torneo.
      IF ls_torneo-prizemoney > 700000.
        APPEND VALUE ty_nombreprizecuidad(                 "AÑADIMOS A LA ESTRUCTURA
             ty_nombre = ls_torneo-nombre                  "EN EL TYPO NOMBRE AÑADIMOS EL NOMBRE DE LA TABLA ORIGINAL
             ty_prizemoney = ls_torneo-prizeMoney          "EN EL TYPO PRIZEMONEY AÑADIMOS EL PRIZEMONEY DE LA TABLA
             ty_cuidad = ls_torneo-ciudad                  "EN EL TYPO CUIDAD AÑADIMOS LA CUIDAD DE LA TABLA ORIGINAL
             ) TO lt_torneosmayores.                       "AÑADIMOS A LA TABLA LA ESTRUCTURA CREADA
      ENDIF.
    ENDLOOP.

    out->write( lt_torneosmayores ).


  ENDMETHOD.
ENDCLASS.

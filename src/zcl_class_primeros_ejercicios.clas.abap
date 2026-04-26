CLASS zcl_class_primeros_ejercicios DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES
      if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_class_primeros_ejercicios IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
**********************************************************************
**TABLA DE MULTIPLICAR DE UN NUMERO Y SUMATORIO TOTAL
**********************************************************************
    DATA lv_numeroDado TYPE i VALUE 2.
    DATA lv_iteracion TYPE i VALUE 0.
    DATA lv_resultado TYPE i.
    DATA lv_sumatorio TYPE i.

    WHILE lv_iteracion <= 10.
      lv_resultado = lv_iteracion * lv_numeroDado.
      out->write( | { lv_numeroDado } x { lv_iteracion }  = { lv_resultado }| ).
      lv_sumatorio = lv_sumatorio + lv_resultado.

      lv_iteracion = lv_iteracion + 1.

    ENDWHILE.
    out->write( | sumatorio es { lv_sumatorio } | ).

    out->write( '***********************************************' ).
*********************************************************************
* ES PAR EL NÚMERO HARCODEADO?
*********************************************************************
    DATA lv_numero TYPE i.
    DATA lv_par TYPE i.

    lv_numero = 22.
    lv_par = lv_numero MOD 2.
    IF lv_par = 0.
      out->write( | El número { lv_numero } es: PAR | ).
    ELSE.
      out->write( | El número { lv_numero } es: IMPAR| ).
    ENDIF.

    out->write( '***********************************************' ).
*********************************************************************
* CONTAR CUANTOS NÚMEROS PARES HAY ENTRE EL 1 Y EL 20 *
*********************************************************************

    DATA lv_limite TYPE i VALUE 0.
    DATA lv_totalpares TYPE i.
    DATA lv_resto.

    WHILE lv_limite < 20.
      IF lv_limite MOD 2 = 0.
        lv_totalpares = lv_totalpares + 1.
      ENDIF.
      lv_limite = lv_limite + 1.
    ENDWHILE.
    out->write( |EL NÚMERO { lv_limite } tiene { lv_totalpares } números pares contenidos| ).

    out->write( '************************************************' ).
*********************************************************************
* CALCULAR EL FACTORIAL DE UN NÚMERO
*********************************************************************
    DATA lv_original TYPE i VALUE 5.
    DATA lv_factorial TYPE i VALUE 5.
    DATA lv_resultado1 TYPE i VALUE 1.

    WHILE lv_factorial > 0.
      lv_resultado1 = lv_factorial * lv_resultado1.
      lv_factorial = lv_factorial - 1.
    ENDWHILE.
    out->write( | El factorial de { lv_original } es { lv_resultado1 }| ).
    out->write( '***********************************************' ).
**********************************************************************
* SUMAR TODOS LOS NÚMEROS DEL 1 AL 50
**********************************************************************
    DATA lv_limite1 TYPE i VALUE 50.
    DATA lv_inicio1 TYPE i VALUE 1.
    DATA lv_resultado2 TYPE i.

    out->write( |La suma de los números del { lv_inicio1 } al { lv_limite1 }| ).
    WHILE lv_inicio1 <= lv_limite1.
      lv_resultado2 = lv_resultado2 + lv_inicio1.
      lv_inicio1 = lv_inicio1 + 1.
    ENDWHILE.

    out->write( |es { lv_resultado2 }| ).
**********************************************************************
*DAME LOS NÚMEROS MULTIPLOS DE UNO U OTRO NUMERO X HASTA EL 100
**********************************************************************
    out->write( '***********************************************' ).

    DATA lv_multiplo1 TYPE i VALUE 2.
    DATA lv_multiplo2 TYPE i VALUE 3.
    DATA lv_iterador TYPE i VALUE 1.

    WHILE lv_iterador <= 100.
        out->write( |NÚMERO { lv_iterador }| ).
      IF lv_iterador MOD lv_multiplo1 = 0.
        out->write( | Es múltiplo de { lv_multiplo1 }| ).
        ENDIF.
      IF lv_iterador MOD lv_multiplo2 = 0.
        out->write( | Es múltiplo de { lv_multiplo2 }| ).
      ENDIF.
      lv_iterador = lv_iterador + 1.
    ENDWHILE.

*********************************************************************
* SUMAR TODOS LOS NÚMEROS IMPARES ENTRE DOS NÚMEROS
*********************************************************************
    out->write( '***********************************************' ).
    DATA lv_numeroMax TYPE i VALUE 50.
    DATA lv_numeroMin TYPE i VALUE 40.
    DATA lv_sumaImpares TYPE i VALUE 0.

*ESTRUCTURA DE CONTROL DE FLUJO
    IF lv_numeroMax < lv_numeroMin.
      out->write( 'la variable Max no debe ser inferior a Min' ).
      EXIT.
    ENDIF.
*SI HEMOS ASIGNADO BIEN LOS VALORES DE MIN Y MAX
    out->write( |El sumatorio de los IMPARES entre { lv_numeroMin } y { lv_numeroMax } es| ).
    WHILE lv_numeroMin <= lv_numeroMax.
      IF lv_numeroMin MOD 2 <> 0.
        lv_sumaImpares += lv_numeroMin.
      ENDIF.
      lv_numeroMin = lv_numeroMin + 1.
    ENDWHILE.
    out->write( lv_sumaImpares ).

  ENDMETHOD.
ENDCLASS.


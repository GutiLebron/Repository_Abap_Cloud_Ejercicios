CLASS zcl_class_calc DEFINITION
 PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES
      if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_class_calc IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
**********************************************************************
*DOS FORMAS DE HACER UN MISMO PROGRAMA
**********************************************************************
*CALCULADORA USANDO IF/ELSE
**********************************************************************
    DATA lv_operador TYPE string.
    DATA(lv_num1) = 3.
    DATA(lv_num2) = 2.

    lv_operador = 'div'.

    IF ( lv_operador = 'suma' ).
      out->write( lv_num1 + lv_num2 ).
    ELSEIF ( lv_operador = 'resta' ).
      out->write( lv_num1 - lv_num2 ).
    ELSEIF ( lv_operador = 'multiplica' ).
      out->write( lv_num1 * lv_num2 ).
    ELSEIF ( lv_operador = 'divide' ).
      TRY.
          out->write( lv_num1 / lv_num2 ).
        CATCH cx_sy_zerodivide.
          out->write( 'No se puede dividir por cero' ).
      ENDTRY.
      ELSE.
      out->write( 'LuisCa te he pillao' ).

    ENDIF.

**********************************************************************
*CALCULADORA CON CASE
**********************************************************************

    DATA lv_operadorCalc TYPE c.
    DATA(lv_numCalc1) = 8.
    DATA(lv_numCalc2) = 3.

    DATA lv_resultado TYPE f.
    lv_operadorcalc = '/'.


    CASE lv_operadorCalc.
      WHEN '+'.
        lv_resultado = lv_numcalc1 + lv_numcalc2.
        out->write( |{ lv_numcalc1  } { lv_operadorCalc } { lv_numcalc2 } = { lv_resultado } | ).
      WHEN '-'.
        lv_resultado = lv_numcalc1 - lv_numcalc2.
        out->write( |{ lv_numcalc1  } { lv_operadorCalc } { lv_numcalc2 } = { lv_resultado } | ).
        IF ( lv_resultado < 0 ).
          out->write( 'no eres negativo ni na' ).
        ENDIF.
      WHEN '*'.
        lv_resultado = lv_numcalc1 * lv_numcalc2.
        out->write( |{ lv_numcalc1  } { lv_operadorCalc } { lv_numcalc2 } = { lv_resultado } | ).
      WHEN '/'.
        TRY. "Try-Catch para controlar excepción división por cero"
            lv_resultado = lv_numcalc1 / lv_numcalc2.
            out->write( |{ lv_numcalc1  } { lv_operadorCalc } { lv_numcalc2 } = { lv_resultado } | ).
          CATCH cx_sy_zerodivide.
            out->write( 'NO puedes DIVIDIR un número por CERO' ).
        ENDTRY.
       WHEN OTHERS. "Casos no contemplados"
            out->write( 'Solo vale sumar, restar, multiplicar y dividir' ).
    ENDCASE.

  ENDMETHOD.

ENDCLASS.


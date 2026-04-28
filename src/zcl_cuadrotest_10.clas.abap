CLASS zcl_cuadrotest_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cuadrotest_10 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*USAMOS UNA ESTRUCTURA AUXILIAR DONDE GUARDAR NUESTROS DATOS
    TYPES: BEGIN OF ty_ficha,
             titulo TYPE string,
             anio   TYPE i,
             expuesto TYPE string,
           END OF ty_ficha.
*DECLARAMOS UNA TABLA CON NUESTRA ESTRUCTURA Y LA ESTRUCTURA INTERNA
    data lt_listado  type table of ty_ficha.
    DATA ls_ficha TYPE ty_ficha.

    DATA lv_titulo TYPE string.
    DATA lv_anio TYPE i.
*INSTANCIAMOS UN OBJETO CUADRO Y LO GUARDAMOS EN LA ESTRUCUTRA INTERNA
    DATA(cuadro1) = NEW zcl_cuadro10( i_titulo = 'Maja desnunda' i_anio = 1895 ).
    ls_ficha = cuadro1->mostrar_ficha(  ).
*HACEMOS UN APPEND PARA GUARDAR EL REGISTRO EN LA TABLA
    append ls_ficha to lt_listado.
    DATA(cuadro2) = NEW zcl_cuadro10( i_titulo = 'Revolucion' i_anio = 1705 ).

    cuadro2->set_titulo( exporting i_titulo = 'La Revolución' ).
    ls_ficha = cuadro2->mostrar_ficha(  ).
    append ls_ficha to lt_listado.

    DATA(cuadro3) = NEW zcl_cuadro10( i_titulo = 'El sueño de una noche de verano' i_anio = 1495 ).
    ls_ficha = cuadro3->mostrar_ficha(  ).
    append ls_ficha to lt_listado.


    DATA(cuadro4) = NEW zcl_cuadro10( i_titulo = 'Jardin Efímero' i_anio = 1935 ).
    ls_ficha = cuadro4->mostrar_ficha(  ).
    append ls_ficha to lt_listado.
*DOS FORMAS DE MOSTRAR LOS CUADROS QUE ESTAN EXPUESTOS, UNA BORRANDO OTRA SIN BORRAR
out->write( '***********LOOP-WRITE************' ).
    LOOP AT lt_listado into ls_ficha.
    if ls_ficha-expuesto = 'Almacenado'.
    out->write( ls_ficha ).
    endif.
    ENDLOOP.
out->write( '*************END**********' ).


*HACEMOS UN DELETE SIMILAR A SQL
    Delete lt_listado where expuesto = 'Almacenado'.

    out->write( lt_listado ).






  ENDMETHOD.
ENDCLASS.

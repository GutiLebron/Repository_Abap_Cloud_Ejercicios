CLASS lhc_zr_lib_libro_10 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:

      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrLibLibro10
        RESULT result,

      check_num_pag FOR VALIDATE ON SAVE
        IMPORTING
            keys FOR ZrLibLibro10~check_num_pag,

      setPaginasbyEstado FOR DETERMINE ON MODIFY
        IMPORTING
            keys FOR ZrLibLibro10~setPaginasbyEstado.

ENDCLASS.

CLASS lhc_zr_lib_libro_10 IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD check_num_pag.

    READ ENTITIES OF zr_lib_libro_10 IN LOCAL MODE
        ENTITY ZrLibLibro10
        FIELDS ( NumPaginas )
        WITH CORRESPONDING #( keys )
        RESULT DATA(lt_libros)
        FAILED DATA(lt_failed).


    LOOP AT lt_libros INTO DATA(ls_libro).

      IF ls_libro-NumPaginas < '10'.

        DATA(lo_msg) = new_message( id = 'ZR_LIBRO'
                                    number = '001'
                                    severity = if_abap_behv_message=>severity-error
                                    v1 = | El número de páginas no puede ser inferior a 10, tu libro tiene { ls_libro-NumPaginas } |   ).

        APPEND VALUE #( %tky = ls_libro-%tky ) TO failed-ZrLibLibro10.

        APPEND VALUE #( %tky = ls_libro-%tky
                        %msg = lo_msg ) TO reported-ZrLibLibro10.

      ENDIF.

    ENDLOOP.
  ENDMETHOD.

METHOD setPaginasbyEstado.
"LEO LOS CAMPOS QUE ME HACEN FALTA PARA LA OPERACIÓN
  READ ENTITIES OF zr_lib_libro_10 IN LOCAL MODE
    ENTITY ZrLibLibro10
      FIELDS ( NumPaginas )
      WITH CORRESPONDING #( keys )
      "CREO TABLAS INTERNAS DONDE GUARDAR LOS DATOS DE LOS CAMPOS"
    RESULT DATA(lt_libros)
    FAILED DATA(lt_failed).

"CREO TABLA INTERNA PARA GUARDAR EL UPDATE"
  DATA lt_update TYPE TABLE FOR UPDATE zr_lib_libro_10.
  "VARIABLE AUXILIAR PARA GUARDAR EL VALOR QUE VA A RECIBIR"
  DATA lv_estado type string.

  LOOP AT lt_libros INTO DATA(ls_libro).

    "al ser intervalos es mas fácil hacerlo con IF/ELSE
  if ls_libro-NumPaginas < 49.
  lv_estado = 'Muy deteriorado'.
  ELSEIF ls_libro-NumPaginas < 149.
  lv_estado = 'Deteriorado'.
  ELSEIF ls_libro-NumPaginas < 399.
  lv_estado = 'Bueno'.
  ELSEIF ls_libro-NumPaginas > 399.
  lv_estado = 'Nuevo'.
  ELSE.
  lv_estado = 'Error'.
  endif.
"AÑADO A LA TABLA DE UPDATE EL ESTADO QUE RECIBE ASIGNANDO A SU CLAVE TECNICA"
    APPEND VALUE #(
      %tky            = ls_libro-%tky
      Estado          = lv_estado
      %control-Estado = if_abap_behv=>mk-on
    ) TO lt_update.


  ENDLOOP.

"ACTUALIZO LOS CAMPOS DE LA TABLA DE LA ENTIDAD CONFORME A LOS DATOS DE LA TABLA INTERNA UPDATE"
  MODIFY ENTITIES OF zr_lib_libro_10 IN LOCAL MODE
    ENTITY ZrLibLibro10
      UPDATE FIELDS ( Estado )
      WITH lt_update.

ENDMETHOD.

ENDCLASS.

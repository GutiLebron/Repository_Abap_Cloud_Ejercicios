CLASS zcl_empleados_10_ag DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA nombre TYPE string.
    DATA dni TYPE string.
    DATA salarioBase TYPE i.

    METHODS:

    constructor
        IMPORTING
          i_nombre TYPE string
          i_dni TYPE string
          i_salarioBase TYPE i,
      get_ficha
        returning
          value(rt_e_ficha) TYPE string,

      get_salario
        returning
          value(rt_e_salario) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_empleados_10_ag IMPLEMENTATION.

  METHOD get_ficha.
    rt_e_ficha = | El nombre del empleado es  { me->nombre }| &
                | El DNI del empleado es  { me->dni }| &
                | El salario del empleado es  { me->salarioBase }|.
  ENDMETHOD.

  METHOD get_salario.
    rt_e_salario = |El salario del empleado es: { me->salariobase }|.
  endMETHOD.

    METHOD constructor.
      me->nombre = i_nombre.
      me->dni = i_dni.
      me->salariobase = i_salariobase.
    ENDMETHOD.
ENDCLASS.

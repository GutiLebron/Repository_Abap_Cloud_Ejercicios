CLASS zcl_empleadotemporal_10_ag DEFINITION

  PUBLIC
    INHERITING FROM zcl_empleados_10_ag
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA horas_trabajadas TYPE i.
    DATA precio_hora TYPE i.

    METHODS:

      constructor
        IMPORTING
          i_nombre           TYPE string
          i_dni              TYPE string
          i_salarioBase      TYPE i
          i_horas_trabajadas TYPE i
          i_precio_hora      TYPE i,

      get_salario
        REDEFINITION,

      get_ficha
        REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_empleadotemporal_10_ag IMPLEMENTATION.

  METHOD get_salario.
  super->get_salario( ).
    rt_e_salario = |El salario del EMPLEADO TEMPORAL es { me->horas_trabajadas * me->precio_hora }|.
  ENDMETHOD.

  METHOD get_ficha.
    rt_e_ficha = | El nombre del empleado es  { me->nombre }| &
                   | El DNI del empleado es  { me->dni }| &
                   | { get_salario( ) }| &
                   | El tiempo trabajado es: { me->horas_trabajadas } horas| &
                   | El precio por hora es:  { me->precio_hora }|.
  ENDMETHOD.
  METHOD constructor.
    super->constructor( i_nombre = i_nombre i_dni = i_dni i_salarioBase = i_salarioBase ).
    precio_hora = i_precio_hora.
    horas_trabajadas = i_horas_trabajadas.
  ENDMETHOD.
ENDCLASS.

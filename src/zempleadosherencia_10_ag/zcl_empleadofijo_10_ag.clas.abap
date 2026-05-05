CLASS zcl_empleadofijo_10_ag DEFINITION
  PUBLIC
  INHERITING FROM zcl_empleados_10_ag
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA anios_en_empresa TYPE i.

    METHODS:
      constructor
        IMPORTING
          i_nombre           TYPE string
          i_DNI              TYPE string
          i_salarioBase      TYPE i
          i_anios_en_empresa TYPE i,

      get_anios
        RETURNING
          VALUE(rt_anios_en_empresa) TYPE string,

      get_salario
        REDEFINITION,

      get_ficha
        REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_empleadofijo_10_ag IMPLEMENTATION.

  METHOD get_anios.
    rt_anios_en_empresa = |El empleado lleva { anios_en_empresa }|.
  ENDMETHOD.

  METHOD get_salario.
  super->get_salario( ).
    rt_e_salario = |El salario del EMPLEADO FIJO es { me->salarioBase * me->anios_en_empresa }|."modifica el salario ya que son 50 euros por año"
  ENDMETHOD.

  METHOD get_ficha.
    rt_e_ficha = | El nombre del empleado es  { me->nombre }| &
                   | El DNI del empleado es  { me->dni }| &
                   | { get_salario( ) }| &
                   | El tiempo que lleva del empleado es: { me->anios_en_empresa } años|.
  ENDMETHOD.

  METHOD constructor.
    super->constructor( i_nombre = i_nombre i_dni = i_dni i_salarioBase = i_salarioBase ).
    anios_en_empresa = i_anios_en_empresa.
  ENDMETHOD.

ENDCLASS.

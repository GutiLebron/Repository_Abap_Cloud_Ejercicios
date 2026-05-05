CLASS zcl_empleadostest_10_ag DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_empleadostest_10_ag IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(lo_empleado) = NEW ZCL_EMPLEADOS_10_AG( i_nombre = 'Antonio' i_dni = '123456789M' i_salarioBase = 1200 ).

    out->write( lo_empleado->get_ficha(  ) ).

    DATA(lo_empleadoFijo) = new zcl_empleadoFijo_10_ag( i_nombre = 'Juan' i_dni = '123456789A' i_salarioBase = 1500 i_anios_en_empresa = 2 ).

    out->write( lo_empleadoFijo->get_ficha(  ) ).
    data(salaioEmpleadoFijo) = lo_empleadoFijo->get_salario(  ).
    out->write( salaioempleadofijo ).

    DATA(lo_empleadoTemporal) = new zcl_empleadoTemporal_10_ag( i_nombre = 'Jose' i_dni = '123456789B' i_salarioBase = 1500 i_precio_hora = 15 i_horas_trabajadas = 3 ).

    out->write( lo_empleadoTemporal->get_ficha( ) ).
    out->write( lo_empleadotemporal->get_salario(  ) ).

  ENDMETHOD.

ENDCLASS.

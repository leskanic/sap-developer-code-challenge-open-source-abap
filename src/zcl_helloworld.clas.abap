class ZCL_HELLOWORLD definition
  public
  final
  create public .

public section.

  class-methods HELLO_WORLD .
protected section.
private section.
ENDCLASS.



CLASS ZCL_HELLOWORLD IMPLEMENTATION.


  METHOD hello_world.
    cl_demo_output=>display_text( |Hello, World!| ).
  ENDMETHOD.
ENDCLASS.

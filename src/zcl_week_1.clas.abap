class ZCL_WEEK_1 definition
  public
  final
  create public .

public section.

  class-methods HELLO_WORLD .
protected section.
private section.
ENDCLASS.



CLASS ZCL_WEEK_1 IMPLEMENTATION.


  METHOD HELLO_WORLD.
    cl_demo_output=>display_text( |Hello, World!| ).
  ENDMETHOD.
ENDCLASS.

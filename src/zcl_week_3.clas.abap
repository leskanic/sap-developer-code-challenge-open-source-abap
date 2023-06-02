CLASS zcl_week_3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    TYPES:
      BEGIN OF ty_key_value,
        key   TYPE string,
        value TYPE string,
      END OF ty_key_value,
      ty_key_value_t TYPE STANDARD TABLE OF ty_key_value WITH DEFAULT KEY,
      BEGIN OF ty_list,
        name TYPE string,
        list TYPE ty_key_value_t,
      END OF ty_list.
    METHODS main.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.
CLASS ZCL_WEEK_3 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(list) = VALUE ty_list( name = |Key-Value List| list = VALUE #( ( key = |Key 1| value = |Value 1| )
                                                                        ( key = |Key 2| value = |Value 2| )
                                                                        ( key = |Key 3| value = |Value 3| ) ) ).
    TRY.
        DATA(mustache) = zcl_mustache=>create( it_template = VALUE string_table( ( |List Directory| )
                                                                                 ( |===| )
                                                                                 ( |List Name: \{\{name\}\}| )
                                                                                 ( |List Contents:| )
                                                                                 ( |---| )
                                                                                 ( |\{\{#list\}\}| )
                                                                                 ( |Key: \{\{key\}\} \| Value: \{\{value\}\}| )
                                                                                 ( |\{\{/list\}\}| ) ) ).
        out->write( mustache->render( list ) ).
      CATCH zcx_mustache_error ##NO_HANDLER.
    ENDTRY.
  ENDMETHOD.
  METHOD main.
    DATA(list) = VALUE ty_list( name = |Key-Value List| list = VALUE #( ( key = |Key 1| value = |Value 1| )
                                                                        ( key = |Key 2| value = |Value 2| )
                                                                        ( key = |Key 3| value = |Value 3| ) ) ).
    TRY.
        DATA(mustache) = zcl_mustache=>create( it_template = VALUE string_table( ( |List Directory| )
                                                                                 ( |===| )
                                                                                 ( |List Name: \{\{name\}\}| )
                                                                                 ( |List Contents:| )
                                                                                 ( |---| )
                                                                                 ( |\{\{#list\}\}| )
                                                                                 ( |Key: \{\{key\}\}\|Value: \{\{value\}\}| )
                                                                                 ( |\{\{/list\}\}| ) ) ).
        cl_demo_output=>display_text( mustache->render( list ) ).
      CATCH zcx_mustache_error ##NO_HANDLER.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.

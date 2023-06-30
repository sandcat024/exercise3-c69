CLASS zcl_material_information_c69_5 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_material_art
      IMPORTING matnr               TYPE i_product-Product
      RETURNING VALUE(material_art) TYPE i_product-ProductType.

ENDCLASS.

CLASS zcl_material_information_c69_5 IMPLEMENTATION.

  METHOD get_material_art.

    DATA material TYPE i_product.
    DATA production_date TYPE datn.
    DATA bool_tmp TYPE boole_d.

    production_Date = sy-datum.

    SELECT SINGLE
      FROM i_product FIELDS ProductType
     WHERE Product = @matnr
      INTO CORRESPONDING FIELDS OF @material .

    material_art = material-ProductType.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

    DATA material_info TYPE REF TO zcl_material_information_c69_5.
    material_info = NEW zcl_material_information_c69_5(  ).
    DATA(material_art) = material_info->get_material_art( 'RM34' ).
    out->write( material_art ).

  ENDMETHOD.

ENDCLASS.

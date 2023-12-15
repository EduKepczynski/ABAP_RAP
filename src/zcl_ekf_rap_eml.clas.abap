CLASS zcl_ekf_rap_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ekf_rap_eml IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    " Step 1 - READ
*    READ ENTITIES OF zekf_dd_travel
*    ENTITY Travel
*    FROM VALUE #( ( TravelUUID = '064F3910F07FA2BA18001F56B848D192' ) )
*    RESULT DATA(travels).
*    out->write( travels ).

*    " Step 2 - READ with specified fields
*    READ ENTITIES OF zekf_dd_travel
*    ENTITY Travel
*    FIELDS ( AgencyID CustomerID )
*    WITH VALUE #( ( TravelUUID = '064F3910F07FA2BA18001F56B848D192' ) )
*    RESULT DATA(travels).
*    out->write( travels ).

*    " Step 3 - READ with ALL fields
*    READ ENTITIES OF zekf_dd_travel
*    ENTITY Travel
*    ALL FIELDS
*    WITH VALUE #( ( TravelUUID = '064F3910F07FA2BA18001F56B848D192' ) )
*    RESULT DATA(travels).
*    out->write( travels ).

*    " Step 4 - READ by association
*    READ ENTITIES OF zekf_dd_travel
*    ENTITY Travel BY \_Booking
*    ALL FIELDS
*    WITH VALUE #( ( TravelUUID = '064F3910F07FA2BA18001F56B848D192' ) )
*    RESULT DATA(travels).
*    out->write( travels ).

*    " Step 5 - unsuccessful READ
*    READ ENTITIES OF zekf_dd_travel
*    ENTITY Travel
*    ALL FIELDS
*    WITH VALUE #( ( TravelUUID = '111111111111111111111111111111111' ) )
*    RESULT DATA(travels)
*    FAILED DATA(failed)
*    REPORTED DATA(reported).
*    out->write( travels ).
*    out->write( failed ).
*    out->write( reported ).

*    "Step 6 - MODIFY Update
*    MODIFY ENTITIES OF zekf_dd_travel
*      ENTITY Travel
*        UPDATE
*          SET FIELDS WITH VALUE
*            #( ( TravelUUID  = '064F3910F07FA2BA18001F56B848D192'
*                 Description = 'RAP course at openSAP' ) )
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    "Step 6b - commit the change
*    COMMIT ENTITIES RESPONSE OF zekf_dd_travel
*    FAILED DATA(failed_commit)
*    REPORTED DATA(reported_commit).
*    out->write( 'Update done' ).



*    "Step 7 - MODIFY Create
*    MODIFY ENTITIES OF zekf_dd_travel
*      ENTITY Travel
*        CREATE
*          SET FIELDS WITH VALUE
*            #( ( %cid        = 'MyContentID_1'
*                 AgencyID    = '70012'
*                 CustomerID  = '14'
*                 BeginDate   = cl_abap_context_info=>get_system_date( )
*                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'Created with EML - Modify Create' ) )
*     MAPPED DATA(mapped)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*      RESPONSE OF zekf_dd_travel
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*    out->write( 'Create done' ).




    " step 8 - MODIFY Delete
    MODIFY ENTITIES OF zekf_dd_travel
      ENTITY Travel
        DELETE FROM
          VALUE
            #( ( TravelUUID  = '4EE91298092A1EDEA6D5E308ED9C5D8C' ) ) "Number generated with the MODIFY CREATE statement.
     FAILED DATA(failed)
     REPORTED DATA(reported).

    COMMIT ENTITIES
      RESPONSE OF zekf_dd_travel
      FAILED     DATA(failed_commit)
      REPORTED   DATA(reported_commit).

    out->write( 'Delete done' ).


  ENDMETHOD.

ENDCLASS.








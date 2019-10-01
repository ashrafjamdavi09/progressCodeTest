PROCEDURE NewCust:
    DEFINE VARIABLE name AS CHARACTER INITIAL "Ashraf Nawaz".
    /* Let subscriber know new customer */
    PUBLISH "NewCustomer" (INPUT name).
END PROCEDURE.

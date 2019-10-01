OUTPUT TO "C:\Testing\practiceID.csv".
FOR EACH _file WHERE _file._Hidden = FALSE:

    FOR EACH _field WHERE _field._File-recid = RECID(_file):
        IF _field._Field-Name =  "Practiceid" THEN
            EXPORT DELIMITER "," _file._File-Name _field._Field-Name.
    END.

END.
OUTPUT CLOSE.


PROCEDURE p1:
    MESSAGE "from super procedure: "
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.

    MESSAGE "TARGET-PROCEDURE:FILE-NAME: " TARGET-PROCEDURE:FILE-NAME SKIP
        "SOURCE-PROCEDURE:FILE-NAME: " SOURCE-PROCEDURE:FILE-NAME
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.


END.
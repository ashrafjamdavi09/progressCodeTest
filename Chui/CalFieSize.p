
DEFINE VARIABLE totFileSize AS DECIMAL      NO-UNDO.
DEFINE VARIABLE inpFileName AS CHARACTER   NO-UNDO.
DEFINE VARIABLE iCount AS INTEGER     NO-UNDO.
DEFINE VARIABLE iNotValid  AS INTEGER     NO-UNDO.

INPUT FROM "C:\Testing\Filelist.txt".
ETIME(TRUE).
REPEAT:
    IMPORT inpFileName.
    ASSIGN FILE-INFO:FILE-NAME = inpFileName.
            iCount = iCount + 1.

    IF  FILE-INFO:FULL-PATHNAME = ? THEN
    DO:
        ASSIGN iNotValid =  iNotValid + 1.
       
         NEXT.
    END.
       

    ASSIGN totFileSize =  totFileSize +  (FILE-INFO:FILE-SIZE / 1024) / 1024 .

END.

INPUT CLOSE.

MESSAGE ETIME
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.

MESSAGE iCount
        iNotValid
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
MESSAGE totFileSize SKIP
    "in MB"
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.

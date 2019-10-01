using IntergyClasses.Core.Lib.* from propath.

DEFINE VARIABLE iStatus AS INTEGER NO-UNDO INIT ?.

DEFINE VARIABLE iResult AS INTEGER NO-UNDO INIT 0.
DEFINE VARIABLE i AS INTEGER.


FUNCTION FieldExists RETURNS LOGICAL (INPUT ipcTableName AS CHARACTER, INPUT ipcFieldName AS CHARACTER) FORWARD.

RUN SetCurrentDirectoryW (INPUT CODEPAGE-CONVERT("C:\ProgressV11\12.00Local\db", "UTF-16"), OUTPUT iResult).
IF iResult = 1 THEN MESSAGE "Current directory has been changed" VIEW-AS ALERT-BOX.
ELSE MESSAGE "Directory does not exist, or access is denied" VIEW-AS ALERT-BOX.

MESSAGE "Process Started"
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.

if NOT FileHelper:FileExists ("C:\ProgressV11\12.00Local\db\MedmanTemp.db") then do:

    OS-COMMAND SILENT VALUE("prostrct create C:\ProgressV11\12.00Local\db\MedmanTemp C:\ProgressV11\12.00Local\db\Medman.st").
    
    iStatus = OS-ERROR.
    
    IF iStatus <> 0 THEN
        MESSAGE "Error occoured during creating the db"
            VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
            
    
    
    OS-COMMAND SILENT VALUE ("procopy C:\ProgressV11\OpenEdge\empty4 C:\ProgressV11\12.00Local\db\MedmanTemp").
    iStatus = OS-ERROR.
    IF iStatus <> 0 THEN
        MESSAGE "Error occoured during copying empty db"
            VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
        
END.

if NOT FileHelper:FileExists ("C:\Testing\Code\DumpLoad\data\medman.df") THEN
    RUN dumDefinition.

//RUN loadDefinition.
//RUN dumpTableData.

RUN loadTableData.

PROCEDURE loadTableData:
    FOR EACH medman._file 
        WHERE medman._file._tbl-type = "t"
        NO-LOCK:
        IF FieldExists (medman._file._file-name, "practiceID") THEN DO:
            MESSAGE 222222
                VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
            OS-COMMAND SILENT VALUE ("proutil C:\ProgressV11\12.00Local\db\MedmanTemp -C load C:/Testing/Code/DumpLoad/data/" + medman._file._file-name + ".bd build indexes").
            i = i + 1.
        END.
        IF i = 10 THEN
            LEAVE.
    END.
END PROCEDURE.

PROCEDURE dumpTableData:

    MESSAGE 11111
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
    FOR EACH medman._file 
        WHERE medman._file._tbl-type = "t"
        NO-LOCK:
        IF FieldExists (medman._file._file-name, "practiceID") THEN DO:
            OS-COMMAND SILENT VALUE ("proutil C:\ProgressV11\12.00Local\db\Medman -C dumpspecified " + medman._file._file-name + ".practiceID eq 6 C:/Testing/Code/DumpLoad/data/").
            i = i + 1.
        END.
        IF i = 10 THEN
            LEAVE.
    END.
END PROCEDURE.

PROCEDURE dumDefinition:
    CREATE ALIAS DICTDB FOR DATABASE Medman.
   RUN prodict/dump_df.p ("ALL","C:\Testing\Code\DumpLoad\data\medman.df","").
END PROCEDURE.

PROCEDURE loadDefinition:

    OS-COMMAND SILENT VALUE ("proserve C:\ProgressV11\12.00Local\db\MedmanTemp.db -H localhost -S 1500").
    iStatus = OS-ERROR.
    IF iStatus <> 0 THEN
        MESSAGE "Error occoured during starting the db on port 1500"
            VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.

    IF NOT CONNECTED ("MedmanTemp") THEN
        CONNECT -db MedmanTemp -H localhost -S 1500.
   
    CREATE ALIAS DICTDB FOR DATABASE MedmanTemp.
    RUN prodict/load_df.p ("C:\Testing\Code\DumpLoad\data\medman.df").
END PROCEDURE.

PROCEDURE SetCurrentDirectoryW EXTERNAL "KERNEL32.DLL":
   DEFINE INPUT  PARAMETER chrCurDir AS CHARACTER.
   DEFINE RETURN PARAMETER iResult AS LONG.
END PROCEDURE.


FUNCTION FieldExists RETURNS LOGICAL (INPUT ipcTableName AS CHARACTER, INPUT ipccFieldName AS CHARACTER):
    DEFINE VARIABLE hBufferHandle AS HANDLE NO-UNDO.
    DEFINE VARIABLE lResult AS LOGICAL NO-UNDO.
 
    CREATE BUFFER hBufferHandle FOR TABLE ipcTableName NO-ERROR.
    lResult = VALID-HANDLE(hBufferHandle) AND VALID-HANDLE(hBufferHandle:BUFFER-FIELD(ipccFieldName)) NO-ERROR.
    IF  VALID-HANDLE(hBufferHandle) THEN DELETE OBJECT hBufferHandle.
    RETURN lResult.

END FUNCTION.


define variable cDriver                 as character    no-undo init ?.
define variable cIPAddress              as character    no-undo init ''.
define variable cOdbcPasswd             as character    no-undo init ?.
define variable cOdbcUserId             as character    no-undo init ?.
define variable cConnectionErrors       as character    no-undo init ?.
DEFINE VARIABLE SQLCommand              AS CHARACTER    NO-UNDO.
DEFINE VARIABLE cWhereClause AS CHARACTER   NO-UNDO.
define variable cOdbcNull as character no-undo init ?.
DEFINE VARIABLE cFileName AS CHARACTER   NO-UNDO.


 define variable hRecordSet         as com-handle   no-undo.
 define variable hCommand           as com-handle   no-undo.
 define variable ghConnection      as com-handle   no-undo.

 
 assign    cOdbcUserId  = "postgres"
           cOdbcPasswd  = "dothedew"
           cDriver      = chr(123) + 'PostgreSQL UNICODE':U + chr(125)
           cIPAddress   = "localhost".
          
           
create "ADODB.Connection" ghConnection.
             
ghConnection:open("DRIVER=" + cDriver + ";SERVER=" +
                          cIPAddress + ";PORT=5432;DATABASE=storageDB;", cOdbcUserId, cOdbcPasswd, 0) NO-ERROR.

if error-status:num-messages > 0 then do:  /* If the connection had errors then: */
    cConnectionErrors = chr(10) +  error-status:get-message(1).
    
    message 'Error: Unable to establish connection to the imaging server database.' + cConnectionErrors
        view-as alert-box.
end.

if ghConnection <> ? then do:

        /* Create the ADO objects needed to query the db. */

    ASSIGN cWhereClause = "name = 1438-01"
           SQLCommand   = 'select catalog_id, name from catalog;'.
      /* Clear the error status. */
        
         create 'ADODB.RecordSet':U hRecordSet.
         create 'ADODB.Command':U hCommand.


        ASSIGN  error-status:error = no.

        ASSIGN  hCommand:ActiveConnection   = ghConnection
                hCommand:CommandText = SQLCommand
                hCommand:CommandType = 1
                ghConnection:CursorLocation = 3
                hRecordSet = hCommand:execute(output cOdbcNull,'' , 32).


    hRecordSet:MoveFirst NO-ERROR.

    do while (not hRecordSet:EOF):
        cFileName =  hRecordSet:fields('name':U):value.

        MESSAGE cFileName
            VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
        hRecordSet:MoveNext no-error.
    END.
  
release object hCommand no-error.
release object hRecordSet no-error.
  
assign hCommand = ?
       hRecordSet = ?.
      


END.

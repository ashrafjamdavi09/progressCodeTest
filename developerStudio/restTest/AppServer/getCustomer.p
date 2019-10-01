@openapi.openedge.export FILE(type="REST", executionMode="external", useReturnValue="false", writeDataSetBeforeImage="false").
define input parameter piCustNum as integer no-undo.

define temp-table ttCust no-undo
    fields custNum as integer
    fields custName as character.

define output parameter table for ttCust.
define output parameter pError as character init ''.


find first customer
    where customer.cust-num = piCustNum
    no-lock no-error.
    
if available customer then
do:
    create ttCust.
    assign ttCust.custName = customer.name
           ttCust.custNum = piCustNum.
end.
else
    assign pError = "No Customer Record Available".

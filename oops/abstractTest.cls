CLASS abstractTest abstract:

    CONSTRUCTOR PUBLIC abstractTest():
       
    END CONSTRUCTOR.
    
    method abstract protected character getTableName().
    
    
    define public property DAL_TableName as character no-undo   
        get ():
    	     return getTableName().
    	end get.



END CLASS.

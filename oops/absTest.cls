CLASS absTest INHERITS abstractTest:

    DEFINE VARIABLE ctest AS abstractTest   NO-UNDO.
    
    CONSTRUCTOR PUBLIC absTest():
        SUPER().
    END CONSTRUCTOR.

    method override protected character GetTableName():
	    return "Preference".
	end method.
END CLASS.

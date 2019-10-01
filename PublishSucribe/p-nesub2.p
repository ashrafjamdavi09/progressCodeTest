PROCEDURE NewCustomer:
    DEFINE INPUT PARAMETER name AS CHAR.
    MESSAGE "Subscriber 2 received event NewCustomer concerning " name
    VIEW-AS ALERT-BOX.
    /* This subscriber receives the first event, then removes itself */
    /*UNSUBSCRIBE TO ALL.*/
END.

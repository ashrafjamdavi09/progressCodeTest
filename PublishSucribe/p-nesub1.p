DEFINE INPUT PARAMETER hPub AS HANDLE.

SUBSCRIBE TO "NewCustomer" IN hPub.

PROCEDURE NewCustomer:
    DEFINE INPUT PARAMETER name AS CHAR.
    MESSAGE "Subscriber 1 received event NewCustomer concerning " name
    VIEW-AS ALERT-BOX.
END.

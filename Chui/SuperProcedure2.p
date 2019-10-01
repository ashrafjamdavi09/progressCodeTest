DEFINE VARIABLE myHandle AS HANDLE.


RUN "C:\testing\Code\chui\superprocedure1.p" PERSISTENT SET myHandle.

THIS-PROCEDURE:ADD-SUPER-PROCEDURE(myHandle).

RUN p1.

PROCEDURE p1:
    RUN SUPER.
    MESSAGE "in main"
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END.

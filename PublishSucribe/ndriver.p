DEFINE VARIABLE hPub AS HANDLE.
DEFINE VARIABLE hSub1 AS HANDLE.
DEFINE VARIABLE hSub2 AS HANDLE.

DEFINE BUTTON bNewCust LABEL "New Customer".

DEFINE BUTTON bQuit LABEL "Quit".

RUN C:\Testing\Code\PublishSucribe\p-nepub.p PERSISTENT set hPub.

RUN C:\Testing\Code\PublishSucribe\p-nesub1.p PERSISTENT set hSub1 (hPub).

RUN C:\Testing\Code\PublishSucribe\p-nesub2.p PERSISTENT set hSub2.

/* Subscribe to event NewCustomer on behalf of subscriber 2 */
SUBSCRIBE PROCEDURE hSub2 TO "NewCustomer" IN hPub.

FORM bNewCust bQuit WITH FRAME x.
ENABLE ALL WITH FRAME x.
ON CHOOSE OF bNewCust RUN NewCust in hPub.
WAIT-FOR CHOOSE OF bQuit OR WINDOW-CLOSE OF CURRENT-WINDOW.

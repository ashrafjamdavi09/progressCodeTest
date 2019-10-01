DEFINE TEMP-TABLE ttOrder NO-UNDO
    FIELD orderNum AS INTEGER
    FIELD orderDate AS DATE
    FIELD shipDate AS DATE
    FIELD promiseDate AS DATE
    FIELD orderTotal AS DECIMAL
    INDEX orderNum AS PRIMARY UNIQUE orderNum.

DEFINE TEMP-TABLE ttOrderLine NO-UNDO
    FIELD orderNum AS INTEGER
    FIELD lineNum AS INTEGER
    FIELD itemNum AS INTEGER
    FIELD price AS DECIMAL
    FIELD Qty AS INTEGER
    FIELD Discount AS INTEGER
    FIELD extendedPrice  AS DECIMAL
    INDEX orderNum_LineNum AS PRIMARY UNIQUE orderNum lineNum.

DEFINE DATASET dsOrderOrderLine FOR ttOrder, ttOrderLine
    DATA-RELATION drOrderOrderLine FOR ttOrder, ttOrderLine RELATION-FIELDS (orderNum, orderNum).

DEFINE QUERY qOrder FOR order.
DEFINE DATA-SOURCE srcOrder FOR QUERY qOrder.
DEFINE DATA-SOURCE srcOrderLine FOR OrderLine.

BUFFER ttOrder:ATTACH-DATA-SOURCE (DATA-SOURCE srcOrder:HANDLE,?,?).
BUFFER ttOrderLine:ATTACH-DATA-SOURCE(data-source srcOrderLine:HANDLE,?,?).

QUERY qOrder:QUERY-PREPARE ("For each order where ShipDate <> ?").

DATASET dsOrderOrderLine:FILL().

FOR EACH ttOrder:
    DISP ttOrder.OrderNum
         ttOrder.OrderDate
         ttOrder.ShipDate
        WITH FRAME ttOrderFarame 1 COL TITLE "Order".
    FOR EACH ttOrderLine OF ttOrder:
        DISPLAY 
            ttOrderLine.orderNum
            ttOrderLine.LineNum
            ttOrderLine.ItemNum
            ttOrderLine.Price
            ttOrderLine.Qty
            WITH FRAME ttOrderLineFrame 1 COL TITLE "Order Line".
    END.
END.


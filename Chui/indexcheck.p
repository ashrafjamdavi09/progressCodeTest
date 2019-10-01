/*
FOR EACH customer WHERE customer.sales-rep = "DDD" AND customer.NAME = "ashraf" AND city > 'aaa':
    MESSAGE 11111
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END. */

/*
FOR EACH customer WHERE customer.cust-num = 10 AND customer.NAME = "ashraf":
    MESSAGE 11111
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END.
*/

/*
FOR EACH customer WHERE customer.city = "abc" AND customer.country = "ashraf":
    MESSAGE 11111
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
END. */

FOR EACH customer WHERE Contact = "DLC" AND (Sales-Rep BEGINS "S" OR Sales-Rep BEGINS "B"):
END.

DO FOR Customer:
  FIND FIRST Customer NO-LOCK WHERE cust-num = 1.
  DISPLAY Customer.Cust-Num.
END.

FOR FIRST customer NO-LOCK:
    DISP cust-num.
END.

FOR EACH Customer NO-LOCK WHERE Customer.State = "NH" 
  BY Customer.Credit-Limit DESCENDING:
  DISPLAY Customer.Cust-Num Customer.Name Customer.Credit-Limit.
END.

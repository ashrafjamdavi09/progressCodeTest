
/*

    find first medman.SystemJobProperty exclusive-lock where systemjobID = 17 and medman.SystemJobProperty.Name = "SJOB-RUN-LOCATION".
    assign medman.SystemJobProperty.ValueIsEditable = no
           medman.SystemJobProperty.DefaultValue = "RUN-SPECIFIC-MACHINE".
           
           */

/*

for each medman.SystemJobScheduledProp exclusive-lock where Medman.SystemJobScheduledProp.SystemJobID = 17 and Medman.SystemJobScheduledProp.Name = "SJOB-RUN-LOCATION":
   assign medman.SystemJobScheduledProp.PropertyValue = "RUN-SPECIFIC-MACHINE".
   message 111
       view-as alert-box information.
   
end.

for each medman.SystemJobScheduledProp exclusive-lock where Medman.SystemJobScheduledProp.SystemJobID = 17 and Medman.SystemJobScheduledProp.Name = "SJOB-RUN-LOCATION-MACHINE":
   assign medman.SystemJobScheduledProp.PropertyValue = "".
   message 222
       view-as alert-box information.
   
end.


*/

/*
message 111
    view-as alert-box information.

find first medman.SystemJobProperty exclusive-lock where systemjobID = 17 and medman.SystemJobProperty.Name = "SJOB-RUN-LOCATION-EVERYWHERE".
    assign medman.SystemJobProperty.ValueIsEditable = yes.

find first medman.SystemJobProperty exclusive-lock where systemjobID = 17 and medman.SystemJobProperty.Name = "SJOB-RUN-LOCATION-MACHINE".
    assign medman.SystemJobProperty.ValueIsEditable = yes. */

/*
message "begin"
    view-as alert-box information.

for each medman.SystemJobScheduled where Medman.SystemJobScheduled.SystemJobID = 17 exclusive-lock:
    assign medman.SystemJobScheduled.MachineName = "".
    message "1111"
        view-as alert-box information.
    
end.
*/

/*
find first medman.SystemJobProperty exclusive-lock where systemjobID = 17 and medman.SystemJobProperty.Name = "SJOB-RUN-LOCATION".
    assign medman.SystemJobProperty.ValueIsEditable = no
           medman.SystemJobProperty.DefaultValue = "RUN-ANYWHERE". */


for each medman.SystemJobScheduledProp exclusive-lock where Medman.SystemJobScheduledProp.SystemJobID = 17 and Medman.SystemJobScheduledProp.Name = "SJOB-RUN-LOCATION":
   assign medman.SystemJobScheduledProp.PropertyValue = "RUN-ANYWHERE".
   message 111
       view-as alert-box information.
   
end.

for each medman.SystemJobScheduledProp exclusive-lock where Medman.SystemJobScheduledProp.SystemJobID = 17 and Medman.SystemJobScheduledProp.Name = "SJOB-RUN-LOCATION-MACHINE":
   assign medman.SystemJobScheduledProp.PropertyValue = "".
   message 222
       view-as alert-box information.
   
end.


/*
find first medman.SystemJobProperty exclusive-lock where systemjobID = 17 and medman.SystemJobProperty.Name = "SJOB-RUN-LOCATION".
    assign medman.SystemJobProperty.ValueIsEditable = no
           medman.SystemJobProperty.DefaultValue = "RUN-SPECIFIC-MACHINE".
           
find first medman.SystemJobProperty exclusive-lock where systemjobID = 17 and medman.SystemJobProperty.Name = "SJOB-RUN-LOCATION-EVERYWHERE".
    assign medman.SystemJobProperty.ValueIsEditable = no.

find first medman.SystemJobProperty exclusive-lock where systemjobID = 17 and medman.SystemJobProperty.Name = "SJOB-RUN-LOCATION-MACHINE".
    assign medman.SystemJobProperty.ValueIsEditable = no.

*/

/*
for each medman.SystemJobScheduledProp exclusive-lock where Medman.SystemJobScheduledProp.SystemJobID = 17:
    message 1111
        view-as alert-box information.
    
    delete medman.SystemJobScheduledProp.
end.
    
    */

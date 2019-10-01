DEFINE VARIABLE mydatasetHandle AS HANDLE.

DEFINE TEMP-TABLE ttStudent NO-UNDO
    FIELD id AS INTEGER
    FIELD NAME AS CHARACTER
    FIELD rollNumber AS CHARACTER
    FIELD schoolSession AS CHARACTER
    INDEX idx IS PRIMARY id.


DEFINE TEMP-TABLE ttStuEducationDetail NO-UNDO
    FIELD stuEducDetailID AS INTEGER
    FIELD stuID AS INTEGER
    FIELD stuclass AS CHARACTER
    FIELD schoolSession AS CHARACTER
    INDEX idx AS PRIMARY stuID
    INDEX idx2 stuEducDetailID.

DEFINE TEMP-TABLE ttStuMarksDetail NO-UNDO
    FIELD stuEducDetailID AS INTEGER
    FIELD studentSub AS CHARACTER
    FIELD studentmarks AS INTEGER
    INDEX idx AS PRIMARY stuEducDetailID.


DEFINE DATASET stuDentDataSet
    FOR ttStudent, ttStuEducationDetail, ttStuMarksDetail
    DATA-RELATION FOR ttStudent, ttStuEducationDetail RELATION-FIELD (id, stuID)
    DATA-RELATION FOR ttStuEducationDetail, ttStuMarksDetail RELATION-FIELD (stuEducDetailID, stuEducDetailID).



CREATE ttStudent.
ASSIGN ttStudent.id            =  1
       ttStudent.NAME          =  "Ashraf nawaz"
       ttStudent.rollNumber    = "14mca10"
       ttStudent.schoolSession = "2018-2019".

CREATE ttStuEducationDetail.
ASSIGN ttStuEducationDetail.stuEducDetailID  = 1
       ttStuEducationDetail.stuID            = 1
       ttStuEducationDetail.stuclass         = "MCA"
       ttStuEducationDetail.schoolSession   = "2018-2019".


CREATE ttStuMarksDetail.
ASSIGN ttStuMarksDetail.stuEducDetailID   =  1
       ttStuMarksDetail.studentSub        =  "C"
       ttStuMarksDetail.studentmarks      =  80.

CREATE ttStuMarksDetail.
ASSIGN ttStuMarksDetail.stuEducDetailID   =  1
       ttStuMarksDetail.studentSub        =  "Java"
       ttStuMarksDetail.studentmarks      =  75.

mydatasetHandle = DATASET stuDentDataSet:HANDLE.


DEFINE VARIABLE iBuffer AS INTEGER NO-UNDO.
DEFINE VARIABLE hBuffer AS HANDLE NO-UNDO.

/* This block shows how to access the DataSet's buffers and the data in their
   temp-table records. */
DO iBuffer = 1 TO mydatasetHandle:NUM-BUFFERS:
  hBuffer = mydatasetHandle:GET-BUFFER-HANDLE(iBuffer).
END.




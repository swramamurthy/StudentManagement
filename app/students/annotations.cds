using StudentService from '../../srv/student-service';

 // Risk List Report Page
 annotate StudentService.StudentList with @(UI : {
    HeaderInfo : {
       TypeName : 'Student',
       TypeNamePlural : 'Students',
       Title : {
          $Type : 'UI.DataField',
          Value : studentname
       },
       Description : {
          $Type : 'UI.DataField',
            Value : studentage
       }
    },
    SelectionFields : [studentsex],
    Identification : [{Value : studentname}],
    // Define the table columns
    LineItem : [
       {Value : studentname},
       {Value : studentcourse_courseID},
       {Value : studentage},
       {Value : studentsex},
       {Value : bp_BusinessPartner}
    ],
 });
 // Risk Object Page
 annotate StudentService.StudentList with @(UI : {
     Facets : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Main',
        Target : '@UI.FieldGroup#Main',
     }],
     FieldGroup #Main : {Data : [
       {Value : studentcourse_courseID},
       {Value : studentage},
       {Value : studentsex},
       {Value : bp_BusinessPartner}       
    ]},
 });
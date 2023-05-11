using studentmanagement as sm from '../db/schema';

// Annotate Risk elements
annotate sm.Students with {
   studentID     @title: 'Student ID';
   studentname   @title: 'Student Name';
   studentage    @title: 'Student Age';
   studentsex    @title: 'Sex';
   studentcourse @title: 'Student Course';
   bp            @title: 'Business Partner';
}

// Annotate Miti elements
annotate sm.Courses with {
   courseID   @(
      UI.Hidden,
      Common: {Text: coursename}
   );
   coursename @title: 'Name';
}

annotate sm.BusinessPartners with {
   BusinessPartner @(
      UI.Hidden,
      Common: {Text: LastName}
   );
   LastName        @title: 'Last Name';
   FirstName       @title: 'First Name';
}

annotate sm.Students with {
   studentcourse @(Common: {
      //show text, not id for mitigation in the context of risks
      Text           : studentcourse.coursename,
      TextArrangement: #TextOnly,
      ValueList      : {
         Label         : 'Courses',
         CollectionPath: 'CourseList',
         Parameters    : [
            {
               $Type            : 'Common.ValueListParameterInOut',
               LocalDataProperty: studentcourse_courseID,
               ValueListProperty: 'courseID'
            },
            {
               $Type            : 'Common.ValueListParameterDisplayOnly',
               ValueListProperty: 'coursename'
            }
         ]
      }
   });


   bp@(Common: {
      Text           : bp.LastName,
      TextArrangement: #TextOnly,
      ValueList      : {
         Label         : 'Business Partners',
         CollectionPath: 'BusinessPartners',
         Parameters    : [
            {
               $Type            : 'Common.ValueListParameterInOut',
               LocalDataProperty: bp_BusinessPartner,
               ValueListProperty: 'BusinessPartner'
            },
            {
               $Type            : 'Common.ValueListParameterDisplayOnly',
               ValueListProperty: 'LastName'
            },
            {
               $Type            : 'Common.ValueListParameterDisplayOnly',
               ValueListProperty: 'FirstName'
            }
         ]
      }
   })
}

namespace studentmanagement;

using {managed} from '@sap/cds/common';
using {API_BUSINESS_PARTNER as external} from '../srv/external/API_BUSINESS_PARTNER.csn';

entity Students : managed {
    key studentID : UUID @(Core.Computed : true);
    studentname : String(100);
    studentsex : String(5);
    studentage : Integer;
    studentcourse : Association to Courses;
    studentgroup : String(20);
    bp: Association to BusinessPartners;
}

entity Courses : managed {
    key courseID : UUID @(Core.Computed : true);
    coursename : String;
    participants : Association to many Students on participants.studentcourse = $self;
}

entity BusinessPartners as projection on external.A_BusinessPartner{
    key BusinessPartner,
    LastName,
    FirstName
}
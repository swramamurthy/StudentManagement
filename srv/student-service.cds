using {studentmanagement as sm} from '../db/schema';

@path: 'service/student'
service StudentService {
    entity StudentList @(restrict: [
        {
            grant: ['READ'],
            to   : ['StudentViewer']
        },
        {
            grant: ['*'],
            to   : ['StudentManager']
        }
    ])                      as projection on sm.Students;

    annotate StudentList with @odata.draft.enabled;

    entity CourseList @(restrict: [
        {
            grant: ['READ'],
            to   : ['StudentViewer']
        },
        {
            grant: ['*'],
            to   : ['StudentManager']
        }
    ])                      as projection on sm.Courses;

    annotate CourseList with @odata.draft.enabled;

    @readonly
    entity BusinessPartners as projection on sm.BusinessPartners;
}

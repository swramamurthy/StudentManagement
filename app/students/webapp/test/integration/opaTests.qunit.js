sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'students/test/integration/FirstJourney',
		'students/test/integration/pages/StudentListList',
		'students/test/integration/pages/StudentListObjectPage'
    ],
    function(JourneyRunner, opaJourney, StudentListList, StudentListObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('students') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStudentListList: StudentListList,
					onTheStudentListObjectPage: StudentListObjectPage
                }
            },
            opaJourney.run
        );
    }
);
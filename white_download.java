VERSION BUILD=9030808 RECORDER=FX
TAB T=1
SET !TIMEOUT_STEP 1
SET !ERRORIGNORE YES
SET !LOOP 12
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl02_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl03_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl04_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl05_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl06_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl07_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl08_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl09_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl10_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl11_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl12_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl13_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl14_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl15_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl16_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl17_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl18_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl19_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl20_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*
URL GOTO=http://medinfrared.com/Admin/Default.aspx
WAIT SECONDS=1
TAG POS=1 TYPE=SELECT FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_Pager_ddlPages CONTENT=%{{!LOOP}}
WAIT SECONDS=2
TAG POS=1 TYPE=INPUT:IMAGE FORM=ID:aspnetForm ATTR=ID:ctl00_ctl00_ContentPlaceMain_Content_ExamGrid1_gvExams_ctl21_DownloadReportCompletedButton
TAG POS=1 TYPE=BUTTON ATTR=ID:download
SAVEAS TYPE=CPL FOLDER=* FILE=*










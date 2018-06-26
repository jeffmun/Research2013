<%@ Page Language="c#" CodeFile="ReportsHelp.aspx.cs" AutoEventWireup="false" Inherits="Help.ReportsHelp" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//w3c//dtd xhtml 1.0 strict//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>UW Autism Center Intranet - Help</title>
	<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" media="screen" href="/css/help.css" />
</head>
<body>

<h1>UW Autism Center Report Definitions</h1>
<h2>General Report Features</h2>
<a name="ReportLibrary" />
<h3>Selecting a Report from the Report Library</h3>
<p>
	All studies have certain reporting requirements that are identical to one another. These are
	reports designed to present Trackers, Clinicians, and Schedulers with a variety of information
	concerning Subjects, Actions, and Measures for a particular study. Since these reports are so
	similar to each other, simply by changing the Study to which a report applies, the data in the
	report can be used by many different people. These generic reports live in the <a href="<%= Request.ApplicationPath %>/reports/" target="_top">
	UW Autism Center Report Library</a>, by clicking the "Reports" menu item on the left navigation.
	Choose a set of reports (based on category) in the Report Library by clicking the links that
	appear on this page or that appear on the Reports sub-menu on the left-navigation bar.
</p>
<a name="ReportTypes" />
<h3>Types of Reports</h3>
<p>
	Reports are currently separated into three categories: Summary Reports, which summarize various
	aspects of tracking information such as Measure or Action Status; Subject Flow Reports, which
	allow trackers and clinicians to view the status of each subject as they "flow" through a study;
	and Maintenance Reports, which point out inconsistencies in the tracking information or items that
	need to be updated or otherwise attended to. You will find these three headings in the Reports
	Library, under which you will find the reports organized by study. Reports that can be shared
	between studies are listed under the "All Studies" section. Reports that are unique to a particular
	study, are listed under that study's heading. If a particular study does not appear in the list,
	it simply means that this study does not have any customized reports defined.
</p>
<a name="Parameters" />
<h3>Report Parameters</h3>
<p>
	Certain reports require the user to enter information needed to generate the report. Before
	rendering these reports, the user will be shown a web form to enter this information. In general,
	this criteria will be simple items such as entering the Study or the Staff Member to which the
	report should pertain.
</p>
<a name="Highlighting" />
<h3>Highlighting Rows</h3>
<p>
	Most reports have the built-in ability to highlight different rows making it easier for to view
	a sub-set of particular rows in a report. To select a row, simply click the row you wish to
	highlight and the background color of that row will change to a bright yellow color. To remove
	the highlighting, simply click the row again. You can highlight as many rows as you like at any
	given time.
</p>
<a name="Links" />
<h3>Links to Other Areas of the Site</h3>
<p>
	Some of the reports will contain links that take you to other parts of the UW Austism Center
	Intranet web site. While the primary function of reports is to present information about Subject,
	Actions, and Measures in a useful and meaningful way, adding links to other more functional parts
	of the site can be useful. Where appropriate, these links have been added.
</p>
<div id="divMain" runat="server"></div>

</body>
</html>
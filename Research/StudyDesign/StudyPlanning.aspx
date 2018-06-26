<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="StudyPlanning.aspx.cs" Inherits="StudyDesign_StudyPlanning" Title="Testing Projections" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

<h4>Testing Projections</h4>

<p>The report below aggregates the total testing time & sessions across studies (based on time estimates for administration, processing, etc. of the measures used in the study).</p>



<iframe src="https://autism.washington.edu/SQLReportServer/Pages/ReportViewer.aspx?%2fStudy+Design%2fProjections_v1&rs:Command=Render" 
width="100%" height="600px">

</iframe>

</asp:Content>


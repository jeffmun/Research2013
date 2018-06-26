<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" Title="DB News" %>
<%@ MasterType VirtualPath="~/UWAC.master"  %>

<asp:Content ID="header" ContentPlaceHolderID="headContent" runat="server">

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">



<asp:Panel ID="panelNewInfo" runat="server" >


<h2>Updates to the UWAC Research DB</h2>
	<asp:Label ID="lblNew" runat="server" ForeColor="ForestGreen" Text="New changes will be noted here.  Check back periodically!"></asp:Label>
<br /><br />
<h4 style="color: gray">Apr 2018</h4>
<h3>Export subject lists & Choose Columns</h3>
<div style="width: 900px">
	
	<table>
		<tr>
			<td>
<p>Information on the <b>Subject Tracking > Subjects</b> page can now be easily exported to a variety of file formats.</p>
<p>Also, you can now choose which columns to display including the subjects's address.  Click the Column Chooser and drag and drop columns to and from the grid.</p>

			</td>
			<td>
				<img src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/images/ExportColumnChooser.PNG" />
			</td>
		</tr>
	</table>

</div>
		<hr />
<h4 style="color: gray">Mar 2018</h4>
<h3>Data projects can integrate data across studies, but...</h3>
<div style="width: 900px">
<p>Data projects can now include data across studies.  However, a subject set is defined by subjects within one particular study (<b><i>the reference study</i></b>).</p>
<p>For example, if the same individuals particpate in studies A, B, & C and these studies have been linked in the database, you can include measures from A, B, or C in your data project.</p>
<p>Suppose you define the data project from within study A.  Data from studies B & C will be included but only for subjects who are included in the subject set defined for this data project.  If new subjects were added in study B that were not in A, these new subjects would not be present in the data project.  If however, you define the data project from within study B, then these new subjects would be included, they just wouldn't have any data from measures collected in study A.</p>
<p>Note that the group and subjectstatus for each row in the <b>Data</b> worksheet will represent the values from within the study the measure was collected, <i><b>which is not necessarily the same as the reference study.</b></i></p>
<p><b><i>The id from the reference study is "ref_id".</i></b> The "ref_id" is applied to all records even when the "id" for the same person may vary across studies when the rules for ID generation/assignment are different across studies.</p>
</div>
		<hr />
<br /><br />
<h4 style="color: gray">Feb 2018</h4>
<h3>Composite variables in Data Projects</h3>
<p>Composite variables can be defined when creating a Data Project.  These are calculated when the Data Project is saved to a file.  Contact Jeff for a tutorial.</p>

<h3>Age variables in Data Projects</h3>
	<div style="width: 900px">
<p>Not all measures include a variable that reflects the subject's age when the measure was collected.</p>
<p>Now, when you include any date variable in a Data Project, the subject's age on that date is automatically calculated and included in the data file.  </p>
<p>The age variable is in months, rounded to 3 decimal places.  (Caclulated by finding the age in days then dividing by (365/12)).</p>
<p>In additional, a new variable "startdate" is also automatically included in all Data Projects.  If the definition of this "startdate" has not been defined for your study (e.g., date of the IQ test), contact Jeff to define the relevant date to use for this purpose.</p>
</div>
	<hr />
<h4 style="color: gray">Dec 2017</h4>

<h3>Login using UW NETID</h3>
<p>You now must login with your UW NETID. (Manage your NETID <a href="https://uwnetid.washington.edu/newid/" target="blank">here</a>)<br />  
	That means that you must add "netid\" before your username like this:
	<br /><br />
	<img src="<% =HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath %>/images/netid_login.png" />
</p>
<br /><br />


<hr />
<h4 style="color: gray">Sept 2017</h4>
<h3>New Menu</h3>
<p>The new menu is largely the same but many old links have been removed and links to new pages are included.<br />
You can display the old menu by selecting it in the page header.
</p>
<h3>New Pages</h3>
Items under the <b>"Subject Tracking"</b> menu allow the flexible display of:
	<ul>
		<li>Subjects</li>
		<li>Actions</li>
		<li>Measures</li>
	</ul> 
<br />
A new page for viewing and editing Actions & Measures for a single subject
	<ul>
		<li>View Single Subject</li>
	</ul>

<br />
<h4>More changes coming...</h4>
We are currently working on the following as well. 
	<ul>
		<li>A new login page based on UW NETID</li>
		<li>Descriptive Stats Viewer for all entered data</li>
		<li>A flexible Outlook-style calendar for displaying Sessions & Phone Calls</li>
	</ul>


	</asp:Panel>



	<asp:Panel ID="panel" runat="server" Visible="false">
		
<table cellspacing="0" style="width: 100%;">
	<tr>
		<td style="width: 50%; padding: 2px; vertical-align: top;">
			<asp:DataGrid	id="tblMyCalendar"
							runat="server"
							CssClass="tblMyInfo"
							AutoGenerateColumns="False"
							GridLines="None"
							style="width: 100%">
				<Columns>
					<asp:HyperLinkColumn HeaderText="My Calendar" HeaderStyle-CssClass="tdHeader" DataTextField="CompleteInfo" DataNavigateUrlFormatString="~/Measures/EditAction.aspx?ActionID={0}" DataNavigateUrlField="ActionID" />
				</Columns>
			</asp:DataGrid>
		</td>
		<td rowspan="3" style="width: 50%; padding: 2px; vertical-align: top;">
			<asp:DataGrid	id="tblNews"
							runat="server"
							CssClass="tblMyInfo"
							AutoGenerateColumns="False"
							GridLines="None"
							ShowFooter="True"
							style="width: 100%">
				<Columns>
					<asp:TemplateColumn>
						<HeaderStyle CssClass="tdHeader" />
						<HeaderTemplate>
							Database and Web Site News &amp; Information
						</HeaderTemplate>
						<ItemTemplate>
							<p>
							<asp:Label 
								ID="lblThisStart" 
								Text='<%# DataBinder.Eval(Container, "DataItem.StartDate") %>' 
								RunAt="server" />:
							<b><asp:Label 
								ID="lblThisTitle" 
								Text='<%# DataBinder.Eval(Container, "DataItem.NewsTitle") %>' 
								RunAt="server" /></b><br />
							<asp:Label 
								ID="lblThisNews" 
								Text='<%# DataBinder.Eval(Container, "DataItem.NewsText") %>' 
								RunAt="server" />
							Valid through <asp:Label 
								ID="lblThisEnd" 
								Text='<%# DataBinder.Eval(Container, "DataItem.EndDate") %>' 
								RunAt="server" />.</p>
						</ItemTemplate>
						<FooterTemplate>
							<asp:HyperLink id="NewsArchives" NavigateUrl="~/NewsArchive.aspx" Text="News Archive" runat="server" />
						</FooterTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:DataGrid>
		</td>
	</tr>
	<tr>
		<td style="width: 50%; padding: 2px; vertical-align: top;">
			<asp:DataGrid	id="tblMyActions"
							runat="server"
							CssClass="tblMyInfo"
							AutoGenerateColumns="False"
							GridLines="None"
							style="width: 100%">
				<Columns>
					<asp:HyperLinkColumn HeaderText="My Recently Updated Actions" HeaderStyle-CssClass="tdHeader" DataTextField="CompleteInfo" DataNavigateUrlFormatString="~/Measures/EditAction.aspx?ActionID={0}" DataNavigateUrlField="ActionID" />
				</Columns>
			</asp:DataGrid>
		</td>
	</tr>
	<tr>
		<td style="width: 50%; padding: 2px; vertical-align: top;">
			<asp:DataGrid	id="tblMyMeasures"
							runat="server"
							CssClass="tblMyInfo"
							AutoGenerateColumns="False"
							GridLines="None"
							style="width: 100%">
				<Columns>
					<asp:HyperLinkColumn HeaderText="My Recently Updated Measures" HeaderStyle-CssClass="tdHeader" DataTextField="CompleteInfo" DataNavigateUrlFormatString="~/Measures/EditMeasure.aspx?ActionID={0}" DataNavigateUrlField="StudyMeasSubjID" />
				</Columns>
			</asp:DataGrid>
		</td>
	</tr>
</table>

	</asp:Panel>



	<br />
	<br />
<br />



</asp:Content>
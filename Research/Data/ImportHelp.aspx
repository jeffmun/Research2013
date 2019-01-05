<%@ Page Language="c#"   Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" EnableEventValidation="true"
  CodeFile="ImportHelp.aspx.cs" Inherits="Data_ImportHelp"  Title ="Import Help"    %>  
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%--<%@ Register Assembly="Microsoft.R.Host.Client, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"  Namespace="Microsoft.R.Host.Client" TagPrefix="r"  %>--%>



<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true"></asp:Content>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


	<asp:Label ID="lbl1" runat="server" Text="Import Help" Font-Size="Medium" Font-Bold="true"></asp:Label>

	<br />
	<br />
	<h2>Importing data from files</h2>
	<p style="font-size: medium">Any data file necessarily contains 2 collections of information: 1) the structure or meta-data or data dictionary, and 2) the data values. <br />Before a file can be imported the structure and destination of the data must be defined.  Once that is accomplished the data values can be imported into the DB.</p>
	<h3>Defining the data dictionary</h3>
	<p style="font-size: medium">Before importing, the meta-data for the data must be defined in the DB.  This meta-data includes: </p>
	<ol style="font-size: medium" type="a">
	  <li>Table name</li>
	  <li>Fields or Variables</li>
	  <li>Value labels - for categorical numeric variables (e.g., 0=No, 1=Yes)</li>
	</ol>
	<p style="font-size: medium">Check the <a href="~/Library/MeasureLibrary.aspx">Measure Library</a> to see if the data you wish to import is already defined. 
		<br /> If it is not, then you can create a <a href="~/Admin/NewMeasure.aspx">New Measure</a>. 
		<br /><br />Once the measure is created, the data dictionary can be defined in a number of ways:</p>

	<table style="border: 1px silver solid">
		<tr style="padding:4px">
			<td style="font-size: small; width:300px; border: 1px silver solid; padding: 4px"><b>Defining it manually</b></td>
			<td style="font-size: small; width:300px; border: 1px silver solid; padding: 4px"><b>Extracting from RED Cap</b></td>
			<td style="font-size: small; width:300px; border: 1px silver solid; padding: 4px"><b>Extracting from NDA</b></td>
			<td style="font-size: small; width:300px; border: 1px silver solid; padding: 4px"><b>Extracting from SPSS .sav file</b></td>
		</tr>
		<tr style="vertical-align:top; font-size:small; padding:4px">
			<td style="padding:4px; border: 1px silver solid;">The <a href="Dictionary.aspx">Data Dictionary</a> page allows you to add and edit variables and value labels. </td>
			<td style="padding:4px; border: 1px silver solid;">The <a href="REDCap.aspx">REDCap Info</a> page allows you to view the meta-data for forms defined in RED Cap and copy that info for the data dictionary. </td>
			<td style="padding:4px; border: 1px silver solid;">See <a href="../NDAR/NDARapi.aspx">NDAR Data Definitions</a> page for details.</td>
			<td style="padding:4px; border: 1px silver solid;">Under construction.</td>
		</tr>
	</table>

	<br />
	<br />
	<h3>Importing Data</h3>
	<p style="font-size: medium">Once the data dictionary is complete, you are set to define how the data is to be imported by editing the "Import Settings" section for the measure (on the <a href="~/Library/Measure.aspx?mID=3839">Measure Library: Details</a> page).
		When a measure has an Import File Type defined, this will enable you to select the measure on the <a href="Import.aspx">Import Data</a> page.
	</p>

	<table align="center">
		<tr>
			<td style="vertical-align: top; padding:10px">
				<i>Screenshot from the <a href="~/Library/Measure.aspx?mID=3839"><b>Measure Library: Details</b></a> page.</i>
				<br />
				<img src="../images/importsettings_1.PNG" />

			</td>
			<td style="vertical-align: top; padding:10px">
				<i>List of Import File Types:</i>
				<br />
				<dx:ASPxGridView ID="gridImportFiletype" runat="server" ClientInstanceName="gridImportFiletype" DataSourceID="sqlImportFiletype" >
					<Columns>
						<dx:GridViewDataColumn FieldName="importfiletype"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="importfiletype_txt"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="importfiletype_desc"></dx:GridViewDataColumn>
					</Columns>
				</dx:ASPxGridView>

			</td>
		</tr>
	</table>
	<br />

	<h4>Linked Import Tables</h4>
	<table>
		<tr>
			<td width="400px" style="vertical-align:top">
		<p style="font-size: medium">Sometimes a single data files contains variables from different measures.  The UWAC DB stores data for each measure in a separate DB table.
		To handle this, you must create a set of linked import tables.  On the <a href="Import.aspx">Import Data</a> page, there is a button to manage linked tables.</p>

			
		
			</td>
			<td style="padding:10px">
					<img src="../images/managelinkedimporttablesbutton_1.PNG" />
				<br />
				<img src="../images/linkedimporttables_1.PNG" />
			</td>
		</tr>
	</table>

	<h4>Linked REDCap Forms</h4>
	<table>
		<tr>
			<td width="400px" style="vertical-align:top">
		<p style="font-size: medium">Similarly, data in REDCap that exists on separate forms, may be best represented in the UWAC DB in a single measure.  
			This is managed on the <a href="REDCap.aspx">REDCap Info</a> page.  Once you select a measure whose Import File Type is "REDCap" you can then edit which REDCap forms are linked to this measure.</p>

			</td>
			<td style="padding:10px">
				<img src="../images/linkedREDCapForms_1.PNG" />
			</td>
		</tr>
	</table>
	
	<br />
	<h4>Defining Import Settings for Fields</h4>
	<table>
		<tr>
			<td style="vertical-align:top">
				<p style="font-size: medium">The final step before import is to ensure that the import settings for each specific field are configured. 
					THIS SECTION STILL UNDER CONSTRUCTION. 

			</td>
			<td style="vertical-align:top">
				
			</td>
		</tr>
	</table>

	
	<asp:SqlDataSource ID="sqlImportFiletype" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from def.ImportFileType"  ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
	</asp:SqlDataSource>

</asp:Content>

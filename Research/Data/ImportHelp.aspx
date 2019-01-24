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
	<h2>The Process of Importing Data</h2>
	<p style="font-size: medium">Any data file necessarily contains 2 collections of information: 1) the structure or meta-data or data dictionary, and 2) the data values. <br />Before a file can be imported the structure and destination of the data must be defined.  Once that is accomplished the data values can be imported into the DB.</p>
	<h3>1. Define the data dictionary</h3>
	<p style="font-size: medium">Before importing, the meta-data for the data must be defined in the DB.  This meta-data includes: </p>
	<ol style="font-size: medium" type="a">
	  <li>Table name</li>
	  <li>Fields or Variables</li>
	  <li>Value labels - for categorical numeric variables (e.g., 0=No, 1=Yes)</li>
	</ol>
	<p style="font-size: medium">Check the <a href="~/Library/MeasureLibrary.aspx">Library > Measure Library</a> to see if the data you wish to import is already defined. 
		<br /> If it is not, then go to <a href="~/Admin/NewMeasure.aspx">Library > Create New Measure</a> to do so. 
		<br /><br />Once the measure is created, the data dictionary can be defined in a number of ways:</p>

	<table style="border: 1px silver solid">
		<tr style="padding:4px">
			<td style="font-size: small; width:300px; border: 1px silver solid; padding: 4px"><b>Defining it manually</b></td>
			<td style="padding:4px; border: 1px silver solid;">The <a href="Dictionary.aspx">Data Dictionary</a> page allows you to add and edit variables and value labels. </td>
		</tr>
		<tr>
			<td style="font-size: small; width:300px; border: 1px silver solid; padding: 4px"><b>Extracting from RED Cap</b></td>
			<td style="padding:4px; border: 1px silver solid;">The <a href="REDCap.aspx">Linked Import Tables</a> page allows you to view the meta-data for forms defined in RED Cap and copy that info for the data dictionary. </td>
		</tr>
		<tr>
			<td style="font-size: small; width:300px; border: 1px silver solid; padding: 4px"><b>Extracting from NDA</b></td>
			<td style="padding:4px; border: 1px silver solid;">See <a href="../NDAR/NDARapi.aspx">NDAR Data Definitions</a> page for details.</td>
		</tr>
		<tr>
			<td style="font-size: small; width:300px; border: 1px silver solid; padding: 4px"><b>Extracting from SPSS .sav file</b></td>
			<td style="padding:4px; border: 1px silver solid;">Extracts data dictionary from .sav file and saves meta-data to DB.</td>
		</tr>
	</table>

	<p style="font-size: medium">Finally, once the data dictionary is defined, you will need to specify the settings for each specific field.  
		The files we import sometimes contain values that need to be transformed before being saved to the DB.  
		More information on this step occurs below in <a href="#3">3. Define Import Settings for Fields</a>
		</p>
	<br />
	<br />
	<h3>2. Define Import Settings for the Measure</h3>
	<p style="font-size: medium">Once the data dictionary is complete, you are set to define how the data is to be imported by editing the "Import Settings" section for the measure (on the <a href="~/Library/Measure.aspx?mID=3839">Library > Measure Library: Details</a> page).
		When a measure has an Import File Type defined, this will enable you to select the measure on the <a href="Import.aspx">Data > Importing Data > Import Data</a> page.
	</p>

	<table align="center">
		<tr>
			<td style="vertical-align: top; padding:10px">
				<i>Section from the <a href="~/Library/Measure.aspx?mID=3839"><b>Measure Library: Details</b></a> page.</i>
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

	<h4>Linked Import Tables (from files)</h4>
	<table>
		<tr>
			<td width="600px" style="vertical-align:top">
		<p style="font-size: medium">Sometimes a single data files contains variables from different measures.  The UWAC DB stores data for each measure in a separate DB table.
		To handle this, you must create a set of linked import tables.  On the <a href="REDCap.aspx">Linked Import Tables</a> page, there is a button to manage linked tables.
			<br />
			<br />
			This example illustrates that the "Actigraph data" set, contains 3 different measures: Actigraph_epochs, Actigraph_properties, and Actigraph_stats.  
			This means that a single file that contains the Actigraph data will be saved to these 3 different measures. 
		</p>

			
		
			</td>
			<td style="padding:10px">
					<img src="../images/managelinkedimporttablesbutton_1.PNG" />
				<br />
				<img src="../images/linkedimporttables_1.PNG" />
			</td>
		</tr>
	</table>
	<br />
	<h4>Linked REDCap Forms</h4>
	<table>
		<tr>
			<td width="600px" style="vertical-align:top">
		<p style="font-size: medium">Similarly, data in REDCap that exists on separate forms, may be best represented in the UWAC DB in a single measure.  
			This is also managed on the <a href="REDCap.aspx">Linked Import Tables</a> page.  Once you select a measure whose Import File Type is "REDCap" you can then edit which REDCap forms are linked to this measure.</p>
			<br />
			<p style="font-size: medium">Once you have defined the settings for specific fields, this page will display the DB data dictionary and the linked REDCap dictionary in one table.</p>
			</td>
			<td style="padding:10px">
				<img src="../images/linkedREDCapForms_1.PNG" />
			</td>
		</tr>
	</table>
	
	<br />
	<h3 id="3">3. Define Import Settings for Fields</h3>
	<table>
		<tr>
			<td style="vertical-align:top">
				<p style="font-size: medium">The final step before import is to ensure that the import settings for each specific field are configured.<br />
					Below is a list of the available "extraction modes" you can use.  
					<br />An "extraction mode" tells the importer 2 things: 
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;First, where to find the information needed to populate a given field
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;Second, once the importer has the information, how should the information be processed before saving it to the field 
					</p>
			</td>
			<td style="vertical-align:top">
				
			</td>
		</tr>
	</table>


	<dx:ASPxGridView ID="gridFldExtractionMode" runat="server" ClientInstanceName="gridFldExtractionMode" DataSourceID="sqlFldExtractionMode" >
					<Columns>
						<dx:GridViewDataColumn FieldName="fldextractionmode" Caption="Extraction Mode"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="fldextractionmode_txt" Caption="Extraction Mode Text"></dx:GridViewDataColumn>
						<dx:GridViewDataColumn FieldName="details" Caption="Details"></dx:GridViewDataColumn>
					</Columns>
				</dx:ASPxGridView>

	<br />
	<table>
		<tr>
			<td>
				<i>Field Import Settings section from the <a href="../Data/Dictionary.aspx"><b>Library > Data Dictionary</b></a> page.</i>
				<br />
				<img src="../images/FldImportSettings_1.PNG" />

			</td>
			<td>

			</td>
		</tr>
	</table>

	<br />	<br />
	<h4>The "Text Constant" property</h4>
	<p style="font-size: medium">This property is used differently for different extraction modes.  The most common uses are as follows:
		<br />&nbsp;&nbsp;&nbsp;&nbsp<b>useOtherFld</b>: for this mode, the "Text Constant" holds the name of the field in the data to import that will be used for the given DB field.
		<br />&nbsp;&nbsp;&nbsp;&nbsp;<b>useConstString</b>: for this mode, the actual text value entered is what gets assigned to the given DB field.
		<br />
		<br />&nbsp;&nbsp;&nbsp;&nbsp;For the <b>updateAfterInsert</b> mode, this property holds the information used to define the instructions that will populate the field, after the data is inserted into the DB.
		</p>

	<br /><br />

		<h3 id="4">4. Import the Data</h3>
	<p style="font-size: medium">Once everything is defined it's time to import the data using the <a href="Import.aspx">Data > Importing Data > Import Data</a> page.  </p>
	   <br /><br />

		<table>
			<tr>
				<td style="vertical-align: top; padding:4px;">
					<div style="font-size: small">
		<b>1. Select the subjects & measure you wish to import. </b>
		<br /><br />Only measures that have been configured in the steps above will be shown.
		<br />After selection, the DB will check to see if any existing records are present and this will be displayed on the page.
						</div>
		<br /><br />
		 <div style="color:darkred; font-size:small">If there are records already entered, you must decide whether to continue or delete these before you will be given the option to "Choose Files" or "Import REDCap Data".</div>

				</td>
				<td style="vertical-align: top; padding:5px; border-style: solid; border-color: gray">
					<b>REDCap example</b><br />
					<div style="color: forestgreen">Note here that 3 different REDCap forms have been linked to this measure.</div>
					<br />
					<img src="../images/Import_Sample_REDCap_1.PNG"  />
					<br />
				</td>
				<td style="vertical-align: top; padding:5px; border-style: solid; border-color: gray">
					<b>File example</b><br />
					<div style="color: forestgreen">Note that importing into this measure will also import into the other linked tables.  
						This is because a single Actigraph file contains information that is saved to different measures.
						<br /><br />
						If records already exist for this subject & measure, you must choose whether to delete these existing records or not.
						<br /><br />
					</div>

					<br />
					<img src="../images/Import_Sample_File_1.PNG" />

				</td>

			</tr>
			<tr>
				<td>
						<br />
				</td>
				<td>

				</td>
			</tr>
			<tr>
				<td style="vertical-align: top; padding:4px;">
									<div style="font-size: small">
	<b>2. Choose the file(s) to import.</b> <br /> <br />Although rare, some measures (e.g., "SleepEnv_Sound") may require selecting multiple files simultaneously.  </div>

				</td>
				<td  style="vertical-align: top; padding:5px; border-style: solid; border-color: gray">
					<br /><i>[NA for REDCap imports]</i>
					</td>

				<td  style="vertical-align: top; padding:5px; border-style: solid; border-color: gray">
										<img src="../images/Import_Sample_File_2.PNG" />
				</td>
			</tr>
			<tr>
				<td>
						<br />
				</td>
				<td>

				</td>
			</tr>
			<tr>
				<td style="vertical-align: top; padding:4px;">
									<div style="font-size: small">
	<b>3. Click the "Import REDCap Data" or "Import Data" Button.</b> <br /><br />At this point, you can opt to view the REDCap data on this page by clicking the "Show REDCap data" button.</div>
				</td>
								<td  style="vertical-align: top; padding:5px; border-style: solid; border-color: gray">
										<img src="../images/Import_Sample_REDCap_2.PNG" />
				</td>
				<td style="vertical-align: top; padding:5px; border-style: solid; border-color: gray">
					<img src="../images/Import_Sample_ReadyToUpload.PNG" />
				</td>
			</tr>
			<tr>
				<td>
						<br />
				</td>
				<td>

				</td>
			</tr>
			<tr>
				<td style="vertical-align: top; padding:4px;">
										<div style="font-size: small">

					<b>4. Success!</b>  <br /><br />Hopefully, it works and you receive a summary of the steps taken and how much data was inserted into the various tables.</div>
					<br /><br />
					<div style="font-size:small; color:darkred">If you get an error, call(ofc: 206-616-2378, cell: 425-478-0920)/email Jeff and we'll work it out.</div>
				</td>
				<td colspan="2" style="font-size: small; vertical-align: top; padding:5px; border-style: solid; border-color: gray">
					<img src="../images/Import_Sample_Success_1.PNG" />
				</td>
			</tr>
		</table>
		



	<br />    <br />    <br />    <br />    <br />    <br />    <br />
	<br />    <br />    <br />    <br />    <br />    <br />    <br />
	<asp:SqlDataSource ID="sqlImportFiletype" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from def.ImportFileType"  ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="sqlFldExtractionMode" runat="server" SelectCommandType="Text"  
		SelectCommand="select * from def.FldExtractionMode"  ConnectionString="<%$ ConnectionStrings:DATA_CONN_STRING %>" >
	</asp:SqlDataSource>


</asp:Content>

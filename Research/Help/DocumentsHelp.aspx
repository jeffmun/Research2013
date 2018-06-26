<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//w3c//dtd xhtml 1.0 strict//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>UW Autism Center Intranet - Help</title>
	<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" media="screen" href="/css/help.css" />
</head>
<body>

<form runat="server">
<h1>
    <asp:SqlDataSource ID="Sql_DocType" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
         SelectCommand="select * from vwDocType order by sortorder"></asp:SqlDataSource>
    Help for Autism Center Documents</h1>
<h2>Contents</h2>
<h3>General Document Features</h3>
<ul>
	<li><a href="#Overview">Overview</a></li>
	<li><a href="#DocTypes">Document Types</a></li>
	<li><a href="#Versioning">Versioning</a></li>
	<li><a href="#DocDBEntity">How Documents Relate to Information in the Database</a></li>
	<li><a href="#SearchDocs">Searching for Documents</a></li>
	<li><a href="#DLDocs">The Document Viewer</a></li>
	<li><a href="#ULDocs">Uploading New Documents</a></li>
</ul>
<hr />
<a name="Overview" />
<h3>Overview</h3>
<p>
	The Autism Center Intranet Site provides that ability to store documents of several types
	which can be easily accessed from various locations on the web site. These documents are
	added to the web server in various ways, but most generally they are uploaded from the
	Documents section of the intranet site (see the section below on <a href="#ULDocs">Uploading
	Documents</a> for more information). 
</p>


<a name="DocTypes" />
<h3>Document Types</h3>
<p>
	Currently, documents on the web site are categorized into the following types:
</p>
   
        &nbsp;<table>
            <tr>
                <td align=center>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="Sql_DocType" HeaderStyle-HorizontalAlign="Left" AutoGenerateColumns="False" HeaderStyle-Font-Underline=true 
           AlternatingRowStyle-BackColor="White" AllowSorting=true HorizontalAlign="left">
            <Columns>
                <asp:BoundField DataField="Document Type" HeaderText="Document Type" SortExpression="Document Type">
                    <ItemStyle Width="200px" HorizontalAlign=Left />
                </asp:BoundField>
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description">
                    <ItemStyle Width="600px" HorizontalAlign=Left/>
                </asp:BoundField>
                <asp:BoundField DataField="N_Docs" HeaderText="# of Docs in DB" SortExpression="N_Docs">
                    <ItemStyle Width="100px" HorizontalAlign=Left/>
                </asp:BoundField>
            </Columns>
            <HeaderStyle HorizontalAlign="Left" />
        </asp:GridView>
                </td>
            </tr>
        </table>
        
        &nbsp;

<a name="Versioning" />
<h3>Versioning</h3>
<p>
	Documents are allowed to have different versions.  When a document is uploaded into the system 
	it is given a title and description.  This initial upload is entered as version 1.  If a second
	version is uploaded, the document title and description stay the same (it's still the same document)
	but the user must enter information regarding the <span style="font-weight: bold">"reason for change"</span>
	that prompted uploading a new version.
</p>

<a name="DocDBEntity" />
<h3>How Documents Relate to Information in the Database</h3>
<p>
	For a document to be entered into the system, it must be linked to something that 
	already exists in the database (study, measure, subject, etc.).  The following table
	shows what types of documents are associated with what entities.
</p>

<iframe src="https://autism.washington.edu/SQLReportServer/Pages/ReportViewer.aspx?%2fDocuments%2fDocType_by_Entity&rs:Command=Render" 
width="600px" height="450px">

</iframe>
<br /><br />
<p>
    When documents are linked to "Consent Form Versions", the idea of the version of a document
    gets a little confusing.  Here is the rule of thumb we use: 
<br /><br />
<span style="font-style:italic" >
    When a document is of type 
    <span style="font-weight:bold" >"Consent Form Verison"</span> then DO NOT enter multiple 
    versions for the document.  If another version of the Consent Form is created, then a new
    Consent Form Verison record is entered in the database and we will upload the initial version 
    of this new Consent Form Version.  If you need more information regarding this issue contact Core B.
    </span>
</p>




<a name="SearchDocs" />
<br /><h3>Searching for Documents</h3>
<p>You can search for documents in three ways.  Note that when you use two or more of these methods in a single search,
they are joined with a logical "AND".</p>       
<h4>      1) by Database Entity</h4>
<p>Here you specify the entity you are interested in (e.g., study, measure, subject) and
all documents related to this entity will be returned.  You are prompted whether you want to include 
documents linked to entities that are completely contained in the searched for entity.  These are
referred to as "nested" documents.  For example, when searching for all documents for a study, the "nested" documents
would include all documents linked to measures used in that study and subjects in that study.
</p>        
<h4>      2) by Document Title</h4>
<p>Here you simply type a search string and all documents that 
contain this string in either the document title or document description will be listed.  Use this page and leave the
search string blank to return a list of all documents in the database.
<br /><p>  
</p>
<h4>      3) by Document Type</h4>
<p>Here you specify the type of document you wish to return.entity you are interested in (e.g., study, measure, subject) and
all documents related to this entity will be returned.  You are prompted whether you want to include 
documents linked to entities that are completely contained in the searched for entity.  These are
referred to as "nested" documents.  For example, when searching for all documents for a study, the "nested" documents
would include all documents linked to measures used in that study and subjects in that study.
</p> 


<a name="DLDocs" />
<br />
<h3>The Document Viewer</h3>
<p>
	In various places around the Autism Center Intranet Site, you will find links to these documents.
	These links direct you to the Document Viewer page.  The page displays information about the document and displays
	the document below.</p>
	
	<h4>Editing Existing Documents</h4>
	<ol>
	<li>To edit the information about a document (e.g., title, status, description), click the <strong>&quot;Edit Doc Info&quot;</strong> button</li>
	<li>To replace the document, click the <strong>&quot;Edit Doc Info&quot;</strong> button, then <strong>&quot;Browse&quot;</strong> to the new file and <strong>&quot;Save&quot;</strong></li>
	<li>To edit the document:</li>
	    <ul>
	        <li> Click the <strong>&quot;Save Local Copy&quot;</strong> button to save the file to your PC.</li>
	        <li> Make your edits and save them.</li>
	        <li> Return to the Document viewer and replace the document with your newly edited file.</li>
	    </ul>
	</ol>
	
	<h4>Uploading a New Version of a Document</h4>
	
    <p>You may wish to simply add a newer version of a document without replacing the previous version.  
        <ol>
            <li>Click the <strong>&quot;Upload New Version&quot;</strong> button.</li>
            <li>Enter a description of the changes made in this new version of the document.</li>
            <li><strong>&quot;Browse&quot;</strong> to this new version and <strong>&quot;Upload&quot;</strong>.</li>
        </ol>
    </p>    


<p><span style="font-style: italic; font-weight:bold">It may not be completely clear when to save changes to a document as a new
version or to simply upload a new document.  If you are unsure, consult Core B 
staff to help with this decision.</span>
    
</p>
<br />
<a name="ULDocs" />
<h3>Uploading New Documents</h3>
<p>
	All members of the Autism Research Group and IT Staff Group have permission to view the
	<a href="<% =Request.ApplicationPath %>/Documents/UploadDocument.aspx">Upload Document Page</a>, and thus upload any document
	to the web server.<br/><br/>

	<span style="font-weight: bold; font-style: italic;">It is advised that you upload any document
	with caution, and make sure the document is a final version and does not already exist in the system.</span>
</p>

<p>
	Once you have confirmed that this document does not already
	exist, you can continue with the upload. All documents must be associated with a database entity.  
	If you do not see a relevant entity to which to associate your document contact Core B.

    To upload a new document:
<ol>
	<li>Select the entity type to which this document is related (e.g., Study, Measure, etc.)</li>
	<li>Select the specific instance of that entity (e.g, TAP T1 study)</li>
	<li>Select the document type</li>
	<li>Enter a <strong>Title, Description, and Status</strong> of the document.</li>
	<li>Click the &quot;Browse&quot; button select the file</li>
	<li>Click the &quot;Upload&quot; button.</li>
</ol>
</p>
<p>
	For additional help, please contact Core B.
</p>

</form>
</body>


</html>
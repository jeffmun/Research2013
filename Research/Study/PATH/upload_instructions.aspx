<%@ Page Title="PATH Video Info" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true"  CodeFile="upload_instructions.aspx.cs" Inherits="Study_PATH_upload_instructions" %>



<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
        

    <br/>
<asp:Label ID="lblTitle" runat="server" Text="PATH Video Information" Font-size="Small" Font-Bold="true"></asp:Label>
    <br/>
    <br />
    <b><i>The following are files found on the the shared network drive at UW:</i></b>

    <asp:Panel ID="panel_files" runat="server">

        <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false" >
            <Columns>
                <asp:BoundField DataField="DocVersID" HeaderText="DocVersID"/>
                <asp:HyperLinkField DataNavigateUrlFields="openlink" HeaderText="Link" Text="Get File" />
                <asp:BoundField DataField="DocTitle" HeaderText="Doc Title"/>
                <asp:BoundField DataField="DocDesc" HeaderText="Doc Description" />
            </Columns>
        </asp:GridView>

    </asp:Panel>

<br/>
<br/>


    &nbsp;&nbsp;&nbsp;&nbsp;

<br/>
<b>Procedure for Uploading Looxcie clips to Postwire</b>
<br/>
<br/>1.	Receiving camera:
<br/>&nbsp;&nbsp;&nbsp;&nbsp;a.	Create a new folder labeled according to week in the participant’s folder
<br/>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;b.	uploads Looxcie clips to PATH Drive>Participant Folder>Week Folder
<br/>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;c.	reviews quickly to see if clips are usable
<br/>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;d.	email Johnny and Cassandra to let them know videos have been uploaded and are ready for editing/uploading
<br/>
<br/>2.	Clipping/Editing:
<br/>&nbsp;&nbsp;&nbsp;&nbsp;a.	Opens video in StreamClip 
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i.	PATH Study Drive>Looxcie folder>Participant Folder>Week Folder>clip
<br/>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;b.	Clip out parent saying date at beginning
<br/>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;c.	If a caretaking video it can also be clipped to 10 minutes
<br/>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;d.	Save video to folder PATH Study Drive>Looxcie folder> “Postwire Clips”
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i.	Label according to activity type and with coding number: “PATH### Activity Type_####”
<br/>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;e.	Updating spread sheet “PATH Looxcie Video Log” to track video name change
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i.	R Drive> PATH - Parents and Toddlers at Home Folder>Coding>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ii.	Tab: “PATH###”
<br/>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;<b>f.	Log on to www.postwire.com
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i.	Email: cass113@u.washington.edu
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ii.	Password: pathstudy</b>
<br/>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;g.	Upload videos
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i.	Open UW Learning Opportunities
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ii.	Upload
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;iii.	Remove participant ID # on video label before logging out of www.postwire.com, clip should just say “Activity type_####”
<br/>
<br/>3.	Assigning to be coded:
<br/>&nbsp;&nbsp;&nbsp;&nbsp;a.	Add video clip to “To Do” tab of PATH Looxcie Video Log spread sheet if not edited/uploaded immediately
<br/>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;b.	Assign the clip to be coded on “Parent Fidelity Tracking Chart”

<br />
    <br />


</asp:Content>

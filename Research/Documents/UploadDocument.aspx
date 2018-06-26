<%@ Page Language="C#" MasterPageFile="~/UWAC.master" CodeFile="UploadDocument.aspx.cs" Inherits="Documents.UploadDocument" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


<asp:HiddenField ID="hidEntityValue" runat="server" Value="-1" />

<%-- DF: Jeff's version  --%>
					<asp:Label ID="lblEntityInfo" runat="server" Text ="" Font-Size="Large" ForeColor="ForestGreen" Font-Bold="true"></asp:Label>
	
	<br /><br />
		
<asp:Panel ID="panel1" runat="server">
<br />
		<table cellspacing="0" class="tblInput">
			<tr class="trTitle">
				<td colspan="2">
					Upload New Document&nbsp; (version: July 2015)
				</td>
			</tr>
			<tr>
				<td colspan="2" id="tdError" runat="server"></td>
			</tr>
			<tr id="trEntity" runat="server">
				<td style="width: 368px">



					<label for="selEntityType">Entity Type</label><br/>
					<asp:DropDownList ID="selEntityType" Runat="server" OnSelectedIndexChanged="PopulateEntityValues"
						AutoPostBack="True" Width="265" />
				</td>
				<td id="tdEntityValue" runat="server"></td>
			</tr>
			<tr>
				<td style="width: 368px">
					<strong>Document Type<br/>
					</strong>
					<asp:DropDownList ID="selDocumentType" Runat="server" Width="265" />
				</td>
				<td>
					&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 368px">
					<strong>Document Title<br/>
					</strong>
					<asp:TextBox ID="txtDocTitle" Runat="server" Width="265" />
				</td>
				<td>
					<label for="selDocumentStatus">Document Status</label><br/>
					<asp:DropDownList ID="selDocumentStatus" Runat="server" Width="265" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<strong>Document Description<br />
						<asp:TextBox ID="txtDocDesc" Runat="server" Width="626px" Height="69px" /></strong></td>
			</tr>
			<tr>
				<td style="width: 368px">
					<strong>File Location</strong><br />
					<input type="file" name="oDocument" style="WIDTH: 350px" id="oDocument" runat="server"/></td>
				<td>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<asp:Button Text="Upload" ID="btnSubmit" Runat="server" OnClick="DoUploadDocument" />
					<input type="button" id="btnHelp" name="btnHelp" value="Help" onclick="PopUpWindow('<%= Request.ApplicationPath %>/Help/DocumentsHelp.aspx#ULDocs', 'wdwHelp', 'menubar=no,toolbars=no,scrollbars=yes,width=600,height=525');"/>
					<input type="hidden" name="hidDocID" id="hidDocID" runat="server"/> <input type="hidden" name="hidDocVersID" id="hidDocVersID" runat="server"/>
				</td>
			</tr>
		</table>

</asp:Panel>

<%--DF: 4/13 updated to jeff version 
<table cellspacing="0" class="tblInput">
	<tr class="trTitle">
		<td colspan="2">
			Upload Document
		</td>
	</tr>
	<tr>
		<td colspan="2" id="tdError" runat="server" style="display: none; color: #ff0000;"></td>
	</tr>
	<tr id="trEntity" runat="server">
		<td>
			<label for="selEntityType">Entity Type</label><br/>
			<asp:DropDownList ID="selEntityType" Runat="server" style="width: 265px;" OnSelectedIndexChanged="PopulateEntityValues" AutoPostBack="True" />
		</td>
		<td id="tdEntityValue" runat="server" style="display: none;"></td>
	</tr>
	<tr>
		<td>
			<label for="txtDocTitle">Document Title</label><br/>
			<asp:TextBox ID="txtDocTitle" Runat="server" style="width: 265px;" />
		</td>
		<td>
			<label for="oDocument">File Location</label><br/>
			<input type="file" name="oDocument" style="width: 350px;" id="oDocument" runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<label for="selDocumentType">Document Type</label><br/>
			<asp:DropDownList ID="selDocumentType" Runat="server" style="width: 265px;" />
		</td>
		<td>
			<label for="selDocumentStatus">Document Status</label><br/>
			<asp:DropDownList ID="selDocumentStatus" Runat="server" style="width: 265px;" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button Text="Upload" ID="btnSubmit" Runat="server" OnClick="DoUploadDocument" />
			<input type="button" id="btnHelp" name="btnHelp" value="Help" onclick="PopUpWindow('/Help/DocumentsHelp.html#ULDocs', 'wdwHelp', 'menubar=no,toolbars=no,scrollbars=yes,width=600,height=525');" />
			<input type="hidden" name="hidDocID" id="hidDocID" runat="server" />
			<input type="hidden" name="hidDocVersID" id="hidDocVersID" runat="server" />
		</td>
	</tr>
</table>
--%>


</asp:Content>
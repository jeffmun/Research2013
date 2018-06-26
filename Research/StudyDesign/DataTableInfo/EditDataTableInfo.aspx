<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="EditDataTableInfo.aspx.cs" Inherits="StudyDesign.DataTableInfo.EditDataTableInfo" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<table cellspacing="0" class="tblInputSmall" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="3">Edit Data Table Info</td>
	</tr>
	<tr>
		<td>
			<label for="selTableID">Data Table</label><br/>
			<asp:DropDownList ID="selTableID" Runat="server" style="width: 225px;" onchange="SyncEditDataTableForm();" />
		</td>
		<td>
			<label for="txtTableName">Data Table Name</label><br/>
			<asp:TextBox ID="txtTableName" Runat="server" style="width: 225px;" />
		</td>
		<td>
			<label for="selStudyID">Study</label><br/>
			<asp:DropDownList ID="selStudyID" Runat="server" style="width: 225px;" />
		</td>
	</tr>
	<tr>
		<td>
			<label for="selAllTableID">All Table</label><br/>
			<asp:DropDownList ID="selAllTableID" Runat="server" style="width: 225px;" />
		</td>
		<td>
			<label for="selFieldInfoStatusID">Field Info. Status</label><br/>
			<asp:DropDownList ID="selFieldInfoStatusID" Runat="server" style="width: 225px;" />
		</td>
		<td>
			<label for="selRunSPSSSyntaxStatus">Run SPSS Syntax</label><br/>
			<asp:DropDownList ID="selRunSPSSSyntaxStatus" Runat="server" style="width: 225px;">
				<asp:ListItem Value="-1">--Select Status--</asp:ListItem>
				<asp:ListItem Value="0">Incomplete, Do Not Display in Create Syntax Page</asp:ListItem>
				<asp:ListItem Value="1">Incomplete, Display in Create Syntax Page</asp:ListItem>
				<asp:ListItem Value="2">Complete with Calculations</asp:ListItem>
				<asp:ListItem Value="2">Complete no Calculations</asp:ListItem>
			</asp:DropDownList>
		</td>
	</tr>
	<tr>
		<td>
			<label for="selDEScoringStatusID">DE ScoringStatus</label><br/>
			<asp:DropDownList ID="selDEScoringStatusID" Runat="server" style="width: 225px;" />
		</td>
		<td>
			<label for="selDEScoringTypeID">DE Scoring Type</label><br/>
			<asp:DropDownList ID="selDEScoringTypeID" Runat="server" style="width: 225px;" />
		</td>
		<td rowspan="2">
			<label for="txtDEScoringNotes">DE Scoring Notes</label><br />
			<asp:TextBox ID="txtDEScoringNotes" Runat="server" TextMode="MultiLine" Rows="5" style="width: 225px;" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:CheckBox ID="chkHasIndexNum" Runat="server" Text="Has Index Num?" /><br/>
			<asp:CheckBox ID="chkSkipForMatrix" Runat="server" Text="Skip for Matrix?" />
		</td>
		<td>
			<asp:CheckBox ID="chkRunSingle" Runat="server" Text="Run Single?" /><br/>
			<asp:CheckBox ID="chkIsTracked" Runat="server" Text="Is Tracked?" />
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<asp:Button ID="btnSaveChanges" Runat="server" Text="Save Changes" OnClick="SaveChanges" />
		</td>
	</tr>
	<tr id="trSubForm" style="display: none;">
		<td colspan="3" style="padding: 0px;">
			<table cellspacing="0" class="tblInput" style="width: 100%; margin: 0px;">
				<tr>
					<td id="tdVarInfo" class="tdHeaderAlt" style="text-align: center; padding: 8px" onclick="AdjustDataTablesIFrame('varinfo');">Variable Info</td><td style="width: 10px;">&nbsp;</td>
					<td id="tdSpecialFields" class="tdHeaderAlt" style="text-align: center; padding: 8px" onclick="AdjustDataTablesIFrame('specialfields');">Special Fields</td><td style="width: 10px;">&nbsp;</td>
					<td id="tdRenameFields" class="tdHeaderAlt" style="text-align: center; padding: 8px" onclick="AdjustDataTablesIFrame('renamefields');">Rename Fields</td><td style="width: 10px;">&nbsp;</td>
				</tr>
			</table>
			<iframe id="oIFrame" runat="server" src="" frameborder="0" scrolling="auto" style="margin: 0px; width: 100%; height: 300px;" />
		</td>
	</tr>
</table>

</asp:Content>
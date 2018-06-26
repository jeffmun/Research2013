<%@ Page Language="c#" MasterPageFile="~/UWAC.master" CodeFile="SubjectsByStudy.aspx.cs" AutoEventWireup="True" Inherits="Measures.SubjectsByStudy" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<asp:DataGrid	ID="tblReport"
				runat="server"
				CssClass="tblReport"
				GridLines="None"
				AutoGenerateColumns="False"
				AllowSorting="True"
				OnItemDataBound="Item_Bound"
				OnSortCommand="SortResults">
	<AlternatingItemStyle CssClass="trDark" />
	<HeaderStyle CssClass="trHeader" />
	<Columns>
	
	<%--DF: 4/12 add ~ --%>
		<asp:HyperLinkColumn HeaderText="Subj ID." DataNavigateUrlField="SubjID" DataNavigateUrlFormatString="~/Measures/ActionsBySubject.aspx?SubjectID={0}" DataTextField="ID" SortExpression="[ID] ASC" />
		<asp:HyperLinkColumn HeaderText="Subj. Status" DataNavigateUrlField="SubjID" DataNavigateUrlFormatString="~/Measures/EditSubject.aspx?SubjID={0}" DataTextField="SubjStatus" SortExpression="[SubjStatus] ASC" />
		<asp:BoundColumn HeaderText="Group" DataField="GroupName" SortExpression="[SubjStatus] ASC" />
		<asp:BoundColumn HeaderText="Age" DataField="CurrentAge" DataFormatString="" SortExpression="[DOB] ASC" />
		<asp:BoundColumn HeaderText="DOB" DataField="DOB" SortExpression="[DOB] ASC" />
		<asp:BoundColumn HeaderText="Gender" DataField="Sex" SortExpression="[Sex] ASC" />
		<asp:BoundColumn HeaderText="Ethnicity" DataField="EthnicityDesc" SortExpression="[EthnicityDesc] ASC" />
	</Columns>
</asp:DataGrid>

</asp:Content>
<%@ Page language="c#" CodeFile="SubjectsByStatus.aspx.cs" Inherits="Measures.SubjectsByStatus"   MasterPageFile="~/UWAC.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<input type="hidden" name="hidSortField" value="" />
<table id="tblMaster" runat="server" cellspacing="0" class="tblReport">
	<tr class="trHeader">
		<td>
			Subj. ID
			<a href="javascript:DoSubmitSort('[ID] ASC');"><img src="<%= Request.ApplicationPath %>/images/sort-az.gif" alt="Sort Ascending" /></a>
			<a href="javascript:DoSubmitSort('[ID] DESC');"><img src="<%= Request.ApplicationPath %>/images/sort-za.gif" alt="Sort Descending" /></a>
		</td>
		<td>
			Name (Last, First)
			<a href="javascript:DoSubmitSort('[LastName] ASC');"><img src="<%= Request.ApplicationPath %>/images/sort-az.gif" alt="Sort Ascending" /></a>
			<a href="javascript:DoSubmitSort('[LastName] DESC');"><img src="<%= Request.ApplicationPath %>/images/sort-za.gif" alt="Sort Descending" /></a>
		</td>
		<td>
			Group
			<a href="javascript:DoSubmitSort('GroupName ASC');"><img src="<%= Request.ApplicationPath %>/images/sort-az.gif" alt="Sort Ascending" /></a>
			<a href="javascript:DoSubmitSort('GroupName DESC');"><img src="<%= Request.ApplicationPath %>/images/sort-za.gif" alt="Sort Descending" /></a>
		</td>
		<td>
			Status
			<a href="javascript:DoSubmitSort('SubjStatus ASC, SubjStatusDetail ASC');"><img src="<%= Request.ApplicationPath %>/images/sort-az.gif" alt="Sort Ascending" /></a>
			<a href="javascript:DoSubmitSort('SubjStatus DESC, SubjStatusDetail DESC');"><img src="<%= Request.ApplicationPath %>/images/sort-za.gif" alt="Sort Descending" /></a>
		</td>
		<td>
			Age
			<a href="javascript:DoSubmitSort('DOB ASC');"><img src="<%= Request.ApplicationPath %>/images/sort-az.gif" alt="Sort Ascending" /></a>
			<a href="javascript:DoSubmitSort('DOB DESC');"><img src="<%= Request.ApplicationPath %>/images/sort-za.gif" alt="Sort Descending" /></a>
		</td>
		<td>
			DOB
			<a href="javascript:DoSubmitSort('DOB ASC');"><img src="<%= Request.ApplicationPath %>/images/sort-az.gif" alt="Sort Ascending" /></a>
			<a href="javascript:DoSubmitSort('DOB DESC');"><img src="<%= Request.ApplicationPath %>/images/sort-za.gif" alt="Sort Descending" /></a>
		</td>
		<td>
			Sex
			<a href="javascript:DoSubmitSort('Sex ASC');"><img src="<%= Request.ApplicationPath %>/images/sort-az.gif" alt="Sort Ascending" /></a>
			<a href="javascript:DoSubmitSort('Sex DESC');"><img src="<%= Request.ApplicationPath %>/images/sort-za.gif" alt="Sort Descending" /></a>
		</td>
		<td>Notes</td>
	</tr>
</table>
</asp:Content>
<%@ Page Language="C#" Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" 
CodeFile="EditVarInfo.aspx.cs" Inherits="Data_EditVarInfo" Title="Edit Variable Info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

<div id="divError" runat="server" class="error" style="display: none; margin: 20px;"></div>

  
     
<table border = "1" cellspacing="0" class="tblInput" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td colspan="2" id="tdTitle" runat="server">Retrieve Data Files</td>
	</tr>
	<tr>
    <td id="infocell"></td>
</tr>
</table>

<br/>

<asp:DropDownList id="ddlStudy" runat="server" AutoPostBack="false" font-name="Courier" Width="600"></asp:DropDownList> <br/>

<br/>


<table>

</table>

<%--
    <asp:GridView ID="gvVarInfo" CssClass="tblInputSmall" runat="server" AutoGenerateColumns="False"  RowStyle-HorizontalAlign="Center"  
        AllowSorting ="True"   RowStyle-Height="10" CellPadding="0"  OnSorting="gvVarInfo_Sorting"  OnRowDataBound="gvVarInfo_RowDataBound" >
        <columns>
        
    
        </columns>    
        
        </asp:GridView>
--%>   
    
</asp:Content>


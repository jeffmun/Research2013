<%@ Page Language="C#" Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" 
CodeFile="SubjectDetails.aspx.cs" Inherits="Data_StudymeasDetails" Title="Subject Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

<div id="divError" runat="server" class="error" style="display: none; margin: 20px;"></div>
    
        
<table border = "1" width="100%" cellspacing="0" class="tblInputSmall" id="tblMaster" runat="server">
	<tr class="trTitle">
		<td  id="tdTitle" runat="server">Subject Details</td>
	</tr>
	<tr><td id="errorLink1"></td></tr>
	</table>
	
<br/>
<asp:Button ID="btnUpdateVisibility" runat="server" Text="Update Visibility" OnClick="UpdateVisibility" CssClass="smalltext"  />
<br/>

<asp:CheckBox ID="chkShowRows" runat="server" AutoPostBack="false" Checked="false"   Text="Show the cases not included by this selection." />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:CheckBox ID="chkShowActions" runat="server" AutoPostBack="false" Checked="false"   Text="Show the Action columns." />
<br/>    

<br/>    
<asp:GridView ID="GridView_active_cases" runat="server" AutoGenerateColumns="false"  AllowSorting="true"  
OnRowDataBound="GridView_active_cases_RowDataBound" OnDataBound="ShowRows" CellPadding="2" OnSorting="GridView_Sorting">
<Columns>
      <asp:TemplateField Visible="true"  HeaderText="Selection Code" SortExpression="code">
           <ItemTemplate>          
           <asp:Label id="lbl_code" runat ="server" text='<%# Eval("code")%>'></asp:Label>         
           </ItemTemplate> </asp:TemplateField>

      <asp:TemplateField Visible="true"  HeaderText="ID" SortExpression="ID" >
           <ItemTemplate>          
           <asp:Label id="lbl_ID" runat ="server" Font-Bold="true" text='<%# Eval("ID")%>'></asp:Label>         
           </ItemTemplate> </asp:TemplateField>

      <asp:TemplateField Visible="true"  HeaderText="Group" SortExpression="groupname" >
           <ItemTemplate>          
           <asp:Label id="lbl_groupname" runat ="server" text='<%# Eval("groupname")%>'></asp:Label>         
           </ItemTemplate> </asp:TemplateField>

      <asp:TemplateField Visible="true"  HeaderText="Subject Status" SortExpression="subjstatus" >
           <ItemTemplate>    <asp:HyperLink ID = "link_subjstatus"   runat="server" Text='<%#Eval("subjstatus")%>'  NavigateUrl = '<%#Eval("subj_link")%>' Target="_blank" >  </asp:HyperLink>              
           </ItemTemplate> </asp:TemplateField>

      <asp:TemplateField Visible="true"  HeaderText="Subject Status Detail" SortExpression="subjstatusdetail" >
           <ItemTemplate>          
           <asp:Label id="lbl_subjstatusdetail" runat ="server" text='<%# Eval("subjstatusdetail")%>' ></asp:Label>         
           </ItemTemplate> </asp:TemplateField>




      <asp:TemplateField Visible="true"  HeaderText="Action" SortExpression="actiontext" ItemStyle-BackColor="#80CE8B" HeaderStyle-BackColor="#80CE8B">
           <ItemTemplate>          
           <asp:Label id="lbl_actiontext" runat ="server" text='<%# Eval("actiontext")%>'></asp:Label>         
           </ItemTemplate> </asp:TemplateField>

      <asp:TemplateField Visible="true"  HeaderText="Action Status" SortExpression="actionstatusshort" ItemStyle-BackColor="#80CE8B" HeaderStyle-BackColor="#80CE8B">
           <ItemTemplate>          <asp:HyperLink ID = "link_actionstatusshort"   runat="server" Text='<%#Eval("actionstatusshort")%>'  NavigateUrl = '<%#Eval("action_link")%>' Target="_blank" >  </asp:HyperLink>      
           </ItemTemplate> </asp:TemplateField>

      <asp:TemplateField Visible="true"  HeaderText="Action Date Done" SortExpression="actiondatedone" ItemStyle-BackColor="#80CE8B" HeaderStyle-BackColor="#80CE8B">
           <ItemTemplate>          
           <asp:Label id="lbl_actiondatedone" runat ="server" text='<%# Eval("actiondatedone", "{0:d}" )%>'></asp:Label>         
           </ItemTemplate> </asp:TemplateField>


      <asp:TemplateField Visible="true"  HeaderText="Action Comp By" SortExpression="staff_compby" ItemStyle-BackColor="#80CE8B" HeaderStyle-BackColor="#80CE8B">
           <ItemTemplate>          
           <asp:Label id="lbl_staff_compby" runat ="server" text='<%# Eval("staff_compby")%>'></asp:Label>         
           </ItemTemplate> </asp:TemplateField>



      <asp:TemplateField Visible="true"  HeaderText="Measure" SortExpression="studymeasname" >
           <ItemTemplate>          
           <asp:Label id="lbl_studymeasname" runat ="server" text='<%# Eval("studymeasname")%>'></asp:Label>         
           </ItemTemplate> </asp:TemplateField>


      <asp:TemplateField Visible="true"  HeaderText="Measure Status" SortExpression="measstatus" >
           <ItemTemplate>        <asp:HyperLink ID = "link_measstatus"   runat="server" Text='<%#Eval("measstatus")%>'  NavigateUrl = '<%#Eval("sms_link")%>' Target="_blank" >  </asp:HyperLink>    
           
           </ItemTemplate> </asp:TemplateField>

      <asp:TemplateField Visible="true"  HeaderText="Measure Status Detail" SortExpression="measstatusdetail" >
           <ItemTemplate>          
           <asp:Label id="lbl_measstatusdetail" runat ="server" text='<%# Eval("measstatusdetail")%>'></asp:Label>         
           </ItemTemplate> </asp:TemplateField>

      <asp:TemplateField Visible="true"  HeaderText="Measure Date Done" SortExpression="measuredatedone" >
           <ItemTemplate>          
           <asp:Label id="lbl_measuredatedone" runat ="server" text='<%# Eval("measuredatedone", "{0:d}")%>'></asp:Label>         
           </ItemTemplate> </asp:TemplateField>
           
           
           
           
           
           

      <asp:TemplateField Visible="true"  HeaderText="DE Status" SortExpression="dataentrystatus" ItemStyle-BackColor="#D0E6FF" HeaderStyle-BackColor="#D0E6FF" >
           <ItemTemplate >     <asp:HyperLink ID = "link_dataentry"   runat="server" Text='<%#Eval("dataentrystatus")%>'  NavigateUrl = '<%#Eval("DElink")%>' Target="_blank" >  </asp:HyperLink> 
           </ItemTemplate> </asp:TemplateField>

      <asp:TemplateField Visible="true"  HeaderText="Verified" ItemStyle-BackColor="#D0E6FF" HeaderStyle-BackColor="#D0E6FF" >
           <ItemTemplate >     
                      <asp:Label id="lbl_verified" runat ="server" text='<%# Eval("verified")%>'></asp:Label>         
           </ItemTemplate> </asp:TemplateField>

      <asp:TemplateField Visible="true"  HeaderText="Score Msg" SortExpression="scoremsg" ItemStyle-BackColor="#D0E6FF" HeaderStyle-BackColor="#D0E6FF">
           <ItemTemplate >    
           <asp:Label id="lbl_scoremsg" runat ="server"  text='<%# Eval("scoremsg")%>'></asp:Label>  </asp:HyperLink>             
           </ItemTemplate> </asp:TemplateField>

      <asp:TemplateField Visible="true"  HeaderText="Data Updated" SortExpression="updated" ItemStyle-BackColor="#D0E6FF" HeaderStyle-BackColor="#D0E6FF" >
           <ItemTemplate >          
           <asp:Label id="lbl_updated" runat ="server"  text='<%# Eval("updated")%>'></asp:Label>         
           </ItemTemplate> </asp:TemplateField>

      <asp:TemplateField Visible="true"  HeaderText="Data UpdatedBy" SortExpression="updatedby" ItemStyle-BackColor="#D0E6FF" HeaderStyle-BackColor="#D0E6FF">
           <ItemTemplate >          
           <asp:Label id="lbl_updatedby" runat ="server" text='<%# Eval("updatedby")%>'></asp:Label>         
           </ItemTemplate> </asp:TemplateField>
      
           
                      
           
</Columns>

</asp:GridView>
    
    
    
    
    
</asp:Content>
    
<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="EmailsByStudy.aspx.cs" Inherits="Info_EmailsByStudy" 
     EnableEventValidation="false" Title="Email list"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >



    <br />
<br />
<asp:Label ID="label1" runat="server" Text ="Email list" Font-Bold="true" Font-Underline="true" Font-Size="Medium"></asp:Label>
    <br />    <br />



    <asp:Panel id="panel_Vine2" runat="server"></asp:Panel>

    <asp:GridView id="gv1" runat="server" AutoGenerateColumns="false" BorderColor="WhiteSmoke" EmptyDataText="No email addresses entered." >
   <Columns>
       <asp:BoundField HeaderText="Study" DataField="studyname" />
       <asp:BoundField HeaderText="Group" DataField="Groupname" />
       <asp:BoundField HeaderText="ID" DataField="ID" />
              <asp:BoundField HeaderText="Subject status" DataField="subjstatus" />
              <asp:BoundField HeaderText="Email address" DataField="emailaddress" />
              <asp:BoundField HeaderText="Email type" DataField="emailtype" />



   </Columns>
        </asp:GridView>




    </asp:Content>


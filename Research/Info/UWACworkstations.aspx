<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" 
    CodeFile="UWACworkstations.aspx.cs" AutoEventWireup="true"
    Inherits="Info_UWACworkstations" Title="Workstations"  
    EnableEventValidation="false" %>

<%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

    <br />
    <br />
    <asp:Label ID="lblInfo" runat="server"> </asp:Label>
    <br />
    <br />
    
    <asp:GridView ID="gv" runat="server" DataSourceID="sql_workstations" 
        AutoGenerateColumns="false" AutoGenerateEditButton="true">
    
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:Label ID="hdrbldg" runat="server" Text="Bldg" Font-Bold="true" /></HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="bldg" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "bldg") %>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:Label ID="hdrroom" runat="server" Text="Room" Font-Bold="true" /></HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="room" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "room") %>' />
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:Label ID="hdrroom_loc" runat="server" Text="Room<br/>Location" Font-Bold="true" /></HeaderTemplate>

                <ItemTemplate>
                    <asp:Label ID="room_location" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "room_location") %>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:Label ID="hdrwsID" runat="server" Text="wsID" Font-Bold="true" /></HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="workstationID" runat="server" ForeColor="Gray" Text='<%# DataBinder.Eval(Container.DataItem, "workstationID") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblwsID" runat="server" ForeColor="Gray" Text='<%# DataBinder.Eval(Container.DataItem, "workstationID") %>' />
                </EditItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:Label ID="hdrcomp" runat="server" Text="Computer" Font-Bold="true" /></HeaderTemplate>

                                <ItemTemplate>
                    <asp:Label ID="comp" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "computer_name") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:HiddenField ID="hidComp" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "computer_name") %>' />
                    <asp:DropDownList ID="ddlComp" runat="server" DataSourceID="sql_comp" 
                        DataTextField="computer_name" DataValueField="computer_PK" OnSelectedIndexChanged="ddlComp_SelectedIndexChanged"
                        AutoPostBack="true" />
                </EditItemTemplate>
            </asp:TemplateField> 

           <asp:TemplateField>
                <HeaderTemplate>
                    <asp:Label ID="hdrstaff" runat="server" Text="Staff" Font-Bold="true" /></HeaderTemplate>

                <ItemTemplate>
                    <asp:Label ID="staff" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "primary_staffname") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                   <asp:DropDownList ID="ddlStaff" runat="server" DataSourceID="sql_staff" 
                       DataTextField="staffname" DataValueField="primary_staffID" OnSelectedIndexChanged="ddlStaff_SelectedIndexChanged"
                       AutoPostBack="true" />
               </EditItemTemplate>
           </asp:TemplateField>
        

        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="sql_workstations" runat="server" 
        SelectCommandType="Text" 
        SelectCommand="select bldg,  room, 
        room_location, workstationID, computer_name, primary_staffname from 
        vwUWACWorkstations order by bldg,  room, room_location"
        ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_comp" runat="server" 
        SelectCommandType="Text" SelectCommand="select -1 computer_pk, '...select computer...' computer_name 
        union select 0 computer_pk, '..REMOVE..' computer_name
        union select computer_PK, (case when workstationID is null then ' [UN]' else '' end)  + computer_name  from tblComputer 
        ) x order by  (case when computer_pk>0 then 1 else computer_pk end) , computer_name"
        ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_staff" runat="server" 
        SelectCommandType="Text" SelectCommand="select -1 primary_staffID, '...select staff...'  staffname 
        union select 0 primary_staffID, '..REMOVE..'  staffname 
        union select staffID as primary_staffID, firstname + ' ' + lastname staffname from 
        tblstaff  order by staffname "  
        ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>">
    </asp:SqlDataSource>

</asp:Content>
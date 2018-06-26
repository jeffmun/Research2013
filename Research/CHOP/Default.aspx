<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="WGA_Default" Title="Whole Genome Analysis project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">
<br />
The list below contains the contents of the "WGA_Phen" table.
<br /><br />



<asp:SqlDataSource ID="SQL_Phen" runat="server" ConnectionString="<%$ ConnectionStrings:WGA_CONN_STRING %>"
     
     SelectCommand = "SELECT * FROM WGA_phen" SelectCommandType=Text
     UpdateCommand = "UPDATE WGA_phen
                       SET 
	                      site = @site
                          ,siteID = @siteID
                          ,sex = @sex
                          ,age_mos = @age_mos
                          ,pop = @pop
                          ,FSIQ = @FSIQ
                          ,NVIQ = @NVIQ
                          ,VIQ = @VIQ
                          ,IQ_test = @IQ_test
                          ,NVIQ_test = @NVIQ_test
                          ,VIQ_test = @VIQ_test
                          ,notes = @notes
                     WHERE pk = @pk" UpdateCommandType=text
                     
>
     <UpdateParameters>
     </UpdateParameters>
</asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" DataSourceID="SQL_Phen">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update" Font-Size="8pt" ></asp:Button>
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel"  Font-Size="8pt" ></asp:Button>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit"  Font-Size="8pt" ></asp:Button>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


</asp:Content>


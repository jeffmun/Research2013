<%@ Page Language="C#" MasterPageFile="~/UWAC.master" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<h2>UW Autism Center Data Entry Forms</h2>
<p>
	Welcome to the UW Autism Center Data Entry Forms. Click on the study for which you want to enter data.
</p>
    
<ul>
	    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="spGetStudies_CanEnterData_by_User" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="studyID"
            DataSourceID="SqlDataSource1">
            <Columns>
                
                <asp:HyperLinkField DataTextField="studyname" DataNavigateUrlFields="studyID" 
                DataNavigateUrlFormatString="~/DataEntry/MeasureDocLinks.aspx?studyID={0}" 
                HeaderText="Study" />
 
            </Columns>
        </asp:GridView>
    
    <br />
    <br />
    

</ul>
</asp:Content>
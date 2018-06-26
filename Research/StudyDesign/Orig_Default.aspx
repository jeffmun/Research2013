<%@ Page MasterPageFile="~/UWAC.master" Language="C#" CodeFile="default.aspx.cs" Inherits="StudyDesign.WebForm1" %>
<%@ MasterType VirtualPath="~/UWAC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<span style="font-size: 12pt; font-weight: bold;">Study Design &nbsp  &nbsp</span>
    <span style="font-size: 10pt">Select a study: &nbsp</span>     
    <asp:DropDownList ID="DDL_studyID" runat="server" DataSourceID="Sql_Studies"  EnableViewState="true"
     DataValueField="studyID" DataTextField="studyname" Font-Size="10pt"  OnSelectedIndexChanged="DDL_studyID_SelectedIndexChanged" OnDataBound="DDL_studyID_DataBound" OnTextChanged="DDL_studyID_TextChanged" ></asp:DropDownList>    

    <asp:SqlDataSource ID="Sql_Studies" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
         SelectCommand = "spGetStudies_CanView_by_User_with_DEFAULT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource> 
    
    <asp:SqlDataSource ID="Sql_DefaultStudy" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
         SelectCommand = "select dbo.fnDefaultStudyIDByCurrentUser() as defaultstudyID" SelectCommandType="Text">
    </asp:SqlDataSource> 
    
    <asp:FormView ID="FormView1" runat="server" DataSourceID="Sql_DefaultStudy" Visible=false>
        <ItemTemplate>
                <asp:Label ID="Label_DefaultStudyID" runat="server" Text='<%# Eval("defaultstudyID") %>'></asp:Label>
        </ItemTemplate>
    </asp:FormView>
    
    <table >
        <tr>
            <td width="200px">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="../StudyDesign/Default.aspx?viewrpt=1" EnableViewState=true OnClick="CheckViewState"  >View Full Design</asp:LinkButton><br />
            </td>
            <td>
                <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="../StudyDesign/Default.aspx?viewrpt=5" EnableViewState=true >View Related Documents</asp:LinkButton><br />
            </td>
            <td>
                <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="../StudyDesign/Default.aspx?viewrpt=3" EnableViewState=true >Compare the measures used across multiple studies</asp:LinkButton><br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="../StudyDesign/Default.aspx?viewrpt=2" EnableViewState=true >View Measures</asp:LinkButton><br />
            </td>
            <td>
                <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="../StudyDesign/Default.aspx?viewrpt=4" EnableViewState=true >Problems in study design that should be fixed</asp:LinkButton><br />
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="../StudyDesign/Default.aspx?viewrpt=6" EnableViewState=true >View Measures with DataTable info</asp:LinkButton><br />
            </td>
            <td>
            </td>
        </tr>
    </table>
    <br />
    
   
<asp:PlaceHolder ID="theFrameHolder" runat="server" /> 
        
        
        
</asp:Content>
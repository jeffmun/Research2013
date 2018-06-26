<%@ Page Language="C#" Debug="true" AutoEventWireup="true"  MasterPageFile="~/UWAC.master" CodeFile="Tadpole_Rel_Tracking.aspx.cs" Inherits="AutismCenterResearch_Study_Tadpole_Tadpole_Rel_Tracking" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        //For navigating using left and right arrow of the keyboard
        var gridview = $("#gv_Randomization_Tadpole");
        $.keynavigation(gridview);
    });
</script>


<br />    
<asp:Label ID="Label1" runat="server" Text="PATH & Tadpole ADOS Reliability Tracking" Font-Bold="true" Font-Size="Medium"></asp:Label>
<br />
<br />
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>
<br />
<br />

<asp:GridView ID="gv" runat="server" DataSourceID="sql_vwTadpolePATH__ADOS_Reliability_Status" AutoGenerateColumns="false" AutoGenerateEditButton="false"
 OnRowDataBound="gv_RowDataBound" >       
 <Columns>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_UseForReliability" runat="server" Text="Use For Reliability?"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblUseForReliability" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UseForReliability") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_rankorder" runat="server" Text="rankorder"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblrankorder" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "rankorder") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_GroupName" runat="server" Text="GroupName"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblGroupName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "GroupName") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_ID" runat="server" Text="ID"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_StudyMeasName" runat="server" Text="Study Meas Name"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblStudyMeasName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "StudyMeasName") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_MeasStatus" runat="server" Text="Meas Status"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblMeasStatus" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MeasStatus") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_MeasStatusDetail" runat="server" Text="Meas Status Detail"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblMeasStatusDetail" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MeasStatusDetail") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_MeasureDateDone" runat="server" Text="Measure Date Done"/></HeaderTemplate>          
        <ItemTemplate><asp:Label ID="lblMeasureDateDone" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MeasureDateDone", "{0:d}") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>

    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_sms_dd_status" runat="server" Text="Data status"/></HeaderTemplate>          
        <ItemTemplate><asp:Hyperlink ID="lblsms_dd_status" runat="server" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "DataEntryURL") %>'  
        Text='<%# DataBinder.Eval(Container.DataItem, "sms_dd_status") %>'   
        /></ItemTemplate>      </asp:TemplateField>


    <asp:TemplateField Visible="false">       <HeaderTemplate><asp:Label ID="hdrlbl_ReliabilityStudyMeasID" runat="server" Text="Reliability StudyMeas ID"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblReliabilityStudyMeasID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ReliabilityStudyMeasID") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_StudyMeasName_REL" runat="server" Text="Study Meas Name REL"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblStudyMeasName_REL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "StudyMeasName_REL") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_MeasStatus_REL" runat="server" Text="Meas Status REL"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblMeasStatus_REL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MeasStatus_REL") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_MeasStatusDetail_REL" runat="server" Text="Meas Status Detail REL"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblMeasStatusDetail_REL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MeasStatusDetail_REL") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>

    <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_sms_dd_status_REL" runat="server" Text="Data status REL"/></HeaderTemplate>          
        <ItemTemplate><asp:Hyperlink ID="lblsms_dd_status_REL" runat="server" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "DataEntryURL_REL") %>'  
        Text='<%# DataBinder.Eval(Container.DataItem, "sms_dd_status_REL") %>'   
        /></ItemTemplate>      </asp:TemplateField>

        <asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_CoderSite" runat="server" Text="Coder Site"/></HeaderTemplate>          
        <ItemTemplate><asp:Label ID="lblCoderSite" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CoderSite") %>'  CssClass="gvBlack"/></ItemTemplate>      
        </asp:TemplateField>

<%--        BackColor='<%# DataBinder.Eval(Container.DataItem, "sms_dd_color") %>' 
--%>
    <%--<asp:TemplateField>       <HeaderTemplate><asp:Label ID="hdrlbl_DataEntryURL_REL" runat="server" Text="DataEntryURL_REL"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblDataEntryURL_REL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DataEntryURL_REL") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
--%>

    <asp:TemplateField Visible="false">       <HeaderTemplate><asp:Label ID="hdrlbl_studymeasID" runat="server" Text="studymeasID"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblstudymeasID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "studymeasID") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
    <asp:TemplateField Visible="false">       <HeaderTemplate><asp:Label ID="hdrlbl_studymeasID_REL" runat="server" Text="studymeasID_REL"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblstudymeasID_REL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "studymeasID_REL") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
    <asp:TemplateField Visible="false">       <HeaderTemplate><asp:Label ID="hdrlbl_studymeassubjID" runat="server" Text="studymeassubjID"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblstudymeassubjID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "studymeassubjID") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
    <asp:TemplateField Visible="false">       <HeaderTemplate><asp:Label ID="hdrlbl_studymeassubjID_REL" runat="server" Text="studymeassubjID_REL"/></HeaderTemplate>          <ItemTemplate><asp:Label ID="lblstudymeassubjID_REL" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "studymeassubjID_REL") %>'  CssClass="gvBlack"/></ItemTemplate>      </asp:TemplateField>
</Columns></asp:GridView>




<asp:SqlDataSource ID="sql_vwTadpolePATH__ADOS_Reliability_Status" runat="server" ConnectionString="<%$ ConnectionStrings: TRACKING_CONN_STRING %>"      
SelectCommandType="Text" SelectCommand="select * from vwTadpolePATH__ADOS_Reliability_Status order by GroupName, rankorder, ID"   />



</asp:Content>
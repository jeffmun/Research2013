<%@ Page Language="C#" Debug="true"  MasterPageFile="~/UWAC.master"  AutoEventWireup="true" CodeFile="ScoringErrors.aspx.cs" Inherits="Analysis_ScoringErrors" 
     EnableEventValidation="false" Title="Scoring Errors"%>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >

    

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
   



<br /><br />

<asp:Label ID="label1" runat="server" Text ="Scoring Errors" Font-Bold="true" Font-Underline="true" Font-Size="Medium"></asp:Label>    <br />  
<asp:Label ID="lblInfo" runat="server" Text ="" Font-Size="X-Small"></asp:Label>
<br /><br />

<asp:Label ID="label2" runat="server" Text ="Duplicate records for a given ID within a single studymeasID" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label>    <br />  
    <asp:GridView id="gv_dupl_studymeasID" runat="server" AutoGenerateColumns="false" BorderColor="WhiteSmoke" EmptyDataText="Hooray no duplicate studymeasID's!">
   <Columns>
       <asp:BoundField HeaderText="Study" DataField="studyname" />
       <asp:BoundField HeaderText="Study Measure" DataField="studymeasname" />
       <asp:BoundField HeaderText="Group" DataField="groupname" ItemStyle-HorizontalAlign="Center" />
       <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-HorizontalAlign="Center" />
       <asp:BoundField HeaderText="# records" DataField="n" ItemStyle-HorizontalAlign="Center" />
       <asp:TemplateField HeaderText ="Data Entry Link 1" ItemStyle-HorizontalAlign="Center">
           <ItemTemplate>
               <asp:HyperLink runat="server" Target="_blank" Text='link1' NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "link1") %>'  ></asp:HyperLink>
           </ItemTemplate>
       </asp:TemplateField>
       <asp:TemplateField HeaderText ="Data Entry Link 2" ItemStyle-HorizontalAlign="Center">
           <ItemTemplate>
               <asp:HyperLink runat="server" Target="_blank" Text='link2' NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "link2") %>'  ></asp:HyperLink>
           </ItemTemplate>
       </asp:TemplateField>

   </Columns>
        </asp:GridView>


<br /><br />

            <asp:UpdatePanel ID="UpdatePanel_ALL_VineII" runat="server" UpdateMode="Conditional" Visible="false">
        <ContentTemplate>


<asp:Label ID="lbl_ALL_VineII" runat="server" Text ="Vineland-II" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label>
<asp:Label ID="N_ALL_VineII" runat="server" Text ="" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label>

    <asp:GridView id="gv_ALL_VineII" runat="server" AutoGenerateColumns="false" BorderColor="WhiteSmoke" EmptyDataText="Hooray no Vineland errors!">
   <Columns>
       <asp:BoundField HeaderText="Study" DataField="studyname" />
       <asp:BoundField HeaderText="Group" DataField="Groupname" />
       <asp:BoundField HeaderText="ID" DataField="ID" />
       <asp:TemplateField HeaderText ="Data Entry Link" ItemStyle-HorizontalAlign="Center">
           <ItemTemplate>
               <asp:HyperLink runat="server" Target="_blank" Text='link' NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "link") %>'  ></asp:HyperLink>
           </ItemTemplate>
       </asp:TemplateField>
              <asp:BoundField HeaderText="Time Point" DataField="timepoint" />
              <asp:BoundField HeaderText="Scoring message" DataField="Scoring_message" />
              <asp:BoundField HeaderText="DIFFS (hand-entered vs. calculated)" DataField="Details" />
              <asp:BoundField HeaderText="Comments" DataField="v2comments" />
                           <asp:BoundField HeaderText="Created By" DataField="CreatedBy" />
                    <asp:BoundField HeaderText="Updated By" DataField="UpdatedBy" />
<asp:TemplateField HeaderText ="Reset for editing" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
        <asp:Button runat="server" ButtonType="Button" Text="Reset" Visible='<%#DataBinder.Eval(Container.DataItem, "reset") %>' OnClick="btnReset_Click" />
        <asp:HiddenField ID="hid_studymeasID" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "studymeasID") %>' />
        <asp:HiddenField ID="hid_pk" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "vineii_pk") %>' />


    </ItemTemplate>
</asp:TemplateField>


   </Columns>
        </asp:GridView>

        </ContentTemplate>
</asp:UpdatePanel>


    <br /><br />

<%--        <asp:UpdatePanel ID="UpdatePanel_ALL_VinelandIISurvey" runat="server" UpdateMode="Conditional" Visible="false">
        <ContentTemplate>


<asp:Label ID="lbl_ALL_VinelandIIsurvey" runat="server" Text ="Vineland" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label>

    <asp:GridView id="gv_ALL_VinelandIIsurvey" runat="server" AutoGenerateColumns="false" BorderColor="WhiteSmoke" EmptyDataText="Hooray no Vineland errors!">
   <Columns>
       <asp:BoundField HeaderText="Study" DataField="studyname" />
       <asp:BoundField HeaderText="Group" DataField="Groupname" />
       <asp:BoundField HeaderText="ID" DataField="ID" />
       <asp:TemplateField HeaderText ="Data Entry Link" ItemStyle-HorizontalAlign="Center">
           <ItemTemplate>
               <asp:HyperLink runat="server" Target="_blank" Text='link' NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "link") %>'  ></asp:HyperLink>
           </ItemTemplate>
       </asp:TemplateField>
              <asp:BoundField HeaderText="Time Point" DataField="timepoint" />
              <asp:BoundField HeaderText="Scoring message" DataField="Scoring_message" />
              <asp:BoundField HeaderText="DIFFS (hand-entered vs. calculated)" DataField="Details" />
              <asp:BoundField HeaderText="Comments" DataField="v2comments" />
                           <asp:BoundField HeaderText="Created By" DataField="CreatedBy" />
                    <asp:BoundField HeaderText="Updated By" DataField="UpdatedBy" />
<asp:TemplateField HeaderText ="Reset for editing" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
        <asp:Button runat="server" ButtonType="Button" Text="Reset" Visible='<%#DataBinder.Eval(Container.DataItem, "reset") %>' OnClick="btnReset_Click" />
        <asp:HiddenField ID="hid_studymeasID" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "studymeasID") %>' />
        <asp:HiddenField ID="hid_pk" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "pk") %>' />


    </ItemTemplate>
</asp:TemplateField>


   </Columns>
        </asp:GridView>

        </ContentTemplate>
</asp:UpdatePanel>--%>

<br />
        <asp:UpdatePanel ID="UpdatePanel_ALL_Mullen_items" runat="server" UpdateMode="Conditional" Visible="false">
        <ContentTemplate>
    <br /><br />
    
<asp:Label ID="lbl_ALL_Mullen_items" runat="server" Text ="Mullen" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label>
<asp:Label ID="N_ALL_Mullen_items" runat="server" Text ="" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label>

    <asp:GridView id="gv_ALL_Mullen_items" runat="server" AutoGenerateColumns="false" BorderColor="WhiteSmoke"  EmptyDataText="Hooray no Mullen errors!">
   <Columns>
    <asp:BoundField HeaderText="Study" DataField="studyname" />
    <asp:BoundField HeaderText="Group" DataField="Groupname" />
    <asp:BoundField HeaderText="ID" DataField="ID" />
    <asp:TemplateField HeaderText ="Data Entry Link" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:HyperLink runat="server" Target="_blank" Text='link' NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "link") %>'  ></asp:HyperLink>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField HeaderText="Time Point" DataField="timepoint" />
    <asp:BoundField HeaderText="Scoring message" DataField="Scoring_message" />
    <asp:BoundField HeaderText="Mullen Comments" DataField="mucmts" />
    <asp:BoundField HeaderText="Details" DataField="Details" />
    <asp:BoundField HeaderText="Clinician" DataField="Clinician" />
    <asp:BoundField HeaderText="Created By" DataField="CreatedBy" />
    <asp:BoundField HeaderText="Updated By" DataField="UpdatedBy" />
    <asp:TemplateField HeaderText ="Reset for editing" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:Button runat="server" ButtonType="Button" Text="Reset" Visible='<%#DataBinder.Eval(Container.DataItem, "reset") %>' OnClick="btnReset_Click" />
            <asp:HiddenField ID="hid_studymeasID" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "studymeasID") %>' />
            <asp:HiddenField ID="hid_pk" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "pk") %>' />
        </ItemTemplate>
    </asp:TemplateField>
   </Columns>
   </asp:GridView>
        </ContentTemplate>
</asp:UpdatePanel>
        <br />


     <asp:UpdatePanel ID="UpdatePanel_ALL_MIND_IntHx_vers2" runat="server" UpdateMode="Conditional" Visible="false">
        <ContentTemplate>  
            <br /><br /> 
<asp:Label ID="lbl_ALL_MIND_IntHx_vers2" runat="server" Text ="MIND_IntHx vers2" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label>
<asp:Label ID="N_ALL_MIND_IntHx_vers2" runat="server" Text ="" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label>

    <asp:GridView id="gv_ALL_MIND_IntHx_vers2" runat="server" AutoGenerateColumns="false" BorderColor="WhiteSmoke"  EmptyDataText="Hooray no MIND IntHx errors!">
   <Columns>
    <asp:BoundField HeaderText="Study" DataField="studyname" />
    <asp:BoundField HeaderText="Group" DataField="Groupname" />
    <asp:BoundField HeaderText="ID" DataField="ID" />
    <asp:TemplateField HeaderText ="Data Entry Link" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:HyperLink runat="server" Target="_blank" Text='link' NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "link") %>'  ></asp:HyperLink>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField HeaderText="Error Type" DataField="ErrorType" ItemStyle-ForeColor="red" />
    <asp:BoundField HeaderText="Tx Item order (A-T)" DataField="ihletter" ItemStyle-HorizontalAlign="Center"  />
    <asp:BoundField HeaderText="Tx Name" DataField="TxName" />
    <asp:BoundField HeaderText="Tx Setting" DataField="TxSetting" />
    <asp:BoundField HeaderText="Num Units" DataField="NumUnits" ItemStyle-HorizontalAlign="Center"  />
    <asp:BoundField HeaderText="Units" DataField="Units" />

           <asp:BoundField HeaderText="Details" DataField="Details" />

    <asp:BoundField HeaderText="Created By" DataField="CreatedBy" />
    <asp:BoundField HeaderText="Updated By" DataField="UpdatedBy" />
    <asp:TemplateField HeaderText ="Reset for editing" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:Button runat="server" ButtonType="Button" Text="Reset" Visible='<%#DataBinder.Eval(Container.DataItem, "reset") %>' OnClick="btnReset_Click" />
            <asp:HiddenField ID="hid_studymeasID" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "studymeasID") %>' />
            <asp:HiddenField ID="hid_pk" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "pk") %>' />
        </ItemTemplate>
    </asp:TemplateField>
   </Columns>
   </asp:GridView>
        </ContentTemplate>
</asp:UpdatePanel>

    

    <br />

    <asp:UpdatePanel ID="UpdatePanel_ALL_ADOS_T" runat="server" UpdateMode="Conditional" Visible="false">
        <ContentTemplate>
    <br /><br />
<asp:Label ID="lbl_ALL_ADOS_T" runat="server" Text ="ADOS-T" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label>
            <asp:Label ID="N_ALL_ADOS_T" runat="server" Text ="" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label><br/>
<asp:Label ID="label6" runat="server" Text ="These cases have been entered into the ESS DB as module 0 (Toddler)."  Font-Bold="false" Font-Size="Small"></asp:Label><br/>
<asp:Label ID="label7" runat="server" Text ="I have scored them according to Mod1 alg as the ADOS-T alg (Luyster 2007) only includes ASD vs. NO ASD categories. "   Font-Bold="false" Font-Size="Small"></asp:Label><br/>
<asp:Label ID="label8" runat="server" Text ="Cases are listed when the ESS dx does not match the UW Mod 1 dx.  Comparisons between the alg scores are also listed."   Font-Bold="false" Font-Size="Small"></asp:Label><br/>

    <asp:GridView id="gv_ALL_AODS_T" runat="server" AutoGenerateColumns="false" BorderColor="WhiteSmoke"  EmptyDataText="Hooray no ADOS-T errors!">
   <Columns>

 <asp:BoundField HeaderText="ESS_vs_UW_CLASS" DataField="ESS_vs_UW_CLASS" />
 <asp:BoundField HeaderText="ESS_vs_UW SA scores" DataField="ESS_vs_UW_SAscores" />
 <asp:BoundField HeaderText="ESS_vs_UW RR scores" DataField="ESS_vs_UW_RRscores" />

           <asp:TemplateField HeaderText ="Data Entry Link" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:HyperLink runat="server" Target="_blank" Text='link' NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "link") %>'  ></asp:HyperLink>
        </ItemTemplate>
    </asp:TemplateField>

 <asp:BoundField HeaderText="pk" DataField="pk" />
 <asp:BoundField HeaderText="ID" DataField="ID" />
 <asp:BoundField HeaderText="visit" DataField="visit" />
 <asp:BoundField HeaderText="comments" DataField="comments" />
 <asp:BoundField HeaderText="adosdate"  DataField="adosdate" dataformatstring="{0:d}"  />
 <asp:BoundField HeaderText="adost_sa ESS" DataField="adost_sa_ESS" HeaderStyle-BackColor="Gainsboro" ItemStyle-BackColor="Gainsboro"  />
 <asp:BoundField HeaderText="adost_rr ESS" DataField="adost_rr_ESS" HeaderStyle-BackColor="Gainsboro" ItemStyle-BackColor="Gainsboro" />
 <asp:BoundField HeaderText="adost_dx ESS" DataField="adost_dx_ESS"  HeaderStyle-BackColor="Gainsboro" ItemStyle-BackColor="Gainsboro"/>

 <asp:BoundField HeaderText="ados_sa UW Mod1" DataField="ados_sa_UW" HeaderStyle-BackColor="#B8DBFF" ItemStyle-BackColor="#B8DBFF" />
 <asp:BoundField HeaderText="ados_rr UW Mod1" DataField="ados_rr_UW" HeaderStyle-BackColor="#B8DBFF" ItemStyle-BackColor="#B8DBFF" />
 <asp:BoundField HeaderText="ados_class UW Mod1" DataField="ados_class_UW" HeaderStyle-BackColor="#B8DBFF" ItemStyle-BackColor="#B8DBFF" />
 <asp:BoundField HeaderText="ADOS AlgVers Mod 1(Fall 2007)" DataField="ADOSalgvers" HeaderStyle-BackColor="#B8DBFF" ItemStyle-BackColor="#B8DBFF" />
 
 <asp:BoundField HeaderText="adost_sa UW T" DataField="adost_sa_UW"  HeaderStyle-BackColor="#C4E8D4" ItemStyle-BackColor="#C4E8D4"  />
 <asp:BoundField HeaderText="adost_rr UW T" DataField="adost_rr_UW"  HeaderStyle-BackColor="#C4E8D4" ItemStyle-BackColor="#C4E8D4" />
 <asp:BoundField HeaderText="adost_class UW T" DataField="adost_class_UW"  HeaderStyle-BackColor="#C4E8D4" ItemStyle-BackColor="#C4E8D4"/>
 <asp:BoundField HeaderText="ADOS-T AlgVers" DataField="ADOSTalgvers"  HeaderStyle-BackColor="#C4E8D4" ItemStyle-BackColor="#C4E8D4" />

   </Columns>
   </asp:GridView>
                </ContentTemplate>
</asp:UpdatePanel>

    <br />
    <asp:UpdatePanel ID="UpdatePanel_ALL_CurrChecklist" runat="server" UpdateMode="Conditional" Visible="false">
        <ContentTemplate>
<br /> <br /> 
<asp:Label ID="lbl_ALL_CurrChecklist" runat="server" Text ="Curriculum Checklist" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label>
<asp:Label ID="N_ALL_CurrChecklist" runat="server" Text ="" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label>
            
            <br/>
    <asp:GridView id="gv_ALL_CurrChecklist" runat="server" AutoGenerateColumns="false" BorderColor="WhiteSmoke"  EmptyDataText="Hooray no CurrChecklist errors!" >
   <Columns>
                  <asp:TemplateField HeaderText ="Data Entry Link" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:HyperLink runat="server" Target="_blank" Text='link' NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "link") %>'  ></asp:HyperLink>
        </ItemTemplate>
    </asp:TemplateField>

 <asp:BoundField HeaderText="pk" DataField="pk" />
 <asp:BoundField HeaderText="ID" DataField="ID" />
 <asp:BoundField HeaderText="Site" DataField="groupname" />
 <asp:BoundField HeaderText="Assessor" DataField="assessor" ItemStyle-HorizontalAlign="Center" />
 <asp:BoundField HeaderText="Visit date" DataField="visit_date" dataformatstring="{0:d}" />
 <asp:BoundField HeaderText="Details - Summary" DataField="details" />
 <asp:BoundField HeaderText="# No Basal" DataField="n_nobasal" />
 <asp:BoundField HeaderText="# No Ceiling" DataField="n_noceil" />
 <asp:BoundField HeaderText="# Basal > Ceil" DataField="n_basalGTceil" />

 <asp:BoundField HeaderText="Total Num Blanks" DataField="tot_numblanks" ItemStyle-HorizontalAlign="Center"  />
 
           <asp:TemplateField HeaderText ="Reset for editing" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:Button runat="server" ButtonType="Button" Text="Reset" Visible='<%#DataBinder.Eval(Container.DataItem, "reset") %>' OnClick="btnReset_Click" />
            <asp:HiddenField ID="hid_studymeasID" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "studymeasID") %>' />
            <asp:HiddenField ID="hid_pk" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "pk") %>' />
        </ItemTemplate>
    </asp:TemplateField>

</Columns>
        </asp:GridView>

    </ContentTemplate>
</asp:UpdatePanel>


       <br />
<asp:UpdatePanel ID="UpdatePanel_ALL_ESDMCurrChecklist" runat="server" UpdateMode="Conditional" Visible="false">
    <ContentTemplate>
        <br /> <br /> 
<asp:Label ID="lbl_ALL_ESDMCurrChecklist" runat="server" Text ="ESDM Curriculum Checklist" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label>
        <asp:Label ID="N_ALL_ESDMCurrChecklist" runat="server" Text ="" Font-Bold="true" Font-Underline="true" Font-Size="Small"></asp:Label><br/>
    <asp:GridView id="gv_ALL_ESDMCurrChecklist" runat="server" AutoGenerateColumns="false" BorderColor="WhiteSmoke"  EmptyDataText="Hooray no ESDM CurrChecklist errors!">
   <Columns>
        <asp:TemplateField HeaderText ="Data Entry Link" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:HyperLink runat="server" Target="_blank" Text='link' NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "link") %>'  ></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="pk" DataField="pk" />
        <asp:BoundField HeaderText="ID" DataField="ID" />
        <asp:BoundField HeaderText="Group" DataField="groupname" />
        <asp:BoundField HeaderText="Assessor" DataField="esdmcc_exmnr" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField HeaderText="Visit date" DataField="esdmcc_date" dataformatstring="{0:d}" />
        <asp:BoundField HeaderText="Details - Summary" DataField="esdmcc_scrmsg" />
        <asp:BoundField HeaderText="# No Basal" DataField="n_nobasal" />
        <asp:BoundField HeaderText="# No Ceiling" DataField="n_noceil" />
        <asp:BoundField HeaderText="# Basal > Ceil" DataField="n_basalGTceil" />
        <asp:TemplateField HeaderText ="Reset for editing" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Button runat="server" ButtonType="Button" Text="Reset" Visible='<%#DataBinder.Eval(Container.DataItem, "reset") %>' OnClick="btnReset_Click" />
                <asp:HiddenField ID="hid_studymeasID" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "studymeasID") %>' />
                <asp:HiddenField ID="hid_pk" runat="server" Value='<%#  DataBinder.Eval(Container.DataItem, "pk") %>' />
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>


    </ContentTemplate>
</asp:UpdatePanel>



    </asp:Content>


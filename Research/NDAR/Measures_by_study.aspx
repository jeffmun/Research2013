<%@ Page Language="c#" Debug="true"  EnableEventValidation="false" MasterPageFile="~/UWAC.master" CodeFile="Measures_by_study.aspx.cs" AutoEventWireup="true"
 Inherits="NDAR_Measures_by_study" Title="NDAR Measures by study"  %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>



<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<style> .styleTBD   {   font: 8pt verdana;   font-weight:100;   color:SteelBlue;   outline-color:gray;}  </style>
<style> .styleData   {   font: 8pt verdana;   font-weight:100;   color:Green;   outline-color:gray;}  </style>
<style> .styleNA   {   font: 8pt verdana;   font-weight:100;   color:gray; outline-color:gray;    }  </style>
<style> .rowstyleAction   {   background-color:gray;  } </style>  
<style> .right_align { text-align: right; }  </style>
<style> .DataDictCell   { border-color:Gray;   font: 8pt verdana;   font-weight:100; border-width:thin;  color:black; outline-color:gray;    }  </style>

 <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js?lang=sql"></script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   <br />

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   

  <%--  <asp:Button ID="btnShowHide_Panel_DataSets" runat="server" Text="View DataSets rather than entire study" OnClick="Click_DisplaySetPanel" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:Panel ID="Panel_DataSets" runat="server" Visible="false">
        <asp:Label ID="lbl_set" runat="server" Text="Data Set:"></asp:Label>
        <asp:DropDownList ID="ddl_set" runat="server" DataSourceID="Sql_autosets" DataTextField="set_label" DataValueField="setpk" >
        </asp:DropDownList>


        <asp:Button ID="Button1" runat="server" Text="View Info for Selected DataSet" OnClick="Click_LoadSet" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Click_LoadStudy" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </asp:Panel>--%>


    <br /> 
    <table>
        <tr>
            <td width="600px">

            </td>

            <td>
                <asp:Label id="lblNDARTools" runat="server" Text  ="NDAR Tools: "  ></asp:Label>
                <asp:HyperLink id="hyp1" runat="server" NavigateUrl="https://ndar.nih.gov/ValidationTool.html" Target="_blank" Text ="Validation" ></asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink id="hyp2" runat="server" NavigateUrl="https://ndar.nih.gov/ndar_data_dictionary.html?type=All&source=NDAR&category=All" Target="_blank" Text="Data Dictionary"></asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink id="hyp3" runat="server" NavigateUrl="https://ndar.nih.gov/GuidTool.html" Target="_blank" Text="GUID"></asp:HyperLink>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="jmInfo" runat="server"></asp:Label>         <br /> 

    <asp:Panel ID="Panel1_header" runat="server" Visible="true">
        <asp:Label ID="Label1" runat="server" Text="Study: " Font-Size="Medium" Font-Bold="false" ></asp:Label>
        <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true" ></asp:Label>
        <br /><br />
        <asp:Label ID="Label4" runat="server" Text="NDAR Data files:" Font-Size="Medium" Font-Bold="true" ></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Label ID="Label6" runat="server" Text="uses: spNDAR__Study_Specific_Views & spNDAR__ExportFile" ForeColor="Silver" Font-Size="Smaller" Font-Bold="false" ></asp:Label>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Label ID="Label7" runat="server" Text="Data files are saved to:" ForeColor="DarkBlue" Font-Size="Smaller" Font-Bold="false" ></asp:Label>
         <asp:Label ID="lblCurrentPath" runat="server" Text="" ForeColor="DarkBlue" Font-Size="Smaller" Font-Bold="true" ></asp:Label>
        <asp:Button ID="btnALL" runat="server" Text="Export All" Font-Size="Smaller" OnClick="ExportFile_ALL" />

    </asp:Panel>

    <asp:Panel ID="Panel1" runat="server" Visible="true">
    </asp:Panel>
        <br/>
    <br/>    <br/>

        <asp:Panel ID="Panel1a_header" runat="server" Visible="false">
                <asp:Label ID="Label1a" runat="server" Text="All measures and views: " Font-Size="Medium" Font-Bold="true" ></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text="sort by: " Font-Size="Smaller" Font-Bold="false" ></asp:Label>

                <asp:DropDownList ID="ddl_SortOrder" runat="server" OnSelectedIndexChanged="Update_GridView02" AutoPostBack="true"  >
                    <asp:ListItem Value="1" Text="Meas name"></asp:ListItem>
                    <asp:ListItem Value="2" Text="NDAR view status, Meas name" Selected="true"></asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label5" runat="server" Text="uses: vwNDAR_tables_and_views & spNDAR_tables_and_views_by_CurrentStudy" ForeColor="Silver" Font-Size="Smaller" Font-Bold="false" ></asp:Label>

                <br />    <br />

        </asp:Panel>
    
    


        <asp:Panel ID="Panel1a" runat="server" Visible="false">

                    <asp:GridView ID="gv_Tables_Views" runat="server"  AutoGenerateColumns="false" Visible="true" OnRowDataBound="gv_Tables_Views_RowDataBound"  >
                <Columns>
                
                <asp:BoundField DataField="studyID" HeaderText="studyID" />
                <asp:BoundField DataField="mID" HeaderText="mID" />
                <asp:BoundField DataField="measname" HeaderText="measname" />
                <asp:BoundField DataField="Ntimes meas used" HeaderText="N times meas used" />
                <asp:BoundField DataField="tblname" HeaderText="tblname" />
                <asp:BoundField DataField="UWtbl_nvars" HeaderText="# flds" />
                 <asp:TemplateField HeaderText = "ds_pk<br/>(Click for NDAR DD)"  >
                    <ItemTemplate>
                    <asp:HyperLink ID="hypNDARLink" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ds_pk") %>' 
                            NavigateURL='<%# DataBinder.Eval(Container.DataItem, "NDARLink") %>' Target="_blank"  
                        ForeColor="DarkBlue" Font-Size="X-Small" />
                    </ItemTemplate>
                </asp:TemplateField>     
                
                           
                <asp:TemplateField HeaderText = "ShortName"  >
                    <ItemTemplate>
                        <asp:Button ID="btn_ShortName" runat="server" OnCommand="gv_Tables_Views_GridButtons_Command" 
                        Text='<%# DataBinder.Eval(Container.DataItem, "ShortNameVers") %>'  
                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ds_pk") %>' CommandName="ShowNDARdse" 
                        ForeColor="DarkBlue" Font-Size="X-Small" />
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:BoundField DataField="NDARdse_nvars" HeaderText="# dse" ItemStyle-ForeColor="DarkBlue" />


                <asp:BoundField DataField="NDAR_view_status" HeaderText="NDAR_view_status" />
                <asp:TemplateField HeaderText = "inDataDB__UW_NDARview" >
                    <ItemTemplate>
                        <asp:Button ID="btn_1" runat="server" OnCommand="gv_Tables_Views_GridButtons_Command" Text='<%# DataBinder.Eval(Container.DataItem, "inDataDB__UW_NDARview") %>'  
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "inDataDB__UW_NDARview") %>' CommandName="ShowViewDef" Font-Size="X-Small" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText = "inNDAR_DS__UW_NDARview" >
                    <ItemTemplate>
                        <asp:Button ID="btn_2" runat="server" OnCommand="gv_Tables_Views_GridButtons_Command" Text='<%# DataBinder.Eval(Container.DataItem, "inNDAR_DS__UW_NDARview") %>'  
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "inNDAR_DS__UW_NDARview") %>' CommandName="ShowViewDef" Font-Size="X-Small" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText = "inNDAR_SSV__NDARview" >
                    <ItemTemplate>
                        <asp:Button ID="btn_3" runat="server" OnCommand="gv_Tables_Views_GridButtons_Command" Text='<%# DataBinder.Eval(Container.DataItem, "inNDAR_SSV__NDARview") %>'  
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "inNDAR_SSV__NDARview") %>' CommandName="ShowViewDefNDAR" Font-Size="X-Small" />
                    </ItemTemplate>
                </asp:TemplateField>
                
                
                </Columns>
            </asp:GridView>
        <br />
    </asp:Panel>

            <asp:Panel ID="Panel3" runat="server" Visible="true">



        <br />
    </asp:Panel>



    <br/>
    <br/>    <br/>

        <asp:Panel ID="Panel2_header" runat="server" Visible="false">
        <asp:Label ID="Label2" runat="server" Text="Data set info: " Font-Size="Medium" Font-Bold="false" ></asp:Label>
        <br />
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" Visible="false">
    </asp:Panel>
    
   <br />   <br />

    <asp:Panel ID="Panel_ViewDef" runat="server" Visible="true">
    <br />
    <br />
<%--            <asp:Label ID="Label10" runat="server" Text="View Name:" Font-Size="Smaller"  ></asp:Label>
            <asp:TextBox ID="txt_VwName" runat="server" Text=""></asp:TextBox>
            <asp:Button ID="btn_LoadViewDef" runat="server" Text="Load View Definition" OnClick="Load_gv_ViewDef" /> --%>
                        <br /><br />
            <asp:Label ID="lblVwName" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></asp:Label>
<br />
<br />
           <asp:GridView ID="gv_ViewDef" runat="server" AutoGenerateColumns="false" GridLines="None">
        <Columns>
        <asp:TemplateField>

        <HeaderTemplate>
            
        
        </HeaderTemplate>

        <ItemTemplate>
            <asp:Literal ID="lbl_spText" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "spTextHTML")  %>'  ></asp:Literal>
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
        </asp:GridView>
    </asp:Panel>
    
    
    <asp:UpdatePanel ID="Panel_NDARdse" runat="server" Visible="true" UpdateMode="Conditional" >
    <ContentTemplate>

        <asp:Button ID="btnRefresh_NDARdse" runat="server" Text="Refresh" OnClick="Refresh_NDARdse" />

    <table>
    <tr>
    <td style="vertical-align:top">
    
    
        <asp:Label ID="NDARdse_lblTitle" runat="server" Text=""></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CheckBox ID="NDARdse_chkShowOnlyUnmatched" runat="server" Text="Show only unmatched fields"  />
        <br /><br />
        <asp:GridView ID="gv_NDARdse" runat="server" OnRowDataBound="gv_NDARdse_RowDataBound">
        <Columns>
            <asp:BoundField DataField="dse_pk" HeaderText="dse_pk" />
            <asp:BoundField DataField="element_num" HeaderText="elm num" />
            
            <asp:TemplateField HeaderText = "UWfld" >
                <ItemTemplate>
                    <asp:TextBox ID="txt_UWfld" runat="server" BackColor="AntiqueWhite" Text='<%# DataBinder.Eval(Container.DataItem, "UWfld") %>'  Font-Size="X-Small" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="ElementName" HeaderText="Element Name" ItemStyle-Font-Bold="true" />
            <asp:BoundField DataField="DataType" HeaderText="Data Type" />
            <asp:BoundField DataField="Size" HeaderText="Size" />
            <asp:BoundField DataField="Req" HeaderText="Req" />
            <asp:BoundField DataField="ElementDescription" HeaderText="Element Description" />
            <asp:BoundField DataField="ValueRange" HeaderText="Value Range" />
            <asp:BoundField DataField="Notes" HeaderText="Notes" />


        </Columns>
        </asp:GridView>
    </td>
    
    <td style="vertical-align:top" >
      <asp:Label ID="Label9" runat="server" Text="UW Table"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="UWtable_chkShowOnlyUnmatched" runat="server" Text="Show only unmatched fields"  />
        <br /><br />
        <asp:GridView ID="gv_UWtable" runat="server" OnRowDataBound = "gv_UWtable_RowDataBound" BackColor="AliceBlue">
        <Columns>
            <asp:BoundField DataField="ord_pos" HeaderText="Ord Pos" />
            <asp:BoundField DataField="databasefield" HeaderText="Field"  ItemStyle-Font-Bold="true"/>
            <asp:BoundField DataField="data_type" HeaderText="Data Type" />
            <asp:BoundField DataField="validlist" HeaderText="Valid List" />
            <asp:BoundField DataField="missval" HeaderText="Miss Val" />
            <asp:BoundField DataField="fieldlabel" HeaderText="Label" />
            <asp:BoundField DataField="ValLabels" HeaderText="Val Labels" />
            <asp:BoundField DataField="used" HeaderText="used" />
        </Columns>
        </asp:GridView>
    </td>
    </tr>
    
    </table>


    </ContentTemplate>
    <Triggers>
    <asp:AsyncPostBackTrigger ControlID="btnRefresh_NDARdse" EventName="Click" />
    </Triggers>
    </asp:UpdatePanel>

    <br /><br />

    <table>
    <tr>    <td style="vertical-align:top" width="1100px">
    
    <pre class="prettyprint lang-sql">
    
    <b><u>Update GUIDs</u></b>
    /* create file to generate GUIDs (in NDAR DB) */
    exec spNDAR_GUID_to_create_MULTIPLE_by_study #studyID#, 'skip_consent' OR 'use_consent'
    
        
    <b><u>Consent </u></b>
    /* edit the following function to designate the NDAR consent (in backend DB) */
    fnNDAR_Has_Consent
    


    <b><u>Next steps based on NDAR_View_Status</u></b>
    <b>2a) ENTER in NDAR_DS (vw created)</b>             
            -- Enter the view name into the "UW_NDARview" field in the NDAR..NDAR_DataStructure table

    <b>2b) CREATE VIEW (vw in NDAR_DS)</b>               
            --Create the view for the "ALL_" table
            exec spNDAR__create_draft_of_vwNDAR_ALL 'NDARshortform_name', vers, 'fnNDARmv/fromto', 'use_ordpos_match', offset, 'UWtbl'

    <b>2c) NEED SSV (vw in NDAR_DS & _ALL created)</b>
            -- To create the study specific view 
            exec NDAR..spNDAR_create_REASON_EXCLUDE_view @studymeasID, @allTP 
                  -->  for the @allTP parameter use 0 for a single timepoint, 1 for all timepoints  

    <b>2d) NDAR_DS exists</b>

    <b>2e) NEED ALL</b>
            --Create a new data structure that is not present in NDAR

        
        <br />
    
     </pre>  <br />
    </td>
        </tr>
        <tr>
    <td style="vertical-align:top">
     <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://ndarportal.nih.gov/ndarportal/login.jsp" ImageUrl="~/NDAR/NDARlogo.png" Target="_blank" ></asp:HyperLink>
    </td>
    

    </tr>

    </table>
    
    <br /> <br />

 <table id="tblmyinfo" runat="server" width="100%">
 <tr><td Font-Color="red"></td></tr>
 </table>
 <br />
  <table id="tblmyerror" runat="server" width="100%">
 <tr><td>
     <asp:Label ID="lblMyError" runat="server" Text="" CssClass="ErrorCell" ></asp:Label>
     <asp:Label ID="lblMyInfo" runat="server" Text="" CssClass="InfoCell" ></asp:Label>
 </td></tr>
 </table>
    
    
<asp:SqlDataSource ID="Sql_autosets" runat="server" SelectCommandType="text"  
    SelectCommand="select * from vwAUTOSETS_for_ddl"  
    ConnectionString="<%$ ConnectionStrings: DATA_CONN_STRING %>">
   </asp:SqlDataSource>  


</asp:Content>



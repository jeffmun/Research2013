<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewDoc.aspx.cs" Inherits="ViewDoc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
--%>    
    
<%@ Page Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" 
CodeFile="TrackReliability.aspx.cs" Inherits="Reliability_TrackReliability" 
Title="Track Reliablity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" Runat="Server">

    <%-- ** SQL DATA SOURCES ** --%>    
    <div> &nbsp;<span style="font-family: Arial"></span><strong><span style="font-family: Arial"></span></strong>
        <br />
        <table>
            <tr>
                <td style="width: 162px; text-align: left" style="vertical-align:top">
                    <strong><span style="font-family: Arial; font-size: 10pt">Reliability
            Tracking</span></strong></td>
                <td style="width: 555px" style="vertical-align:top">
                    <span style="font-size: 8pt; font-family: Arial">This page lists the specific cases
                        that have been assigned as reliability cases based on the study design.<br />
                        <br />
                        Several tasks can be accomplished on this page:<br />
                        - compare original and reliability ratings<br />
                        - view summary statistics (Clinician Frequency, Reliability Statistics)<br />
                        - assign new cases to be rated for reliabilty<br />
                        - update the details regarding the review status of the reliability cases</span></td>
                <td style="vertical-align:top">
                     
            </tr>
        </table>
        <br />
        
            <asp:SqlDataSource ID="Sql_StudiesWithReliability" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="spStudiesWithReliability" SelectCommandType="StoredProcedure" ></asp:SqlDataSource>
            
        <asp:SqlDataSource ID="Sql_UserDefaultStudy" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="spGetUserDefaultStudy" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            
        <asp:SqlDataSource ID="Sql_ReliabilityTracking_ForInsert_Random" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            InsertCommand="spInsertReliability" InsertCommandType="StoredProcedure" 
            SelectCommand="select * from vwReliabilityTracking where studyID = @studyID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDL_SelectStudyID" PropertyName="SelectedValue" Name="studyID" />
            </SelectParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="GridView_Totals" PropertyName="SelectedValue" Name="studymeasID" Type="Int32" />
                <asp:ControlParameter ControlID="FormView_Insert_Random$TextBox_NumRecsToInsert" PropertyName="Text" Name="N" Type=Int32 />
                
            </InsertParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="Sql_ReliabilityTracking_ForInsert_Single" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            InsertCommand="spInsertReliability_single" InsertCommandType="StoredProcedure" 
            SelectCommand="select 1">
            <SelectParameters>
            </SelectParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="GridView_Totals" PropertyName="SelectedValue" Name="studymeasID" Type="Int32" />
                <asp:ControlParameter ControlID="FormView_Insert_Single$DDL_ID_to_insert" PropertyName="SelectedValue" Name="subjID" Type=Int32 />
                
            </InsertParameters>
        </asp:SqlDataSource>

        
        <span style="font-family: Arial"></span>
        <asp:SqlDataSource ID="Sql_ReliabilityTracking_Totals" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
             SelectCommand="select * from vwReliabilityTracking_Totals where studyID = @studyID"
             UpdateCommand="exec uwautism_research_data.dbo.spSummarizeReliability @INPUTstudymeasID" UpdateCommandType=Text OnUpdating="Sql_ReliabilityTracking_Totals_Updating" >
            <SelectParameters>
                <asp:ControlParameter ControlID="DDL_SelectStudyID" Name="studyID" PropertyName="SelectedValue"  />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="GridView_Totals" PropertyName="SelectedValue" Name="INPUTstudymeasID" Type=int32 />
            </UpdateParameters>
            
        </asp:SqlDataSource>


            <asp:SqlDataSource ID="Sql_SubjectList" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
             SelectCommand="select subjID, ID, replicate('0',20-len(ID)) + ID as IDsort, ID + ' (' + groupname + ')' as ID_group  
                            from vwMasterStatus_AM
                            where studymeasID = @studymeasID 
                            and measstatusID=1
                            and subjID not in (select subjID from tblReliabilityTracking where studymeasID = @studymeasID)
                            order by IDsort">
            <SelectParameters>
                            <asp:ControlParameter ControlID="GridView_Totals" PropertyName="SelectedValue" Name="studymeasID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        
            <asp:SqlDataSource ID="Sql_ReliabilityTracking_Details" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" 
                SelectCommand="select * from vwReliabilityTracking where studymeasID = @studymeasID"
                UpdateCommand="UPDATE tblReliabilityTracking set  relRevNotes = @relRevNotes, relTraining=@relTraining, relRevStatusID=@relRevStatusID where relID = @relID"
                DeleteCommand="DELETE from tblReliabilityTracking where relID = @relID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView_Totals" Name="studymeasID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:FormParameter FormField="TextBox_RevNotes_UPDATE"  Name="relRevNotes" Type=string />
                    <asp:FormParameter FormField="TextBox_relTraining_UPDATE"  Name="relTraining" Type=int32 />
                    <asp:FormParameter FormField="DDL_RevStatus_UPDATE" Name="relRevStatusID" Type=int32 />
                    <asp:FormParameter FormField="relID" Name="relID" Type=int32 />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:FormParameter FormField="relID" Name="relID" Type=int32 />
                </DeleteParameters>
            </asp:SqlDataSource>
      
            <asp:SqlDataSource ID="Sql_RevStatus" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
                SelectCommand="select * from tblReliability_ReviewStatus order by relRevSortOrder">
            </asp:SqlDataSource>      &nbsp; &nbsp;
            
            
            
        <br />
        <table style="width: 609px">
            <tr>
                <td style="width: 209px; height: 44px;" style="vertical-align:top">
                    <span style="font-family: Arial">
        Select study:&nbsp;<br />
                    </span>
        <asp:DropDownList ID="DDL_SelectStudyID" runat="server" DataSourceID="Sql_StudiesWithReliability"
             DataTextField="studyname" DataValueField="studyID" Width="298px" OnSelectedIndexChanged="DDL_SelectStudyID_SelectedIndexChanged" AutoPostBack=true >
        </asp:DropDownList><br />
                    </td>
                <td align="right" style="width: 209px; height: 44px;" valign="middle">
                    &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insert new reliabilities"
                        Visible="False" Width="154px" /></td>
                

        
            </tr>
            <tr>
                <td style="width: 209px; height: 21px" style="vertical-align:top">
                    <br />
                    <span style="color: #000099; font-family: Arial"></span>
                </td>
                <td align="left" style="width: 209px; height: 21px">
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top" bordercolor="dimgray" bordercolordark="#000099">
                    &nbsp;<span style="font-size: 10pt; font-family: Arial"><strong>View Summary Reports:</strong></span><asp:FormView
                        ID="FormView1" runat="server" DataSourceID="Sql_ReliabilityTracking_Totals" Font-Names="Arial"
                        Font-Size="10pt">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink3" Target=_blank runat="server" NavigateUrl='<%# Eval("ClinFreqReportURL") %>'>Clinician Frequency</asp:HyperLink><br />
                            <br />
                            <asp:HyperLink ID="HyperLink2" Target=_blank runat="server" NavigateUrl='<%# Eval("RelStatsReportURL") %>'>Reliability Stats (Kappa, ICC)</asp:HyperLink><br />
                            
                        </ItemTemplate>
                    </asp:FormView>
                </td>
                
                <td align="left" bordercolor="dimgray" bordercolordark="#000099">
        
            <asp:FormView ID="FormView_Insert_single" runat="server" Visible=False 
                    DataSourceID="Sql_ReliabilityTracking_ForInsert_Single" DefaultMode="Insert" OnItemInserted="FormView_Insert_single_ItemInserted" Font-Names="Arial" Font-Size="10pt" Width="268px">
                        <InsertItemTemplate>
                            <span style="color: #000099"><strong>Insert new reliabilities to complete:<br />
                            </strong>
                                <br />
                        Select ID to insert:<br />
                            </span>
                        <asp:DropDownList ID="DDL_ID_to_insert" runat=server DataSourceID="SQL_SubjectList" DataValueField="subjID" DataTextField="ID_group" Width="144px" ForeColor="#000099" > </asp:DropDownList>		    
                            <asp:Button ID="InsertButton_Single" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Insert" ForeColor="#000099" ></asp:Button>

                        </InsertItemTemplate>
        </asp:FormView>
                    <br />
                
                
                    <asp:FormView ID="FormView_Insert_Random"  runat="server" Visible=False 
                    DataSourceID="Sql_ReliabilityTracking_ForInsert_Random" DefaultMode="Insert" OnItemInserted="FormView_Insert_Random_ItemInserted" Font-Names="Arial" Font-Size="10pt" Width="271px" >
                        <InsertItemTemplate>
                            <span style="color: #000099">
                                <br />
                        # of random records to insert:</span>
                            <asp:TextBox ID="TextBox_NumRecsToInsert" runat="server" Width="37px" ForeColor="#000099"  ></asp:TextBox><br />
                            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Insert Random Records" ForeColor="#000099" Width="184px" ></asp:Button>
                            <br />
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox_NumRecsToInsert"
                                ErrorMessage="Enter a value from 1 to 30" MaximumValue="30" MinimumValue="1" Type="Integer"></asp:RangeValidator>

                        </InsertItemTemplate>
        </asp:FormView>
                </td>
            </tr>
        </table>
        <br />
        <span style="font-size: 9pt; color: cornflowerblue; font-family: Arial"></span>
        <asp:GridView ID="GridView_Totals" runat="server" DataSourceID="Sql_ReliabilityTracking_Totals" DataKeyNames="studymeasID" AutoGenerateColumns="False" CellPadding="4" Font-Names="Arial" Font-Size="10pt" ForeColor="#333333" GridLines="None" Height="149px" OnSelectedIndexChanged="GridView_Totals_SelectedIndexChanged" OnRowCommand="GridView_Totals_RowCommand" OnRowDataBound="GridView_Totals_RowDataBound" OnRowUpdating="GridView_Totals_RowUpdating" >
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:ButtonField  ButtonType=Button CommandName="Select" Text="Show Details" >
                    <ControlStyle Font-Size="8pt" Width="75px" />
                </asp:ButtonField>
                <asp:BoundField DataField="studyName" HeaderText="Study" SortExpression="studyName" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="studymeasName" HeaderText="Measure" SortExpression="studymeasName" />
                <asp:BoundField DataField="TotalCollected" HeaderText="Total Collected" SortExpression="TotalCollected" ><ItemStyle HorizontalAlign="Center" /> </asp:BoundField>
                <asp:BoundField DataField="NumRelsAssigned" HeaderText="# Assigned" SortExpression="NumRelsAssigned" ><ItemStyle HorizontalAlign="Center" /> </asp:BoundField>
                <asp:BoundField DataField="PctRelsAssigned_text" HeaderText="% Assigned" SortExpression="PctRelsAssigned_text" ><ItemStyle HorizontalAlign="Center" /> </asp:BoundField>
                <asp:BoundField DataField="NumRelsEntered_byID" HeaderText="# Entered (by ID)" SortExpression="NumRelsEntered_byID" ><ItemStyle HorizontalAlign="Center" /> </asp:BoundField>
                <asp:BoundField DataField="NumRelsEntered_ALL" HeaderText="# Entered (ALL)" SortExpression="NumRelsEntered_ALL" ><ItemStyle HorizontalAlign="Center" /> </asp:BoundField>
                <asp:BoundField DataField="NumRelsProcessed" HeaderText="# Processed" SortExpression="NumRelsProcessed" ><ItemStyle HorizontalAlign="Center" /> </asp:BoundField>
                <asp:BoundField DataField="PctRelsAgree_GT80_text" HeaderText="% with AGREE &gt; 80%" SortExpression="PctRelsAgree_GT80_text" > <ItemStyle HorizontalAlign="Center" /> </asp:BoundField>
                <asp:ButtonField  ButtonType=Button CommandName="Update" Text="Update Stats" >
                    <ControlStyle Font-Size="8pt" Width="75px"  />
                </asp:ButtonField>


     
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#FF8000" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        <span style="font-size: 9pt; color: #6495ed; font-family: Arial"><br />
            <asp:Label ID="Label_Detail_Caption" runat="server" Text="(Click column headers to sort)" Width="173px" Visible="False"></asp:Label><br />
        </span>
        
        
        <asp:GridView ID="GridView_Details" runat="server" AutoGenerateColumns="False" CellPadding="4"
            Visible=False DataSourceID="Sql_ReliabilityTracking_Details" DataKeyNames="relid" Font-Names="Arial" Font-Size="9pt"
             AllowSorting=True ForeColor="#333333" GridLines="None" OnRowUpdating="GridView_Details_RowUpdating"  >
             
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
       
            <Columns>
                <asp:CommandField ShowEditButton="True" >
                    <ControlStyle Font-Size="8pt" />
                </asp:CommandField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink  ID="HyperLink1"  runat="server" Target=_blank NavigateUrl='<%# Eval("DetailsReportURL") %>'
                            Text="View Dtls" Font-Size="8pt" ></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Measure" SortExpression="studymeasname">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("studymeasname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ID" SortExpression="IDsort">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Group" SortExpression="groupname">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("groupname") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action details" SortExpression="action_details">
                    <ItemTemplate>
                        <asp:Label ID="Label5a" runat="server" Text='<%# Bind("action_details") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Font-Size="8pt" />
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Orig Clin" SortExpression="staff_meascompby">
                    <ControlStyle ForeColor="Blue" />
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("staff_meascompby") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rel Clin (Data)" SortExpression="rel_clin">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("rel_Clin") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Trng? (0=N,1=Y)" SortExpression="relTraining">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox_relTraining_UPDATE" runat="server" Text='<%# Bind("relTraining") %>'  Width="40px" ></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label_relTraining" runat="server" Text='<%# Bind("relTraining") %>' Width="40px"   ></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Wrap="True" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Review Status" SortExpression="relRevSortOrder">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDL_RevStatus_UPDATE" runat="server" SelectedValue='<%# Bind("relRevStatusID") %>'  
                        DataSourceID="Sql_RevStatus" DataValueField="relRevStatusID" DataTextField="relRevStatusText"  ></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("relRevStatusText") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="True" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Review Notes" SortExpression="relRevNotes">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox_RevNotes_UPDATE" runat="server" Text='<%# Bind("relRevNotes") %>' Height="100px" TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("relRevNotes") %>' ></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Wrap="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="All Items" SortExpression="Agree_All">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("SumAgreeTotal") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="% AGREE" SortExpression="PctAgreeTotal">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("PctAgreeTotal_text") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Alg Items" SortExpression="agree_algorithm">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("SumAgreeAlgorithm") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="% AGREE Alg Items" SortExpression="PctAgreeAlgorithm">
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("PctAgreeAlgorithm_text") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                
                
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton  ID="delete" Runat="server"  Font-Size=Smaller ForeColor="Red"
                        OnClientClick="return confirm('Are you sure you want to delete this record?');"
                        CommandName="Delete">Delete
                    </asp:LinkButton>
                </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

                
            </Columns>
            
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="Gold" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        &nbsp;&nbsp;<br />
    </div>          

</asp:Content>


<%--        
    </form>
</body>
</html>
--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewDoc.aspx.cs" Inherits="ViewDoc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span style="font-family: Arial">
        <strong><span style="text-decoration: underline">UW Autism Center:
        Document Viewer</span></strong><span style="color: indigo">&nbsp;</span></span>
        <asp:SqlDataSource 
            ID="SQL_Doc_info" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="spGetDocVersByDocVersID" SelectCommandType="StoredProcedure"  
            InsertCommand="spDocVers_Insert" InsertCommandType="StoredProcedure"
            UpdateCommand="spDocVers_Update" UpdateCommandType="StoredProcedure"
             ProviderName="<%$ ConnectionStrings:TRACKING_CONN_STRING.ProviderName %>" OnInserting="SQL_Doc_info_Inserting" >
            
            <SelectParameters> 
                <asp:QueryStringParameter Name="DocVersID" QueryStringField="DocVersID" Type="Int32" />
            </SelectParameters>
            
               <UpdateParameters>
                    <asp:QueryStringParameter Name="DocVersID" QueryStringField="DocVersID" Type=Int32 />
                    <asp:FormParameter Name="DocTitle" FormField="DocTitleTextBox" Type=String />
                    <asp:FormParameter Name="ChangesDesc" FormField="ChangesDescTextBox" Type=String/>
                   <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                   <asp:FormParameter Name="DocStatusID" FormField="DocStatusID_DropDown" Type=int32 />
               </UpdateParameters>
               
            <InsertParameters>
                <asp:FormParameter Name="DocID"  FormField="DocIDTextBox_Insert"  Type=String/>
                <asp:FormParameter Name="ChangesDesc" FormField="ChangesDescTextBox_Insert" Type=String/>
                <asp:ControlParameter Name="FileExt" ControlID="FormView1$FileExtLabel1" PropertyName="Text"  Type=String/>
                <asp:ControlParameter Name="OrigFileName" ControlID="FormView1$FileUpload1" PropertyName="FileName" />
            </InsertParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="Sql_Doc_Info_OtherVersions" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="spGetDocVersByDocVersID_others" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="DocVersID" QueryStringField="DocVersID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="Sql_EntityInfo" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="spGetEntityInfo_from_DocVersID" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="DocVersID" QueryStringField="DocVersID" DefaultValue="2" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        

        <asp:SqlDataSource ID="Sql_NextDocVersID" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="select ident_current('tbldocvers') + 1 as NextDocVersID" SelectCommandType="Text">
        </asp:SqlDataSource>
        
        
        <asp:SqlDataSource ID="Sql_DocStatus" runat="server" ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
            SelectCommand="Select * from tblDocStatus_lkup" SelectCommandType="Text">    
        </asp:SqlDataSource>
        
        
        <asp:FormView ID="FormView2" runat="server" DataSourceID="Sql_NextDocVersID" Visible="False">
            <ItemTemplate>
                <asp:Label ID="NextDocVersIDLabel" runat="server" Text='<%# Eval("NextDocVersID") %>'>
                </asp:Label><br />
            </ItemTemplate>
        </asp:FormView>
                
        &nbsp; &nbsp;&nbsp;<br />
        <table>
            <tr>
                <td rowspan="2" style="width: 117px" align="left" style="vertical-align:top">
                
                
        <asp:FormView ID="FormView1" runat="server" 
        DataSourceID="SQL_Doc_info" Width="366px" Font-Names="Arial"  DataKeyNames="DocVersID" OnModeChanging="FormView1_ModeChanging" OnDataBound="FormView1_DataBound" OnModeChanged="FormView1_ModeChanged" OnItemInserting="FormView1_ItemInserting" OnItemUpdated="FormView1_ItemUpdated" OnItemInserted="FormView1_ItemInserted">
           
           
            <EditItemTemplate>
            
                            <span style="font-size: 10pt">&nbsp;</span><br />
                <table style="width: 494px" border="0" bordercolor="#ffffff" cellpadding="1" cellspacing="0">
                    <tr>
                        <td style="height: 10px" colspan="2">
                            <span><span style="text-decoration: underline; font-size: 11pt;">Document Info</span>&nbsp;
                                <span style="font-size: 10pt">DocID: <strong>&nbsp;</strong></span>
                                <asp:Label ID="DocIDTextBox" runat="server" Text='<%# Eval("DocID") %>' Font-Size="10pt" Width="70px"></asp:Label>
                                
                                <asp:Label ID="DocStatusIDTextBox" runat="server" Text='<%# Eval("DocStatusID") %>' Visible=false Font-Size="10pt" Width="70px"></asp:Label>
                                <asp:Label ID="DocTypeIDTextBox" runat="server" Text='<%# Eval("DocTypeID") %>' Visible=false Font-Size="10pt" Width="70px"></asp:Label>
                <asp:Button ID="EditButton" runat="server"  CommandName="Update" Text="Save" Font-Size="8pt" /><span style="font-size: 10pt">
                <asp:Button ID="CancelEditButton" runat="server" CommandName="Cancel" Text="Cancel" Font-Size="8pt" /><span style="font-size: 10pt">
                </td>
                
                    <tr>
                        <td style="width: 59px; height: 21px;">
                            <span style="font-size: 10pt; color: #006600;">Title:</span></td>
                        <td style="width: 100px; height: 21px;">
                            <asp:TextBox ID="DocTitleTextBox" runat="server" Font-Bold="True" Text='<%# Bind("DocTitle") %>' Width="360px" Font-Size="12pt" ForeColor="#006600"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 10pt">Type:</span></td>
                        <td style="width: 100px">
                            <asp:Label ID="doctypeTextBox" runat="server" Text='<%# Eval("doctype") %>' Width="360px" Font-Size="10pt"></asp:Label></td>
                            
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 10pt; color: #006600;">Status:</span></td>
                        <td style="width: 100px">
                            <!-- <asp:Label ID="docstatusTextBox" runat="server" Text='<%# Eval("docstatus") %>' Width="360px" Font-Size="10pt"></asp:Label> -->
                            <asp:DropDownList ID="DocStatusID_DropDown" runat=server Text='<%# Bind("DocStatusID") %>' DataSourceID="Sql_DocStatus" DataTextField="DocStatus" DataValueField="DocStatusID" ForeColor="#006600"     />
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="DocLinkTextBox" runat="server" ForeColor="#6600CC" Text='<%# Eval("DocLink") %>'
                                Visible="False" Width="360px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span style="text-decoration: underline">Document Version Info</span><strong>&nbsp;
                            </strong><span style="font-size: 9pt">DocVersID:&nbsp; </span>
                            <asp:Label ID="DocVersIDTextBox" runat="server" Text='<%# Eval("DocVersID") %>' Font-Bold="False" Font-Size="10pt" Width="61px"></asp:Label><span
                                style="font-size: 9pt"> </span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 10pt">Version:</span></td>
                        <td style="width: 100px">
                            <asp:Label ID="VersionTextBox" runat="server" Font-Bold="True" Text='<%# Eval("Version") %>' Width="360px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 10pt; color: #006600;">Changes in
                                this version:</span></td>
                        <td style="width: 100px">
                            <asp:TextBox ID="ChangesDescTextBox" runat="server" Text='<%# Bind("ChangesDesc") %>' Width="360px" Font-Size="10pt" Height="40px" ForeColor="#006600"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 8pt">Date Submitted:</span></td>
                        <td style="width: 100px">
                            <asp:Label ID="DateSubmittedTextBox" runat="server" Text='<%# Eval("DateSubmitted", "{0:d}") %>' Width="360px" Font-Size="10pt"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 8pt">Uploaded By: </span>
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="UploadedByTextBox" runat="server" Text='<%# Eval("UploadedBy") %>' Width="360px" Font-Size="10pt"></asp:Label></td>
                            <asp:Label ID="DocFileNameTextBox" runat="server" Text='<%# Eval("DocFileName") %>' Visible=false Width="360px" Font-Size="10pt"></asp:Label></tr>
                    <tr>
                        <td style="width: 59px">
                        </td>
                        <td style="width: 100px">
                        </td>
                    </tr>
                </table>

       
            </EditItemTemplate>
            
            
            <InsertItemTemplate>
                  <span style="font-size: 10pt">&nbsp;</span><br />
                <table style="width: 494px" border="0" bordercolor="#ffffff" cellpadding="1" cellspacing="0">
                    <tr>
                        <td style="height: 10px" colspan="2">
                            <span><span style="text-decoration: underline; font-size: 11pt;">Document Info</span>&nbsp;
                                <span style="font-size: 10pt">DocID: <strong>&nbsp;</strong></span>
                                <asp:Label ID="DocIDTextBox_Insert" runat="server" Text='<%# Bind("DocID") %>' Font-Size="10pt" Width="70px"></asp:Label>
                                
                                <asp:Label ID="DocStatusIDTextBox_Insert" runat="server" Text='<%# Eval("DocStatus") %>' Visible=false Font-Size="10pt" Width="70px"></asp:Label>
                                <asp:Label ID="DocTypeIDTextBox_Insert" runat="server" Text='<%# Eval("DocType") %>' Visible=false Font-Size="10pt" Width="70px"></asp:Label>
                </td>
                
                    <tr>
                        <td style="width: 59px; height: 21px;">
                            <span style="font-size: 10pt">Title:</span></td>
                        <td style="width: 100px; height: 21px;">
                            <asp:Label ID="DocTitleTextBox_Insert" runat="server" Font-Bold="True" Text='<%# Eval("DocTitle") %>' Width="360px" Font-Size="12pt"></asp:Label ></td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 10pt">Type:</span></td>
                        <td style="width: 100px">
                            <asp:Label ID="DocTypeTextBox_Insert" runat="server" Text='<%# Eval("doctype") %>' Width="360px" Font-Size="10pt"></asp:Label></td>
                            
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 10pt">Status:</span></td>
                        <td style="width: 100px">
                            <asp:Label ID="DocStatusTextBox_Insert" runat=server Text='<%# Eval("DocStatus") %>' Font-Size="10pt" />
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="DocLinkTextBox_Insert" runat="server" ForeColor="#6600CC" Text='<%# Eval("DocLink") %>'
                                Visible="False" Width="360px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span style="text-decoration: underline; font-size: 11pt;">Document Version Info</span><strong>&nbsp;
                            </strong><span style="font-size: 9pt">DocVersID:&nbsp; </span>
                            <asp:Label ID="DocVersIDTextBox_Insert" runat="server" Text='<%# Eval("DocVersID") %>' Font-Bold="False" Font-Size="10pt" Width="61px"></asp:Label><span
                                style="font-size: 9pt"> </span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 10pt">Version:</span></td>
                        <td style="width: 100px">
                            <asp:Label ID="VersionTextBox_Insert" runat="server" Font-Bold="True" Text="New Version" Width="360px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 8pt; color: #009900;"> <span style="color: #006600">Describe changes made in this version:</span> </span></td>
                        <td style="width: 100px">
                            <asp:TextBox ID="ChangesDescTextBox_Insert" runat="server" Text='<%# Bind("ChangesDesc") %>' Width="360px" Font-Size="10pt" Height="40px" ForeColor="#006600"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="A description of changes is required."
                                 ControlToValidate="ChangesDescTextBox_Insert" Text='<%# Eval("ChangesDesc") %>' Width="340px"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 8pt">Date Submitted:</span></td>
                        <td style="width: 100px">
                            <asp:Label ID="DateSubmittedTextBox_Insert" runat="server" Text="pending" Width="360px" Font-Size="10pt"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 10pt"><span style="font-size: 8pt">Uploaded By:</span> </span>
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="UploadedByTextBox_Insert" runat="server" Text="pending" Width="360px" Font-Size="10pt"></asp:Label></td>
                            <asp:Label ID="DocFileNameTextBox_Insert" runat="server" Text='<%# Eval("DocFileName") %>' Visible=false Width="360px" Font-Size="10pt"></asp:Label></tr>
                    <tr>
                        <td style="width: 59px">
                        </td>
                        <td style="width: 100px">
                        </td>
                    </tr>
                </table>

                
                <span style="font-size: 10pt">
                    <span style="color: #006600">
                    Select a file to upload:<br />
                    </span>
                </span>
   
               <asp:FileUpload id="FileUpload1"                  
                   runat="server" Width="460px" ForeColor="#006600" Enabled=true>
               </asp:FileUpload><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="FileUpload1" 
                runat="server" ErrorMessage="A file must be selected."></asp:RequiredFieldValidator>
                <br /><br />
       
                <asp:Label id="FileUploadLabel1"  runat="server" ForeColor="#009900" Width="230px" ></asp:Label>
                <asp:Label ID="FileExtLabel1" runat="server" Visible=false ForeColor="#009900" Width="187px"></asp:Label><br />

                <asp:Button ID="InsertButton" runat="server" 
                    CausesValidation="True" CommandName="Insert"  OnClick="UploadButton_Click"
                    Text="Upload" Font-Size="8pt"></asp:Button>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Button ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel"
                    Text="Cancel" Font-Size="8pt"> </asp:Button>
            </InsertItemTemplate>


            
            <ItemTemplate>
                <span style="font-size: 10pt">&nbsp;</span><br />
                <table style="width: 494px" border="0" bordercolor="#ffffff" cellpadding="1" cellspacing="0">
                    <tr>
                        <td style="height: 10px" colspan="2">
                            <span><span style="text-decoration: underline; font-size: 11pt;">Document Info</span>&nbsp;
                                <span style="font-size: 10pt">DocID: <strong>&nbsp;</strong></span>
                                <asp:Label ID="DocIDLabel" runat="server" Text='<%# Bind("DocID") %>' Font-Size="10pt" Width="70px"></asp:Label>
                                
                                <asp:Label ID="DocStatusIDLabel" runat="server" Text='<%# Eval("DocStatusID") %>' Visible=false Font-Size="10pt" Width="70px"></asp:Label>
                                <asp:Label ID="DocTypeIDLabel" runat="server" Text='<%# Eval("DocTypeID") %>' Visible=false Font-Size="10pt" Width="70px"></asp:Label>
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" Font-Size="8pt" /><span style="font-size: 10pt"><strong></strong></span></span></td>
                    </tr>
                    <tr>
                        <td style="width: 59px; height: 21px;">
                            <span style="font-size: 10pt">Title:</span></td>
                        <td style="width: 100px; height: 21px;">
                            <asp:Label ID="DocTitleLabel" runat="server" Font-Bold="True" Text='<%# Bind("DocTitle") %>' Width="360px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 10pt">Type:</span></td>
                        <td style="width: 100px">
                            <asp:Label ID="doctypeLabel" runat="server" Text='<%# Eval("doctype") %>' Width="360px" Font-Size="10pt"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 10pt">Status:</span></td>
                        <td style="width: 100px">
                            <asp:Label ID="docstatusLabel" runat="server" Text='<%# Eval("docstatus") %>' Width="360px" Font-Size="10pt"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="DocLinkLabel" runat="server" ForeColor="#6600CC" Text='<%# Eval("DocLink") %>'
                                Visible="False" Width="360px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span style="text-decoration: underline; font-size: 11pt;">Document Version Info</span><strong>&nbsp;
                            </strong><span style="font-size: 9pt">DocVersID:&nbsp; </span>
                            <asp:Label ID="DocVersIDLabel" runat="server" Text='<%# Eval("DocVersID") %>' Font-Bold="False" Font-Size="10pt" Width="61px"></asp:Label><span
                                style="font-size: 9pt"> </span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 10pt">Version:</span></td>
                        <td style="width: 100px">
                            <asp:Label ID="VersionLabel" runat="server" Font-Bold="True" Text='<%# Eval("Version") %>' Width="360px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 10pt">Changes in
                                this version:</span></td>
                        <td style="width: 100px">
                            <asp:Label ID="ChangesDescLabel" runat="server" Text='<%# Bind("ChangesDesc") %>' Width="360px" Font-Size="10pt" Height="39px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 8pt">Date Submitted:</span></td>
                        <td style="width: 100px">
                            <asp:Label ID="DateSubmittedLabel" runat="server" Text='<%# Eval("DateSubmitted", "{0:d}") %>' Width="360px" Font-Size="10pt"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 59px">
                            <span style="font-size: 8pt">Uploaded By: </span>
                        </td>
                        <td style="width: 100px">
                            <asp:Label ID="UploadedByLabel" runat="server" Text='<%# Eval("UploadedBy") %>' Width="360px" Font-Size="10pt"></asp:Label></td>
                            <asp:Label ID="DocFileNameLabel" runat="server" Text='<%# Eval("DocFileName") %>' Visible=false Width="360px" Font-Size="10pt"></asp:Label></tr>
                    <tr>
                        <td style="width: 59px">
                        </td>
                        <td style="width: 100px">
                        </td>
                    </tr>
                </table>

                 <asp:Button ID="InsertButton" runat="server" 
                 Text="Upload new version of this document" CommandName="New" 
                 Width="211px" Font-Size="8pt"/>&nbsp;

            </ItemTemplate>
            
            <EmptyDataTemplate>
                <span style="color: #cc0033">
                No Document Version with this ID. </span>
            </EmptyDataTemplate>
            
            
            
        </asp:FormView>
                </td>
                <td style="width: 101px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DocVersID"
            Caption="Other versions of this document:" CaptionAlign="Left" 
            DataSourceID="Sql_Doc_Info_OtherVersions" Font-Names="Arial" Font-Size="9pt" >
            <Columns>
                <asp:HyperLinkField DataTextField="Version" DataNavigateUrlFields="ViewLink"  HeaderText="Version (click to view)" SortExpression="Version" />
                <asp:BoundField DataField="ChangesDesc" HeaderText="Changes in this version" SortExpression="ChangesDesc" >
                    <ControlStyle Width="40px" />
                </asp:BoundField>
                <asp:BoundField DataField="DateSubmitted" HeaderText="DateSubmitted" SortExpression="DateSubmitted" DataFormatString="{0:M/dd/yy}" HtmlEncode="False" />
                
            </Columns>
            <EmptyDataTemplate>
                <span style="color: #cc0033">No other versions of this document have been entered into the system.</span>
            </EmptyDataTemplate>
        </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="width: 101px">
                    <br />
                    <br />
        <asp:GridView ID="GridView2" runat="server" Caption="This document is linked to the following database objects:"
            CaptionAlign="Left" DataSourceID="Sql_EntityInfo" Font-Names="Arial" Font-Size="9pt" 
             Width="342px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" >
            <EmptyDataTemplate>
                <span style="color: #000099">Document not linked to other objects in the database.</span>
            </EmptyDataTemplate>
            <HeaderStyle Font-Bold="False" />
        </asp:GridView>
                </td>
            </tr>
        </table>
        
<div>
        &nbsp;
    &nbsp;<br />
    <br />
       
       <hr />
    &nbsp;
    &nbsp;<asp:Button ID="DisplayDoc_Button" runat="server" BackColor="LightSteelBlue"
        ForeColor="Black" OnClick="DisplayDoc_Button_Click" Text="Display Document" /></div>
        
        <br />
        <asp:Label ID="Label_Error" runat="server" ForeColor="Red"></asp:Label>&nbsp;<br />
        
        
        <asp:PlaceHolder ID="theFrameHolder" runat="server" /> 
        <br />
    
    </div>
        
        
    </form>
</body>
</html>

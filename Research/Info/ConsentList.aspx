<%@ Page Language="c#" Debug="true" MasterPageFile="~/UWAC.master" CodeFile="ConsentList.aspx.cs" AutoEventWireup="true"
 Inherits="Info_ConsentList" Title="Consent List"   EnableEventValidation="false" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

 <asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">


    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>


 
 <br />
 <br />
 <table>
 <tr>
 <td width = "500px">             <asp:Label ID="lblINTRO_studyname" runat="server" Text=" " Font-Size="Medium" Font-Bold="false"></asp:Label>
            <asp:Label ID="lblStudyname_ContentPage" runat="server" Text=" " Font-Size="Medium" Font-Bold="true"></asp:Label></td>

     <td>
         <asp:Button ID="Button1" runat="server" Text="Upload consent forms" PostBackUrl="~/Documents/UploadDocument.aspx" />
     </td>
 </tr>
 </table>



     <br />
     <br />
     <asp:Label ID="Label2" runat="server" Text="List of consent forms and their versions. Click Version # for details." Font-Italic="true" ForeColor="Navy" Font-Size="X-Small" ></asp:Label>
     <asp:GridView ID="gv_consentlist" runat="server" AutoGenerateColumns="false" OnRowDataBound="gv_consentlist_RowDataBound" >
     <Columns>
     
     <asp:TemplateField><HeaderTemplate>cfID</HeaderTemplate>
         <ItemTemplate><asp:Label ID="consentformID" runat="server" ForeColor="Gray" Text='<%#  DataBinder.Eval(Container.DataItem, "[consentformID]") %>'></asp:Label></ItemTemplate></asp:TemplateField>
     <asp:TemplateField><HeaderTemplate>cfvID</HeaderTemplate>
         <ItemTemplate><asp:Label ID="consentformversionID" runat="server" ForeColor="Gray" Text='<%#  DataBinder.Eval(Container.DataItem, "[consentformversionID]") %>'></asp:Label></ItemTemplate></asp:TemplateField>


     <asp:TemplateField><HeaderTemplate>Consent Form</HeaderTemplate>
         <ItemTemplate>
             <asp:Label ID="ConsentFormName" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ConsentFormName]") %>'></asp:Label></ItemTemplate></asp:TemplateField>

     <asp:TemplateField ItemStyle-HorizontalAlign="Center"><HeaderTemplate>Groups</HeaderTemplate>
         <ItemTemplate>
             <asp:Label ID="Groups" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[Groups]") %>'></asp:Label>
         </ItemTemplate></asp:TemplateField>


     <asp:TemplateField ItemStyle-HorizontalAlign="Center"><HeaderTemplate>Version #</HeaderTemplate>
         <ItemTemplate>
             <asp:Label ID="Version" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[Version]") %>'></asp:Label>
         </ItemTemplate></asp:TemplateField>

     <asp:TemplateField ItemStyle-HorizontalAlign="Center"><HeaderTemplate>View Details</HeaderTemplate>
         <ItemTemplate>
             <asp:Button ID="lnkbtn_Details" runat="server" Text="Details" Visible="false" Font-Size="X-Small"
                  OnCommand="lnkbtn_Details_Command" CommandName="details" CommandArgument='<%#  DataBinder.Eval(Container.DataItem, "[consentformversionID]") %>' />
         </ItemTemplate></asp:TemplateField>

     <asp:TemplateField ItemStyle-HorizontalAlign="Center"><HeaderTemplate>Consent Form<br/>Version</HeaderTemplate>
         <ItemTemplate>
             <asp:Label ID="ConsentFormVersionName" runat="server"  Text='<%#  DataBinder.Eval(Container.DataItem, "[ConsentFormVersionName]") %>'></asp:Label>
         </ItemTemplate></asp:TemplateField>

     <asp:TemplateField ItemStyle-HorizontalAlign="Center"><HeaderTemplate>Approved<br />Date</HeaderTemplate>
         <ItemTemplate>
             <asp:Label ID="ApprovedDate" runat="server"  Text='<%#  DataBinder.Eval(Container.DataItem, "[ApprovedDate]","{0:d}") %>'></asp:Label>
         </ItemTemplate></asp:TemplateField>

             <asp:TemplateField ItemStyle-HorizontalAlign="Center"><HeaderTemplate>Effective<br />Date</HeaderTemplate>
         <ItemTemplate>
             <asp:Label ID="EffectiveDate" runat="server"  Text='<%#  DataBinder.Eval(Container.DataItem, "[EffectiveDate]","{0:d}") %>'></asp:Label>
         </ItemTemplate></asp:TemplateField>

              <asp:TemplateField ItemStyle-HorizontalAlign="Center"><HeaderTemplate>Ending<br />Date</HeaderTemplate>
         <ItemTemplate>
             <asp:Label ID="EndingDate" runat="server"  Text='<%#  DataBinder.Eval(Container.DataItem, "[EndingDate]","{0:d}" ) %>'></asp:Label>
         </ItemTemplate></asp:TemplateField>


     <asp:TemplateField ItemStyle-HorizontalAlign="Center"><HeaderTemplate># Items<br />on Consent</HeaderTemplate>
         <ItemTemplate>
             <asp:Label ID="NumItems" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[NumItems]") %>'></asp:Label>
         </ItemTemplate></asp:TemplateField>
     <asp:TemplateField><HeaderTemplate>Reason for Change</HeaderTemplate>
         <ItemTemplate>
             <asp:Label ID="ReasonForChange" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[ReasonForChange]") %>'></asp:Label>

         </ItemTemplate></asp:TemplateField>

     <asp:TemplateField ItemStyle-HorizontalAlign="Center"><HeaderTemplate>Consent<br />Form</HeaderTemplate>
         <ItemTemplate>
             <asp:HyperLink ID="cfv_viewlink" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[cfv_viewlink_label]") %>'  NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "[cfv_viewlink]") %>' Target="_blank"></asp:HyperLink>
<%--             <asp:Button ID="btn_cfv_upload" runat="server" Text="Upload" />--%>
         </ItemTemplate>

     </asp:TemplateField>

     <asp:TemplateField ItemStyle-HorizontalAlign="Center"><HeaderTemplate>Stamped<br />Consent<br />Form</HeaderTemplate><ItemTemplate><asp:HyperLink ID="stamped_cfv_viewlink" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "[stamped_cfv_viewlink_label]") %>'  NavigateUrl='<%#  DataBinder.Eval(Container.DataItem, "[stamped_cfv_viewlink]") %>'  Target="_blank"></asp:HyperLink></ItemTemplate></asp:TemplateField>


              
              </Columns>

     </asp:GridView>

     <br /><br /><br />

     <asp:UpdatePanel ID="panel_details" runat="server" UpdateMode="Conditional">
         <ContentTemplate>

             <asp:Label ID="Label1" runat="server" Text="Consent Form Items:" Font-Bold="true"></asp:Label>
             <asp:Label ID="lbl_cfv" runat="server" Text="" Font-Bold="true"></asp:Label>
             <br />
             <asp:GridView ID="gv_details" runat="server" AutoGenerateColumns="false">
                 <Columns>
                    <asp:TemplateField><HeaderTemplate>cfvID</HeaderTemplate>
                        <ItemTemplate><asp:Label ID="cfvID" runat="server" ForeColor="Gray" Text='<%#  DataBinder.Eval(Container.DataItem, "[cfvID]") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField><HeaderTemplate>cfv_ciID</HeaderTemplate>
                        <ItemTemplate><asp:Label ID="cfv_ciID" runat="server" ForeColor="Gray" Text='<%#  DataBinder.Eval(Container.DataItem, "[cfv_ciID]") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField><HeaderTemplate>default_cioID</HeaderTemplate>
                        <ItemTemplate><asp:Label ID="default_cioID" runat="server" ForeColor="Gray" Text='<%#  DataBinder.Eval(Container.DataItem, "[default cioID]") %>'></asp:Label></ItemTemplate></asp:TemplateField>


                    <asp:TemplateField><HeaderTemplate>Consent Item Text</HeaderTemplate>
                        <ItemTemplate><asp:Label ID="consentitemtext" runat="server" ForeColor="Black" Text='<%#  DataBinder.Eval(Container.DataItem, "[consentitemtext]") %>'></asp:Label></ItemTemplate></asp:TemplateField>

                    <asp:TemplateField><HeaderTemplate>Consent Item Text Long</HeaderTemplate>
                        <ItemTemplate><asp:Label ID="consentitemtext_long" runat="server" ForeColor="Black" Text='<%#  DataBinder.Eval(Container.DataItem, "[consentitemtext_long]") %>'></asp:Label></ItemTemplate></asp:TemplateField>

                    <asp:TemplateField><HeaderTemplate>Defaul tOption</HeaderTemplate>
                        <ItemTemplate><asp:Label ID="DefaultOption" runat="server" ForeColor="Black" Text='<%#  DataBinder.Eval(Container.DataItem, "[DefaultOption]") %>'></asp:Label></ItemTemplate></asp:TemplateField>


                     <asp:TemplateField><HeaderTemplate>Options</HeaderTemplate>
                        <ItemTemplate><asp:Label ID="Options" runat="server" ForeColor="Black" Text='<%#  DataBinder.Eval(Container.DataItem, "[Options]") %>'></asp:Label></ItemTemplate></asp:TemplateField>




                 </Columns>

             </asp:GridView>

         </ContentTemplate>
     </asp:UpdatePanel>




  </asp:Content>
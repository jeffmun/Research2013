<%@ Page Language="C#" Debug="true" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="GeneEvents.aspx.cs" Inherits="Genetics_GeneEvents"
    EnableEventValidation="false" Title="Gene Events" %>
 <%@ MasterType VirtualPath="~/UWAC.master" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server" >

           <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"      >
    </asp:ScriptManager>



  <br />
    <asp:Label ID="lblInfo" runat="server"></asp:Label>
  <br />

    <asp:UpdatePanel ID="UpdatePanel0" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

        <table>
            <tr>
                <td style="vertical-align:top">
                    <asp:Label ID="lblStudy" runat="server" Text="Study" Font-Bold="true" ></asp:Label>
                </td>
                <td style="vertical-align:top">
                    <asp:Label ID="lblMethod" runat="server" Text="Method" Font-Bold="true" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblGene" runat="server" Text="Gene"  Font-Bold="true"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblRegion" runat="server" Text="Region"  Font-Bold="true"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEvent_type" runat="server" Text="Event type"  Font-Bold="true"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblInheritance" runat="server" Text="Inheritance"  Font-Bold="true"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblIncludedFiles" runat="server" Text="Included Files"  Font-Underline="true"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top">    
                    <asp:ListBox ID="lstStudy" runat="server" SelectionMode="Multiple" Font-Size="X-Small" EnableViewState="true" Rows="12" />
                </td>
                <td style="vertical-align:top">    
                    <asp:ListBox ID="lstMethod" runat="server" SelectionMode="Multiple" Font-Size="X-Small" EnableViewState="true" Rows="6"  />
                </td>
                <td style="vertical-align:top">    
                    <asp:ListBox ID="lstGene" runat="server" SelectionMode="Multiple"  Font-Size="X-Small" Rows="12" />
                </td>
                <td style="vertical-align:top">    
                    <asp:ListBox ID="lstRegion" runat="server" SelectionMode="Multiple"  Font-Size="X-Small" Rows="12" />
                </td>
                <td style="vertical-align:top">    
                    <asp:ListBox ID="lstEvent_type" runat="server" SelectionMode="Multiple"  Font-Size="X-Small" Rows="12" />
                </td>
                <td style="vertical-align:top">    
                    <asp:ListBox ID="lstInheritance" runat="server" SelectionMode="Multiple"  Font-Size="X-Small" Rows="12" />
                </td>               
                <td style="vertical-align:top">    
                    <asp:GridView ID="gvFiles" runat="server" AutoGenerateColumns="true"></asp:GridView>
                </td>
                <td>

                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search"  />
        </ContentTemplate>
    </asp:UpdatePanel>

    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            
             <asp:Label ID="lblFileinfo" runat="server" Text=""  Font-Size="X-Small"></asp:Label> <br />
            <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="true" />

            <br />
            <br />
             <asp:Label ID="lblResults" runat="server" Text=""  Font-Size="X-Small"></asp:Label> <br />
            
            <asp:GridView ID="gvGeneEvents" runat="server" AutoGenerateColumns="false"  >
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            View Details
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Button ID="btnDetails" runat="server" Text="Details" OnCommand="btnDetails_Command"  Font-Size="XX-Small"
                                 CommandName="details" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "geneevent_details") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="study"          DataField="studyname"         />
                    <asp:BoundField HeaderText="id"          DataField="id"         />
                    <asp:BoundField HeaderText="id_type"     DataField="id_type"     />
                    <asp:BoundField HeaderText="region"      DataField="region"      />
                    <asp:BoundField HeaderText="chrom"       DataField="chrom"       />
                    <asp:BoundField HeaderText="gene"        DataField="gene"        />
                    <asp:BoundField HeaderText="event_type"  DataField="event_type" />
                    <asp:BoundField HeaderText="inheritance" DataField="inheritance" />


                </Columns>

            </asp:GridView>


        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSearch" />
        </Triggers>
    </asp:UpdatePanel>
    
    </asp:Content>
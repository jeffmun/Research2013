<%@ Page Language="C#"   Debug="true" MasterPageFile="~/UWAC.master" CodeFile="ProcessActigraphy.aspx.cs" AutoEventWireup="true" EnableEventValidation="true"
 Inherits="Data_ProcessActigraphy" Title="Process Actigraphy"      %>   <%--Theme="Skin1" EnableEventValidation="true"--%>
<%@ MasterType VirtualPath="~/UWAC.master" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="headContent" Visible="true">
</asp:Content>


<asp:Content ID="Content1"  ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true"></asp:ScriptManager>


	<br />
	<table>
		<tr>
			<td style="vertical-align:top">
				<dx:ASPxComboBox ID="cboFile" runat="server" Caption="Select file to process:" DataSourceID="sql_actig_files" ValueField="docversid" TextField="id_file"></dx:ASPxComboBox>
				<dx:ASPxComboBox ID="cboTimeptID" runat="server" Caption="Select timepoint of this file:" DataSourceID="sql_actig_timept" ValueField="timepointid" TextField="timepoint_text"></dx:ASPxComboBox>
				<%--<dx:ASPxTextBox ID="txtdocversid" runat="server" Text="1549" Caption="DocversID"></dx:ASPxTextBox> --%>
				<dx:ASPxButton ID="btnProcess" runat="server" Text="Process selected actigraphy file" OnClick="btnProcess_Click"></dx:ASPxButton>
				<br />
				<dx:ASPxLabel ID="lbl" runat="server" EncodeHtml="false" ></dx:ASPxLabel>

			</td>
			<td style="vertical-align:top; padding-left:50px">
				<dx:ASPxButton ID="btnViewFile" runat="server" OnClick="btnViewFile_Click" Text="Open selected file in new tab">
					<ClientSideEvents Click="function(s,e) {document.forms[0].target = '_blank';}" />
				</dx:ASPxButton>
				<br /><br />				
				<dx:ASPxButton ID="btnStats" runat="server" OnClick="btnStats_Click" Text="Display sleep stats for selected file"></dx:ASPxButton>

			</td>
		</tr>
	</table>

	<br /><br />
	<dx:ASPxPanel ID="panel" runat="server">
		<PanelCollection>
			<dx:PanelContent>
			</dx:PanelContent>
		</PanelCollection>
	</dx:ASPxPanel>


		<asp:SqlDataSource ID="sql_actig_files" runat="server" SelectCommandType="Text"  
		SelectCommand="select (case when coalesce(n_act_stats, 0) > 0 then '*DONE*' else '' end) as isdone
			, id, a.docversid, doctitle, (case when coalesce(n_act_stats, 0) > 0 then '*DONE* ' else '' end) + id + '...' + doctitle  id_file 
			from 
			(select docversid, doctitle, entityid from uwautism_research_backend..vwDocVers where doctype='Actiwatch data') a
			join uwautism_research_backend.trk.vwMasterStatus_S b ON a.entityid = b.subjid
			left join 
					(select docversid, count(*) n_act_stats 
					from uwautism_research_data..ALL_Actigraphy_stats group by docversid) c ON a.docversid = c.docversid 
			where studyid = dbo.fnDefaultStudyIDByCurrentUser() order by id"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
	</asp:SqlDataSource>
	

	<asp:SqlDataSource ID="sql_actig_timept" runat="server" SelectCommandType="Text"  
		SelectCommand="select studyname, studyid, timepointid, timepoint_text, count(*) n 
			from uwautism_research_backend..vwStudyMeas where measureID in 
			( select measureid from uwautism_research_backend..tblmeasure where measname like 'actig%')
			and studyid  = dbo.fnDefaultStudyIDByCurrentUser()
			group by studyname, studyid, timepointid, timepoint_text"
		ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>" >
	</asp:SqlDataSource>
	



</asp:Content>





<%@ Page Language="c#" Debug="true" MasterPageFile="../UWAC.master"
    CodeFile="Waitlist_Edit_2.aspx.cs" AutoEventWireup="true" Inherits="Waitlist_Waitlist_Edit_2" Title="Waitlist" %>


<%--EnableEventValidation="false"--%>

<%@ MasterType VirtualPath="../UWAC.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

    <br />

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" EnableViewState="true" ChildrenAsTriggers="true">

        <ContentTemplate>
<hr />
            <table style="vertical-align: top; width: 95%">
                <tr><td>
				 <asp:Label ID="LabelCheckBox1" runat="server" Text="Include Archived Clients in Dropdown List"></asp:Label>
            <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" />
            <br />
            <asp:Label ID="lblDropDownList1" runat="server" Text="Client"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
            <%--                <asp:SqlDataSource ID="SqlDataSource_Waitlist_DDL_1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:waitlistConnectionString %>"
                            SelectCommand="SELECT DISTINCT [LName], [FName], [ClientID] FROM [Clients] 
                            ORDER BY [LName], [FName] "></asp:SqlDataSource>--%>
                        <b></td>
                    <td>
                        <asp:Label ID="lblNewClientFName" runat="server" Text="New Client First Name"></asp:Label>
                        <asp:TextBox ID="TextBoxNewClientFName" AutoPostBack="True" runat="server" OnTextChanged="TextBoxNewClientName_TextChanged" OnDataBinding="TextBoxNewClientName_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblNewClientLName" runat="server" Text="New Client Last Name"></asp:Label>
                        <asp:TextBox ID="TextBoxNewClientLName" AutoPostBack="True" runat="server" OnTextChanged="TextBoxNewClientName_TextChanged" OnDataBinding="TextBoxNewClientName_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnCreateNewClient" runat="server" OnClick="btnCreateNewClient_Click" Text="Create New Client" />
                    </td>
					
					<td>
					    <asp:Label ID="LabelFF" runat="server" Text="Nav. Notes"></asp:Label>
                        <asp:TextBox ID="TextBox70" runat="server" Wrap="True" ></asp:TextBox>
						
					
           	
						
						
					</td>
                </tr>
            </table>

            <hr />







            <table style="text-align: right; width: 95%">

                <tr>
                    <td valign="top" style="min-width:315px">
           
						<b>
                            <asp:Label ID="LabelDemographics" runat="server" Text="Demographics"></asp:Label></b>
                        </b>
                        </br>
                            <asp:Label ID="Label1" runat="server" Text="Contact Date"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <br />

                          
                            <asp:Label ID="Label4" runat="server" Text="Last Name"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label5" runat="server" Text="First Name"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label6" runat="server" Text="Initial"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label7" runat="server" Text="DOB"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label8" runat="server" Text="Age"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label9" runat="server" Text="Gender"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                            <br />


                        <asp:Label ID="Label35" runat="server" Text="Ethnicity"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblEthnicity" runat="server"></asp:TextBox>
                        <br />

                            
                        <asp:Label ID="Label112" runat="server" Text="Primary Language"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblPrimLanguage" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label113" runat="server" Text="Other Languages"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblOtherLanguages" runat="server"></asp:TextBox>
                        <br />


                                                                                <asp:Label ID="Label3" runat="server" Text="Last 4 of SSN"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblLast4SSN" runat="server"></asp:TextBox>
                        <br />

                                                           
                                  


                        <asp:Label ID="Label107" runat="server" Text="Rel. Status"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblPatRelStatus" runat="server"></asp:TextBox>
                        <br />
                        

						                        <b>

						<br />
                            <asp:Label ID="LabelContactInfo" runat="server" Text="Contact Info"></asp:Label></b>
                        <br />
                        
						
                            <asp:Label ID="Label17" runat="server" Text="Home Phone"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                            <br />

                                                                            <asp:Label ID="Label39" runat="server" Text="Home Phone Best Time"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblHomeBestTime" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label42" runat="server" Text="Home OK to Leave Msg"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblhomeOkToLeaveMsg" runat="server"></asp:TextBox>
                        <br />
                      


                            <asp:Label ID="Label18" runat="server" Text="Work Phone"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
                            <br />

                              <asp:Label ID="Label59" runat="server" Text="Work Phone Best Time"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblWorkBestTime" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label60" runat="server" Text="Work OK to Leave Msg"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblWorkOkToLeaveMsg" runat="server"></asp:TextBox>
                        <br />

                            <asp:Label ID="Label19" runat="server" Text="Cell Phone"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
                            <br />

                                                    <asp:Label ID="Label61" runat="server" Text="Cell Phone Best Time"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblCellBestTime" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label62" runat="server" Text="Cell OK to Leave Msg"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblCellOkToLeaveMsg" runat="server"></asp:TextBox>
                        <br />

                            <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                            <br />
                        </b>

                                                <asp:Label ID="Label115" runat="server" Text="OK to Email"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblEmailOK" runat="server"></asp:TextBox>

                        <br />

                        <asp:Label ID="Label13" runat="server" Text="Address"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                        <br />

                        <asp:Label ID="Label114" runat="server" Text="Apt"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <br />

                        <asp:Label ID="Label14" runat="server" Text="City"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label15" runat="server" Text="State"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label16" runat="server" Text="Zip Code"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label116" runat="server" Text="On Call?"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label123" runat="server" Text="When not avail"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox35" runat="server"></asp:TextBox>

					  <br /><br />
                        <b><asp:Label ID="Label121" runat="server" Text="Family Info"></asp:Label></b>
                        &nbsp;
                        <br />

                            <asp:Label ID="Label10" runat="server" Text="Guardian Last Name"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label11" runat="server" Text="Guardian First Name"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label12" runat="server" Text="Guardian Relationship"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                            <br />


                                                    <asp:Label ID="Label36" runat="server" Text="Auth. to Consent"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblAuthorized" runat="server"></asp:TextBox>
                        <br />
						
						<asp:Label ID="Label108" runat="server" Text="Parent Rel. Status"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblParentsDivorced" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label109" runat="server" Text="Custody Type"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblIfYesParentsDiv" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label110" runat="server" Text="Custody Holder"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblIfYesParentName" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label111" runat="server" Text="Resp. Med. Decisions"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblIfYesMedDecisions" runat="server"></asp:TextBox>
                        <br />
                           
 

                                                                 <br />

                        <asp:Label ID="Label22" runat="server" Text="School District" Visible="False"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox22" runat="server" Visible="False"></asp:TextBox>
           

                       

                    </td>

                    <td valign="top" style="min-width:315px">

					

                             <b><asp:Label ID="Label119" runat="server" Text="Guarantor"></asp:Label></b>
                        &nbsp;
                        <br />

                        <asp:Label ID="Label96" runat="server" Text="Guar. Last Name"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblGuarantorLastName" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label97" runat="server" Text="Guar. First Name"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblGuarantorFirstName" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label98" runat="server" Text="Guar. Rel. to Client"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblGuarRelToClient" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label99" runat="server" Text="Guar. Phone"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblGuarPhone" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label100" runat="server" Text="Guar. Address"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblGuarAddress" runat="server"></asp:TextBox>
                        <br />

                                                                    <br />
                        <b><asp:Label ID="Label120" runat="server" Text="Next of Kin"></asp:Label></b>
                        &nbsp;
                        <br />

                        <asp:Label ID="Label102" runat="server" Text="Next of Kin Last Name"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblNOKLastName" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label101" runat="server" Text="Next of Kin First Name"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblNOKFirstName" runat="server"></asp:TextBox>
                        <br />
						

						
                        <asp:Label ID="Label103" runat="server" Text="Rel. to Client"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblNOKRelToClient" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label104" runat="server" Text="Next of Kin Phone"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblNOKPhone" runat="server"></asp:TextBox>
                        <br />

                                               
                        <asp:Label ID="Label28" runat="server" Text="Referral Category" Visible="False"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox28" runat="server" Visible="False"></asp:TextBox>
                        <br />

                      

                                                <b><asp:Label ID="Label122" runat="server" Text="Primary Provider"></asp:Label></b>
                        &nbsp;
                        <br />
  <asp:Label ID="Label20" runat="server" Text="Primary Care Provider"  ></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox20" runat="server"  ></asp:TextBox>
                        <br/>
                        <asp:Label ID="Label21" runat="server" Text="Provider Facility"  ></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox21" runat="server"  ></asp:TextBox>
                        <br/>

                                                <asp:Label ID="Label105" runat="server" Text="Provider Phone"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblPrimProvPhone" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label106" runat="server" Text="Provider Address"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblPrimProvAddr" runat="server"></asp:TextBox>
                        <br /><br />


                    

                        <b><asp:Label ID="Label117" runat="server" Text="Primary Insurance"></asp:Label></b>
                        &nbsp;
                        <br />

                         <asp:Label ID="Label23" runat="server" Text="Primary Insurance"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
                            <br />

                        <asp:Label ID="Label63" runat="server" Text="Benefit Plan Name"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblBenefitPlanName" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label64" runat="server" Text="Subscriber Last Name"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblSubscriberLastName" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label65" runat="server" Text="Subscriber First Name"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblSubscriberFirstName" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label66" runat="server" Text="Sub. DOB"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblSubscriberDOB" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label67" runat="server" Text="Sub. SSN"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblSubscriberSSN" runat="server"></asp:TextBox>
						<br />
                        <asp:Label ID="Label68" runat="server" Text="Patient Rel. to Sub."></asp:Label>
                        &nbsp;<asp:TextBox ID="tblPatientRelToSub" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label70" runat="server" Text="Sub. ID"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblSubID" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label83" runat="server" Text="Group Number"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblGroupNum" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label84" runat="server" Text="Provider Phone"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblProvPhoneNum" runat="server"></asp:TextBox>
                        <br />




                        <asp:Label ID="Label85" runat="server" Text="Insurance Address"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblInsuranceAddress" runat="server"></asp:TextBox>
                        <br />
                     

                                                                        <br />
                        <b><asp:Label ID="Label118" runat="server" Text="Secondary Insurance"></asp:Label></b>
                        &nbsp;
                        <br />


                                                    <asp:Label ID="Label24" runat="server" Text="Secondary Insurance"></asp:Label>
                            &nbsp;<asp:TextBox ID="TextBox24" runat="server"></asp:TextBox>
                            <br />
                        <asp:Label ID="Label86" runat="server" Text="Benefit Plan Name 2"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblBenefitPlanName2" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label87" runat="server" Text="Sub. Last Name 2"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblSubscriberLastName2" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label88" runat="server" Text="Sub. First Name 2"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblSubscriberFirstName2" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label89" runat="server" Text="Sub. DOB 2"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblSubscriberDOB2" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label90" runat="server" Text="Sub. SSN 2"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblSubscriberSSN2" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label91" runat="server" Text="Patient Rel. to Sub. 2"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblPatientRelToSub2" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label92" runat="server" Text="Sub. ID 2"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblSubID2" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label93" runat="server" Text="Group Number 2"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblGroupNum2" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label94" runat="server" Text="Provider Phone 2"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblProvPhoneNum2" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label95" runat="server" Text="Insurance Address 2"></asp:Label>
                        &nbsp;<asp:TextBox ID="tblInsuranceAddress2" runat="server"></asp:TextBox>
                        <br />


                            </td>
                 



                    <td valign="top" style="min-width:315px">

					
					
                     

                        <b>
                            <asp:Label ID="LabelServices" runat="server" Text="Services"></asp:Label></b>
                        <br />

                        <asp:Label ID="Label72" runat="server" Text="Primary Service"></asp:Label>

                        <asp:DropDownList ID="DDL_Service_1" runat="server" width="167" >
                        </asp:DropDownList>


                        <br />
                        <asp:Label ID="Label73" runat="server" Text="Status"></asp:Label>
                        <asp:DropDownList ID="DDL_Status_1" runat="server" width="167" >
                        </asp:DropDownList>

                        <br />

                        <asp:Label ID="Label74" runat="server" Text="Secondary Service"></asp:Label>
                        <asp:DropDownList ID="DDL_Service_2" runat="server" width="167">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label75" runat="server" Text="Status"></asp:Label>
                        <asp:DropDownList ID="DDL_Status_2" runat="server" width="167">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label76" runat="server" Text="3rd Service"></asp:Label>
                        <asp:DropDownList ID="DDL_Service_3" runat="server" width="167">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label77" runat="server" Text="Status"></asp:Label>
                        <asp:DropDownList ID="DDL_Status_3" runat="server" width="167">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label78" runat="server" Text="4th Service"></asp:Label>
                        <asp:DropDownList ID="DDL_Service_4" runat="server" width="167">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label79" runat="server" Text="Status"></asp:Label>
                        <asp:DropDownList ID="DDL_Status_4" runat="server" width="167">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label80" runat="server" Text="5th Service"></asp:Label>
                        <asp:DropDownList ID="DDL_Service_5" runat="server" width="167">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label81" runat="server" Text="Status"></asp:Label>
                        <asp:DropDownList ID="DDL_Status_5" runat="server" width="167">
                        </asp:DropDownList>

                        <br /><br /><br />
					
					                        <b>
                         <asp:Label ID="LabelRefer" runat="server" Text="Referral"></asp:Label></b>
                        <br />
					    <asp:Label ID="Label57" runat="server" Text="Referral Source" ></asp:Label>
                        <asp:TextBox ID="TextBox57" runat="server" Visible="false" ></asp:TextBox>
						
						<asp:TextBox ID="tblWhoReferred" runat="server" ></asp:TextBox>
					




					<br/> 

                                     <asp:Label ID="Label82" runat="server" Text="Dummy Label" Visible="False"></asp:Label>
 

        <%--                <br />
                        <b><asp:Label ID="LabelDiagnoses" runat="server" Text="Diagnoses" Visible="True"></asp:Label></b>--%>
                        <!--<br />-->
                        
                                           
                        <asp:Label ID="Label52" runat="server" Text="Autism Diagnosis" Visible="True"></asp:Label>
                         <asp:TextBox ID="TextBox52" runat="server" Visible="True"></asp:TextBox>
                        <!--<br />-->
                        <asp:Label ID="Label53" runat="server" Text="Diagnosis" Visible="False"></asp:Label>
                        <asp:TextBox ID="TextBox53" runat="server" Visible="False"></asp:TextBox>
                        <!--<br />-->
                        <asp:Label ID="Label54" runat="server" Text="Diagnosis" Visible="False"></asp:Label>
                        <asp:TextBox ID="TextBox54" runat="server" Visible="False"></asp:TextBox>
                        <!--<br />-->
                             <br />
                        <asp:Label ID="Label55" runat="server" Text="Diagnosed By" Visible="True"></asp:Label>
                         <asp:TextBox ID="TextBox55" runat="server" Visible="True"></asp:TextBox>
                        <!--<br />-->
                        <asp:Label ID="Label56" runat="server" Text="Position" Visible="False"></asp:Label>
                         <asp:TextBox ID="TextBox56" runat="server" Visible="False"></asp:TextBox>
                        <!--<br />-->

                        <!--<br />-->
                        <asp:Label ID="Label58" runat="server" Text="Referral Position" Visible="False"></asp:Label>
                         <asp:TextBox ID="TextBox58" runat="server" Visible="False"></asp:TextBox>
                        <!--<br />-->
                        <!--<br />-->

                        		<br/> <br/> <br />
					
                        <b>
                            <asp:Label ID="LabelIntake" runat="server" Text="Intake"></asp:Label></b>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="ID"></asp:Label>
                        &nbsp;
                <asp:TextBox ID="TextBox2" runat="server" Enabled="false"></asp:TextBox>

                        <br />
                        <asp:Label ID="Label26" runat="server" Text="Intake Staff"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label27" runat="server" Text="Site Requested"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox27" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label29" runat="server" Text="Intake Packet Mailed"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox29" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label30" runat="server" Text="Intake Packet Returned"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox30" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label46" runat="server" Text="Chart Type"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox46" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label37" runat="server" Text="Interest Checked"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox37" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label38" runat="server" Text="2nd Interest Check"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox38" runat="server"></asp:TextBox>
                        <br />

                        <br /><br />

                        <b>
                            <asp:Label ID="LabelScheduling" runat="server" Text="Scheduling"></asp:Label></b>
                        <!--<br />-->

                        <asp:Label ID="Label31" runat="server" Text="Chart Email Sent" Visible="False"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox31" runat="server" Visible="False"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label32" runat="server" Text="Pre-Auth Email Sent"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox32" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label33" runat="server" Text="Pre-Auth Given"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox33" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label34" runat="server" Text="Billing Consult. Complete"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox34" runat="server"></asp:TextBox>
                        <br />
                        
                        <asp:Label ID="Label40" runat="server" Text="Schedule Attempt 1"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox40" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label41" runat="server" Text="Schedule Attempt 2"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox41" runat="server"></asp:TextBox>
                        <br />
                        

                        <asp:Label ID="Label44" runat="server" Text="Scheduling Packet Sent"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox44" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label47" runat="server" Text="Scheduled With"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox47" runat="server"></asp:TextBox>
                        <br />

                        <asp:Label ID="Label45" runat="server" Text="First Appointment"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox45" runat="server"></asp:TextBox>
                        <br />

                        <asp:Label ID="Label43" runat="server" Text="Scheduled w/ Family"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox43" runat="server"></asp:TextBox>
                        <br />
                        <br /><br />
                        
 <b>
                            <asp:Label ID="Label25" runat="server" Text="Archive"></asp:Label></b>
                        &nbsp;
                <%-- <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox> --%>
                        <asp:CheckBox ID="CheckBox25" runat="server" />
                        <br />
                        <asp:Label ID="Label48" runat="server" Text="Archive Reasons"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox48" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label49" runat="server" Text="Archive Date"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox49" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label50" runat="server" Text="Archive Staff"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox50" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label51" runat="server" Text="Purge Records"></asp:Label>
                        &nbsp;<asp:TextBox ID="TextBox51" runat="server" OnTextChanged="TextBox51_TextChanged"></asp:TextBox>
                        <br />

           
</td></tr></table>
            <table style="text-align: right; width: 95%"><tr><td>

                          <asp:Label ID="Label69" runat="server" Text="Initial Comment"></asp:Label></b>
                        &nbsp;<asp:TextBox ID="TextBox69" runat="server" Wrap="True" Rows="10" TextMode="multiline" Height="200px" Width = "540px" ></asp:TextBox>
                        


						</td><td>
                                             <asp:Label ID="Label71" runat="server" Text="Scheduling Comment"></asp:Label></b>
                        &nbsp;<asp:TextBox ID="TextBox71" runat="server" Wrap="True" Rows="10" TextMode="multiline" Height="200px" Width = "540px" ></asp:TextBox>
                        <br />
</td>
                </tr>
                <tr>
                    <td>
                           <asp:Button ID="btnSaveChanges" runat="server" Visible="True" Text="Save Changes" OnClick="btnSaveChanges_Click"  Height="46px" Width="284px" />




                    </td>
                </tr>
            </table>
            <br />
            
                    
                      
                    <%--
                      <asp:Label ID="LabelFF" runat="server" visible="False" Text="Follow-Up Comment"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox70" runat="server" visible="False" Wrap="True" Rows="10" TextMode="multiline" Height="44px" Width="148px"></asp:TextBox>--%>
              
                        
       
                    









        </ContentTemplate>

        <Triggers>

            <asp:AsyncPostBackTrigger ControlID="CheckBox1" EventName="CheckedChanged" />

            <asp:PostBackTrigger ControlID="DropDownList1" />
            <asp:PostBackTrigger ControlID="DDL_Service_1" />
            <asp:PostBackTrigger ControlID="DDL_Status_1" />
            <asp:PostBackTrigger ControlID="btnSaveChanges" />
			   <asp:PostBackTrigger ControlID="btnCreateNewClient" />

        </Triggers>

    </asp:UpdatePanel>





    <%-- <br />
    <hr />


    <asp:GridView ID="GridView1" runat="server" AllowSorting="True"
        AutoGenerateColumns="False" DataSourceID="SqlDataSource5" ShowFooter="True"
        OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:CheckBoxField DataField="Archive" HeaderText="Archive" SortExpression="Archive" />
            <asp:BoundField DataField="Site" HeaderText="Site" SortExpression="Site" />
            <asp:BoundField DataField="SvcReq" HeaderText="SvcReq" SortExpression="SvcReq" />
            <asp:BoundField DataField="SvcStatus" HeaderText="SvcStatus" SortExpression="SvcStatus" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
            <asp:BoundField DataField="SvcReq2" HeaderText="SvcReq2" SortExpression="SvcReq2" />
            <asp:BoundField DataField="Ins" HeaderText="Ins" SortExpression="Ins" />
            <asp:BoundField DataField="InfoRtn" HeaderText="InfoRtn" SortExpression="InfoRtn" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:waitlistConnectionString %>" 
        SelectCommand="SELECT DISTINCT * FROM [vw_getWaitlist] 
        WHERE (([Site] IS NOT NULL) 
        AND ([SvcStatus] NOT LIKE '%' + @SvcStatus + '%')) 
        ORDER BY [Site], [SvcReq], [SvcStatus]">
        <SelectParameters>
            <asp:Parameter DefaultValue="No Paperwork" Name="SvcStatus" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>--%>
</asp:Content>


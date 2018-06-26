<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="IBQ_R Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">
<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_IBQ_R" >
</def:dataentrycontroller>
<def:datafieldcontrol runat="server" id="id" DatabaseField="id"  IsInsertField="true"   FieldLabelWidth="250px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum"  IsInsertField="true"   FieldLabelWidth="250px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="DateAdministered" DatabaseField="IBQRDate"  IsInsertField="true"  FieldLabelWidth="250px "></def:datafieldcontrol>
<asp:panel id="mainPanel" runat="server">
<br />
<table cellspacing="0" cellpadding="5" border="1">
    <tr>
        <td align="center"><strong>1</strong></td>
        <td align="center"><strong>2</strong></td>
        <td align="center"><strong>3</strong></td>
        <td align="center"><strong>4</strong></td>
        <td align="center"><strong>5</strong></td>
        <td align="center"><strong>6</strong></td>
        <td align="center"><strong>7</strong></td>
        <td align="center"><strong>0</strong></td>
        <td align="center"><strong>-9</strong></td>
    </tr>
    <tr>
        <td align="center">Never</td>
        <td align="center">Very Rarely</td>
        <td align="center">Less Than Half the Time</td>
        <td align="center">About Half the Time</td>
        <td align="center">More Than Half the Time</td>
        <td align="center">Almost Always</td>
        <td align="center">Always</td>
        <td align="center">Does Not Apply</td>
        <td align="center">Missing Value</td>
    </tr>
</table>
<h3>Feeding</h3>
<strong>During feeding, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRFe001" DatabaseField="IBQRFe001"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRFe002" DatabaseField="IBQRFe002"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRFe003" DatabaseField="IBQRFe003"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRFe004" DatabaseField="IBQRFe004"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>In the last week, while being fed in your lap, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRFe005" DatabaseField="IBQRFe005"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRFe006" DatabaseField="IBQRFe006"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRFe007" DatabaseField="IBQRFe007"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>How often did your baby make talking sounds:</strong>
<def:datafieldcontrol runat="server" id="IBQRFe008" DatabaseField="IBQRFe008"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRFe009" DatabaseField="IBQRFe009"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRFe010" DatabaseField="IBQRFe010"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />
<table cellspacing="0" cellpadding="5" border="1">
    <tr>
        <td align="center"><strong>1</strong></td>
        <td align="center"><strong>2</strong></td>
        <td align="center"><strong>3</strong></td>
        <td align="center"><strong>4</strong></td>
        <td align="center"><strong>5</strong></td>
        <td align="center"><strong>6</strong></td>
        <td align="center"><strong>7</strong></td>
        <td align="center"><strong>0</strong></td>
        <td align="center"><strong>-9</strong></td>
    </tr>
    <tr>
        <td align="center">Never</td>
        <td align="center">Very Rarely</td>
        <td align="center">Less Than Half the Time</td>
        <td align="center">About Half the Time</td>
        <td align="center">More Than Half the Time</td>
        <td align="center">Almost Always</td>
        <td align="center">Always</td>
        <td align="center">Does Not Apply</td>
        <td align="center">Missing Value</td>
    </tr>
</table>
<h3>Sleeping</h3>
<strong>Before falling asleep at night during the last week, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRSl011" DatabaseField="IBQRSl011"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>During sleep, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRSl012" DatabaseField="IBQRSl012"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSl013" DatabaseField="IBQRSl013"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSl014" DatabaseField="IBQRSl014"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>After sleeping, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRSl015" DatabaseField="IBQRSl015"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSl016" DatabaseField="IBQRSl016"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSl017" DatabaseField="IBQRSl017"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>How often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRSl018" DatabaseField="IBQRSl018"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSl019" DatabaseField="IBQRSl019"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSl020" DatabaseField="IBQRSl020"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When going to sleep at night, how often did your baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRSl021" DatabaseField="IBQRSl021"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSl022" DatabaseField="IBQRSl022"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSl023" DatabaseField="IBQRSl023"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When your baby awoke at night, how often did s/he:</strong>
<def:datafieldcontrol runat="server" id="IBQRSl024" DatabaseField="IBQRSl024"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSl025" DatabaseField="IBQRSl025"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When put down for a nap, how often did your baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRSl026" DatabaseField="IBQRSl026"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSl027" DatabaseField="IBQRSl027"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSl028" DatabaseField="IBQRSl028"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSl029" DatabaseField="IBQRSl029"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When it was time for bed or a nap and your baby did not want to go, how often did s/he:</strong>
<def:datafieldcontrol runat="server" id="IBQRSl030" DatabaseField="IBQRSl030"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSl031" DatabaseField="IBQRSl031"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />
<table cellspacing="0" cellpadding="5" border="1">
    <tr>
        <td align="center"><strong>1</strong></td>
        <td align="center"><strong>2</strong></td>
        <td align="center"><strong>3</strong></td>
        <td align="center"><strong>4</strong></td>
        <td align="center"><strong>5</strong></td>
        <td align="center"><strong>6</strong></td>
        <td align="center"><strong>7</strong></td>
        <td align="center"><strong>0</strong></td>
        <td align="center"><strong>-9</strong></td>
    </tr>
    <tr>
        <td align="center">Never</td>
        <td align="center">Very Rarely</td>
        <td align="center">Less Than Half the Time</td>
        <td align="center">About Half the Time</td>
        <td align="center">More Than Half the Time</td>
        <td align="center">Almost Always</td>
        <td align="center">Always</td>
        <td align="center">Does Not Apply</td>
        <td align="center">Missing Value</td>
    </tr>
</table>
<h3>Bathing and Dressing</h3>
<strong>When being dressed or undressed during the last week, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRBa032" DatabaseField="IBQRBa032"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRBa033" DatabaseField="IBQRBa033"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRBa034" DatabaseField="IBQRBa034"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRBa035" DatabaseField="IBQRBa035"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When put into the bath water, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRBa036" DatabaseField="IBQRBa036"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRBa037" DatabaseField="IBQRBa037"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRBa038" DatabaseField="IBQRBa038"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRBa039" DatabaseField="IBQRBa039"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When face was washed, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRBa040" DatabaseField="IBQRBa040"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRBa041" DatabaseField="IBQRBa041"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRBa042" DatabaseField="IBQRBa042"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When hair was washed, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRBa043" DatabaseField="IBQRBa043"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRBa044" DatabaseField="IBQRBa044"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRBa045" DatabaseField="IBQRBa045"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />
<table cellspacing="0" cellpadding="5" border="1">
    <tr>
        <td align="center"><strong>1</strong></td>
        <td align="center"><strong>2</strong></td>
        <td align="center"><strong>3</strong></td>
        <td align="center"><strong>4</strong></td>
        <td align="center"><strong>5</strong></td>
        <td align="center"><strong>6</strong></td>
        <td align="center"><strong>7</strong></td>
        <td align="center"><strong>0</strong></td>
        <td align="center"><strong>-9</strong></td>
    </tr>
    <tr>
        <td align="center">Never</td>
        <td align="center">Very Rarely</td>
        <td align="center">Less Than Half the Time</td>
        <td align="center">About Half the Time</td>
        <td align="center">More Than Half the Time</td>
        <td align="center">Almost Always</td>
        <td align="center">Always</td>
        <td align="center">Does Not Apply</td>
        <td align="center">Missing Value</td>
    </tr>
</table>
<h3>Play</h3>
<strong>How often during the last week did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRPl046" DatabaseField="IBQRPl046"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl047" DatabaseField="IBQRPl047"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl048" DatabaseField="IBQRPl048"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl049" DatabaseField="IBQRPl049"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl050" DatabaseField="IBQRPl050"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl051" DatabaseField="IBQRPl051"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl052" DatabaseField="IBQRPl052"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl053" DatabaseField="IBQRPl053"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl054" DatabaseField="IBQRPl054"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl055" DatabaseField="IBQRPl055"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl056" DatabaseField="IBQRPl056"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl057" DatabaseField="IBQRPl057"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl058" DatabaseField="IBQRPl058"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>How often during the last week did the baby enjoy:</strong>
<def:datafieldcontrol runat="server" id="IBQRPl059" DatabaseField="IBQRPl059"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl060" DatabaseField="IBQRPl060"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl061" DatabaseField="IBQRPl061"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl062" DatabaseField="IBQRPl062"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl063" DatabaseField="IBQRPl063"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl064" DatabaseField="IBQRPl064"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl065" DatabaseField="IBQRPl065"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl066" DatabaseField="IBQRPl066"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl067" DatabaseField="IBQRPl067"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl068" DatabaseField="IBQRPl068"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl069" DatabaseField="IBQRPl069"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl070" DatabaseField="IBQRPl070"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl071" DatabaseField="IBQRPl071"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When playing quietly with one of his/her favorite toys, how often did your baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRPl072" DatabaseField="IBQRPl072"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl073" DatabaseField="IBQRPl073"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl074" DatabaseField="IBQRPl074"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When something the baby was playing with had to be removed, how often did s/he:</strong>
<def:datafieldcontrol runat="server" id="IBQRPl075" DatabaseField="IBQRPl075"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl076" DatabaseField="IBQRPl076"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When tossed around playfully how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRPl077" DatabaseField="IBQRPl077"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl078" DatabaseField="IBQRPl078"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>During a peekaboo game, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRPl079" DatabaseField="IBQRPl079"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl080" DatabaseField="IBQRPl080"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>How often did your baby enjoy bouncing up and down:</strong>
<def:datafieldcontrol runat="server" id="IBQRPl081" DatabaseField="IBQRPl081"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl082" DatabaseField="IBQRPl082"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>How often did the infant look up from playing:</strong>
<def:datafieldcontrol runat="server" id="IBQRPl083" DatabaseField="IBQRPl083"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl084" DatabaseField="IBQRPl084"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When your baby saw a toy s/he wanted, how often did s/he:</strong>
<def:datafieldcontrol runat="server" id="IBQRPl085" DatabaseField="IBQRPl085"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl086" DatabaseField="IBQRPl086"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When given a new toy, how often did your baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRPl087" DatabaseField="IBQRPl087"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl088" DatabaseField="IBQRPl088"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRPl089" DatabaseField="IBQRPl089"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />
<table cellspacing="0" cellpadding="5" border="1">
    <tr>
        <td align="center"><strong>1</strong></td>
        <td align="center"><strong>2</strong></td>
        <td align="center"><strong>3</strong></td>
        <td align="center"><strong>4</strong></td>
        <td align="center"><strong>5</strong></td>
        <td align="center"><strong>6</strong></td>
        <td align="center"><strong>7</strong></td>
        <td align="center"><strong>0</strong></td>
        <td align="center"><strong>-9</strong></td>
    </tr>
    <tr>
        <td align="center">Never</td>
        <td align="center">Very Rarely</td>
        <td align="center">Less Than Half the Time</td>
        <td align="center">About Half the Time</td>
        <td align="center">More Than Half the Time</td>
        <td align="center">Almost Always</td>
        <td align="center">Always</td>
        <td align="center">Does Not Apply</td>
        <td align="center">Missing Value</td>
    </tr>
</table>
<h3>Daily Activities</h3>
<strong>How often during the last week did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa090" DatabaseField="IBQRDa090"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa091" DatabaseField="IBQRDa091"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa092" DatabaseField="IBQRDa092"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa093" DatabaseField="IBQRDa093"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa094" DatabaseField="IBQRDa094"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa095" DatabaseField="IBQRDa095"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa096" DatabaseField="IBQRDa096"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa097" DatabaseField="IBQRDa097"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa098" DatabaseField="IBQRDa098"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa099" DatabaseField="IBQRDa099"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa100" DatabaseField="IBQRDa100"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa101" DatabaseField="IBQRDa101"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa102" DatabaseField="IBQRDa102"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa103" DatabaseField="IBQRDa103"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa104" DatabaseField="IBQRDa104"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When being held, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa105" DatabaseField="IBQRDa105"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa106" DatabaseField="IBQRDa106"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa107" DatabaseField="IBQRDa107"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa108" DatabaseField="IBQRDa108"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When placed on his/her back, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa109" DatabaseField="IBQRDa109"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa110" DatabaseField="IBQRDa110"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa111" DatabaseField="IBQRDa111"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa112" DatabaseField="IBQRDa112"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When the baby wanted something, how often did s/he:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa113" DatabaseField="IBQRDa113"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa114" DatabaseField="IBQRDa114"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When placed in an infant seat or car seat, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa115" DatabaseField="IBQRDa115"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa116" DatabaseField="IBQRDa116"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa117" DatabaseField="IBQRDa117"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa118" DatabaseField="IBQRDa118"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When frustrated with something, how often did your baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa119" DatabaseField="IBQRDa119"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When your baby was upset about something, how often did s/he:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa120" DatabaseField="IBQRDa120"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa121" DatabaseField="IBQRDa121"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa122" DatabaseField="IBQRDa122"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When rocked or hugged, in the last week, how often did your baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa123" DatabaseField="IBQRDa123"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa124" DatabaseField="IBQRDa124"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa125" DatabaseField="IBQRDa125"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When reunited after having been away during the last week how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa126" DatabaseField="IBQRDa126"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa127" DatabaseField="IBQRDa127"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa128" DatabaseField="IBQRDa128"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When being carried, in the last week, how often did your baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa129" DatabaseField="IBQRDa129"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa130" DatabaseField="IBQRDa130"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>While sitting in your lap:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa131" DatabaseField="IBQRDa131"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa132" DatabaseField="IBQRDa132"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>How often did your baby notice:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa133" DatabaseField="IBQRDa133"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa134" DatabaseField="IBQRDa134"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa135" DatabaseField="IBQRDa135"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa136" DatabaseField="IBQRDa136"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa137" DatabaseField="IBQRDa137"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa138" DatabaseField="IBQRDa138"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa139" DatabaseField="IBQRDa139"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When tired, how often was your baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa140" DatabaseField="IBQRDa140"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa141" DatabaseField="IBQRDa141"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>At the end of an exciting day, how often did your baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa142" DatabaseField="IBQRDa142"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa143" DatabaseField="IBQRDa143"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>For no apparent reason, how often did your baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa144" DatabaseField="IBQRDa144"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa145" DatabaseField="IBQRDa145"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>How often did your baby make talking sounds when:</strong>
<def:datafieldcontrol runat="server" id="IBQRDa146" DatabaseField="IBQRDa146"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa147" DatabaseField="IBQRDa147"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRDa148" DatabaseField="IBQRDa148"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />
<table cellspacing="0" cellpadding="5" border="1">
    <tr>
        <td align="center"><strong>1</strong></td>
        <td align="center"><strong>2</strong></td>
        <td align="center"><strong>3</strong></td>
        <td align="center"><strong>4</strong></td>
        <td align="center"><strong>5</strong></td>
        <td align="center"><strong>6</strong></td>
        <td align="center"><strong>7</strong></td>
        <td align="center"><strong>0</strong></td>
        <td align="center"><strong>-9</strong></td>
    </tr>
    <tr>
        <td align="center">Never</td>
        <td align="center">Very Rarely</td>
        <td align="center">Less Than Half the Time</td>
        <td align="center">About Half the Time</td>
        <td align="center">More Than Half the Time</td>
        <td align="center">Almost Always</td>
        <td align="center">Always</td>
        <td align="center">Does Not Apply</td>
        <td align="center">Missing Value</td>
    </tr>
</table>
<h3>Two Week Time Span</h3>
<strong>When you returned from having been away and the baby was awake, how often did s/he:</strong>
<def:datafieldcontrol runat="server" id="IBQRTw149" DatabaseField="IBQRTw149"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When introduced to an unfamiliar adult, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRTw150" DatabaseField="IBQRTw150"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRTw151" DatabaseField="IBQRTw151"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRTw152" DatabaseField="IBQRTw152"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRTw153" DatabaseField="IBQRTw153"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When in the presence of several unfamiliar adults, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRTw154" DatabaseField="IBQRTw154"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRTw155" DatabaseField="IBQRTw155"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRTw156" DatabaseField="IBQRTw156"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When visiting a new place, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRTw157" DatabaseField="IBQRTw157"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRTw158" DatabaseField="IBQRTw158"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRTw159" DatabaseField="IBQRTw159"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRTw160" DatabaseField="IBQRTw160"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When your baby was approached by an unfamiliar person when you and s/he were out, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRTw161" DatabaseField="IBQRTw161"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRTw162" DatabaseField="IBQRTw162"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When an unfamiliar adult came to your home or apartment, how often did your baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRTw163" DatabaseField="IBQRTw163"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRTw164" DatabaseField="IBQRTw164"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When in a crowd of people, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRTw165" DatabaseField="IBQRTw165"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>Did the baby seem sad when:</strong>
<def:datafieldcontrol runat="server" id="IBQRTw166" DatabaseField="IBQRTw166"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRTw167" DatabaseField="IBQRTw167"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When you were busy with another activity, and your baby was not able to get your attention, how often did s/he:</strong>
<def:datafieldcontrol runat="server" id="IBQRTw168" DatabaseField="IBQRTw168"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRTw169" DatabaseField="IBQRTw169"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When your baby saw another baby crying, how often did s/he:</strong>
<def:datafieldcontrol runat="server" id="IBQRTw170" DatabaseField="IBQRTw170"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRTw171" DatabaseField="IBQRTw171"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When familiar relatives/friends came to visit, how often did your baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRTw172" DatabaseField="IBQRTw172"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRTw173" DatabaseField="IBQRTw173"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<br />
<table cellspacing="0" cellpadding="5" border="1">
    <tr>
        <td align="center"><strong>1</strong></td>
        <td align="center"><strong>2</strong></td>
        <td align="center"><strong>3</strong></td>
        <td align="center"><strong>4</strong></td>
        <td align="center"><strong>5</strong></td>
        <td align="center"><strong>6</strong></td>
        <td align="center"><strong>7</strong></td>
        <td align="center"><strong>0</strong></td>
        <td align="center"><strong>-9</strong></td>
    </tr>
    <tr>
        <td align="center">Never</td>
        <td align="center">Very Rarely</td>
        <td align="center">Less Than Half the Time</td>
        <td align="center">About Half the Time</td>
        <td align="center">More Than Half the Time</td>
        <td align="center">Almost Always</td>
        <td align="center">Always</td>
        <td align="center">Does Not Apply</td>
        <td align="center">Missing Value</td>
    </tr>
</table>
<h3>Soothing Techniques</h3>
<strong>When rocking your baby, how often did s/he:</strong>
<def:datafieldcontrol runat="server" id="IBQRSo174" DatabaseField="IBQRSo174"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSo175" DatabaseField="IBQRSo175"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSo176" DatabaseField="IBQRSo176"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When singing or talking to your baby, how often did s/he:</strong>
<def:datafieldcontrol runat="server" id="IBQRSo177" DatabaseField="IBQRSo177"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSo178" DatabaseField="IBQRSo178"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSo179" DatabaseField="IBQRSo179"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When walking with the baby, how often did s/he:</strong>
<def:datafieldcontrol runat="server" id="IBQRSo180" DatabaseField="IBQRSo180"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSo181" DatabaseField="IBQRSo181"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSo182" DatabaseField="IBQRSo182"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When giving him/her a toy, how often did the baby:</strong>
<def:datafieldcontrol runat="server" id="IBQRSo183" DatabaseField="IBQRSo183"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSo184" DatabaseField="IBQRSo184"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSo185" DatabaseField="IBQRSo185"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When showing the baby something to look at, how often did s/he:</strong>
<def:datafieldcontrol runat="server" id="IBQRSo186" DatabaseField="IBQRSo186"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSo187" DatabaseField="IBQRSo187"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSo188" DatabaseField="IBQRSo188"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<strong>When patting or gently rubbing some part of the baby's body, how often did s/he:</strong>
<def:datafieldcontrol runat="server" id="IBQRSo189" DatabaseField="IBQRSo189"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSo190" DatabaseField="IBQRSo190"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="IBQRSo191" DatabaseField="IBQRSo191"  IsEntryField="true" IsDoubleEntryField="true"   FieldLabelWidth="250px" FieldTextBoxWidth="30px"></def:datafieldcontrol>
</asp:panel>
<br />
<def:datafieldcontrol runat="server" id="created" DatabaseField="created"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="250px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="250px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updated" DatabaseField="updated"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="250px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="250px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scored" DatabaseField="scored"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="250px "></def:datafieldcontrol>
<def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy"  IsReadOnly="true" RenderReadOnlyAsDiv="true"   FieldLabelWidth="250px "></def:datafieldcontrol>
</asp:Content>

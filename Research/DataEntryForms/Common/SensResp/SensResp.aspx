<%@ Register TagPrefix="def" Namespace="DataEntryFramework3" %> 
<%@ Page language="c#" MasterPageFile="~/UWAC.master"  Title="SensResp Data Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="server">

<def:dataentrycontroller id="DataEntryController1" runat="server" DatabaseTable="ALL_SensResp" >
</def:dataentrycontroller>
<div class="main">
  <def:datafieldcontrol runat="server" id="id" DatabaseField="id" IsInsertField="true" FieldLabelWidth="300px" FieldTextBoxMaxLength="15"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="indexnum" DatabaseField="indexnum" IsInsertField="true" FieldTextBoxTextDefault="1" FieldLabelWidth="300px" FieldTextBoxWidth="40px"></def:datafieldcontrol>
</div>
<asp:panel id="mainPanel" CssClass="mainPanel" runat="server">
<div class="main">
  <def:datafieldcontrol runat="server" id="SENSdate" DatabaseField="SENSdate" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="300px"></def:datafieldcontrol>
</div>

<h4>Visual Spatial Processing</h4>
<div class="collection">
  <div class="main">
    <div class="collection">
      <div class="label">1. Blink at bright lights or seem irritated or fatigued by them?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA01" DatabaseField="SENSPA01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR01" DatabaseField="SENSPR01" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">2. Become easily distracted by visual stimulation?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA02" DatabaseField="SENSPA02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR02" DatabaseField="SENSPR02" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">3. Avoid or have difficulty with eye contact?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA03" DatabaseField="SENSPA03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR03" DatabaseField="SENSPR03" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">4. Have difficulty doing puzzles?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA04" DatabaseField="SENSPA04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR04" DatabaseField="SENSPR04" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">5. Have difficulty finding a familiar face in the crowd?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA05" DatabaseField="SENSPA05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR05" DatabaseField="SENSPR05" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">6. Have difficulty following street signs when driving?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA06" DatabaseField="SENSPA06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>      
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR06" DatabaseField="SENSPR06" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SENSPA01" runat="server"  DatabaseField="SENSPA01"></def:ValueSetLabel></div>
</div>
<h4>Auditory and Language Processing</h4>
<div class="collection">
  <div class="main">
    <div class="collection">
      <div class="label">7. Seem overly sensitive to sounds?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA07" DatabaseField="SENSPA07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR07" DatabaseField="SENSPR07" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">8. Become distracted by lots of noise?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA08" DatabaseField="SENSPA08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR08" DatabaseField="SENSPR08" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">9. Become distracted by background noises such as refrigerators?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA09" DatabaseField="SENSPA09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR09" DatabaseField="SENSPR09" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">10. Have difficulty completing tasks when the radio is on?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA10" DatabaseField="SENSPA10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR10" DatabaseField="SENSPR10" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SENSPA07" runat="server"  DatabaseField="SENSPA07"></def:ValueSetLabel></div>
</div>
<h4>Taste and Smell</h4>
<div class="collection">
  <div class="main">
    <div class="collection">
      <div class="label">11. React defensively to the taste and textures of foods?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA11" DatabaseField="SENSPA11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR11" DatabaseField="SENSPR11" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">12. Lick, chew, or suck on non-food items?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA12" DatabaseField="SENSPA12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR12" DatabaseField="SENSPR12" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">13. Tend to explore with smell, deliberately smell objects?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA13" DatabaseField="SENSPA13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR13" DatabaseField="SENSPR13" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">14. Prefer smooth foods?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA14" DatabaseField="SENSPA14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR14" DatabaseField="SENSPR14" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">15. Prefer crunchy textured foods?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA15" DatabaseField="SENSPA15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR15" DatabaseField="SENSPR15" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">16. Prefer foods of certain tastes? (sweet, sour, salty, spicy, bland, bitter)</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA16" DatabaseField="SENSPA16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR16" DatabaseField="SENSPR16" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SENSPA11" runat="server"  DatabaseField="SENSPA11"></def:ValueSetLabel></div>
</div>
<h4>Movement</h4>
<div class="collection">
  <div class="main">
    <div class="collection">
      <div class="label">17. Seek fast movement activities? (biking, skiing)</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA17" DatabaseField="SENSPA17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR17" DatabaseField="SENSPR17" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">18. Avoid fast carnival rides that spin or go up and down?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA18" DatabaseField="SENSPA18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR18" DatabaseField="SENSPR18" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">19. Become upset if head was tilted backward or forward as in hair washing?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA19" DatabaseField="SENSPA19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR19" DatabaseField="SENSPR19" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">20. Dislike roughhousing?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA20" DatabaseField="SENSPA20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR20" DatabaseField="SENSPR20" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">21. Rock in seat?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA21" DatabaseField="SENSPA21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR21" DatabaseField="SENSPR21" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">22. Have difficulty if not in front seat while riding in car?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA22" DatabaseField="SENSPA22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR22" DatabaseField="SENSPR22" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">23. Seem fearful of heights?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA23" DatabaseField="SENSPA23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR23" DatabaseField="SENSPR23" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">24. Hesitate or avoid climbing on ladders?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA24" DatabaseField="SENSPA24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR24" DatabaseField="SENSPR24" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">25. Get lost in new or familiar places?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA25" DatabaseField="SENSPA25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR25" DatabaseField="SENSPR25" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SENSPA17" runat="server"  DatabaseField="SENSPA17"></def:ValueSetLabel></div>
</div>
<h4>Motor Planning</h4>
<div class="collection">
  <div class="main">
    <div class="collection">
      <div class="label">26. Have difficulty with motor tasks that have several steps?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA26" DatabaseField="SENSPA26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR26" DatabaseField="SENSPR26" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">27. Find small manipulative activities difficult?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA27" DatabaseField="SENSPA27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR27" DatabaseField="SENSPR27" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">28. Avoid fine motor activities?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA28" DatabaseField="SENSPA28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR28" DatabaseField="SENSPR28" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">29. Take a long time to do most motor tasks? (dressing)</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA29" DatabaseField="SENSPA29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR29" DatabaseField="SENSPR29" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">30. Dislike participating in sports or games?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA30" DatabaseField="SENSPA30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR30" DatabaseField="SENSPR30" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">31. Have difficulty learning exercise steps or routines?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA31" DatabaseField="SENSPA31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR31" DatabaseField="SENSPR31" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">32. Have difficulty reproducing a rhythm with your hands?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA32" DatabaseField="SENSPA32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR32" DatabaseField="SENSPR32" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SENSPA26" runat="server"  DatabaseField="SENSPA26"></def:ValueSetLabel></div>
</div>
<h4>Tactile</h4>
<div class="collection">
  <div class="main">
    <div class="collection">
      <div class="label">33. Dislike grooming activities? (haircutting, nail clipping)</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA33" DatabaseField="SENSPA33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR33" DatabaseField="SENSPR33" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">34. Feel bothered by clothes? (turtlenecks, socks)</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA34" DatabaseField="SENSPA34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR34" DatabaseField="SENSPR34" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">35. Tend to prefer long sleeves and pants regardless of weather?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA35" DatabaseField="SENSPA35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR35" DatabaseField="SENSPR35" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">36. Dislike cloth of certain textures?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA36" DatabaseField="SENSPA36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR36" DatabaseField="SENSPR36" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">37. Avoid getting hands into messy things?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA37" DatabaseField="SENSPA37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR37" DatabaseField="SENSPR37" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">38. Notice irritating bumps on the bed sheets?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA38" DatabaseField="SENSPA38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR38" DatabaseField="SENSPR38" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">39. Over or under dress for the temperature?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA39" DatabaseField="SENSPA39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR39" DatabaseField="SENSPR39" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">40. Become irritated when splashed with water?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA40" DatabaseField="SENSPA40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR40" DatabaseField="SENSPR40" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">41. Become angry or annoyed when touched or bumped unexpectedly?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA41" DatabaseField="SENSPA41" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR41" DatabaseField="SENSPR41" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">42. Dislike going barefoot?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA42" DatabaseField="SENSPA42" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR42" DatabaseField="SENSPR42" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">43. Tend to remove shoes whenever possible?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA43" DatabaseField="SENSPA43" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR43" DatabaseField="SENSPR43" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
    <div class="collection">
      <div class="label">44. Tend not to feel pain as much as others?</div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPA44" DatabaseField="SENSPA44" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
      <div class="key"><def:datafieldcontrol runat="server" id="SENSPR44" DatabaseField="SENSPR44" IsEntryField="true" IsDoubleEntryField="true" FieldLabelWidth="60px" FieldTextBoxWidth="40px"></def:datafieldcontrol></div>
    </div>
  </div>
  <div class="key"><def:ValueSetLabel ID="ValueSetLabel_SENSPA33" runat="server"  DatabaseField="SENSPA33"></def:ValueSetLabel></div>
</div>
<h4>Comments</h4>
<def:datafieldcontrol runat="server" id="SENSCMNT" DatabaseField="SENSCMNT" IsEntryField="true" IsDoubleEntryField="false" FieldLabelWidth="150px" FieldTextBoxWidth="400px" FieldTextBoxHeight="40px" FieldTextBoxTextMode="multiline" FieldTextBoxMaxLength="1000"></def:datafieldcontrol>
</asp:panel>
<div class="main">
  <def:datafieldcontrol runat="server" id="created" DatabaseField="created" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="createdBy" DatabaseField="createdBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updated" DatabaseField="updated" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="updatedBy" DatabaseField="updatedBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scored" DatabaseField="scored" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px"></def:datafieldcontrol>
  <def:datafieldcontrol runat="server" id="scoredBy" DatabaseField="scoredBy" IsReadOnly="true" RenderReadOnlyAsDiv="true" FieldLabelWidth="300px" FieldTextBoxWidth="250px" FieldTextBoxMaxLength="50"></def:datafieldcontrol>
</div>
</asp:Content>

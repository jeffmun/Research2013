<%@ Page Title="" Language="C#" MasterPageFile="~/UWAC.master" AutoEventWireup="true" CodeFile="Bal2.aspx.cs" Inherits="AC_Bal2" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="oBodyPlaceHolder" runat="Server">


    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" />



    <connectionstring>
<add name="TRACKING_CONN_STRING" connectionString="INTEGRATED SECURITY=SSPI;DATA SOURCE=AUTISM-SQL;PERSIST SECURITY INFO=False;INITIAL CATALOG=uwautism_research_backend;"/>
</connectionstring>

     

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


    <%--  Month--%>

    <asp:DropDownList ID="ddlMonth" runat="server" DataSourceID="sql_mv_months" Visible="false"
        DataValueField="Month" DataTextField="Month" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" AutoPostBack="true">
    </asp:DropDownList>

    <br />
    <br />

    <asp:Label ID="importDate" runat="server" Text="Imported on " Font-Size="Medium" Font-Bold="true"></asp:Label>

<%--    <div style="background-color: #f8f8ff; border: 2px solid black; margin: 10px">
                <asp:Label ID="l1" runat="server" Text="Core Clinic" Font-Size="Medium" Font-Bold="true">              </asp:Label>

        <asp:Panel ID="panel1" runat="server"></asp:Panel>
    </div>


    <br />
    <br />--%>




    <asp:SqlDataSource ID="sql_mv_months" runat="server"
        SelectCommandType="Text"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="select top 100 percent [Month] from ac.vwGetMonthlyVarianceMonths order by [Month] desc"
        UpdateCommand="select top 100 percent [Month] from ac.vwGetMonthlyVarianceMonths order by [Month] desc"></asp:SqlDataSource>



    <asp:GridView ID="grid1" runat="server" AutoGenerateColumns="false" OnRowDataBound="grid_RowDataBound" visible="false">
        <Columns>
            <asp:BoundField DataField="Budgetnbr" HeaderText="Budget #" />
            <asp:BoundField DataField="BudgetName" HeaderText="Budget Name" />
            <asp:BoundField DataField="RevenueAmount" HeaderText="Revenue" DataFormatString="{0:c}" />
            <asp:BoundField DataField="ExpenseAmount" HeaderText="Expenses" DataFormatString="{0:c}" />
            <asp:BoundField DataField="EXP_SALARY" HeaderText="Exp: Salary" DataFormatString="{0:c}" />
            <asp:BoundField DataField="EXP_Non_SALARY" HeaderText="Exp: Other" DataFormatString="{0:c}" />
            <asp:BoundField DataField="RemainingBal" HeaderText="Balance" DataFormatString="{0:c}" />
            <asp:BoundField DataField="yrmo" HeaderText="Year_Mo" />
            <asp:BoundField DataField="imported_from_EDW" HeaderText="Data retrieved on:" />

        </Columns>
    </asp:GridView>

    <br />
    <br />



    <asp:GridView ID="grid2" runat="server" AutoGenerateColumns="false" OnRowDataBound="grid_RowDataBound" visible="false">
        <Columns>
            <asp:BoundField DataField="Budgetnbr" HeaderText="Budget #" />
            <asp:BoundField DataField="BudgetName" HeaderText="Budget Name" />
            <asp:BoundField DataField="RevenueAmount" HeaderText="Revenue" DataFormatString="{0:c}" />
            <asp:BoundField DataField="ExpenseAmount" HeaderText="Expenses" DataFormatString="{0:c}" />
            <asp:BoundField DataField="RemainingBal" HeaderText="Balance" DataFormatString="{0:c}" />
            <asp:BoundField DataField="yrmo" HeaderText="Year_Mo" />
            <asp:BoundField DataField="imported_from_EDW" HeaderText="Data retrieved on:" />

        </Columns>
    </asp:GridView>


    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Research" Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>


    <asp:GridView ID="grid3" runat="server" AutoGenerateColumns="false" OnRowDataBound="grid_RowDataBound" Visible="false">
        <Columns>
            <asp:BoundField DataField="Budgetnbr" HeaderText="Budget #" />
            <asp:BoundField DataField="BudgetName" HeaderText="Budget Name" />
            <asp:BoundField DataField="RevenueAmount" HeaderText="Revenue" DataFormatString="{0:c}" />
            <asp:BoundField DataField="ExpenseAmount" HeaderText="Expenses" DataFormatString="{0:c}" />
            <asp:BoundField DataField="RemainingBal" HeaderText="Balance" DataFormatString="{0:c}" />
            <asp:BoundField DataField="yrmo" HeaderText="Year_Mo" />
            <asp:BoundField DataField="imported_from_EDW" HeaderText="Data retrieved on:" />

        </Columns>
    </asp:GridView>


<%--
    <div style="background-color: #fffff8; border: 2px solid black; margin: 10px">

        <div id="chart_div">

            <asp:Label ID="Label1" Text="65-3920, Fade Autism Center" Style="font-size: large" runat="server" /><br />
            <asp:Chart ID="Chart1" runat="server" DataSourceID="sql_mv_653920" Height="450px" Width="900px">

                <Series>
                    <asp:Series
                        LegendText="Rev + Endowments" MarkerStyle="circle"
                        MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        Color="Green"
                        ChartType="Line"
                        Name="SeriesIncome"
                        XValueMember="Month"
                        YValueMembers="Income" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Revenue" MarkerStyle="circle" MarkerSize="7"
                        Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Green"
                        Name="SeriesRevenue"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Revenue" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Expenses" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesExpenses"
                        XValueMember="Month"
                        YValueMembers="Expenses" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Salaries" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesSalaries"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Salaries" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Balance" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Blue"
                        Name="SeriesBalance"
                        XValueMember="Month"
                        YValueMembers="Balance" YValuesPerPoint="2">
                    </asp:Series>





                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend10">
                    </asp:Legend>
                </Legends>

            </asp:Chart>

        </div>




           










        <div id="chart_div">

            <asp:Label ID="Label9" Text="09-5001, Autism Center (State)" Style="font-size: large" runat="server" /><br />
            <asp:Chart ID="Chart2" runat="server" DataSourceID="sql_mv_095001" Height="450px" Width="900px">

                <Series>
                    <asp:Series
                        LegendText="Rev + Endowments" MarkerStyle="circle"
                        MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        Color="Green"
                        ChartType="Line"
                        Name="SeriesIncome"
                        XValueMember="Month"
                        YValueMembers="Income" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Revenue" MarkerStyle="circle" MarkerSize="7"
                        Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Green"
                        Name="SeriesRevenue"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Revenue" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Expenses" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesExpenses"
                        XValueMember="Month"
                        YValueMembers="Expenses" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Salaries" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesSalaries"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Salaries" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Balance" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Blue"
                        Name="SeriesBalance"
                        XValueMember="Month"
                        YValueMembers="Balance" YValuesPerPoint="2">
                    </asp:Series>





                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend10">
                    </asp:Legend>
                </Legends>

            </asp:Chart>

        </div>
        <div id="chart_div">

            <asp:Label ID="Label10" Text="09-5002, Parent Support (State)" Style="font-size: large" runat="server" /><br />
            <asp:Chart ID="Chart3" runat="server" DataSourceID="sql_mv_095002" Height="450px" Width="900px">

                <Series>
                    <asp:Series
                        LegendText="Rev + Endowments" MarkerStyle="circle"
                        MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        Color="Green"
                        ChartType="Line"
                        Name="SeriesIncome"
                        XValueMember="Month"
                        YValueMembers="Income" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Revenue" MarkerStyle="circle" MarkerSize="7"
                        Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Green"
                        Name="SeriesRevenue"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Revenue" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Expenses" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesExpenses"
                        XValueMember="Month"
                        YValueMembers="Expenses" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Salaries" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesSalaries"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Salaries" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Balance" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Blue"
                        Name="SeriesBalance"
                        XValueMember="Month"
                        YValueMembers="Balance" YValuesPerPoint="2">
                    </asp:Series>





                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend10">
                    </asp:Legend>
                </Legends>
            </asp:Chart>

        </div>
        <div id="chart_div">

            <asp:Label ID="Label11" Text="09-9877, UWAC Rev" Style="font-size: large" runat="server" /><br />
            <asp:Chart ID="Chart4" runat="server" DataSourceID="sql_mv_099877" Height="450px" Width="900px">

                <Series>
                    <asp:Series
                        LegendText="Rev + Endowments" MarkerStyle="circle"
                        MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        Color="Green"
                        ChartType="Line"
                        Name="SeriesIncome"
                        XValueMember="Month"
                        YValueMembers="Income" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Revenue" MarkerStyle="circle" MarkerSize="7"
                        Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Green"
                        Name="SeriesRevenue"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Revenue" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Expenses" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesExpenses"
                        XValueMember="Month"
                        YValueMembers="Expenses" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Salaries" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesSalaries"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Salaries" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Balance" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Blue"
                        Name="SeriesBalance"
                        XValueMember="Month"
                        YValueMembers="Balance" YValuesPerPoint="2">
                    </asp:Series>





                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend10">
                    </asp:Legend>
                </Legends>
            </asp:Chart>

        </div>
        <div id="chart_div">

            <asp:Label ID="Label4" Text="65-5411, UWAC Endowed Chair"   Style="font-size: large" runat="server" /><br />
            <asp:Chart ID="Chart5" runat="server" DataSourceID="sql_mv_655411" Height="450px" Width="900px">




                <Series>
                    <asp:Series
                        LegendText="Rev + Endowments" MarkerStyle="circle"
                        MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        Color="Green"
                        ChartType="Line"
                        Name="SeriesIncome"
                        XValueMember="Month"
                        YValueMembers="Income" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Revenue" MarkerStyle="circle" MarkerSize="7"
                        Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Green"
                        Name="SeriesRevenue"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Revenue" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Expenses" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesExpenses"
                        XValueMember="Month"
                        YValueMembers="Expenses" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Salaries" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesSalaries"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Salaries" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Balance" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Blue"
                        Name="SeriesBalance"
                        XValueMember="Month"
                        YValueMembers="Balance" YValuesPerPoint="2">
                    </asp:Series>





                </Series>


                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend10">
                    </asp:Legend>
                </Legends>
            </asp:Chart>

        </div>
        <div id="chart_div">

            <asp:Label ID="Label5" Text="Sum Over Above" Style="font-size: large" runat="server" /><br />
            <asp:Chart ID="Chart6" runat="server" DataSourceID="sql_mv_sum_over_clinic" Height="600px" Width="900px">
                <Series>


                    <asp:Series
                        LegendText="Rev + Endowments" MarkerStyle="circle"
                        MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        Color="Green"
                        ChartType="Line"
                        Name="SeriesIncome"
                        XValueMember="Month"
                        YValueMembers="Income" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Revenue" MarkerStyle="circle" MarkerSize="7"
                        Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Green"
                        Name="SeriesRevenue"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Revenue" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Expenses" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesExpenses"
                        XValueMember="Month"
                        YValueMembers="Expenses" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Salaries" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesSalaries"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Salaries" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Balance" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Blue"
                        Name="SeriesBalance"
                        XValueMember="Month"
                        YValueMembers="Balance" YValuesPerPoint="2">
                    </asp:Series>





                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend10">
                    </asp:Legend>
                </Legends>
            </asp:Chart>

        </div>

    </div>
   

     


        <div style="background-color: #f8fff8; border: 2px solid black; margin: 10px">
        <asp:Label ID="Label3" runat="server" Text="Gift" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <asp:Panel ID="panel2" runat="server"></asp:Panel>
    </div>


    <div style="background-color: #fffff8; border: 2px solid black; margin: 10px">

        <div id="chart_div">

            <asp:Label ID="Label7" Text="65-3977, UWAC Gift" Style="font-size: large" runat="server" /><br />
            <asp:Chart ID="Chart7" runat="server" DataSourceID="sql_mv_653977" Height="450px" Width="900px">

                <Series>
                    <asp:Series
                        LegendText="Rev + Endowments" MarkerStyle="circle"
                        MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        Color="Green"
                        ChartType="Line"
                        Name="SeriesIncome"
                        XValueMember="Month"
                        YValueMembers="Income" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Revenue" MarkerStyle="circle" MarkerSize="7"
                        Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Green"
                        Name="SeriesRevenue"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Revenue" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Expenses" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesExpenses"
                        XValueMember="Month"
                        YValueMembers="Expenses" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Salaries" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesSalaries"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Salaries" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Balance" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Blue"
                        Name="SeriesBalance"
                        XValueMember="Month"
                        YValueMembers="Balance" YValuesPerPoint="2">
                    </asp:Series>





                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend10">
                    </asp:Legend>
                </Legends>

            </asp:Chart>

        </div>




           










        <div id="chart_div">

            <asp:Label ID="Label8" Text="65-6876, St. John Masonic Lodge" Style="font-size: large" runat="server" /><br />
            <asp:Chart ID="Chart8" runat="server" DataSourceID="sql_mv_656876" Height="450px" Width="900px">

                <Series>
                    <asp:Series
                        LegendText="Rev + Endowments" MarkerStyle="circle"
                        MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        Color="Green"
                        ChartType="Line"
                        Name="SeriesIncome"
                        XValueMember="Month"
                        YValueMembers="Income" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Revenue" MarkerStyle="circle" MarkerSize="7"
                        Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Green"
                        Name="SeriesRevenue"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Revenue" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Expenses" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesExpenses"
                        XValueMember="Month"
                        YValueMembers="Expenses" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Salaries" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesSalaries"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Salaries" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Balance" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Blue"
                        Name="SeriesBalance"
                        XValueMember="Month"
                        YValueMembers="Balance" YValuesPerPoint="2">
                    </asp:Series>





                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend10">
                    </asp:Legend>
                </Legends>

            </asp:Chart>

        </div>
        <div id="chart_div">

            <asp:Label ID="Label12" Text="65-8823, UWAC Fade Match" Style="font-size: large" runat="server" /><br />
            <asp:Chart ID="Chart9" runat="server" DataSourceID="sql_mv_658823" Height="450px" Width="900px">

                <Series>
                    <asp:Series
                        LegendText="Rev + Endowments" MarkerStyle="circle"
                        MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        Color="Green"
                        ChartType="Line"
                        Name="SeriesIncome"
                        XValueMember="Month"
                        YValueMembers="Income" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Revenue" MarkerStyle="circle" MarkerSize="7"
                        Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Green"
                        Name="SeriesRevenue"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Revenue" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Expenses" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesExpenses"
                        XValueMember="Month"
                        YValueMembers="Expenses" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Salaries" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesSalaries"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Salaries" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Balance" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Blue"
                        Name="SeriesBalance"
                        XValueMember="Month"
                        YValueMembers="Balance" YValuesPerPoint="2">
                    </asp:Series>





                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend10">
                    </asp:Legend>
                </Legends>
            </asp:Chart>

        </div>
        

    </div>

    --%>
    <div style="background-color: #fff8f8; border: 2px solid black; margin: 10px" >
        <asp:Label ID="Label6" runat="server" Text="Research" Font-Size="Medium" Font-Bold="true" visible="false"></asp:Label>
        <asp:Panel ID="panel3" runat="server" ></asp:Panel>
    </div>


    <div style="background-color: #fffff8; border: 2px solid black; margin: 10px" >

        <div id="chart_div" >

            <asp:Label ID="Label16" Text="63-0120, EYE BLINK ASD" Style="font-size: large" runat="server" /><br />
            <asp:Chart ID="Chart13" runat="server" DataSourceID="sql_mv_630120" Height="450px" Width="900px">

                <Series>
                    <asp:Series
                        LegendText="Award" MarkerStyle="circle"
                        MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        Color="Green"
                        ChartType="Line"
                        Name="SeriesIncome"
                        XValueMember="Month"
                        YValueMembers="Income" YValuesPerPoint="2">
                    </asp:Series>

   

                    <asp:Series
                        LegendText="Expenses" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesExpenses"
                        XValueMember="Month"
                        YValueMembers="Expenses" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Salaries" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesSalaries"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Salaries" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Balance" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Blue"
                        Name="SeriesBalance"
                        XValueMember="Month"
                        YValueMembers="Balance" YValuesPerPoint="2">
                    </asp:Series>





                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend10">
                    </asp:Legend>
                </Legends>

            </asp:Chart>

        </div>





        <div id="chart_div">

            <asp:Label ID="Label17" Text="63-0555, ACE TX EFFECTS" Style="font-size: large" runat="server" /><br />
            <asp:Chart ID="Chart14" runat="server" DataSourceID="sql_mv_630555" Height="450px" Width="900px">

                <Series>
                    <asp:Series
                        LegendText="Awards" MarkerStyle="circle"
                        MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        Color="Green"
                        ChartType="Line"
                        Name="SeriesIncome"
                        XValueMember="Month"
                        YValueMembers="Income" YValuesPerPoint="2">
                    </asp:Series>

       

                    <asp:Series
                        LegendText="Expenses" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesExpenses"
                        XValueMember="Month"
                        YValueMembers="Expenses" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Salaries" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesSalaries"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Salaries" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Balance" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Blue"
                        Name="SeriesBalance"
                        XValueMember="Month"
                        YValueMembers="Balance" YValuesPerPoint="2">
                    </asp:Series>





                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend10">
                    </asp:Legend>
                </Legends>

            </asp:Chart>

        </div>

        <div id="chart_div">

            <asp:Label ID="Label18" Text="63-1369, IBIS-2 BQC Autism" Style="font-size: large" runat="server" /><br />
            <asp:Chart ID="Chart15" runat="server" DataSourceID="sql_mv_631369" Height="450px" Width="900px">

                <Series>
                    <asp:Series
                        LegendText="Awards" MarkerStyle="circle"
                        MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        Color="Green"
                        ChartType="Line"
                        Name="SeriesIncome"
                        XValueMember="Month"
                        YValueMembers="Income" YValuesPerPoint="2">
                    </asp:Series>

 

                    <asp:Series
                        LegendText="Expenses" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesExpenses"
                        XValueMember="Month"
                        YValueMembers="Expenses" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Salaries" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesSalaries"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Salaries" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Balance" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Blue"
                        Name="SeriesBalance"
                        XValueMember="Month"
                        YValueMembers="Balance" YValuesPerPoint="2">
                    </asp:Series>





                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend10">
                    </asp:Legend>
                </Legends>
            </asp:Chart>

        </div>


        <div id="chart_div">

            <asp:Label ID="Label19" Text="63-1370, IBIS-2 CHDD Autism" Style="font-size: large" runat="server" /><br />
            <asp:Chart ID="Chart16" runat="server" DataSourceID="sql_mv_631370" Height="450px" Width="900px">

                <Series>
                    <asp:Series
                        LegendText="Awards" MarkerStyle="circle"
                        MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        Color="Green"
                        ChartType="Line"
                        Name="SeriesIncome"
                        XValueMember="Month"
                        YValueMembers="Income" YValuesPerPoint="2">
                    </asp:Series>


                    <asp:Series
                        LegendText="Expenses" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesExpenses"
                        XValueMember="Month"
                        YValueMembers="Expenses" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Salaries" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesSalaries"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Salaries" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Balance" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Blue"
                        Name="SeriesBalance"
                        XValueMember="Month"
                        YValueMembers="Balance" YValuesPerPoint="2">
                    </asp:Series>





                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend10">
                    </asp:Legend>
                </Legends>
            </asp:Chart>

        </div>


        <div id="chart_div">

            <asp:Label ID="Label20" Text="63-4035, HARE"   Style="font-size: large" runat="server" /><br />
            <asp:Chart ID="Chart17" runat="server" DataSourceID="sql_mv_634035" Height="450px" Width="900px">




                <Series>
                    <asp:Series
                        LegendText="Awards" MarkerStyle="circle"
                        MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        Color="Green"
                        ChartType="Line"
                        Name="SeriesIncome"
                        XValueMember="Month"
                        YValueMembers="Income" YValuesPerPoint="2">
                    </asp:Series>

 

                    <asp:Series
                        LegendText="Expenses" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesExpenses"
                        XValueMember="Month"
                        YValueMembers="Expenses" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Salaries" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Red"
                        Name="SeriesSalaries"
                        BorderDashStyle="Dash"
                        XValueMember="Month"
                        YValueMembers="Salaries" YValuesPerPoint="2">
                    </asp:Series>

                    <asp:Series
                        LegendText="Balance" MarkerStyle="circle" MarkerSize="7" Legend="Legend10" BorderWidth="2"
                        ChartType="Line"
                        Color="Blue"
                        Name="SeriesBalance"
                        XValueMember="Month"
                        YValueMembers="Balance" YValuesPerPoint="2">
                    </asp:Series>





                </Series>


                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend10">
                    </asp:Legend>
                </Legends>
            </asp:Chart>

        </div>
        
   
  
      
    </div>



                <asp:SqlDataSource ID="sql_mv_666732" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="666732" />
        </SelectParameters>

    </asp:SqlDataSource>            
    <asp:SqlDataSource ID="sql_mv_667514" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="667514" />
        </SelectParameters>

    </asp:SqlDataSource>          
      <asp:SqlDataSource ID="sql_mv_668148" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="668148" />
        </SelectParameters>

    </asp:SqlDataSource>      
          <asp:SqlDataSource ID="sql_mv_657837" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="657837" />
        </SelectParameters>
    </asp:SqlDataSource>


            <asp:SqlDataSource ID="sql_mv_666076" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="666076" />
        </SelectParameters>
    </asp:SqlDataSource>

        <asp:SqlDataSource ID="sql_mv_665176" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="665176" />
        </SelectParameters>
    </asp:SqlDataSource>

     <asp:SqlDataSource ID="sql_mv_663077" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="663077" />
        </SelectParameters>
    </asp:SqlDataSource>


         <asp:SqlDataSource ID="sql_mv_634168" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="634168" />
        </SelectParameters>
    </asp:SqlDataSource>


    
    
     <asp:SqlDataSource ID="sql_mv_658823" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="658823" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_mv_653977" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="653977" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_mv_653920" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="653920" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_mv_sum_over_clinic" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetSummedMonth"
        UpdateCommand="fin.spGetSummedMonth">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_mv_631370" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="631370" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_mv_634035" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="634035" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_mv_633383" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="633383" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sql_mv_655411" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="655411" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_mv_656876" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="656876" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_mv_631369" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="631369" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_mv_630120" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="630120" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_mv_630555" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="630555" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_mv_095001" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="095001" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_mv_095002" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="095002" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sql_mv_099877" runat="server"
        SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:TRACKING_CONN_STRING %>"
        SelectCommand="fin.spGetBudgetMonth"
        UpdateCommand="fin.spGetBudgetMonth">
        <SelectParameters>
            <asp:Parameter Name="BudgetNumber" Type="String" DefaultValue="099877" />
        </SelectParameters>
    </asp:SqlDataSource>


    <table>
        <tr>
            <td>
                <asp:Panel ID="panelCharts" runat="server" Visible="false"></asp:Panel>
            </td>
            <td>
                <asp:Panel ID="panelCharts2" runat="server" Visible="false"></asp:Panel>
            </td>

        </tr>
    </table>

</asp:Content>


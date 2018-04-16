<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxp" %>




<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxt" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxpc" %>

<%@ Register Assembly="DevExpress.XtraCharts.v16.1.Web, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>

<script language="jscript" type="text/jscript">

var increaseTimerID = "";
var decreaseTimerID = "";

function BeginAppearPanel() {
    if (increaseTimerID == "") {
        increaseTimerID = window.setInterval("IncreaseOpacity()", 100);

        if (decreaseTimerID != "") {
            window.clearInterval(decreaseTimerID);
            decreaseTimerID = "";
        }
    }
}

function IncreaseOpacity() {
    RoundPanelLayer.filters.item("DXImageTransform.Microsoft.Alpha").opacity += 20;

    if (RoundPanelLayer.filters.item("DXImageTransform.Microsoft.Alpha").opacity == 100) {
        window.clearInterval(increaseTimerID);
        increaseTimerID = "";
        decreaseTimerID = window.setInterval("DecreaseOpacity()", 100);
    }
}

function DecreaseOpacity() {
    RoundPanelLayer.filters.item("DXImageTransform.Microsoft.Alpha").opacity -= 20;

    if (RoundPanelLayer.filters.item("DXImageTransform.Microsoft.Alpha").opacity == 0) {
        window.clearInterval(decreaseTimerID);
        decreaseTimerID = "";
    }
}


</script>

</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" ClientInstanceName="chart"
             Height="261px" Width="994px" CrosshairEnabled="True">

<Legend Name="Default Legend"></Legend>
            <SeriesSerializable>
                <cc1:Series ArgumentScaleType="DateTime"  Name="Series 1"
                     >
                    <points>
<cc1:SeriesPoint Values="0.2" ArgumentSerializable="12/03/2008 01:00:00.000"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="0.6" ArgumentSerializable="12/03/2008 01:10:00.000"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="0.4" ArgumentSerializable="12/03/2008 01:20:00.000"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="0.5" ArgumentSerializable="12/03/2008 01:30:00.000"></cc1:SeriesPoint>
</points>
                    <ViewSerializable>
<cc1:LineSeriesView></cc1:LineSeriesView>
</ViewSerializable>
                    <LabelSerializable>
<cc1:PointSeriesLabel>
                        <fillstyle >
<OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</fillstyle>
                    </cc1:PointSeriesLabel>
</LabelSerializable>
                </cc1:Series>
            </SeriesSerializable>
            <SeriesTemplate >
                <LabelSerializable>
<cc1:SideBySideBarSeriesLabel>
                    <FillStyle >
                        <OptionsSerializable>
<cc1:SolidFillOptions />
</OptionsSerializable>
                    </FillStyle>
                </cc1:SideBySideBarSeriesLabel>
</LabelSerializable>
                <ViewSerializable>
<cc1:SideBySideBarSeriesView>
                </cc1:SideBySideBarSeriesView>
</ViewSerializable>
            </SeriesTemplate>
            <DiagramSerializable>
<cc1:XYDiagram>
                <axisx visibleinpanesserializable="-1">
<Label Staggered="True" TextPattern="{A:MM/dd/yyyy hh:mm tt}"></Label>
                    <DateTimeScaleOptions AutoGrid="False" GridAlignment="Second" GridSpacing="6" 
                        MeasureUnit="Second">
                    </DateTimeScaleOptions>
</axisx>
                <axisy visibleinpanesserializable="-1">
</axisy>
            </cc1:XYDiagram>
</DiagramSerializable>
            <FillStyle >
                <OptionsSerializable>
<cc1:SolidFillOptions />
</OptionsSerializable>
            </FillStyle>
            <ClientSideEvents ObjectHotTracked="function(s, e) {
    var webChart = s.GetChart();
    var coord = webChart.diagram.PointToDiagram(e.x, e.y);

    var i = 0;
    var prevPointIdex = 0;

    for (i = 1; i &lt; webChart.series[0].points.length; i++) { 
        var point = webChart.series[0].points[i];

        if (Date.parse(point.argument) &gt; Date.parse(coord.dateTimeArgument)) {
               prevPointIdex = i - 1;
            break;
           }
    }

    var x1 = Date.parse(webChart.series[0].points[prevPointIdex].argument);
    var y1 = webChart.series[0].points[prevPointIdex].values[0];
    var x2 = Date.parse(webChart.series[0].points[prevPointIdex + 1].argument);
    var y2 = webChart.series[0].points[prevPointIdex + 1].values[0];

    var dta = new Date(coord.dateTimeArgument);
    var value = (dta.getTime() - x1) * (y2 - y1) / (x2 - x1) + y1;

    var str = &quot;&quot;
    str += (dta.getMonth() + 1) + &quot;/&quot;;          
    str += dta.getDate() + &quot;/&quot;;                 
    str += dta.getFullYear() + &quot; &quot;
    str += dta.getHours() + &quot;:&quot;
    str += dta.getMinutes() + &quot;:&quot;
    str += dta.getSeconds();

    lblArgument.SetText(str);
    lblValue.SetText(Math.round(value*100)/100);

    BeginAppearPanel();
}" />
        </dxchartsui:WebChartControl>
        &nbsp; &nbsp;&nbsp;

                <table id="RoundPanelLayer" style="filter:progid:DXImageTransform.Microsoft.Alpha(opacity=0); width:80%" >
                <tr>
                    <td>

        &nbsp;&nbsp;<dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" CssFilePath="~/App_Themes/BlackGlass/{0}/styles.css"
            CssPostfix="BlackGlass" HeaderText="WebChartControl" Height="100px" ImageFolder="~/App_Themes/BlackGlass/{0}/"
            Width="80%">



            <ContentPaddings PaddingLeft="2px" PaddingTop="10px" />



            <Border BorderStyle="None" />
            <Content BackColor="#C9D7DC">
                <BackgroundImage ImageUrl="~/App_Themes/BlackGlass/Web/rpContentBack.gif" VerticalPosition="top" />
            </Content>

            <HeaderStyle BackColor="White" Height="23px" HorizontalAlign="Left">
                <Paddings PaddingBottom="0px" PaddingLeft="3px" PaddingTop="0px" />
                <BackgroundImage ImageUrl="~/App_Themes/BlackGlass/Web/rpHeaderBack.gif" Repeat="RepeatX"
                    VerticalPosition="bottom" />
                <Border BorderStyle="None" />
            </HeaderStyle>
            <BorderTop BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />


            <HeaderContent BackColor="#444545">
                <BackgroundImage HorizontalPosition="left" ImageUrl="~/App_Themes/BlackGlass/Web/rpHeaderBack.gif"
                    Repeat="RepeatX" VerticalPosition="top" />
            </HeaderContent>


            <PanelCollection>
                <dxp:PanelContent runat="server">

            <table style="width: 100%">
                <tr>
                    <td>
                        <strong><span style="color: red">Argument</span></strong></td>
                    <td>
                        <strong><span style="color: red">Value</span></strong></td>
                </tr>
                <tr>
                    <td>
                        &nbsp;<dxe:ASPxLabel ID="ASPxLabel1" runat="server" ClientInstanceName="lblArgument" EnableClientSideAPI="True" Font-Overline="True" Font-Size="Large" Font-Underline="True" ForeColor="Blue" Width="300px">
                        </dxe:ASPxLabel>
                    </td>
                    <td s><dxe:ASPxLabel ID="ASPxLabel2" runat="server" ClientInstanceName="lblValue" EnableClientSideAPI="True" Font-Overline="True" Font-Size="Large" Font-Underline="True" ForeColor="Blue" Width="300px">
                    </dxe:ASPxLabel>
                    </td>
                </tr>
            </table>
                </dxp:PanelContent>
            </PanelCollection>


        </dxrp:ASPxRoundPanel>

                          </td>
                </tr>
            </table>

    </div>
    </form>
</body>
</html>
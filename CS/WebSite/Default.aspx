<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v8.3, Version=8.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3, Version=8.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>

<%@ Register Assembly="DevExpress.Web.v8.3, Version=8.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3, Version=8.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3, Version=8.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v8.3, Version=8.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTimer" TagPrefix="dxt" %>

<%@ Register Assembly="DevExpress.Web.v8.3, Version=8.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

<%@ Register Assembly="DevExpress.XtraCharts.v8.3.Web, Version=8.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v8.3, Version=8.3.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
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
            DiagramTypeName="XYDiagram" Height="261px" Width="994px" EnableClientSideAPI="True" EnableClientSidePointToDiagram="True">
            <SeriesSerializable>
                <cc1:Series ArgumentScaleType="DateTime" LabelTypeName="PointSeriesLabel" Name="Series 1"
                    PointOptionsTypeName="PointOptions" SeriesViewTypeName="LineSeriesView">
                    <points>
<cc1:SeriesPoint Values="0.2" ArgumentSerializable="12/03/2008 01:00:00.000"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="0.6" ArgumentSerializable="12/03/2008 01:10:00.000"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="0.4" ArgumentSerializable="12/03/2008 01:20:00.000"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="0.5" ArgumentSerializable="12/03/2008 01:30:00.000"></cc1:SeriesPoint>
</points>
                    <view hiddenserializablestring="to be serialized"></view>
                    <label hiddenserializablestring="to be serialized" linevisible="True">
                        <fillstyle filloptionstypename="SolidFillOptions">
<Options HiddenSerializableString="to be serialized"></Options>
</fillstyle>
                    </label>
                    <pointoptions hiddenserializablestring="to be serialized"></pointoptions>
                    <legendpointoptions hiddenserializablestring="to be serialized"></legendpointoptions>
                </cc1:Series>
            </SeriesSerializable>
            <SeriesTemplate LabelTypeName="SideBySideBarSeriesLabel" PointOptionsTypeName="PointOptions"
                SeriesViewTypeName="SideBySideBarSeriesView">
                <PointOptions HiddenSerializableString="to be serialized">
                </PointOptions>
                <Label HiddenSerializableString="to be serialized" LineVisible="True">
                    <FillStyle FillOptionsTypeName="SolidFillOptions">
                        <Options HiddenSerializableString="to be serialized" />
                    </FillStyle>
                </Label>
                <LegendPointOptions HiddenSerializableString="to be serialized">
                </LegendPointOptions>
                <View HiddenSerializableString="to be serialized">
                </View>
            </SeriesTemplate>
            <Diagram>
                <axisx visibleinpanesserializable="-1" datetimegridalignment="Second" datetimemeasureunit="Second">
<Label Staggered="True"></Label>

<Range SideMarginsEnabled="True"></Range>

<DateTimeOptions Format="LongTime"></DateTimeOptions>
</axisx>
                <axisy visibleinpanesserializable="-1">
<Range SideMarginsEnabled="True"></Range>
</axisy>
            </Diagram>
            <FillStyle FillOptionsTypeName="SolidFillOptions">
                <Options HiddenSerializableString="to be serialized" />
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

    var str = &quot;&quot;;
    str += (dta.getMonth() + 1) + &quot;/&quot;;          
    str += dta.getDate() + &quot;/&quot;;                 
    str += dta.getFullYear() + &quot; &quot;;
	str += dta.getHours() + &quot;:&quot;;
	str += dta.getMinutes() + &quot;:&quot;;
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
            <TopEdge BackColor="#444545">
                <BackgroundImage HorizontalPosition="left" ImageUrl="~/App_Themes/BlackGlass/Web/rpTopEdge.gif"
                    Repeat="RepeatX" VerticalPosition="top" />
            </TopEdge>
            <LeftEdge BackColor="#C9D7DC">
                <BackgroundImage HorizontalPosition="left" ImageUrl="~/App_Themes/BlackGlass/Web/rpContentLeftEdge.gif"
                    Repeat="RepeatY" VerticalPosition="top" />
            </LeftEdge>
            <BottomRightCorner Height="10px" Url="~/App_Themes/BlackGlass/Web/rpBottomRightCorner.png"
                Width="10px" />
            <ContentPaddings PaddingLeft="2px" PaddingTop="10px" />
            <NoHeaderTopRightCorner Height="10px" Url="~/App_Themes/BlackGlass/Web/rpNoHeaderTopRightCorner.png"
                Width="10px" />
            <RightEdge BackColor="#C9D7DC">
                <BackgroundImage HorizontalPosition="right" ImageUrl="~/App_Themes/BlackGlass/Web/rpContentRightEdge.gif"
                    Repeat="RepeatY" VerticalPosition="top" />
            </RightEdge>
            <HeaderRightEdge BackColor="#444545">
                <BackgroundImage HorizontalPosition="right" ImageUrl="~/App_Themes/BlackGlass/Web/rpHeaderRightEdge.png"
                    Repeat="NoRepeat" VerticalPosition="top" />
            </HeaderRightEdge>
            <Border BorderStyle="None" />
            <Content BackColor="#C9D7DC">
                <BackgroundImage ImageUrl="~/App_Themes/BlackGlass/Web/rpContentBack.gif" VerticalPosition="top" />
            </Content>
            <HeaderLeftEdge BackColor="#444545">
                <BackgroundImage HorizontalPosition="left" ImageUrl="~/App_Themes/BlackGlass/Web/rpHeaderLeftEdge.png"
                    Repeat="RepeatX" VerticalPosition="top" />
            </HeaderLeftEdge>
            <HeaderStyle BackColor="White" Height="23px" HorizontalAlign="Left">
                <Paddings PaddingBottom="0px" PaddingLeft="3px" PaddingTop="0px" />
                <BackgroundImage ImageUrl="~/App_Themes/BlackGlass/Web/rpHeaderBack.gif" Repeat="RepeatX"
                    VerticalPosition="bottom" />
                <Border BorderStyle="None" />
            </HeaderStyle>
            <BorderTop BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
            <BottomEdge BackColor="#C9D7DC">
                <BackgroundImage ImageUrl="~/App_Themes/BlackGlass/Web/rpContentBottomEdge.gif" Repeat="RepeatX"
                    VerticalPosition="bottom" />
            </BottomEdge>
            <TopRightCorner Height="7px" Url="~/App_Themes/BlackGlass/Web/rpTopRightCorner.png"
                Width="10px" />
            <HeaderContent BackColor="#444545">
                <BackgroundImage HorizontalPosition="left" ImageUrl="~/App_Themes/BlackGlass/Web/rpHeaderBack.gif"
                    Repeat="RepeatX" VerticalPosition="top" />
            </HeaderContent>
            <NoHeaderTopEdge BackColor="#C9D7DC">
            </NoHeaderTopEdge>
            <NoHeaderTopLeftCorner Height="10px" Url="~/App_Themes/BlackGlass/Web/rpNoHeaderTopLeftCorner.png"
                Width="10px" />
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
            <TopLeftCorner Height="7px" Url="~/App_Themes/BlackGlass/Web/rpTopLeftCorner.png"
                Width="10px" />
            <BottomLeftCorner Height="10px" Url="~/App_Themes/BlackGlass/Web/rpBottomLeftCorner.png"
                Width="10px" />
        </dxrp:ASPxRoundPanel>
        
                          </td>
                </tr>
            </table>
        
    </div>
    </form>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewReport.aspx.cs" Inherits="PortalApp.config.ViewReport" %>

<%@ Register assembly="DevExpress.XtraReports.v15.1.Web, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" SettingsReportViewer-ShouldDisposeReport="false">
        </dx:ASPxDocumentViewer>
    
    </div>
    </form>
</body>
</html>

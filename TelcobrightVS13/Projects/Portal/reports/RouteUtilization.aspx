﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="True"
    CodeBehind="RouteUtilization.aspx.cs" Inherits="DefaultRtUtil" %>

<%--Common--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="MediationModel" %>
<%@ Import Namespace="PortalApp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
   
<%--Page Load and Other Server Side Asp.net scripts--%>
        <script runat="server">
        
            protected void Page_Load(object sender, EventArgs e)
            {
                //common code for report pages
                //view state of ParamBorder div
                string tempText = this.hidValueFilter.Value;
                bool lastVisible = this.hidValueFilter.Value == "invisible" ? false : true;
                if (this.hidValueSubmitClickFlag.Value == "false")
                {
                    if (lastVisible)
                    {
                        //show filters...
                        this.Page.ClientScript.RegisterStartupScript(GetType(), "MyKey", "ShowParamBorderDiv();", true);
                    }
                    else
                    {
                        //hide filters...
                        this.Page.ClientScript.RegisterStartupScript(GetType(), "MyKey", "HideParamBorderDiv();", true);
                    }
                }
                //set this month's start and End Date [Time] in the date picker controls...
                if (!this.IsPostBack)
                {
                    //set summary as report source default
                    this.DropDownListReportSource.SelectedIndex = 1;

                    this.TextBoxYear.Text = DateTime.Now.ToString("yyyy");
                    this.TextBoxYear1.Text = DateTime.Now.ToString("yyyy");
                    this.DropDownListMonth.SelectedIndex = int.Parse(DateTime.Now.ToString("MM")) - 1;
                    this.DropDownListMonth1.SelectedIndex = int.Parse(DateTime.Now.ToString("MM")) - 1;
                    //txtDate.Text = FirstDayOfMonthFromDateTime(System.DateTime.Now).ToString("dd/MM/yyyy");
                    //txtDate1.Text = LastDayOfMonthFromDateTime(System.DateTime.Now).ToString("dd/MM/yyyy");
                    this.txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    this.txtDate1.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    
                    
                    //set controls if page is called for a template
                    TreeView masterTree = (TreeView) this.Master.FindControl("TreeView1");
                    NameValueCollection n = this.Request.QueryString;
                    CommonCode commonCodes = new CommonCode();
                    if (n.HasKeys())
                    {
                        string templateName = "";
                        var items = n.AllKeys.SelectMany(n.GetValues, (k, v) => new { key = k, value = v });
                        foreach (var thisParam in items)
                        {
                            if (thisParam.key == "templ")
                            {
                                templateName = thisParam.value;
                                break;
                            }
                        }
                        if (templateName != "")
                        {
                            //set controls here ...
                            string retVal = commonCodes.SetTemplateControls(this, templateName);
                            if (retVal != "success")
                            {
                                string script = "alert('Error occured while loading template: " + templateName
                                    + "! " + Environment.NewLine + retVal + "');";
                                this.ClientScript.RegisterClientScriptBlock(GetType(), "Alert", script, true);
                                return;
                            }
                        }
                        //Load Report Templates in TreeView dynically from database.
                        CommonCode commonCode = new CommonCode();
                        commonCode.LoadReportTemplatesTree(ref masterTree);
                    }
                    //Retrieve Path from TreeView for displaying in the master page caption label
                    string localPath = this.Request.Url.LocalPath;
                    int pos2NdSlash = localPath.Substring(1, localPath.Length - 1).IndexOf("/");
                    string rootFolder = localPath.Substring(1, pos2NdSlash);
                    int endOfRootFolder = this.Request.Url.AbsoluteUri.IndexOf(rootFolder);
                    string urlWithQueryString = ("~" +"/"+rootFolder + this.Request.Url.AbsoluteUri.Substring((endOfRootFolder + rootFolder.Length), this.Request.Url.AbsoluteUri.Length - (endOfRootFolder + rootFolder.Length))).Replace("%20", " ");
                    TreeNodeCollection cNodes = masterTree.Nodes;
                    TreeNode matchedNode = null;
                    foreach (TreeNode N in cNodes)//for each nodes at root level, loop through children
                    {
                        matchedNode = commonCodes.RetrieveNodes(N, urlWithQueryString);
                        if (matchedNode != null)
                        {
                            break;
                        }
                    }
                    //set screentile/caption in the master page...
                    Label lblScreenTitle = (Label) this.Master.FindControl("lblScreenTitle");
            lblScreenTitle.Text = "";
                    if (matchedNode != null)
                    {
                        lblScreenTitle.Text = matchedNode.ValuePath;
                    }
                    else
                    {
                        lblScreenTitle.Text = "";
                    }
            if(lblScreenTitle.Text=="")
                    {
                        lblScreenTitle.Text = "Reports/Route Utilization/Ingress-Egress";
                    }

                    //End of Site Map Part *******************************************************************

                }

                this.hidValueSubmitClickFlag.Value = "false";
            }

            public DateTime FirstDayOfMonthFromDateTime(DateTime dateTime)
            {
                return new DateTime(dateTime.Year, dateTime.Month, 1);
            }

            public DateTime LastDayOfMonthFromDateTime(DateTime dateTime)
            {
                DateTime firstDayOfTheMonth = new DateTime(dateTime.Year, dateTime.Month, 1);
                return firstDayOfTheMonth.AddMonths(1).AddDays(-1);
            } 
         
        protected void DropDownListMonth_SelectedIndexChanged(object sender, EventArgs e)
            {   
                //select 15th of month to find out first and last day of a month as it exists in all months.
                DateTime anyDayOfMonth = new DateTime(int.Parse(this.TextBoxYear.Text), int.Parse(this.DropDownListMonth.SelectedValue), 15);
            this.txtDate.Text= FirstDayOfMonthFromDateTime(anyDayOfMonth).ToString("dd/MM/yyyy");
            }
         protected void DropDownListMonth1_SelectedIndexChanged(object sender, EventArgs e)
         {
             //select 15th of month to find out first and last day of a month as it exists in all months.
             DateTime anyDayOfMonth = new DateTime(int.Parse(this.TextBoxYear1.Text), int.Parse(this.DropDownListMonth1.SelectedValue), 15);
             this.txtDate1.Text = LastDayOfMonthFromDateTime(anyDayOfMonth).ToString("dd/MM/yyyy");
         }
         protected void ButtonTemplate_Click(object sender, EventArgs e)
         {
             //exit if cancel clicked in javascript...
             if (this.hidValueTemplate.Value == null || this.hidValueTemplate.Value == "")
             {
                 return;
             }

             //check for duplicate templatename and alert the client...
             string templateName = this.hidValueTemplate.Value;
             if (templateName == "")
             {
                 string script = "alert('Templatename cannot be empty!');";
                 this.ClientScript.RegisterClientScriptBlock(GetType(), "Alert", script, true);
                 return;
             }
             else if (templateName.IndexOf('=') >= 0 || templateName.IndexOf(':') >= 0 ||
                 templateName.IndexOf(',') >= 0 || templateName.IndexOf('?') >= 0)
             {
                 string script = "alert('Templatename cannot contain characters =:,?');";
                 this.ClientScript.RegisterClientScriptBlock(GetType(), "Alert", script, true);
                 return;
             }
             using (PartnerEntities context = new PartnerEntities())
             {
                 if (context.reporttemplates.Any(c => c.Templatename == templateName))
                 {
                     string script = "alert('Templatename: " + templateName + " exists, try a different name.');";
                     this.ClientScript.RegisterClientScriptBlock(GetType(), "Alert", script, true);
                     return;
                 }
             }
             string localPath = this.Request.Url.LocalPath;
             int pos2NdSlash = localPath.Substring(1, localPath.Length - 1).IndexOf("/");
             string rootFolder = localPath.Substring(1, pos2NdSlash);
             int endOfRootFolder = this.Request.Url.AbsoluteUri.IndexOf(rootFolder);
             string urlWithQueryString = "~" + this.Request.Url.AbsoluteUri.Substring((endOfRootFolder + rootFolder.Length), this.Request.Url.AbsoluteUri.Length - (endOfRootFolder + rootFolder.Length));
             int posQMark = urlWithQueryString.IndexOf("?");
             string urlWithoutQs = (posQMark < 0 ? urlWithQueryString : urlWithQueryString.Substring(0, posQMark)).Replace("~","~/reports").Replace("~","~/reports");
             CommonCode commonCode = new CommonCode();
             string retVal = commonCode.SaveTemplateControlsByPage(this, templateName, urlWithoutQs);
             TreeView masterTree = (TreeView) this.Page.Master.FindControl("Treeview1");
             commonCode.LoadReportTemplatesTree(ref masterTree);

             //Retrieve Path from TreeView for displaying in the master page caption label
             TreeNodeCollection cNodes = masterTree.Nodes;
             TreeNode matchedNode = null;
             foreach (TreeNode n in cNodes)//for each nodes at root level, loop through children
             {
                 matchedNode = commonCode.RetrieveNodes(n, urlWithoutQs + "?templ=" + templateName);
                 if (matchedNode != null)
                 {
                     break;
                 }
             }
             //set screentile/caption in the master page...
             Label lblScreenTitle = (Label) this.Master.FindControl("lblScreenTitle");
             if (matchedNode != null)
             {
                 lblScreenTitle.Text = matchedNode.ValuePath;
             }
             else
             {
                 lblScreenTitle.Text = "";
             }
             
             if (retVal == "success")
             {
                 string scrSuccess = "alert('Template created successfully');";
                 this.ClientScript.RegisterClientScriptBlock(GetType(), "Alert", scrSuccess, true);
             }
             
         }
         
     </script> 


</asp:Content>



<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
 <asp:Timer ID="Timer1" Interval="300000" runat="server" ontick="Timer1_Tick" ></asp:Timer>  
 <div id="report" style="clear:both;height:25px;background-color:white;padding-left:5px;width:1009px;margin-bottom:2px;">
    
    <script type="text/javascript">
        function ToggleParamBorderDiv() {
            var filter = document.getElementById('ParamBorder');
            if (filter.style.display == 'none') {
                filter.style.display = 'block';
                document.getElementById("<%= this.ShowHideFilter.ClientID %>").value = "Hide Filter";
                SetHidValueFilter("visible");
            }
            else {
                filter.style.display = 'none';
                document.getElementById("<%= this.ShowHideFilter.ClientID %>").value = "Show Filter";
                SetHidValueFilter("invisible");
            }
        }
        function HideParamBorderDiv() {
            var filter = document.getElementById('ParamBorder');
            filter.style.display = 'none';
            document.getElementById("<%= this.ShowHideFilter.ClientID %>").value = "Show Filter";
            SetHidValueFilter("invisible");

        }

        function HideParamBorderDivSubmit() {
            var filter = document.getElementById('ParamBorder');
            filter.style.display = 'none';
            document.getElementById("<%= this.ShowHideFilter.ClientID %>").value = "Show Filter";
            SetHidValueFilter("invisible");

        }

        function ShowParamBorderDiv() {
            var filter = document.getElementById('ParamBorder');
            filter.style.display = 'block';
            document.getElementById("<%= this.ShowHideFilter.ClientID %>").value = "Hide Filter";
            SetHidValueFilter("visible");
        }

        function ShowMessage(message) {
            alert(message);
        }

        function SetHidValueFilter(value) {
            document.getElementById("<%= this.hidValueFilter.ClientID%>").value = value;
        }

        function SetHidValueTemplate(value) {
            document.getElementById("<%= this.hidValueTemplate.ClientID%>").value = value;
        }

        function SethidValueSubmitClickFlag(value) {
            document.getElementById("<%= this.hidValueSubmitClickFlag.ClientID%>").value = value;
        }
            
    </script>

    
    <span style="padding-left:0px;float:left;left:0px;font-weight:bold;margin-top:2px;margin-right:20px;color:Black;"> Report:</span>
    <span style="font-weight:bold;"> Source</span>
     <asp:DropDownList ID="DropDownListReportSource" runat="server">
         <asp:ListItem Value="1">CDR</asp:ListItem>
         <asp:ListItem Value="2">Summary Data</asp:ListItem>
         <asp:ListItem Value="3">Error Table</asp:ListItem>
     </asp:DropDownList>


    <asp:Button ID="submit" runat="server" Text="Show Report" onclick="submit_Click" OnClientClick="SethidValueSubmitClickFlag('true');"/> 
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            style="margin-left: 0px" Text="Export" Visible="False" />
    <asp:Button ID="ShowHideFilter" runat="server" ViewStateMode="Enabled"
            style="margin-left: 0px" Text="Hide Filter" Visible="True" OnClientClick="ToggleParamBorderDiv();return false;"/>
    <asp:Button ID="ButtonTemplate" runat="server" OnClientClick="var value = prompt('Enter name of the Report Template:'); SetHidValueTemplate(value);" OnClick="ButtonTemplate_Click" 
            style="margin-left: 0px" Text="Save as Template" Visible="True"/>
    <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label> 
    <span style="font-weight:bold;"> Real Time Update 
            <asp:CheckBox ID="CheckBoxRealTimeUpdate" runat="server" AutoPostBack="true" oncheckedchanged="CheckBoxRealTimeUpdate_CheckedChanged"/></span>
        <span style="font-weight:bold;"> Update Duration Last  
        <asp:TextBox ID="TextBoxDuration" runat="server" Text="30" Width="30px" ontextchanged="TextBoxDuration_TextChanged" Enabled="false" ></asp:TextBox> Minutes</span>  
        <input type="hidden" id="hidValueFilter" runat="server"/>
        <input type="hidden" id="hidValueSubmitClickFlag" runat="server" value="false"/>
        <input type="hidden" id="hidValueTemplate" runat="server" />
 </div>   

<div>
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" > </ajaxToolkit:ToolkitScriptManager>
    
</div>



 <div id="ParamBorder" style="float:left;padding-top:3px;padding-left:10px;height:135px;display:block;border:2px ridge #E5E4E2;margin-bottom:5px;width:1100px;">
    <div style="height:20px;background-color:#f2f2f2;color:black;"> 
        <span style="float:left;font-weight:bold;padding-left:20px;">   Show Egress Erlang <asp:CheckBox ID="CheckBoxShowPerformance" runat="server" /></span> 
        <%--<div style="clear:right;"></div>--%>
        
    </div>
    <br />
    <%--date time div--%>
     <div id="DateTimeDiv" style="padding-left:5px;position:relative;float:left;left:10px;top:-11px;width:630px;z-index:10;background-color:#F7F6F3;height:70px;"> <%--Start OF date time/months field DIV--%>
     <span style="padding-left:0px;">
        
        Start Year/Month: 
        <asp:TextBox ID="TextBoxYear" runat="server" Text="" Width="30px"></asp:TextBox>
        Month <asp:DropDownList ID="DropDownListMonth" runat="server" 
          onselectedindexchanged="DropDownListMonth_SelectedIndexChanged" 
          AutoPostBack="True">
          <asp:ListItem Value="01">Jan</asp:ListItem>
          <asp:ListItem Value="02">Feb</asp:ListItem>
          <asp:ListItem Value="03">Mar</asp:ListItem>
          <asp:ListItem Value="04">Apr</asp:ListItem>
          <asp:ListItem Value="05">May</asp:ListItem>
          <asp:ListItem Value="06">Jun</asp:ListItem>
          <asp:ListItem Value="07">Jul</asp:ListItem>
          <asp:ListItem Value="08">Aug</asp:ListItem>
          <asp:ListItem Value="09">Sep</asp:ListItem>
          <asp:ListItem Value="10">Oct</asp:ListItem>
          <asp:ListItem Value="11">Nov</asp:ListItem>
          <asp:ListItem Value="12">Dec</asp:ListItem>
      </asp:DropDownList>

      End Year/Month: 
        <asp:TextBox ID="TextBoxYear1" runat="server" Text="" Width="30px"></asp:TextBox>
        Month <asp:DropDownList ID="DropDownListMonth1" runat="server" 
          onselectedindexchanged="DropDownListMonth1_SelectedIndexChanged" AutoPostBack="True">
          <asp:ListItem Value="01">Jan</asp:ListItem>
          <asp:ListItem Value="02">Feb</asp:ListItem>
          <asp:ListItem Value="03">Mar</asp:ListItem>
          <asp:ListItem Value="04">Apr</asp:ListItem>
          <asp:ListItem Value="05">May</asp:ListItem>
          <asp:ListItem Value="06">Jun</asp:ListItem>
          <asp:ListItem Value="07">Jul</asp:ListItem>
          <asp:ListItem Value="08">Aug</asp:ListItem>
          <asp:ListItem Value="09">Sep</asp:ListItem>
          <asp:ListItem Value="10">Oct</asp:ListItem>
          <asp:ListItem Value="11">Nov</asp:ListItem>
          <asp:ListItem Value="12">Dec</asp:ListItem>
      </asp:DropDownList>

      </span>


    <div style="float:left;width:280px;">
        Start Date [Time] <asp:TextBox id="txtDate" Runat="server" /> 
        <asp:CalendarExtender ID="CalendarStartDate" runat="server" 
            TargetControlID="txtDate"  PopupButtonID="txtDate" Format="dd/MM/yyyy">
        </asp:CalendarExtender>     
        
        
    </div>
    
    <div style="float:left;width:280px;">
        End Date [Time] <asp:TextBox id="txtDate1" Runat="server" />
        <asp:CalendarExtender ID="CalendarEndDate" runat="server" 
            TargetControlID="txtDate1"  PopupButtonID="txtDate1" Format="dd/MM/yyyy">
        </asp:CalendarExtender>     
    </div>
   
    <div style="font-size:smaller;text-align:left;overflow:visible;clear:left;color:#8B4500;">[Enter only Date in "dd/MM/yyyy (e.g. 21/11/2012) or Date+Time in "dd/MM/yyyy HH:mm:ss" (e.g. 21/11/2012 19:01:59) format]</div>

</div> <%--END OF date time/months field DIV--%>
<div id="TimeSummary" style="float:left;margin-left:15px;padding-left:20px;height:70px;width: 280px;background-color: #faebd7;margin-top: -10px;">
    <div style="font-weight:bold;float:left;">Period wise Summary<asp:CheckBox ID="CheckBoxDailySummary" runat="server" /></div> 
    <div style="clear:left;margin-top:5px;"></div>
    <div style="float:left; margin-right:5px;">
        <asp:RadioButton ID="RadioButtonHalfHourly" Text="Half Hourly" GroupName="Time" runat="server" AutoPostBack="false"/><br />
        <asp:RadioButton ID="RadioButtonHourly" Text="Hourly" GroupName="Time" runat="server" AutoPostBack="false"/>
    </div>
    <div style="float:left;margin-right:5px;">
        <asp:RadioButton ID="RadioButtonDaily" Text="Daily" GroupName="Time" runat="server" AutoPostBack="false" Checked="true"/><br />
        <asp:RadioButton ID="RadioButtonWeekly" Text="Weekly" GroupName="Time" runat="server" AutoPostBack="false" Checked="false"/><br />
    </div>
    <div style="float:left;">
        <asp:RadioButton ID="RadioButtonMonthly" Text="Monthly" GroupName="Time" runat="server" AutoPostBack="false" Checked="false"/><br />
        <asp:RadioButton ID="RadioButtonYearly" Text="Yearly" GroupName="Time" runat="server" AutoPostBack="false"/>
    </div>
</div>    
       
       <div id="PartnerFilter" style="margin-top:-4px;margin-left:10px;float:left;width:1080px;padding-left:5px;background-color:#f2f2f2;">
           <%--<span style="font-size: smaller;position:relative;left:-53px;padding-left:0px;clear:right;">[Enter only Date in "dd/MM/yyyy (e.g. 21/11/2012) or Date+Time in "dd/MM/yyyy HH:mm:ss" (e.g. 21/11/2012 19:01:59) format]</span>   --%>

            <div style="text-align:left;">
                
                <div style="float:left; height: 25px;">

                <div style="float:left;">
                    
                    Route: 
                        
                    <asp:DropDownList ID="DropDownListPartner" runat="server" 
                        DataSourceID="SqlDataSource3" DataTextField="PartnerName" 
                        DataValueField="idPartner" Enabled="true">
                    </asp:DropDownList>
                    
                    <span style="padding-left:50px;">W=</span> <asp:TextBox ID="TextBoxW" runat="server" Text=".6"></asp:TextBox>
                </div>
                
                &nbsp;&nbsp;

        
               
             </div>
                
            </div>
       </div>
       <%--End Div Partner***************************************************--%>

          
</div> <%--Param Border--%>

    
    <%--All Partners Combo--%>
 
<asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:Reader %>" 
                ProviderName="<%$ ConnectionStrings:Reader.ProviderName %>" 
                SelectCommand="AllRoute" SelectCommandType="StoredProcedure">
              </asp:SqlDataSource>


<%--ListView Goes Here***************DataFormatString="{0:F2}" ****--%>
<div style="float:left;text-align:left;width:900px;position:relative;top:0px;padding-left:5px;">
    
    <div style="width:760px;text-align:center;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="Vertical" 
            onrowdatabound="GridView1_RowDataBound">
            <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="RouteName" HeaderText="Ingress Route" SortExpression="RouteName" />
            <asp:BoundField DataField="Ports" HeaderText="No. Of Ports" SortExpression="Ports" />
            <asp:BoundField DataField="TotalCalls" HeaderText="Total Calls" SortExpression="TotalCalls" />
            <asp:BoundField DataField="SuccessfulCalls" HeaderText="Successful Calls" SortExpression="SuccessfulCalls" />
            <asp:BoundField DataField="FailedCalls" HeaderText="Failed Calls" SortExpression="FailedCalls" />    
            <asp:BoundField DataField="TotalMinutes" HeaderText="Total Minutes" SortExpression="TotalMinutes" DataFormatString="{0:F2}"/>
            <asp:BoundField DataField="TimeSpanSec" HeaderText="Time Span (Hour)" SortExpression="TimeSpanSec" DataFormatString="{0:F2}" />    
            <asp:BoundField DataField="Ec" HeaderText="CarriedErlang" SortExpression="Ec" DataFormatString="{0:F2}"/>
            <asp:BoundField DataField="Eo" HeaderText="Offered Erlang" SortExpression="Eo" DataFormatString="{0:F2}"/>
            <asp:BoundField DataField="EcPerPort" HeaderText="Erlang/Port" SortExpression="EcPerPort" DataFormatString="{0:F2}"/>
            <asp:BoundField DataField="MHT" HeaderText="MHT (Sec)" SortExpression="MHT" DataFormatString="{0:F2}"/>
            <asp:BoundField DataField="Utilization" HeaderText="Utilization" SortExpression="Utilization" DataFormatString="{0:F2}"/>

        </Columns>
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="true" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="white" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    </div>

</div>
    
    
</asp:Content>


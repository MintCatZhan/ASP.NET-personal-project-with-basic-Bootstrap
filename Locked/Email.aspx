<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="WebApplication2.Locked.Email" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>

<script language="c#" runat="server">

    public void SendEmail(object sender, EventArgs e)
    {
        MailMessage newMsg = new MailMessage();

        foreach (GridViewRow gvRow in gvAccount.Rows)
        {
            CheckBox cb = (CheckBox)gvRow.FindControl("chkEmail");

            if (cb != null && cb.Checked)
            {
                newMsg.To.Add(new MailAddress(gvRow.Cells[2].Text, gvRow.Cells[1].Text));
            }
        }

        newMsg.From = new MailAddress("yzh210@student.monash.edu", "YuanZhan");
        newMsg.Subject = subject.Text;
        newMsg.Body = message.Text;

        try
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.monash.edu.au";
            smtp.Send(newMsg);
            lblMail.Text = "Mail Successfully Sent";
        }
        catch (Exception exc)
        {
            lblMail.Text = exc.Message;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" method="post" runat="server">
        <asp:AccessDataSource ID="dsForMail" runat="server" DataFile="~/AccountInfo.accdb" SelectCommand="SELECT [ID],[account_name], [email] FROM [AccountInfo]"></asp:AccessDataSource>
        <asp:Label runat="server" ID="lblMail" />

        <asp:GridView class="table table-striped" runat="server" ID="gvAccount" DataSourceID="dsForMail" AutoGenerateColumns="false" DataKeyNames="ID" AllowSorting="true">
            <Columns>
                <asp:BoundField DataField="ID" Visible="false" SortExpression="ID" />
                <asp:BoundField DataField="account_name" HeaderText="Account Name" SortExpression="account_name" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"/>
                <asp:TemplateField HeaderText="Select">
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="chkEmail" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br /><br />

        <table class="table table-striped">
            <tr>
                <td>From</td>
                <td>Overwatch</td>
            </tr>
            <tr>
                <td>Subject</td>
                <td>
                    <asp:TextBox class="form-control" Width="30%" ID="subject" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Message</td>
                <td>
                    <asp:TextBox runat="server" Width="80%" ID="message" class="form-control" TextMode="MultiLine" />
                </td>
            </tr>
        </table>

        <asp:Button class="btn btn-primary" ID="SendMail" runat="server" Text="Send Email" OnClick="SendEmail" />
    </form>

</asp:Content>

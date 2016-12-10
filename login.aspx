<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server" language="C#">
    void Login_Authenticate(object sender, AuthenticateEventArgs e)
    {
        DS1.SelectCommand = "SELECT * FROM login WHERE usernames = '" + login.UserName + "' AND password = '" + login.Password + "'";
        DS1.Select(DataSourceSelectArguments.Empty);
    }

    private void CheckLogin(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows > 0)
        {
            FormsAuthentication.RedirectFromLoginPage(login.UserName, false);
        }
        else
        {
            login.FailureText = "Invalid Login";
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:AccessDataSource ID="DS1" runat="server" DataFile="~/login.accdb" OnSelected="CheckLogin" />
    <form runat="server">
        <asp:Login ID="login" runat="server" OnAuthenticate="Login_Authenticate" TitleText="Entering" UserNameLabelText="Username: " UserNameRequiredErrorMessage="required"
             PasswordLabelText="Password: " PasswordRequiredErrorMessage="pass required" LoginButtonText="click to login" DisplayRememberMe="false" DestinationPageUrl="~/Home.aspx">
        </asp:Login>
        <p />
        <asp:ValidationSummary ID="vlSummary1" Font-Names="Arial" Visible="true" runat="server" ValidationGroup="Login" HeaderText="fix it: " />
    </form>
</body>
</html>

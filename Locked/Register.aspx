<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication2.Register" %>


<script runat="server">

    protected void cvAN_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        if (accountName.Text.Length > 10)
        {
            feedbackLabel.Visible = true;
            feedbackLabel.Text = "Account name is too long";
            return;
        }
        args.IsValid = true;
    }

    protected void detials_Click(object sender, EventArgs e)
    {
        pnlgvAcc.Visible = true;
        gvAccInfo.Visible = true;
        successRegisterPanel.Visible = false;
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        if (!(Page.IsValid))
        {
            return;
        }
        if (accountName.Text.Length > 10)
        {
            registerPanel.Visible = false;
            feedbackLabel.Visible = true;
            feedbackLabel.Text = "Account name is too long";
        }
        else
        {
            registerPanel.Visible = false;
            savedSucs.Visible = false;
            successRegisterPanel.Visible = true;
            accName.Text = accountName.Text;
            fname.Text = firstname.Text;
            lname.Text = lastname.Text;
            ageInput.Text = age.Text;
            level.Text = gamelevel.Text;
            emailAdd.Text = email.Text;
            wayToKnow.Text = howToKnow.Text;
            inputPassword.Text = confirmPassword.Text;
            accInfo.InsertParameters[0].DefaultValue = accountName.Text;
            accInfo.InsertParameters[1].DefaultValue = firstname.Text;
            accInfo.InsertParameters[2].DefaultValue = lastname.Text;
            accInfo.InsertParameters[3].DefaultValue = confirmPassword.Text;
            accInfo.InsertParameters[4].DefaultValue = age.Text;
            accInfo.InsertParameters[5].DefaultValue = gamelevel.Text;
            accInfo.InsertParameters[6].DefaultValue = email.Text;
            accInfo.InsertParameters[7].DefaultValue = howToKnow.Text;
            accInfo.InsertParameters[8].DefaultValue = whatever.Text;
            accInfo.Insert();
            savedSucs.Visible = true;
        }
    }

    void displayData(Object sender, GridViewCommandEventArgs e)
    {
        displayLbl.Text = "Account Name: " +
            gvAccInfo.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text + "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" +
            "First Name: " +
            gvAccInfo.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text + "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" +
            "Last Name: " +
            gvAccInfo.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].Text;
    }
    
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <input class="btn btn-success" type="button" value="Search" onclick="location.href='Search.aspx'" />
    </div>

    <asp:AccessDataSource DataFile="~/AccountInfo.accdb" ID="accInfo" runat="server"
        InsertCommand="INSERT INTO [AccountInfo]([account_name],[first_name],[last_name],[password],[age],[level],[email],[howToKnow],[whatever]) VALUES (?,?,?,?,?,?,?,?,?)"
        SelectCommand="SELECT * From [AccountInfo]">
        <InsertParameters>
            <asp:FormParameter Name="account_name" Type="String" />
            <asp:FormParameter Name="first_name" Type="String" />
            <asp:FormParameter Name="last_name" Type="String" />
            <asp:FormParameter Name="password" Type="String" />
            <asp:FormParameter Name="age" Type="String" />
            <asp:FormParameter Name="level" Type="String" />
            <asp:FormParameter Name="email" Type="String" />
            <asp:FormParameter Name="howToKnow" Type="String" />
            <asp:FormParameter Name="whatever" Type="string" />
        </InsertParameters>
    </asp:AccessDataSource>

    <asp:AccessDataSource runat="server" DataFile="~/AccountInfo.accdb" ID="dtlAccInfo"
        SelectCommand="SELECT [account_name],[first_name],[last_name],[age],[level],[email],[howToKnow],[whatever] FROM [AccountInfo] WHERE [ID]=? "></asp:AccessDataSource>
    <div>
        <form runat="server">
            <h1>Register</h1>
            <asp:Label ID="savedSucs" runat="server" Visible="false" Text="Account Created Successfully." />
            <asp:Panel ID="registerPanel" runat="server" Visible="true">
                <table class="table table-striped">
                    <tr>
                        <td>Account Name:</td>
                        <td>
                            <asp:TextBox class="form-control" Width="30%" ID="accountName" runat="server" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rvAN" runat="server"
                                ErrorMessage="Please input an account name" ControlToValidate="accountName" Display="Dynamic" />
                            <asp:Label ID="feedbackLabel" runat="server" Visible="false" />
                            <asp:CustomValidator ID="cvAN" runat="server"
                                OnServerValidate="cvAN_ServerValidate" ControlToValidate="accountName" Display="Dynamic" />
                        </td>
                    </tr>

                    <tr>
                        <td>Set password:</td>
                        <td>
                            <asp:TextBox class="form-control" Width="30%" ID="setPassword" runat="server" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rvSPW" runat="server"
                                ErrorMessage="Please set a password" ControlToValidate="setPassword" Display="Dynamic" />
                        </td>
                    </tr>

                    <tr>
                        <td>Confirm password:</td>
                        <td>
                            <asp:TextBox class="form-control" Width="30%" ID="confirmPassword" runat="server" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ErrorMessage="Please set a password" ControlToValidate="setPassword" Display="Dynamic" />
                            <asp:CompareValidator ID="cvPW" runat="server" ErrorMessage="Wrong password"
                                ControlToCompare="setPassword" ControlToValidate="confirmPassword" Display="Dynamic" />
                        </td>
                    </tr>

                    <tr>
                        <td>First Name:</td>
                        <td>
                            <asp:TextBox ID="firstname" class="form-control" Width="30%" runat="server" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rvFN" runat="server"
                                ErrorMessage="Please input firstname" ControlToValidate="firstname" Display="Dynamic" />
                        </td>
                    </tr>

                    <tr>
                        <td>Last Name:</td>
                        <td>
                            <asp:TextBox ID="lastname" class="form-control" Width="30%" runat="server" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rvLN" runat="server"
                                ErrorMessage="Please input lastname" ControlToValidate="lastname" Display="Dynamic" />
                        </td>
                    </tr>

                    <tr>
                        <td>Age:</td>
                        <td>
                            <asp:TextBox ID="age" class="form-control" Width="30%" runat="server" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rvAGE" runat="server"
                                ErrorMessage="Please input age" ControlToValidate="age" Display="Dynamic" />
                            <asp:RangeValidator ID="rgvAGE" runat="server"
                                ErrorMessage="Please input a valid age" ControlToValidate="age" MaximumValue="120"
                                MinimumValue="12" Type="Integer" Display="Dynamic" />
                        </td>
                    </tr>

                    <tr>
                        <td>Game level:</td>
                        <td>
                            <asp:DropDownList ID="gamelevel" runat="server">
                                <asp:ListItem>Master</asp:ListItem>
                                <asp:ListItem>Some experience</asp:ListItem>
                                <asp:ListItem>Beginner</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>Email:</td>
                        <td>
                            <asp:TextBox class="form-control" Width="30%" ID="email" runat="server" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rvEMail" runat="server"
                                ErrorMessage="Please input email" ControlToValidate="email" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                ControlToValidate="email" ErrorMessage="Wrong format" Display="Dynamic"
                                ValidationExpression=".*@.*\..*" />
                        </td>
                    </tr>

                    <tr>
                        <td>How do you know Overwatch?</td>
                        <td>
                            <asp:ListBox ID="howToKnow" runat="server">
                                <asp:ListItem>By friend</asp:ListItem>
                                <asp:ListItem>By advertisment</asp:ListItem>
                                <asp:ListItem>By website</asp:ListItem>
                            </asp:ListBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rvHowToKnow" runat="server"
                                ErrorMessage="Please select an option" ControlToValidate="howToKnow" Display="Dynamic" />
                        </td>
                    </tr>

                    <tr>
                        <td>Pick 12345 whatever</td>
                        <td>
                            <asp:RadioButtonList ID="whatever" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="neededit" runat="server"
                                ErrorMessage="Please select an option" ControlToValidate="whatever" Display="Dynamic" />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:CheckBox ID="ck1" runat="server" />
                            I have read this documents blblblblbl
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ErrorMessage="Please select an option" ControlToValidate="howToKnow" Display="Dynamic" />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Button class="btn btn-primary" ID="submit" runat="server" Text="Register" OnClick="submit_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>

            <asp:Panel ID="successRegisterPanel" runat="server" Visible="false">
                <div class="panel panel-default">
                    <div class="panel-heading">Account Name: </div>
                    <div class="panel-body">
                        <asp:Label ID="accName" runat="server" /><br />
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">First Name: </div>
                    <div class="panel-body">
                        <asp:Label ID="fname" runat="server" /><br />
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">Last Name: </div>
                    <div class="panel-body">
                        <asp:Label ID="lname" runat="server" /><br />
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">Age: </div>
                    <div class="panel-body">
                        <asp:Label ID="ageInput" runat="server" /><br />
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">Level: </div>
                    <div class="panel-body">
                        <asp:Label ID="level" runat="server" /><br />
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">Email Address: </div>
                    <div class="panel-body">
                        <asp:Label ID="emailAdd" runat="server" /><br />
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">How to know: </div>
                    <div class="panel-body">
                        <asp:Label ID="wayToKnow" runat="server" /><br />
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">Password: </div>
                    <div class="panel-body">
                        <asp:Label ID="inputPassword" runat="server" Visible="false" /><br />
                    </div>
                </div>
                <div>
                    <asp:Button runat="server" Text="Click here to see all the records" class="btn btn-primary" ID="details" OnClick="detials_Click" />"
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlgvAcc" Visible="false">
                <asp:GridView OnRowCommand="displayData" Visible="true" runat="server" ID="gvAccInfo" DataSourceID="accInfo" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="account_name" HeaderText="Account Name" ReadOnly="True" />
                        <asp:BoundField DataField="first_name" HeaderText="First Name" ReadOnly="true" />
                        <asp:BoundField DataField="last_name" HeaderText="Last Name" ReadOnly="true" />
                        <asp:HyperLinkField DataTextField="email" HeaderText="Email" DataNavigateUrlFields="email" DataNavigateUrlFormatString="Home.aspx" />
                        <asp:ButtonField ButtonType="Button" Text="View Details" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>
            <div>
                <asp:Label class="label label-default" ID="displayLbl" runat="server" />
            </div>
        </form>
    </div>
</asp:Content>

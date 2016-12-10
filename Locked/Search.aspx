<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebApplication2.Search" %>

<script language="c#" runat="server">

    private void findCust(object sender, EventArgs e)
    {
        Button btn = (Button)sender;

        switch (btn.CommandName)
        {
            case "Id":
                lothian.SelectCommand = "SELECT * FROM AccountInfo WHERE ID LIKE '%" + cusID.Text.Trim(' ') + "%'";
                break;
            case "Name":
                lothian.SelectCommand = "SELECT * FROM AccountInfo WHERE account_name LIKE '%" + cusName.Text.Trim(' ') + "%'";
                break;
            case "Email":
                lothian.SelectCommand = "SELECT * FROM AccountInfo WHERE email LIKE '%" + cusEmail.Text.Trim(' ') + "%'";
                break;
        }



        lv.DataSource = lothian;
        lv.DataBind();


        if (lv.Items.Count == 0)
        {
            notFoundMsg.Visible = true;
        }
        else
        {
            notFoundMsg.Visible = false;
        }
    }


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:AccessDataSource ID="lothian" DataFile="~/AccountInfo.accdb" runat="server" />
    <form runat="server">
        <h2>Find a user</h2>
        <table class="table table-striped">
            <tr>
                <td>Customer ID</td>
                <td>
                    <asp:TextBox ID="cusID" class="form-control" runat="server" />
                </td>
                <td>
                    <asp:Button Text="Search by ID" class="btn btn-primary" runat="server" ID="srhId" OnClick="findCust" CommandName="Id" />
                </td>
            </tr>
            <tr>
                <td>Account Name</td>
                <td>
                    <asp:TextBox ID="cusName" class="form-control" runat="server" />
                </td>
                <td>
                    <asp:Button Text="Search by Name" class="btn btn-primary" runat="server" ID="srhName" OnClick="findCust" CommandName="Name" />
                </td>
            </tr>
            <tr>
                <td>Customer Email Addess</td>
                <td>
                    <asp:TextBox ID="cusEmail" class="form-control" runat="server" />
                </td>
                <td>
                    <asp:Button Text="Search by Email Address" class="btn btn-primary" runat="server" ID="srhEmail" OnClick="findCust" CommandName="Email" />
                </td>
            </tr>
        </table>

        <br />
        <br />
        <br />
        <asp:Label runat="server" ID="notFoundMsg" Text="No result" Visible="false"></asp:Label>
        <asp:ListView runat="server" ID="lv">
            <ItemTemplate>
                <table class="table table-striped">
                    <tr>
                        <td>Account Name: 
                        </td>
                        <td>
                            <%# Eval("account_name") %>
                        </td>
                    </tr>
                    <tr>
                        <td>First Name: 
                        </td>
                        <td>
                            <%# Eval("first_name") %>
                        </td>
                    </tr>
                    <tr>
                        <td>Last Name: 
                        </td>
                        <td>
                            <%# Eval("last_name") %>
                        </td>
                    </tr>
                    <tr>
                        <td>Age:
                        </td>
                        <td>
                            <%# Eval("age") %>
                        </td>
                    </tr>
                    <tr>
                        <td>Email:
                        </td>
                        <td>
                            <%# Eval("email") %>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:ListView>

    </form>

</asp:Content>

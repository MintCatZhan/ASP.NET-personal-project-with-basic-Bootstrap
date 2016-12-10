<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="WebApplication2.FAQ" %>


<script runat="server">
    void Page_load(Object sender, EventArgs e)
    {
        Calendar calendar = new Calendar();
        mainForm.Controls.Add(calendar);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Q. Will there be any other ways to get into the Closed Beta besides opting-in?
    </p>
    <p>
        Not at this time. Also, please note that Overwatch beta keys do not exist. Access to the Closed Beta will be provided solely through account flagging. 
    </p>
    <p>
        Q. How many players do you plan to invite to the Closed Beta?
    </p>
    <p>
        The number of players we invite will be largely based on our testing needs. We also want to make sure the game’s matchmaking system remains in a relatively healthy place throughout this phase of testing. As a result, if we determine we need more players to test new features or keep matches running smoothly, we’ll continue to add people to the Closed Beta from our opt-in pool.
    </p>
    <form runat="server" id="mainForm">
        
    </form>

</asp:Content>

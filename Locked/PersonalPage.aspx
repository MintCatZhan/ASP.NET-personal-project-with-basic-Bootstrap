<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PersonalPage.aspx.cs" Inherits="WebApplication2.Locked.PersonalPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
            <h1>This is a personal page published by the author.The ideas and information expressed
         on it have not been approved or authorised by Monash University either explicitly 
        or implicitly. In no event shall Monash University be liable for any damages whatsoever
         resulting from any action arising in connection with the use of this information or 
        its publication, including any action for infringement of copyright or defamation.</h1>
        </div>
        <div>
            <asp:HyperLink NavigateUrl="~/Home.aspx" Text="Back" runat="server" />
        </div>
    </form>
</asp:Content>

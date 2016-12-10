<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    <asp:HyperLink runat="server" NavigateUrl="~/Locked/FAQ.aspx" Text="FAQ" /><br />
    <asp:HyperLink runat="server" NavigateUrl="~/Locked/History.aspx" Text="History" />
</asp:Content>

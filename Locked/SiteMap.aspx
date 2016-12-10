<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SiteMap.aspx.cs" Inherits="WebApplication2.SiteMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <asp:SiteMapDataSource ID="sm1" runat="server" />
        <asp:TreeView runat="server" DataSourceID="sm1" />
    </form>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication2.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul>
        <li>
            <asp:HyperLink runat="server" NavigateUrl="mailto:yzh210@student.monash.edu" Text="Author" />
        </li>
        <li>
            <asp:HyperLink runat="server" NavigateUrl="~/PersonalPage.aspx" Text="Personal Page" />
        </li>
        <li>
            <asp:HyperLink runat="server" NavigateUrl="http://www.monash.edu/disclaimer-copyright" Text="Monash Disclaimer" />
        </li>
        <li>
            Copyright @Yuan Zhan
        </li>
        <li>
            Acknowledgement
        </li>
    </ul>
    <asp:AdRotator runat="server" id="ad1" AdvertisementFile="~/ad.xml" />
    <asp:AdRotator runat="server" id="ad2" AdvertisementFile="~/ad.xml" />
</asp:Content>

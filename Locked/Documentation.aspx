<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Documentation.aspx.cs" Inherits="WebApplication2.Documentation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul>
        <li>Name: Yuan Zhan</li>
        <li>Student ID: 26693267</li>
        <li>Unit Name: Internet Applicaiton Development</li>
        <li>Unit Provider: Monash University, The Caulfield School of Information Technology</li>
        <li>Assignment Number: Credit part</li>
        <li>Data of submission: 28 Aug 2016</li>
        <li>Tutor Name: Linh Chu</li>
        <li>
            <asp:HyperLink runat="server" Text="Linh Chu" NavigateUrl="mailto:linh.chu@monash.edu" />
        </li>
        <li>
            <asp:HyperLink Text="Assignment specification" NavigateUrl="http://moodle.vle.monash.edu/mod/page/view.php?id=3321999" runat="server" />
        </li>
    </ul>
</asp:Content>

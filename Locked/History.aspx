<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="WebApplication2.History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <img src="../Pix/mei.jpg" />
        <p>
            Thirty years ago, in a future not too dissimilar to ours, the world was sowing the seeds of its own destruction.<br />
            Designed to bolster manufacturing and create worldwide economic equality,
            <br />
            the world designed omnic robots which were built by A.I. centres around the world called Omniums. Eventually however the unthinkable happened,<br />
            the Omniums went rogue and began churning out military robots to destroy humanity.
            <br />
            When governments failed to stop the Omniums the UN created an international task force to fight them.<br />
            Bringing together the best and brightest from around the world this task force named 'Overwatch' would wage an asymmetrical war against the robots.<br />
            The small 5-Man strike team was made up by German soldier Reinhardt Wilhelm, Swedish engineer Torbjorn Lindhorn,<br />
            Egyptian sniper ace Anna Amari and two soldiers from the United States' Soldier Enhancement Program: long-time friends Gabriel Reyes and Jack Morrison.<br />
            Reyes became the team's leader but it was Morrison who became its figurehead, moulding the team into an effective fighting force.
            <br />
            They fought the Omnic robots in what would become known as the Omnic Crisis. It lasted for years and years, displacing India’s population, ravaging Australia,
            <br />
            devastating Siberia and besieging the Korean Peninsula with a highly adaptable giant sea-robot. But despite the adversity there were triumphs.
            <br />
            The Russians defeated and shut down their Omnium and South Korea created mecha suits to fight the sea-robot.
            <br />
            The Crisis claimed many lives on both sides but finally the humans, thanks in no small part to Overwatch, prevailed.<br />
        </p>
    </div>
    <div>
        <form runat="server">
            <asp:SiteMapDataSource runat="server" ID="sds1" />
            <asp:Menu runat="server" DataSourceID="sds1" />
        </form>
    </div>
</asp:Content>

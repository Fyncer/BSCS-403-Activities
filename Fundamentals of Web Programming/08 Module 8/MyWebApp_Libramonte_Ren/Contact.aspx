<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="MyWebApp_Libramonte_Ren.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Contact? Secret.</h3>
        <address>
            STI Ortigas-Cainta,<br />
            Ortigas Extension 1234<br />
            <abbr title="Phone">P:</abbr>
            09123456789
        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:Support@example.com">MyFirstWebApp@example.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">NotMyWebApp@example.com</a>
        </address>
    </main>
</asp:Content>

<%@ Page Title="Modyfikacja edycji" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editions.aspx.cs" Inherits="Projekt2.Editions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Edycje</h3>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SYMBOL_EDYCJI" DataSourceID="SqlDataSource1" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="SYMBOL_EDYCJI" HeaderText="Symbol Edycji" ReadOnly="True" SortExpression="SYMBOL_EDYCJI" />
            <asp:BoundField DataField="NAZWA_EDYCJI" HeaderText="Nazwa" SortExpression="NAZWA_EDYCJI" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" SelectCommand="SELECT * FROM [EDYCJA]"></asp:SqlDataSource>
    
</asp:Content>

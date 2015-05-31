<%@ Page Title="Logowanie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Projekt2.Login" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Strona logowania</h3>
    
    <div class="form-group">
        <label class="col-sm-2 control-label">Nazwa użytkownika</label>
        <div class="col-sm-10">
            <asp:TextBox ID="UserName" runat="server" class="form-control" placeholder="Nazwa użytkownika"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Hasło</label>
        <div class="col-sm-10">
            <asp:TextBox ID="UserPass" TextMode="Password" runat="server" class="form-control" placeholder="Hasło"/>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox">
                <label>
                    <asp:CheckBox ID="Persist" runat="server" />
                    Pamiętaj mnie
                </label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <asp:Button ID="Submit1" OnClick="Logon_Click" Text="Zaloguj" runat="server" />
        </div>
    </div>
    
</asp:Content>

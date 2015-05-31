<%@ Page Title="Zmiana hasła" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="Projekt2.Account" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Zmiana hasła</h3>

    <div class="form-group">
        <label class="col-sm-2 control-label">Nowe hasło</label>
        <div class="col-sm-10">
            <asp:TextBox ID="UserPass" TextMode="Password" runat="server" CssClass="form-control" placeholder="Hasło" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Potwierdź hasło</label>
        <div class="col-sm-10">
            <asp:TextBox ID="UserPassConfirm" TextMode="Password" runat="server" CssClass="form-control" placeholder="Potwierdzenie hasła" />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Potwierdzenie hasła musi być takie samo jak hasło." ControlToCompare="UserPassConfirm" ControlToValidate="UserPass" ForeColor="Red"></asp:CompareValidator>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10" style="padding-top: 10px;">
            <asp:Button ID="ChangePassword" Text="Zmień hasło" runat="server" OnClick="ChangePassword_Click" CssClass="btn-primary btn" />
        </div>
    </div>
</asp:Content>

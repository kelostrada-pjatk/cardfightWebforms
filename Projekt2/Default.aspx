<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Projekt2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Karty kolekcjonerskie</h1>
        <p class="lead">System do przechowywania kart kolekcjonerskich Cardfight!! Vanguard.</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Kolekcjonuj karty</h2>
            <p>
                Aplikacja pozwala na dodawanie nowych kart do systemu, a także na modyfikacje istniejących.
            </p>
            <p>
                <a class="btn btn-default" href="/Cards.aspx">Przejdź &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Buduj talie</h2>
            <p>
                Każdy użytkownik może tworzyć swoje talie i kolekcje kart, modyfikować je i usuwać.
            </p>
            <p>
                <a class="btn btn-default" href="/Decks.aspx">Przejdź &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Zarządzaj edycjami</h2>
            <p>
                Możesz w dowolny sposób dodawać edycje i nowe klany.
            </p>
            <p>
                <a class="btn btn-default" href="/Editions.aspx">Przejdź &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>

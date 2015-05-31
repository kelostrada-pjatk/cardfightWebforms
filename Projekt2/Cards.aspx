<%@ Page Title="Modyfikacja kart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cards.aspx.cs" Inherits="Projekt2.Cards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-6">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID_KARTY" DataSourceID="SqlDataSource1" PageSize="15" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="NUMER_KARTY" HeaderText="Numer" SortExpression="NUMER_KARTY" />
                    <asp:BoundField DataField="NAZWA_KARTY" HeaderText="Nazwa" SortExpression="NAZWA_KARTY" />
                    <asp:BoundField DataField="SYMBOL_EDYCJI" HeaderText="Edycja" SortExpression="SYMBOL_EDYCJI" />
                    <asp:BoundField DataField="ID_PROJEKTANTA" HeaderText="Projektant" SortExpression="ID_PROJEKTANTA" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-lg-6">
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ID_KARTY" DataSourceID="SqlDataSource2" CssClass="table table-striped table-bordered">
                <Fields>
                    <asp:BoundField DataField="NUMER_KARTY" HeaderText="Numer" SortExpression="NUMER_KARTY" />
                    <asp:BoundField DataField="SYMBOL_EDYCJI" HeaderText="Edycja" SortExpression="SYMBOL_EDYCJI" />
                    <asp:BoundField DataField="NAZWA_KARTY" HeaderText="Nazwa" SortExpression="NAZWA_KARTY" />
                    <asp:BoundField DataField="SILA" HeaderText="Siła" SortExpression="SILA" />
                    <asp:BoundField DataField="TARCZA" HeaderText="Tarcza" SortExpression="TARCZA" />
                    <asp:BoundField DataField="GRADE" HeaderText="Grade" SortExpression="GRADE" />
                    <asp:BoundField DataField="ID_PROJEKTANTA" HeaderText="Projektant" SortExpression="ID_PROJEKTANTA" />
                    <asp:BoundField DataField="ZDOLNOSC" HeaderText="Zdolność" SortExpression="ZDOLNOSC" />
                    <asp:BoundField DataField="GRAFIKA" HeaderText="Grafika" SortExpression="GRAFIKA" />
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Zapisz" CssClass="btn btn-primary"/>
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" CssClass="btn btn-primary"/>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="Wstaw" CssClass="btn btn-primary"/>
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" CssClass="btn btn-primary"/>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj" CssClass="btn btn-primary"/>
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="New" Text="Nowy" CssClass="btn btn-primary"/>
                            &nbsp;<asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete" Text="Skasuj" CssClass="btn btn-primary"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </div>
    </div>
    
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" SelectCommand="SELECT * FROM [KARTA]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [KARTA] WHERE ([ID_KARTY] = @ID_KARTY)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [KARTA] WHERE [ID_KARTY] = @original_ID_KARTY AND (([NUMER_KARTY] = @original_NUMER_KARTY) OR ([NUMER_KARTY] IS NULL AND @original_NUMER_KARTY IS NULL)) AND (([SYMBOL_EDYCJI] = @original_SYMBOL_EDYCJI) OR ([SYMBOL_EDYCJI] IS NULL AND @original_SYMBOL_EDYCJI IS NULL)) AND (([NAZWA_KARTY] = @original_NAZWA_KARTY) OR ([NAZWA_KARTY] IS NULL AND @original_NAZWA_KARTY IS NULL)) AND (([TARCZA] = @original_TARCZA) OR ([TARCZA] IS NULL AND @original_TARCZA IS NULL)) AND (([SILA] = @original_SILA) OR ([SILA] IS NULL AND @original_SILA IS NULL)) AND (([GRADE] = @original_GRADE) OR ([GRADE] IS NULL AND @original_GRADE IS NULL)) AND (([ID_PROJEKTANTA] = @original_ID_PROJEKTANTA) OR ([ID_PROJEKTANTA] IS NULL AND @original_ID_PROJEKTANTA IS NULL)) AND (([ZDOLNOSC] = @original_ZDOLNOSC) OR ([ZDOLNOSC] IS NULL AND @original_ZDOLNOSC IS NULL)) AND (([GRAFIKA] = @original_GRAFIKA) OR ([GRAFIKA] IS NULL AND @original_GRAFIKA IS NULL))" InsertCommand="INSERT INTO [KARTA] ([NUMER_KARTY], [SYMBOL_EDYCJI], [NAZWA_KARTY], [TARCZA], [SILA], [GRADE], [ID_PROJEKTANTA], [ZDOLNOSC], [GRAFIKA]) VALUES (@NUMER_KARTY, @SYMBOL_EDYCJI, @NAZWA_KARTY, @TARCZA, @SILA, @GRADE, @ID_PROJEKTANTA, @ZDOLNOSC, @GRAFIKA)" UpdateCommand="UPDATE [KARTA] SET [NUMER_KARTY] = @NUMER_KARTY, [SYMBOL_EDYCJI] = @SYMBOL_EDYCJI, [NAZWA_KARTY] = @NAZWA_KARTY, [TARCZA] = @TARCZA, [SILA] = @SILA, [GRADE] = @GRADE, [ID_PROJEKTANTA] = @ID_PROJEKTANTA, [ZDOLNOSC] = @ZDOLNOSC, [GRAFIKA] = @GRAFIKA WHERE [ID_KARTY] = @original_ID_KARTY AND (([NUMER_KARTY] = @original_NUMER_KARTY) OR ([NUMER_KARTY] IS NULL AND @original_NUMER_KARTY IS NULL)) AND (([SYMBOL_EDYCJI] = @original_SYMBOL_EDYCJI) OR ([SYMBOL_EDYCJI] IS NULL AND @original_SYMBOL_EDYCJI IS NULL)) AND (([NAZWA_KARTY] = @original_NAZWA_KARTY) OR ([NAZWA_KARTY] IS NULL AND @original_NAZWA_KARTY IS NULL)) AND (([TARCZA] = @original_TARCZA) OR ([TARCZA] IS NULL AND @original_TARCZA IS NULL)) AND (([SILA] = @original_SILA) OR ([SILA] IS NULL AND @original_SILA IS NULL)) AND (([GRADE] = @original_GRADE) OR ([GRADE] IS NULL AND @original_GRADE IS NULL)) AND (([ID_PROJEKTANTA] = @original_ID_PROJEKTANTA) OR ([ID_PROJEKTANTA] IS NULL AND @original_ID_PROJEKTANTA IS NULL)) AND (([ZDOLNOSC] = @original_ZDOLNOSC) OR ([ZDOLNOSC] IS NULL AND @original_ZDOLNOSC IS NULL)) AND (([GRAFIKA] = @original_GRAFIKA) OR ([GRAFIKA] IS NULL AND @original_GRAFIKA IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID_KARTY" Type="Int32" />
            <asp:Parameter Name="original_NUMER_KARTY" Type="Int32" />
            <asp:Parameter Name="original_SYMBOL_EDYCJI" Type="String" />
            <asp:Parameter Name="original_NAZWA_KARTY" Type="String" />
            <asp:Parameter Name="original_TARCZA" Type="Int32" />
            <asp:Parameter Name="original_SILA" Type="Int32" />
            <asp:Parameter Name="original_GRADE" Type="Int32" />
            <asp:Parameter Name="original_ID_PROJEKTANTA" Type="Int32" />
            <asp:Parameter Name="original_ZDOLNOSC" Type="String" />
            <asp:Parameter Name="original_GRAFIKA" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NUMER_KARTY" Type="Int32" />
            <asp:Parameter Name="SYMBOL_EDYCJI" Type="String" />
            <asp:Parameter Name="NAZWA_KARTY" Type="String" />
            <asp:Parameter Name="TARCZA" Type="Int32" />
            <asp:Parameter Name="SILA" Type="Int32" />
            <asp:Parameter Name="GRADE" Type="Int32" />
            <asp:Parameter Name="ID_PROJEKTANTA" Type="Int32" />
            <asp:Parameter Name="ZDOLNOSC" Type="String" />
            <asp:Parameter Name="GRAFIKA" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="ID_KARTY" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="NUMER_KARTY" Type="Int32" />
            <asp:Parameter Name="SYMBOL_EDYCJI" Type="String" />
            <asp:Parameter Name="NAZWA_KARTY" Type="String" />
            <asp:Parameter Name="TARCZA" Type="Int32" />
            <asp:Parameter Name="SILA" Type="Int32" />
            <asp:Parameter Name="GRADE" Type="Int32" />
            <asp:Parameter Name="ID_PROJEKTANTA" Type="Int32" />
            <asp:Parameter Name="ZDOLNOSC" Type="String" />
            <asp:Parameter Name="GRAFIKA" Type="String" />
            <asp:Parameter Name="original_ID_KARTY" Type="Int32" />
            <asp:Parameter Name="original_NUMER_KARTY" Type="Int32" />
            <asp:Parameter Name="original_SYMBOL_EDYCJI" Type="String" />
            <asp:Parameter Name="original_NAZWA_KARTY" Type="String" />
            <asp:Parameter Name="original_TARCZA" Type="Int32" />
            <asp:Parameter Name="original_SILA" Type="Int32" />
            <asp:Parameter Name="original_GRADE" Type="Int32" />
            <asp:Parameter Name="original_ID_PROJEKTANTA" Type="Int32" />
            <asp:Parameter Name="original_ZDOLNOSC" Type="String" />
            <asp:Parameter Name="original_GRAFIKA" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

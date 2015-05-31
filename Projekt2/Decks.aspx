<%@ Page Title="Tworzenie i modyfikacja talii" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Decks.aspx.cs" Inherits="Projekt2.Decks" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h3>Talie użytkownika</h3>
        <div class="col-lg-4">

            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID_TALII" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="NAZWA_TALII" HeaderText="Nazwa" SortExpression="NAZWA_TALII" />
                    <asp:TemplateField HeaderText="Udostępniona?" SortExpression="UDOSTEPNIONA">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UDOSTEPNIONA") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# (int)Eval("UDOSTEPNIONA") == 1 ? "tak" : "nie" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ID_TALII" DataSourceID="SqlDataSource3" CssClass="table table-striped table-bordered" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated">
                <Fields>
                    <asp:TemplateField HeaderText="Nazwa talii" SortExpression="NAZWA_TALII">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NAZWA_TALII") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NAZWA_TALII") %>' CssClass="form-control"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("NAZWA_TALII") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Udostępniona?" SortExpression="UDOSTEPNIONA">
                        <EditItemTemplate>
                            <asp:DropDownList runat="server" ID="DropDownList1" SelectedValue='<%# Bind("UDOSTEPNIONA") %>' CssClass="form-control">
                                <asp:ListItem Value="1">tak</asp:ListItem>
                                <asp:ListItem Value="0">nie</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UDOSTEPNIONA") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# (int)Eval("UDOSTEPNIONA") == 1 ? "tak" : "nie" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Zapisz" CssClass="btn btn-primary" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" CssClass="btn btn-primary" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj" CssClass="btn btn-primary" />
                            &nbsp;<asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete" Text="Skasuj" CssClass="btn btn-primary" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <b>Nazwa:</b>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox><br />
            <asp:Button ID="Button4" runat="server" Text="Dodaj nową talię" CssClass="btn btn-primary" OnClick="Button4_Click" />
        </div>
        <div class="col-lg-8">
            
            <% if (GridView1.SelectedIndex != -1)
               { %>
            <div class="form-inline row">
                <div class="form-group">
                    <asp:Button ID="Button5" runat="server" Text="Dodaj kartę do talii" CssClass="btn btn-primary" OnClick="Button5_Click" />
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="NAZWA_KARTY" DataValueField="ID_KARTY" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <br/>
            </div>
            <% } %>
            <div class="row">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_KARTY" DataSourceID="SqlDataSource2" CssClass="table table-striped table-bordered" AllowSorting="True">
                    <Columns>
                        <asp:TemplateField HeaderText="" SortExpression="GRAFIKA">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GRAFIKA") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("GRAFIKA") %>' Height="40" BorderWidth="0" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="LICZBA_KART" HeaderText="Liczba" SortExpression="LICZBA_KART" />
                        <asp:BoundField DataField="SYMBOL_EDYCJI" HeaderText="Edycja" SortExpression="SYMBOL_EDYCJI" />
                        <asp:BoundField DataField="NAZWA_KARTY" HeaderText="Nazwa karty" SortExpression="NAZWA_KARTY" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" SelectCommand="talie_uzytkownika_sel" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="id_uzytkownika" SessionField="UserId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" SelectCommand="karty_talia_sel" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id_talii" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" DeleteCommand="DELETE FROM [TALIA] WHERE [ID_TALII] = @original_ID_TALII" InsertCommand="INSERT INTO [TALIA] ([NAZWA_TALII], [UDOSTEPNIONA]) VALUES (@NAZWA_TALII, @UDOSTEPNIONA)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ID_TALII], [NAZWA_TALII], [UDOSTEPNIONA] FROM [TALIA] WHERE ([ID_TALII] = @ID_TALII)" UpdateCommand="UPDATE [TALIA] SET [NAZWA_TALII] = @NAZWA_TALII, [UDOSTEPNIONA] = @UDOSTEPNIONA WHERE [ID_TALII] = @original_ID_TALII AND (([NAZWA_TALII] = @original_NAZWA_TALII) OR ([NAZWA_TALII] IS NULL AND @original_NAZWA_TALII IS NULL)) AND (([UDOSTEPNIONA] = @original_UDOSTEPNIONA) OR ([UDOSTEPNIONA] IS NULL AND @original_UDOSTEPNIONA IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID_TALII" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NAZWA_TALII" Type="String" />
                <asp:Parameter Name="UDOSTEPNIONA" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="ID_TALII" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="NAZWA_TALII" Type="String" />
                <asp:Parameter Name="UDOSTEPNIONA" Type="Int32" />
                <asp:Parameter Name="original_ID_TALII" Type="Int32" />
                <asp:Parameter Name="original_NAZWA_TALII" Type="String" />
                <asp:Parameter Name="original_UDOSTEPNIONA" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" SelectCommand="SELECT [NAZWA_KARTY], [ID_KARTY] FROM [KARTA]"></asp:SqlDataSource>
    </div>
</asp:Content>

<%@ Page Title="Modyfikacja edycji" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editions.aspx.cs" Inherits="Projekt2.Editions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="row">
        <h3>Edycje</h3>
        <div class="col-lg-6">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SYMBOL_EDYCJI" DataSourceID="SqlDataSource1" AllowSorting="True" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="SYMBOL_EDYCJI" HeaderText="Symbol Edycji" ReadOnly="True" SortExpression="SYMBOL_EDYCJI" />
                    <asp:BoundField DataField="NAZWA_EDYCJI" HeaderText="Nazwa" SortExpression="NAZWA_EDYCJI" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-lg-6">
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="SYMBOL_EDYCJI" DataSourceID="SqlDataSource2" CssClass="table table-striped table-bordered" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated">
                <Fields>
                    <asp:TemplateField HeaderText="Symbol Edycji" SortExpression="SYMBOL_EDYCJI">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("SYMBOL_EDYCJI") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SYMBOL_EDYCJI") %>' CssClass="form-control"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("SYMBOL_EDYCJI") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nazwa edycji" SortExpression="NAZWA_EDYCJI">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NAZWA_EDYCJI") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NAZWA_EDYCJI") %>' CssClass="form-control"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("NAZWA_EDYCJI") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" SelectCommand="SELECT * FROM [EDYCJA]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" SelectCommand="SELECT * FROM [EDYCJA] WHERE ([SYMBOL_EDYCJI] = @SYMBOL_EDYCJI)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [EDYCJA] WHERE [SYMBOL_EDYCJI] = @original_SYMBOL_EDYCJI AND (([NAZWA_EDYCJI] = @original_NAZWA_EDYCJI) OR ([NAZWA_EDYCJI] IS NULL AND @original_NAZWA_EDYCJI IS NULL))" InsertCommand="INSERT INTO [EDYCJA] ([SYMBOL_EDYCJI], [NAZWA_EDYCJI]) VALUES (@SYMBOL_EDYCJI, @NAZWA_EDYCJI)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [EDYCJA] SET [NAZWA_EDYCJI] = @NAZWA_EDYCJI WHERE [SYMBOL_EDYCJI] = @original_SYMBOL_EDYCJI AND (([NAZWA_EDYCJI] = @original_NAZWA_EDYCJI) OR ([NAZWA_EDYCJI] IS NULL AND @original_NAZWA_EDYCJI IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_SYMBOL_EDYCJI" Type="String" />
            <asp:Parameter Name="original_NAZWA_EDYCJI" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SYMBOL_EDYCJI" Type="String" />
            <asp:Parameter Name="NAZWA_EDYCJI" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="SYMBOL_EDYCJI" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="NAZWA_EDYCJI" Type="String" />
            <asp:Parameter Name="original_SYMBOL_EDYCJI" Type="String" />
            <asp:Parameter Name="original_NAZWA_EDYCJI" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
</asp:Content>

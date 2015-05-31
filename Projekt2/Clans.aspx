<%@ Page Title="Modyfikacja klanów" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clans.aspx.cs" Inherits="Projekt2.Clans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h3>Klany</h3>
        <div class="col-lg-6">
            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="ID_KLANU" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered">
                <Fields>
                    <asp:TemplateField HeaderText="ID klanu" InsertVisible="False" SortExpression="ID_KLANU">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID_KLANU") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID_KLANU") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nazwa klanu" SortExpression="NAZWA_KLANU">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NAZWA_KLANU") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NAZWA_KLANU") %>' CssClass="form-control"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("NAZWA_KLANU") %>'></asp:Label>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" DeleteCommand="DELETE FROM [KLAN] WHERE [ID_KLANU] = @original_ID_KLANU AND (([NAZWA_KLANU] = @original_NAZWA_KLANU) OR ([NAZWA_KLANU] IS NULL AND @original_NAZWA_KLANU IS NULL))" InsertCommand="INSERT INTO [KLAN] ([NAZWA_KLANU]) VALUES (@NAZWA_KLANU)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [KLAN]" UpdateCommand="UPDATE [KLAN] SET [NAZWA_KLANU] = @NAZWA_KLANU WHERE [ID_KLANU] = @original_ID_KLANU AND (([NAZWA_KLANU] = @original_NAZWA_KLANU) OR ([NAZWA_KLANU] IS NULL AND @original_NAZWA_KLANU IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID_KLANU" Type="Int32" />
            <asp:Parameter Name="original_NAZWA_KLANU" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NAZWA_KLANU" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NAZWA_KLANU" Type="String" />
            <asp:Parameter Name="original_ID_KLANU" Type="Int32" />
            <asp:Parameter Name="original_NAZWA_KLANU" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
</asp:Content>

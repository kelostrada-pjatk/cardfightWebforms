<%@ Page Title="Modyfikacja kart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cards.aspx.cs" Inherits="Projekt2.Cards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-6">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID_KARTY" DataSourceID="SqlDataSource1" PageSize="15" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Numer" HeaderText="Numer" SortExpression="Numer" ReadOnly="True" />
                    <asp:BoundField DataField="NAZWA_KARTY" HeaderText="Nazwa" SortExpression="NAZWA_KARTY" />
                    <asp:TemplateField HeaderText="Projektant" SortExpression="ID_PROJEKTANTA">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ID_PROJEKTANTA") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID_PROJEKTANTA") %>' style="display: none;"></asp:Label>
                            <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource7" >
                                <ItemTemplate><%#Eval("LOGIN")%></ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" SelectCommand="SELECT [LOGIN] FROM [UZYTKOWNIK] WHERE ([ID_UZYTKOWNIKA] = @ID_UZYTKOWNIKA)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label1" Name="ID_UZYTKOWNIKA" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-lg-6">
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ID_KARTY" DataSourceID="SqlDataSource2" CssClass="table table-striped table-bordered" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated">
                <Fields>
                    <asp:TemplateField HeaderText="Numer" SortExpression="NUMER_KARTY">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NUMER_KARTY") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("NUMER_KARTY") %>' CssClass="form-control"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("NUMER_KARTY") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edycja" SortExpression="SYMBOL_EDYCJI">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource5" DataTextField="NAZWA_EDYCJI" DataValueField="SYMBOL_EDYCJI" SelectedValue='<%# Bind("SYMBOL_EDYCJI") %>' CssClass="form-control">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource5" DataTextField="NAZWA_EDYCJI" DataValueField="SYMBOL_EDYCJI" SelectedValue='<%# Bind("SYMBOL_EDYCJI") %>' CssClass="form-control">
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("SYMBOL_EDYCJI") %>'></asp:Label>
                            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource6" >
                                <ItemTemplate><%#Eval("NAZWA_EDYCJI")%></ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" SelectCommand="SELECT [NAZWA_EDYCJI] FROM [EDYCJA] WHERE ([SYMBOL_EDYCJI] = @SYMBOL_EDYCJI)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label3" Name="SYMBOL_EDYCJI" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nazwa" SortExpression="NAZWA_KARTY">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("NAZWA_KARTY") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("NAZWA_KARTY") %>' CssClass="form-control"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("NAZWA_KARTY") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Siła" SortExpression="SILA">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("SILA") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("SILA") %>' CssClass="form-control"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("SILA") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tarcza" SortExpression="TARCZA">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("TARCZA") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("TARCZA") %>' CssClass="form-control"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("TARCZA") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Grade" SortExpression="GRADE">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("GRADE") %>' CssClass="form-control">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("GRADE") %>' CssClass="form-control">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("GRADE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Projektant" SortExpression="ID_PROJEKTANTA">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4" DataTextField="LOGIN" DataValueField="ID_UZYTKOWNIKA" SelectedValue='<%# Bind("ID_PROJEKTANTA") %>' CssClass="form-control">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4" DataTextField="LOGIN" DataValueField="ID_UZYTKOWNIKA" SelectedValue='<%# Bind("ID_PROJEKTANTA") %>' CssClass="form-control">
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID_PROJEKTANTA") %>' style="display: none;"></asp:Label>
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3" >
                                <ItemTemplate><%#Eval("LOGIN")%></ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" SelectCommand="SELECT [LOGIN] FROM [UZYTKOWNIK] WHERE ([ID_UZYTKOWNIKA] = @ID_UZYTKOWNIKA)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label1" Name="ID_UZYTKOWNIKA" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Zdolność" SortExpression="ZDOLNOSC">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("ZDOLNOSC") %>' TextMode="MultiLine" CssClass="form-control" Rows="8"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("ZDOLNOSC") %>' TextMode="MultiLine" CssClass="form-control" Rows="8"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("ZDOLNOSC") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Grafika" SortExpression="GRAFIKA">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GRAFIKA") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GRAFIKA") %>' CssClass="form-control"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("GRAFIKA") %>' />
                            <br />
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
    
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" SelectCommand="SELECT ID_KARTY, SYMBOL_EDYCJI + '/' + RIGHT ('000' + CAST(NUMER_KARTY AS VARCHAR(3)), 3) AS Numer, NAZWA_KARTY, ID_PROJEKTANTA FROM KARTA"></asp:SqlDataSource>
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
    
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" SelectCommand="SELECT ID_UZYTKOWNIKA, LOGIN FROM UZYTKOWNIK UNION SELECT NULL AS ID_UZYTKOWNIKA, '--brak--' AS LOGIN"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:s11027ConnectionString %>" SelectCommand="SELECT * FROM [EDYCJA]"></asp:SqlDataSource>
</asp:Content>

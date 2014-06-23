<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="results.aspx.cs" Inherits="results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">
    <div class="row">
        <div class="span12">
            <h1>Search Results</h1>
        </div>
    </div>

    <hr />

    <div class="row">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:GridView ID="GridView1" 
                runat="server" 
                AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" 
                GridLines="None"
                CssClass="table table-hover table-striped" 
                DataKeyNames="RegistrantID" 
                OnRowCommand="GridView1_RowCommand" 
                SelectCommand="SELECT [FirstName], [LastName], [MidInitial], [Gender], [DOB], [Height], [Weight], [HairColor], [EyeColor], [Race], [Complexion], [Build], [Active], [RegistrantID] FROM [Registrant] WHERE (([FirstName] LIKE '%' + @FirstName + '%') AND ([LastName] LIKE '%' + @LastName + '%') AND ([MidInitial] LIKE '%' + @MidInitial + '%') AND ([Weight] &gt;= @Weight) AND ([Height] &gt;= @Height) AND ([Gender] LIKE '%' + @Gender + '%') AND ([EyeColor] LIKE '%' + @EyeColor + '%') AND ([HairColor] LIKE '%' + @HairColor + '%') AND ([Build] LIKE '%' + @Build + '%') AND ([Race] LIKE '%' + @Race + '%') AND ([Complexion] LIKE '%' + @Complexion + '%') AND ([DOB] LIKE '%' + @DOB + '%') AND ([RegistrantID] &gt;= @RegistrantID))">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
    <%--                <asp:BoundField DataField="RegistrantID" HeaderText="RegistrantID" SortExpression="RegistrantID" InsertVisible="False" ReadOnly="True" />--%>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="MidInitial" HeaderText="Mid" SortExpression="MidInitial" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="DOB" HeaderText="DoB" SortExpression="DOB" />
                    <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                    <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                    <asp:BoundField DataField="HairColor" HeaderText="Hair Color" SortExpression="HairColor" />
                    <asp:BoundField DataField="EyeColor" HeaderText="Eye Color" SortExpression="EyeColor" />
                    <asp:BoundField DataField="Race" HeaderText="Race" SortExpression="Race" />
                    <asp:BoundField DataField="Complexion" HeaderText="Complexion" SortExpression="Complexion" />
                    <asp:BoundField DataField="Build" HeaderText="Build" SortExpression="Build" />
    <%--                <asp:BoundField DataField="Active" HeaderText="Active" SortExpression="Active" />--%>
                    <asp:ButtonField HeaderText="Profile" Text="View Profile" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [RegistrantID], [FirstName], [LastName], [MidInitial], [Gender], [DOB], [Height], [Weight], [HairColor], [EyeColor], [Race], [Complexion], [Build], [Active] FROM [Registrant] WHERE (([FirstName] LIKE '%' + @FirstName + '%') AND ([LastName] LIKE '%' + @LastName + '%') AND ([Weight] &gt;= @Weight) AND ([Height] &gt;= @Height) AND ([Gender] = @Gender)  AND ([EyeColor] LIKE '%' + @EyeColor + '%') AND ([HairColor] LIKE '%' + @HairColor + '%') AND ([Build] LIKE '%' + @Build + '%') AND ([Race] LIKE '%' + @Race + '%') AND ([Complexion] LIKE '%' + @Complexion + '%') AND ([DOB] LIKE '%' + @DOB + '%') AND ([RegistrantID] &gt;= @RegistrantID))">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="%" Name="FirstName" QueryStringField="firstName" Type="String" />
                    <asp:QueryStringParameter DefaultValue="%" Name="LastName" QueryStringField="lastName" Type="String" />
                    <asp:QueryStringParameter DefaultValue="0" Name="Weight" QueryStringField="weight" Type="Int32" />
                    <asp:QueryStringParameter DefaultValue="0" Name="Height" QueryStringField="height" Type="Int32" />
                    <asp:QueryStringParameter DefaultValue="Male" Name="Gender" QueryStringField="gender" Type="String" />
                    <asp:QueryStringParameter DefaultValue="%" Name="EyeColor" QueryStringField="eyeColor" Type="String" />
                    <asp:QueryStringParameter DefaultValue="%" Name="HairColor" QueryStringField="hairColor" Type="String" />
                    <asp:QueryStringParameter DefaultValue="%" Name="Build" QueryStringField="build" Type="String" />
                    <asp:QueryStringParameter DefaultValue="%" Name="Race" QueryStringField="race" Type="String" />
                    <asp:QueryStringParameter DefaultValue="%" Name="Complexion" QueryStringField="complexion" Type="String" />
                    <asp:QueryStringParameter DefaultValue="%" Name="DOB" QueryStringField="dateOfBirth" />
                    <asp:QueryStringParameter DefaultValue="0" Name="RegistrantID" QueryStringField="registrantID" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>

    <hr />

    <div class="row">
        <div class="span2">
            <asp:HyperLink ID="hylSearch" 
                runat="server"
                NavigateUrl="~/search.aspx"
                Text="Back to Search"
                CssClass="btn btn-primary btn-block">
            </asp:HyperLink>
        </div>
        <div class="span2 offset1">
            <asp:HyperLink ID="hylGallery" 
                runat="server"
                NavigateUrl="~/gallery.aspx"
                Text="Search by Image"
                CssClass="btn btn-primary btn-block">
            </asp:HyperLink>
        </div>
    </div>
</asp:Content>


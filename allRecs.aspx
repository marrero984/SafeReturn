<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="allRecs.aspx.cs" Inherits="allRecs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">

        <div class="row">
        <div class="span12">
            <h1>All Records</h1>
        </div>
    </div>

    <hr />

    <asp:GridView ID="allRecsGrid" runat="server" OnRowCommand="allRecsGrid_RowCommand" CssClass="table table-hover table-striped" AutoGenerateColumns="False" DataKeyNames="RegistrantID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="MidInitial" HeaderText="MidInitial" SortExpression="MidInitial" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
            <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
            <asp:BoundField DataField="HairColor" HeaderText="HairColor" SortExpression="HairColor" />
            <asp:BoundField DataField="EyeColor" HeaderText="EyeColor" SortExpression="EyeColor" />
            <asp:BoundField DataField="Race" HeaderText="Race" SortExpression="Race" />
            <asp:BoundField DataField="Complexion" HeaderText="Complexion" SortExpression="Complexion" />
            <asp:BoundField DataField="Build" HeaderText="Build" SortExpression="Build" />
            <asp:BoundField DataField="RegistrantID" HeaderText="RegistrantID" InsertVisible="False" ReadOnly="True" SortExpression="RegistrantID" Visible="False" />
            <asp:ButtonField HeaderText="Profile" Text="View Profile" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [FirstName], [LastName], [MidInitial], [Gender], [DOB], [Height], [Weight], [HairColor], [EyeColor], [Race], [Complexion], [Build], [RegistrantID] FROM [Registrant]"></asp:SqlDataSource>

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


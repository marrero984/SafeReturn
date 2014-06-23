<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">

    <section class="container">
        <div class="row">
            <div class="span2">
                <h4>Options</h4>
                <hr />
                <asp:HyperLink ID="hylSearch" 
                    runat="server"
                    Text="Search"
                    CssClass="btn btn-primary btn-block"
                    NavigateUrl="~/search.aspx">
                </asp:HyperLink>
                <br />
                <asp:HyperLink ID="hylGallery" runat="server" Text="View Gallery" CssClass="btn btn-primary btn-block" NavigateUrl="~/gallery.aspx"></asp:HyperLink>
                <br />
                <br />
                <h4>
                    <asp:Label ID="lblAdmin" 
                        runat="server" 
                        Text="Admin"
                        Visible="false">
                    </asp:Label>
                </h4>
                <hr />
                <asp:HyperLink ID="hylCreateRecord" 
                    runat="server"
                    Text="Create New Record"
                    CssClass="btn btn-primary btn-block"
                    NavigateUrl="~/profileCreate.aspx"
                    Visible="false">
                </asp:HyperLink>
                <br />
                <asp:HyperLink ID="hylQuickSearch" 
                    runat="server" 
                    Text="Edit/Delete Record" 
                    CssClass="btn btn-primary btn-block"
                    NavigateUrl="~/quicksearch.aspx"
                    Visible="false">
                </asp:HyperLink>
                <br />
                <asp:HyperLink ID="hylUserMaintenance" 
                    runat="server" 
                    Text="User Maintenance" 
                    NavigateUrl="~/userList.aspx"
                    CssClass="btn btn-primary btn-block"
                    Visible="false">
                </asp:HyperLink>                        
            </div>

            <div class="span10">

                <asp:Literal ID="litMessage" 
                    runat="server"
                    Visible="false">
                </asp:Literal>

                <h2>Alerts</h2>
                <asp:Table ID="tblAlerts" runat="server" CssClass="table table-striped">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell Text="Image" CssClass="span2"></asp:TableHeaderCell>
                        <asp:TableHeaderCell Text="Name" CssClass="span2"></asp:TableHeaderCell>
                        <asp:TableHeaderCell Text="Date/Time Activated" CssClass="span3"></asp:TableHeaderCell>
                        <asp:TableHeaderCell Text="Information" CssClass="span3"></asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>
            </div>
        </div>
    </section>

</asp:Content>
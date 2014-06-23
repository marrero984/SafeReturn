<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userList.aspx.cs" Inherits="UserMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">

    <div class="container">
        <div class="row">
            <div class="span12">
                <h2>User Maintenance</h2>
                <asp:Literal ID="litMessage" 
                    runat="server">
                </asp:Literal>
            </div>
        </div>
        <div class="row">
            <div class="span1 offset1 lbltxtalign">
                <asp:Label ID="lblUsername" 
                    runat="server" 
                    Text="Username">
                </asp:Label>
            </div>
            <div class="span2">
                <asp:TextBox ID="txtUsername" 
                    runat="server" 
                    laceholder="Username">
                </asp:TextBox>
            </div>
            <div class="span2">
                <asp:Button ID="btnSearch" 
                    runat="server"
                    CssClass="btn btn-primary btn-block"
                    OnClick="btnSearch_Click" 
                    Text="Search" />
            </div>
            <div class="span2 offset4">
                <asp:HyperLink ID="hylAddUser" 
                    runat="server"
                    Text="Add User"
                    CssClass="btn btn-primary btn-block"
                    NavigateUrl="~/userMaintenance.aspx">
                </asp:HyperLink>
            </div>
        </div>

        <hr />

        <div class="row">
            <div class="span12">
                <asp:GridView ID="gdvUsers" 
                    runat="server"
                    GridLines="None"
                    CssClass="table table-hover table-striped" 
                    AutoGenerateColumns="False"
                    OnRowCommand="gdvUsers_RowCommand"
                    AllowPaging="true"
                    PageSize="10"
                    OnPageIndexChanging="gdvUsers_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="UserID" HeaderText="User ID" >
                            <HeaderStyle CssClass="span1" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Username" HeaderText="Username">
                            <HeaderStyle CssClass="span3" />
                        </asp:BoundField>

                        <asp:BoundField DataField="UserType" HeaderText="User Type">
                            <HeaderStyle CssClass="span3" />
                        </asp:BoundField>

                        <asp:ButtonField CommandName="Edits" 
                            Text="Edit">
                            <ControlStyle CssClass="btn btn-primary btn-block"/>
                            <HeaderStyle CssClass="span1" />
                        </asp:ButtonField>
                    </Columns>
                </asp:GridView> 
            </div>
        </div>
    </div>

    </asp:Content>


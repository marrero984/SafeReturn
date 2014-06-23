<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">
    
    <section class="container">
        <h2>Login</h2>

        <hr />

        <div class="row">
            <div class="span2 lbltxtalign">
                <asp:Label ID="lblusername" runat="server" Text="Username"></asp:Label>
            </div>
            <div class="span3">
                <asp:TextBox ID="txtusername" runat="server" MaxLength="25" CssClass="span3"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="span2 lbltxtalign">
                <asp:Label ID="lblpassword" runat="server" Text="Password"></asp:Label>
            </div>
            <div class="span3">
                <asp:TextBox ID="txtpassword" runat="server" MaxLength="25" TextMode="Password" CssClass="span3"></asp:TextBox> 
            </div>
        </div>
        <div class="row">
            <div class="span2 offset2">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click"/>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="span6 offset1">
                <asp:Label ID="lblInvalidLogin"
                    runat="server"
                    ForeColor="Red"
                    Text="Username or password is incorrect; please try again."
                    Visible ="false">
                </asp:Label>
            </div>
        </div>
        
        <br />

        <div class="row">
            <p class="offset1"><small>*If you do not have a username and password, please contact your IT department.</small></p>
        </div>

    </section>    

</asp:Content>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userMaintenance.aspx.cs" Inherits="userMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">

    <div class="container">
        <header class="row">
            <div class="span12">
                <h2>
                    <asp:Label ID="lblHeader" 
                        runat="server" 
                        Text="">
                    </asp:Label>
                </h2>
                <asp:Literal ID="litMessage" 
                    runat="server"
                    Visible="false">
                </asp:Literal>
            </div>
        </header>

        <hr />

        <section class="row">
            <div class="span12">
                <h4>
                    <asp:Label ID="lblUserID" 
                        runat="server" 
                        Text="User ID#"
                        Visible="false">
                    </asp:Label>
                    <asp:Label ID="lblUserIDNo" 
                        runat="server"
                        Visible="false">
                    </asp:Label>
                </h4>
            </div>
        </section>


        
        <asp:Panel ID="pnlEditUser" 
            runat="server"
            Visible="false">
            <section class="row">
                <div class="span2 right">
                    <asp:Label ID="lblUsername" 
                        runat="server" 
                        Text="Username">
                    </asp:Label>
                </div>
                <div class="span3">
                    <asp:Label ID="lblUsernameValue" 
                        runat="server">
                    </asp:Label>
                </div>
            </section>
            <br />
        </asp:Panel>
        <asp:Panel ID="pnlNewUser" 
            runat="server"
            Visible="false">
            <section class="row">
                <div class="span2 lbltxtalign">
                    <asp:Label ID="lblUsername2" 
                        runat="server" 
                        Text="Username">
                    </asp:Label>
                </div>
                <div class="span3">
                    <asp:TextBox ID="txtUsername" 
                        runat="server"
                        MaxLength="25">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsername" 
                        runat="server" 
                        ErrorMessage="Username required"
                        ControlToValidate="txtUsername"
                        Display="Dynamic"
                        Font-Size="Small"
                        ForeColor="Red"
                        Enabled="false">
                    </asp:RequiredFieldValidator>
                </div>
            </section>
        </asp:Panel>
        

        <section class="row">
            <div class="span2 lbltxtalign">
                <asp:Label ID="lblUserType" 
                    runat="server" 
                    Text="User Type">
                </asp:Label>
            </div>
            <div class="span3">
                <asp:DropDownList ID="ddlUserType" 
                    runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>User</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvUserType" 
                    runat="server"
                    ControlToValidate="ddlUserType"
                    Display="Dynamic"
                    ErrorMessage="User type is required"
                    Font-Size="Small"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>
        </section>

        <br />
        <asp:Panel ID="pnlPasswordInfo" 
            runat="server"
            Visible="false">
            <div class="row">
                <div class="span12">
                    <h4>Reset Password</h4>
                    <p>User passwords cannot be retrieved or viewed.<br />
                        To set a new password for the user, please complete below; otherwise leave blank.</p>
                </div>
            </div>
        </asp:Panel>

        <section class="row">
            <div class="span2 lbltxtalign">
                <asp:Label ID="lblPassword1" 
                    runat="server" 
                    Text="New Password">
                </asp:Label>
            </div>
            <div class="span3">
                <asp:TextBox ID="txtPassword1" 
                    runat="server"
                    MaxLength="25">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword1" 
                    runat="server" 
                    ErrorMessage="Password required"
                    ControlToValidate="txtPassword1"
                    Display="Dynamic"
                    Font-Size="Small"
                    ForeColor="Red"
                    Enabled="false">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPassword1" 
                    runat="server" 
                    ControlToValidate="txtPassword1"
                    Display="Dynamic"
                    ErrorMessage="Passwords must be 8-25 characters long and <br/>contain at least one alphabetic and one numeric character."
                    Font-Size="Small"
                    ForeColor="Red"
                    ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,25})$">
                </asp:RegularExpressionValidator>
            </div>
        </section>
        
        <section class="row">
            <div class="span2 lbltxtalign">
                <asp:Label ID="lblPassword2" 
                    runat="server" 
                    Text="Confirm Password">
                </asp:Label>
            </div>
            <div class="span3">
                <asp:TextBox ID="txtPassword2" 
                    runat="server"
                    MaxLength="25">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword2" 
                    runat="server" 
                    ErrorMessage="Password confirmation required"
                    ControlToValidate="txtPassword2"
                    Display="Dynamic"
                    Font-Size="Small"
                    ForeColor="Red"
                    Enabled="false">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPassword2" 
                    runat="server" 
                    ControlToValidate="txtPassword2"
                    Display="Dynamic"
                    ErrorMessage="Passwords must be 8-25 characters long and <br/>contain at least one alphabetic and one numeric character."
                    Font-Size="Small"
                    ForeColor="Red"
                    ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,25})$">
                </asp:RegularExpressionValidator>
            </div>
            <div class="span6">
                <asp:Label ID="lblPasswordMatch" 
                    runat="server" 
                    Text="Passwords do not match" 
                    Font-Size="Small"
                    ForeColor="Red"
                    Visible="false"></asp:Label>
            </div>
        </section>  

        <br />
        
        <section class="row">
            <div class="span2 offset2">
                <asp:Button ID="btnSaveUpdate" 
                    runat="server" 
                    Text="Save" 
                    CssClass="btn btn-primary btn-block"
                    OnClick="btnSaveUpdate_Click"
                    Visible="false" />

                <asp:Button ID="btnSaveNew" 
                    runat="server" 
                    Text="Save" 
                    CssClass="btn btn-primary btn-block"
                    OnClick="btnSaveNew_Click"
                    Visible="false"/>
            </div>
            <div class="span2 offset1">
                <asp:Button ID="btnCancel" 
                    runat="server" 
                    Text="Cancel" 
                    CssClass="btn btn-block"
                    OnClick="btnCancel_Click"
                    CausesValidation="false"/>
            </div>
            <div class="span2 offset1">
                <asp:HyperLink ID="hylDelete" 
                    runat="server"
                    Text="Delete"
                    CssClass="btn btn-danger btn-block"
                    Visible="false"
                    data-toggle="modal"
                    NavigateUrl="#mdlDeleteUser">
                </asp:HyperLink>
            </div>
        </section>   
        
        <!-- Delete user modal -->
        <div id="mdlDeleteUser" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="DeleteUserModal" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="H4">Delete User</h3>
            </div>
            <div class="modal-body">
                <p>This will permanently delete this user.
                    <br />
                    Are you sure you want to continue?
                </p>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
                <asp:Button ID="btnDelete" 
                    runat="server" 
                    Text="Yes" 
                    CssClass="btn btn-danger" 
                    OnClick="btnDelete_Click"/>
            </div>   
        </div>
    </div>
</asp:Content>


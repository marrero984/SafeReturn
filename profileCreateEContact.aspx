<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profileCreateEContact.aspx.cs" Inherits="profileCreateEContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">
    
    <div class="container">
        <div class="row">
            <h2 class="span12">Create New Profile <%--<a class="btn btn-primary" href="import.aspx">Import XML</a>--%></h2>         
        </div>
        <hr />
        <div class="row">
            <section class="span12 profile">
                <div class="row">
                    <h4>Emergency Contact Information</h4>
                </div>

                <div id="emercontact">
                    <div class="row"> 
                        <div class="span10">
                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblECFirstName" runat="server" Text="First Name"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:TextBox ID="txtECFirstName" runat="server" MaxLength="25"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revECFirstName" 
                                        runat="server" 
                                        ControlToValidate="txtECFirstName"
                                        Display="Dynamic"
                                        ErrorMessage="Name cannot include numeric characters"
                                        Font-Size="Small"
                                        ForeColor="Red"
                                        ValidationExpression="^[a-zA-Z'.\s]{1,25}$">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <div class="span2 right"> 
                                    <asp:Label ID="lblECLastName" runat="server" Text="Last Name"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:TextBox ID="txtECLastName" runat="server" MaxLength="25"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revECLastName" 
                                        runat="server" 
                                        ControlToValidate="txtECLastName"
                                        Display="Dynamic"
                                        ErrorMessage="Name cannot include numeric characters"
                                        Font-Size="Small"
                                        ForeColor="Red"
                                        ValidationExpression="^[a-zA-Z'.\s]{1,25}$">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblECRelationship" runat="server" Text="Relationship"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:TextBox ID="txtECRelationship" runat="server" MaxLength="25"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revRelationship" 
                                        runat="server" 
                                        ControlToValidate="txtECRelationship"
                                        Display="Dynamic"
                                        ErrorMessage="Relationship cannot include numeric characters"
                                        Font-Size="Small"
                                        ForeColor="Red"
                                        ValidationExpression="^[a-zA-Z'.\s]{1,25}$">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span5">
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECStreet" runat="server" Text="Street"></asp:Label>
                                        </div>
                                        <div class="span3">
                                            <asp:TextBox ID="txtECStreet1" runat="server" MaxLength="50"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="span3 offset2">
                                            <asp:TextBox ID="txtECStreet2" runat="server" MaxLength="50"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECCity" runat="server" Text="City"></asp:Label>
                                        </div>
                                        <div class="span3">
                                            <asp:TextBox ID="txtECCity" runat="server" MaxLength="50"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECState" runat="server" Text="State"></asp:Label>
                                        </div>
                                        <div class="span1">
                                            <asp:TextBox ID="txtECState" runat="server" MaxLength="2"></asp:TextBox>
                                        </div>
                                        <div class="span1 right"> 
                                            <asp:Label ID="lblECZip" runat="server" Text="Zip"></asp:Label>
                                        </div>
                                        <div class="span1">
                                            <asp:TextBox ID="txtECZip" runat="server" MaxLength="10"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECCountry" runat="server" Text="Country"></asp:Label>
                                        </div>
                                        <div class="span3">
                                            <asp:TextBox ID="txtECCountry" runat="server" MaxLength="50"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECPhone" runat="server" Text="Phone"></asp:Label>
                                        </div>
                                        <div class="span3">
                                            <asp:TextBox ID="txtECPhone1" runat="server" MaxLength="14"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revECPhone"
                                                runat="server" 
                                                ControlToValidate="txtECPhone1"
                                                Display="Dynamic"
                                                ErrorMessage="Phone should be formatted as:</br>(425) 555-0123</br>425-555-0123</br>425 555 0123</br>1-425-555-0123"
                                                Font-Size="Small"
                                                ForeColor="Red"
                                                ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$">
                                            </asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECPhoneMobile" runat="server" Text="Mobile"></asp:Label>
                                        </div>
                                        <div class="span3">
                                            <asp:TextBox ID="txtECPhone2" runat="server" MaxLength="14"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revECMobile"
                                                runat="server" 
                                                ControlToValidate="txtECPhone2"
                                                Display="Dynamic"
                                                ErrorMessage="Phone should be formatted as:</br>(425) 555-0123</br>425-555-0123</br>425 555 0123</br>1-425-555-0123"
                                                Font-Size="Small"
                                                ForeColor="Red"
                                                ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$">
                                            </asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECEmail" runat="server" Text="Email"></asp:Label>
                                        </div>
                                        <div class="span3">
                                            <asp:TextBox ID="txtECEmail" runat="server" TextMode="Email" MaxLength="50"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                   
                    </div>
                </div>
                <hr />

                <div id="buttonrow" class="row">
                    <div class="span2">
                        <asp:Button ID="btnBack" runat="server" Text="&laquo; Back" CssClass="btn btn-inverse btn-block" OnClick="btnBack_Click"/>
                    </div>
                    <div class="span2 offset8">
                        <asp:Button ID="btnNext" runat="server" Text="Next &raquo;" CssClass="btn btn-primary btn-block" OnClick="btnNext_Click"/>
                    </div>
                </div>
            </section> 
        </div>
     </div><%--End container div--%>

</asp:Content>


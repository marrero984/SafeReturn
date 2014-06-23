<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profileCreate.aspx.cs" Inherits="profileCreate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">

    <div class="container">
        <div class="row">
            <h2 class="span12">Create New Profile</h2>
             
        </div>
        <hr />
        <div class="row">

            <section class="span12 profile">
                <div class="row">
                    <h4>Personal Information</h4>
                </div>

                <div id="personalinfo">
                    <div class="row">
                        <div class="span12">
                            <div class="row test">
                                <div class="span2 lbltxtalign">
                                    <asp:Label ID="lblFirstName" runat="server" Text="First Name*"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:TextBox ID="txtFirstName" runat="server" MaxLength="25"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFirstName" 
                                        runat="server"
                                        ControlToValidate="txtFirstName"
                                        Display="Dynamic"
                                        ErrorMessage="First name is required"
                                        Font-Size="Small"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revFirstName" 
                                        runat="server" 
                                        ControlToValidate="txtFirstName"
                                        Display="Dynamic"
                                        ErrorMessage="Name cannot include numeric characters"
                                        Font-Size="Small"
                                        ForeColor="Red"
                                        ValidationExpression="^[a-zA-Z'.\s]{1,25}$">
                                    </asp:RegularExpressionValidator>
                                </div>
                               <div class="span2 lbltxtalign">
                                    <asp:Label ID="lblMidInitial" runat="server" Text="Mid Initial"></asp:Label>
                                </div>
                                <div class="span1">
                                    <asp:TextBox ID="txtMidInitial" runat="server" MaxLength="1"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revMidInitial" 
                                        runat="server" 
                                        ControlToValidate="txtMidInitial"
                                        Display="Dynamic"
                                        ErrorMessage="Name cannot include numeric characters"
                                        Font-Size="Small"
                                        ForeColor="Red"
                                        ValidationExpression="^[a-zA-Z'.\s]$">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="row">

                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblLastName" runat="server" Text="Last Name*"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:TextBox ID="txtLastName" runat="server" MaxLength="25"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="refLastName" 
                                        runat="server"
                                        ControlToValidate="txtLastName"
                                        Display="Dynamic"
                                        ErrorMessage="Last name is required"
                                        Font-Size="Small"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revLastName" 
                                        runat="server" 
                                        ControlToValidate="txtLastName"
                                        Display="Dynamic"
                                        ErrorMessage="Name cannot include numeric or special characters"
                                        Font-Size="Small"
                                        ForeColor="Red"
                                        ValidationExpression="^[a-zA-Z'.\s]{1,25}$">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblDoB" runat="server" Text="Date of Birth"></asp:Label>
                                </div>
                                <div class="span2">
                                    <asp:TextBox ID="txtDoB" runat="server" 
                                        TextMode="Date" 
                                        CssClass="span2"></asp:TextBox>
                                    <asp:RangeValidator ID="rvDoB" 
                                        runat="server" 
                                        ControlToValidate="txtDoB"
                                        Display="Dynamic"
                                        ErrorMessage="Date is outside expected range"
                                        Font-Size="Small"
                                        ForeColor="Red"
                                        Type="Date">
                                    </asp:RangeValidator>
                                </div>
                                <div class="span1">
                                    <asp:Label ID="lblDateFormat" runat="server">mm/dd/yyyy</asp:Label>
                                </div>
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblGender" text="Gender*" runat="server"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:DropDownList ID="ddlGender" runat="server">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                        <asp:ListItem>Transgender</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvGender" 
                                        runat="server"
                                        ControlToValidate="ddlGender"
                                        Display="Dynamic"
                                        ErrorMessage="Gender is required"
                                        Font-Size="Small"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblHeight" runat="server" Text="Height*"></asp:Label>
                                </div>
                                <div class="span1">
                                    <asp:TextBox ID="txtHeightFt" runat="server" MaxLength="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvHeightFt" 
                                        runat="server" 
                                        ControlToValidate="txtHeightFt"
                                        Display="Dynamic"
                                        ErrorMessage="Height feet is required"
                                        Font-Size="Small"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revHeightFt" 
                                        runat="server" 
                                        ControlToValidate="txtHeightFt"
                                        Display="Dynamic"
                                        ErrorMessage="Height must be numeric"
                                        Font-Size="Small"
                                        ForeColor="Red"
                                        ValidationExpression="^\d+$">
                                    </asp:RegularExpressionValidator>
                                    <asp:RangeValidator ID="rvHeightFt" 
                                        runat="server" 
                                        ControlToValidate="txtHeightFt"
                                        Display="Dynamic"
                                        ErrorMessage="Height feet must be between 1-9"
                                        MinimumValue="1"
                                        MaximumValue="9">
                                    </asp:RangeValidator>
                                </div>
                                <div class="span1">
                                    <asp:TextBox ID="txtHeightIn" runat="server" MaxLength="2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvHeightIn" 
                                        runat="server" 
                                        ControlToValidate="txtHeightIn"
                                        Display="Dynamic"
                                        ErrorMessage="Height inches is required"
                                        Font-Size="Small"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revHeightIn" 
                                        runat="server" 
                                        ControlToValidate="txtHeightIn"
                                        Display="Dynamic"
                                        ErrorMessage="Height must be numeric"
                                        Font-Size="Small"
                                        ForeColor="Red"
                                        ValidationExpression="^\d+$">
                                    </asp:RegularExpressionValidator>
                                    <asp:RangeValidator ID="rvHeightIn" 
                                        runat="server" 
                                        ControlToValidate ="txtHeightIn"
                                        Display="Dynamic"
                                        Type="Double"
                                        ErrorMessage="Height inches must be between 0-12"
                                        MinimumValue="0"
                                        MaximumValue="12">
                                    </asp:RangeValidator>
                                </div>
                                <div class="span2"> 
                                    <asp:Label ID="lblHeightUOM" runat="server" Text="Feet / Inches"></asp:Label>
                                </div>
                                <div class="span1 lbltxtalign"> 
                                    <asp:Label ID="lblWeight" runat="server" Text="Weight*"></asp:Label>
                                </div>
                                <div class="span1">
                                    <asp:TextBox ID="txtWeight" runat="server" MaxLength="4"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvWeight" 
                                        runat="server" 
                                        ControlToValidate="txtWeight"
                                        Display="Dynamic"
                                        ErrorMessage="Weight is required"
                                        Font-Size="Small"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revWeight" 
                                        runat="server" 
                                        ControlToValidate="txtWeight"
                                        Display="Dynamic"
                                        ErrorMessage="Weight must be numeric"
                                        Font-Size="Small"
                                        ForeColor="Red"
                                        ValidationExpression="^\d+$">
                                    </asp:RegularExpressionValidator>
                                    <asp:RangeValidator ID="rvWeight" 
                                        runat="server" 
                                        ControlToValidate="txtWeight"
                                        Display="Dynamic"
                                        ErrorMessage="Weight must be between 1-2000"
                                        MinimumValue="1"
                                        MaximumValue="2000">
                                    </asp:RangeValidator>
                                </div>
                                <div class="span2"> 
                                    <asp:Label ID="lblWeightUOM" runat="server" Text="Lbs"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblHairColor" runat="server" Text="Hair Color*"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:DropDownList ID="ddlHairColor" runat="server">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Bald</asp:ListItem>
                                        <asp:ListItem>Blonde</asp:ListItem>
                                        <asp:ListItem>Black</asp:ListItem>
                                        <asp:ListItem>Brown</asp:ListItem>
                                        <asp:ListItem>Grey</asp:ListItem>
                                        <asp:ListItem>Red</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvHairColor" 
                                        runat="server" 
                                        ControlToValidate="ddlHairColor"
                                        Display="Dynamic"
                                        ErrorMessage="Hair Color is required"
                                        Font-Size="Small"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblEyeColor" runat="server" Text="Eye Color*"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:DropDownList ID="ddlEyeColor" runat="server">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Blue</asp:ListItem>
                                        <asp:ListItem>Brown</asp:ListItem>
                                        <asp:ListItem>Gray</asp:ListItem>
                                        <asp:ListItem>Green</asp:ListItem>
                                        <asp:ListItem>Hazel</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvEyeColor" 
                                        runat="server" 
                                        ControlToValidate="ddlEyeColor"
                                        Display="Dynamic"
                                        ErrorMessage="Eye Color is required"
                                        Font-Size="Small"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblRace" runat="server" Text="Race"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:DropDownList ID="ddlRace" runat="server">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Asian</asp:ListItem>
                                        <asp:ListItem>Black</asp:ListItem>
                                        <asp:ListItem>Hispanic</asp:ListItem>
                                        <asp:ListItem>Native American</asp:ListItem>
                                        <asp:ListItem>White</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblComplexion" runat="server" Text="Complexion"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:DropDownList ID="ddlComplexion" runat="server">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Dark</asp:ListItem>
                                        <asp:ListItem>Fair</asp:ListItem>
                                        <asp:ListItem>Pale</asp:ListItem>
                                        <asp:ListItem>Tan</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblBuild" runat="server" Text="Build"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:DropDownList ID="ddlBuild" runat="server">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Light</asp:ListItem>
                                        <asp:ListItem>Medium</asp:ListItem>
                                        <asp:ListItem>Heavy</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <p class="span3"><small>* Indicates a required field</small></p>
                </div>
                
                <hr />

                <div class="row">                  
                    <h4>Address & Contact Information</h4>    
                </div>
                
                <div id="address">
                    <div class="row">
                        <div class="span5">
                            <div class="row">
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblStreet1" runat="server" Text="Street"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:TextBox ID="txtStreet1" runat="server" MaxLength="50"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span3 offset2">
                                    <asp:TextBox ID="txtStreet2" runat="server" MaxLength="50"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:TextBox ID="txtCity" runat="server" MaxLength="50"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                                </div>
                                <div class="span1">
                                    <asp:TextBox ID="txtState" 
                                        runat="server"
                                        MaxLength="2"></asp:TextBox>
                                </div>
                                <div class="span1 lbltxtalign"> 
                                    <asp:Label ID="lblZip" runat="server" Text="Zip"></asp:Label>
                                </div>
                                <div class="span1">
                                    <asp:TextBox ID="txtZip" 
                                        runat="server"
                                        MaxLength="10">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:TextBox ID="txtCountry" runat="server" MaxLength="50"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="span5">
                            <div class="row">
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblPhone1" runat="server" Text="Phone"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:TextBox ID="txtPhone1" runat="server" MaxLength="14"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revPhone1"
                                        runat="server" 
                                        ControlToValidate="txtPhone1"
                                        Display="Dynamic"
                                        ErrorMessage="Phone should be formatted as:</br>(425) 555-0123</br>425-555-0123</br>425 555 0123</br>1-425-555-0123"
                                        Font-Size="Small"
                                        ForeColor="Red"
                                        ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblPhone2" runat="server" Text="Mobile"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:TextBox ID="txtPhone2" runat="server" MaxLength="14"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revPhone2"
                                        runat="server" 
                                        ControlToValidate="txtPhone2"
                                        Display="Dynamic"
                                        ErrorMessage="Phone should be formatted as:</br>(425) 555-0123</br>425-555-0123</br>425 555 0123</br>1-425-555-0123"
                                        Font-Size="Small"
                                        ForeColor="Red"
                                        ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span2 lbltxtalign"> 
                                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" MaxLength="50"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <hr />

                <div class="row">
                    <div class="span2 offset8">
                        <asp:Button ID="btnNext" runat="server" Text="Next &raquo;" CssClass="btn btn-primary btn-block" OnClick="btnNext_Click"/>
                    </div>
                </div>
            </section> 
        </div>
     </div><%--End container div--%>
</asp:Content>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profileEdit.aspx.cs" Inherits="profileEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
    <style>
        h4 {
            padding-left: 20px;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">
     <div class="container">
         <div class="row">
             <div class="span12">
                 <asp:Literal ID="litMessage" 
                     runat="server">
                 </asp:Literal>
             </div>
         </div>
        <div class="row">
            <h2 class="span12">Profile: 
                <asp:Label ID="lblFullName" 
                    runat="server"
                    Text="">
                </asp:Label>
                <asp:Label ID="lblProfileStatus" 
                    runat="server"
                    ForeColor="Red"
                    Text="Inactive Profile"
                    Visible="false">
                </asp:Label>
                <asp:HiddenField ID="hfRegID" runat="server" />
                <asp:HiddenField ID="hfStatus" runat="server" />
            </h2>
        </div>
        <hr />
        <div class="row">
            <aside class="span2">
                <asp:Image ID="imgProPrimaryPic" 
                    runat="server" 
                    CssClass="img-polaroid"/>
            </aside>

            <section class="span10 profile">
                <div class="row">
                    <h4><a data-toggle="collapse" data-target="#personalinfo"><i class="icon-plus"></i></a>Personal Information</h4>
                </div>

                <div id="personalinfo">
                    <div class="row">
                        <div class="span12">
                            <div class="row">
                                <div class="span2 right">
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
                               <div class="span2 right">
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
                                <div class="span2 right"> 
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
                                <div class="span2 right"> 
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
                                <div class="span2 right"> 
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
                                <div class="span2 right"> 
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
                                        ErrorMessage="Height inches must be between 0-12"
                                        MinimumValue="0"
                                        MaximumValue="12"
                                        Type="Double">
                                    </asp:RangeValidator>
                                </div>
                                <div class="span2"> 
                                    <asp:Label ID="lblHeightUOM" runat="server" Text="Feet / Inches"></asp:Label>
                                </div>
                                <div class="span1 right"> 
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
                                <div class="span2 right"> 
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
                                <div class="span2 right"> 
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
                                <div class="span2 right"> 
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
                                <div class="span2 right"> 
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
                                <div class="span2 right"> 
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
                            
                            <p class="offset2"><small>* Indicates a required field.</small></p>
                        </div>
                    </div>
                </div>
                
                <hr />

                <div class="row">                  
                    <h4><a data-toggle="collapse" data-target="#address"><i class="icon-plus"></i></a>Address & Contact Information</h4>    
                </div>
                
                <div id="address" class="row collapse">
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
                    <h4><a data-toggle="collapse" data-target="#emercontact"><i class="icon-plus"></i></a>Emergency Contact</h4>
                </div>

                <div id="emercontact" class="row collapse">
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
                                    <asp:TextBox ID="txtECRelatoinship" runat="server" MaxLength="25"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revRelationship" 
                                        runat="server" 
                                        ControlToValidate="txtECRelatoinship"
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
                                            <asp:TextBox ID="txtECPhone" runat="server" MaxLength="14"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revECPhone"
                                                runat="server" 
                                                ControlToValidate="txtECPhone"
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
                                            <asp:TextBox ID="txtECMobile" runat="server" MaxLength="14"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revECMobile"
                                                runat="server" 
                                                ControlToValidate="txtECMobile"
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

                <div class="row">
                    <h4><a data-toggle="collapse" data-target="#generalinfo"><i class="icon-plus"></i></a>General Information</h4>
                </div>

                <div id="generalinfo" class="row collapse">
                    <div class="row">
                        <div class="span10">

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblDisability" runat="server" Text="Impairment or Disability"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtDisability" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>
                
                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblVerbal" runat="server" Text="Verbal Ability"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtVerbal" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblMedical" runat="server" Text="Medical Conditions"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtMedical" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblMedications" runat="server" Text="Medications"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtMedications" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblSafety" runat="server" Text="Safety Concerns"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtSafety" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblCharacteristics" runat="server" Text="Physical Charcteristics"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtCharacteristics" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblClothing" runat="server" Text="Typical Clothing"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtClothing" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblHobbies" runat="server" Text="Hobbies"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtHobbies" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblFascinations" runat="server" Text="Fascinations"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtFascinations" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblFreqLocations" runat="server" Text="Frequent Locations"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtFreqLocations" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblMisc" runat="server" Text="Misc"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtMisc" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <hr />

                <div class="row">
                    <h4><a data-toggle="collapse" data-target="#policeRec"><i class="icon-plus"></i></a>Police Record History</h4>
                </div>

                <div id="policeRec" class="row collapse">
                    <div class="row">
                        <div class="span10">
                            <p><small>This section includes police record numbers that the individual has been involved in.  It does not link to any outside data source and is intended only for reference purposes.</small></p>
                        </div>
                        <div class="span10">
                            <asp:GridView ID="gdvPoliceRec" 
                                runat="server"
                                GridLines="None"
                                CssClass="table table-hover table-striped"
                                AutoGenerateColumns="false"
                                OnRowCommand="gdvPoliceRec_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="RecordNo"
                                        HeaderText="Record No.">
                                        <HeaderStyle CssClass="span9" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RecordID"
                                        ItemStyle-CssClass="hide" 
                                        ControlStyle-CssClass="hide" 
                                        HeaderStyle-CssClass="hide" 
                                        FooterStyle-CssClass="hide">
                                    </asp:BoundField>
                                    <asp:ButtonField DataTextField="RecordID"
                                        DataTextFormatString="Delete"
                                        ControlStyle-CssClass="btn btn-danger">
                                        <HeaderStyle CssClass="span1" />
                                    </asp:ButtonField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="row">
                        <div class="span10">
                            <a href="#mdlAddPoliceRec" role="button" class="btn btn-primary offset1" data-toggle="modal">Add Record</a>
                        </div>
                    </div>
                </div>

                <hr />

                <div class="row">
                    <h4><a data-toggle="collapse" data-target="#alerthistory"><i class="icon-plus"></i></a>Alert History</h4>
                </div>

                <div id="alerthistory" class="row collapse">
                    <div class="row">
                        <div class="span10">
                            <asp:Table ID="tblAlertHistory" runat="server" 
                                CssClass="table table-hover table-striped table-bordered">
                                <asp:TableHeaderRow>
                                    <asp:TableHeaderCell Text="Created Date" CssClass="span2"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell Text="Time" CssClass="span1"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell Text="End Date" CssClass="span2"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell Text="Time" CssClass="span1"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell Text="Information" CssClass="span4"></asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
                        </div>
                    </div>
                </div>
                                                                
                <hr />

                <div class="row">
                    <h4><a data-toggle="collapse" data-target="#images"><i class="icon-plus"></i></a>Images</h4>
                </div>

                <div id="images" class="row collapse">
                    <div class="row">
                        <div class="span10">
                            <asp:Table ID="tblImages" runat="server" CssClass="table table-hover table-striped table-bordered">
                                <asp:TableHeaderRow
                                    BackColor="#f9f9f9">
                                    <asp:TableHeaderCell Text=" " CssClass="span3"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell Text="Caption" CssClass="span4"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell Text="Primary" CssClass="span1"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell Text="Edit" CssClass="span1"></asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="span2 offset1">
                            <asp:HyperLink ID="hylCreateImages" 
                                runat="server" 
                                Text="Add Photo" 
                                CssClass="btn btn-primary btn-block">
                            </asp:HyperLink>
                        </div>
                    </div>
                </div>

                <hr />

                <div class="row">
                    <div class="span2">
                        <asp:Button ID="btnSaveChanges" 
                            runat="server" 
                            Text="Save Changes" 
                            CssClass="btn btn-primary btn-block" 
                            OnClick="btnSaveChanges_Click" />
                    </div>
                    <div class="span2 offset2">
                        <asp:HyperLink ID="hylChangeStatus" 
                            runat="server" role="button" 
                            CssClass="btn btn-danger btn-block"
                            NavigateUrl="#mdlInactivateProfile" 
                            Text="Inactivate" 
                            data-toggle="modal">
                        </asp:HyperLink>
                    </div>
                    <div class="span2 offset2">
                        <asp:HyperLink ID="hylDeleteProfile" 
                            runat="server" 
                            role="button" 
                            CssClass="btn btn-danger btn-block"
                            NavigateUrl="#mdlDeleteProfile" 
                            Text="Delete Profile" 
                            data-toggle="modal">
                        </asp:HyperLink>
                    </div>
                </div>
            </section> 
        </div>



        <!-- Add police record modal -->
        <div id="mdlAddPoliceRec" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="PoliceRecModal" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="H1">Add Police Record</h3>
            </div>
            <div class="modal-body">
                <p>Please enter the record number and associated police department:</p>
                <br />
                <div class="row">
                    <div class="span2 right">
                        <asp:Label ID="lblPoliceRecNo" runat="server" Text="Record No.:"></asp:Label>
                    </div>
                    <div class="span3">
                        <asp:TextBox ID="txtPoliceRecNo" runat="server" CssClass="span2"></asp:TextBox>
                    </div>
                </div>
<%--                <div class="row">
                    <div class="span2 right">
                        <asp:Label ID="lblPoliceDept" runat="server" Text="Department:"></asp:Label>
                    </div>
                    <div class="span3">
                        <asp:TextBox ID="txtPoliceDept" runat="server" CssClass="span2"></asp:TextBox>
                    </div>
                </div>--%>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                <asp:Button ID="btnSavePoliceRec" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSavePoliceRec_Click"/>
            </div>
        </div>



        <!-- Inactivate profile modal -->
        <div id="mdlInactivateProfile" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="InactiveateProfileModal" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="H2">Inactivate Profile</h3>
            </div>
            <div class="modal-body">
                <p>This will inactivate this profile and surpress it from future search results.
                    <br />
                    To reactivate a profile, use the update/edit search when logged in as an adminstrator.
                    <br />
                    Are you sure you want to inactivate this profile?
                </p>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
                <asp:Button ID="btnInactivate" 
                    runat="server" 
                    Text="Yes" 
                    CssClass="btn btn-primary" 
                    OnClick="btnChangeProfileStatus_Click"/>
            </div>
        </div><%--End inactivate modal --%>

        <!-- Activate profile modal -->
        <div id="mdlActivateProfile" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="ActiveateProfileModal" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="H3">Activate Profile</h3>
            </div>
            <div class="modal-body">
                <p>This will activate this profile and it will now appear in search results.
                    <br />
                    Are you sure you want to activate this profile?
                </p>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
                <asp:Button ID="btnActivateProfile" 
                    runat="server" 
                    Text="Yes" 
                    CssClass="btn btn-primary" 
                    OnClick="btnChangeProfileStatus_Click"/>
            </div>
        </div><%--End activate modal --%>

         <!-- Delete profile modal -->
        <div id="mdlDeleteProfile" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="DeleteProfileModal" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="H4">Delete Profile</h3>
            </div>
            <div class="modal-body">
                <p>This will permanently delete this profile and all associated records.  Once deleted, these files cannot be recovered.
                    <br />
                    Are you sure you want to delete this profile?
                </p>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
                <asp:Button ID="btnDeleteProfile" 
                    runat="server" 
                    Text="Yes" 
                    CssClass="btn btn-danger" 
                    OnClick="btnDeleteProfile_Click"/>
            </div>
        </div><%--End activate modal --%>

     </div> <%--End container div--%>

</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">
    <section class="container">

        <div>
            <h1>Search for a Record</h1>
        </div>

        <hr />         
          
        <div id ="parameters" class="collapse in">

            <div class="row">
                <div class="span2 lbltxtalign">
                    <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
                </div>
                <div class="span3">
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator 
                        ID="firstNameValidation" 
                        runat="server" 
                        ControlToValidate="txtFirstName" 
                        Display="Dynamic"
                        ErrorMessage="Please enter a valid First Name." 
                        ForeColor="Red" 
                        ValidationExpression="[a-zA-Z]*$">
                    </asp:RegularExpressionValidator>
                </div>

                <div class="span2 lbltxtalign">
                    <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
                </div>
                <div class="span3">
                    <asp:TextBox ID="txtLastName" runat="server" ></asp:TextBox>
                    <asp:RegularExpressionValidator 
                        ID="lastNameValidation" 
                        runat="server" 
                        ControlToValidate="txtLastName"
                        Display="Dynamic" 
                        ErrorMessage="Please enter a valid Last Name." 
                        ForeColor="Red" 
                        ValidationExpression="[a-zA-Z]*$">
                    </asp:RegularExpressionValidator>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="span2 lbltxtalign">
                    <asp:Label ID="lblGender" runat="server" Text="Gender:"></asp:Label>
                </div>
                <div class="span3">
                    <asp:DropDownList ID="ddlGender" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Transgender</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="span2 lbltxtalign">
                    <asp:Label ID="lblRace" runat="server" Text="Race:"></asp:Label>
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
            </div>

            <div class="row">
                <div class="span2 lbltxtalign">
                    <asp:Label ID="lblHairColor" runat="server" Text="Hair Color:"></asp:Label>
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
                </div>

                <div class="span2 lbltxtalign">
                    <asp:Label ID="lblEyeColor" runat="server" Text="Eye Color:"></asp:Label>
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
                </div>
            </div>

            <div class="row">
                <div class="span2 lbltxtalign">
                    <asp:Label ID="lblComplexion" runat="server" Text="Complexion:"></asp:Label>
                </div>
                <div class="span3">
                    <asp:DropDownList ID="ddlComplexion" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Fair</asp:ListItem>
                        <asp:ListItem>Pale</asp:ListItem>
                        <asp:ListItem>Tan</asp:ListItem>
                        <asp:ListItem>Dark</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="span2 lbltxtalign">
                    <asp:Label ID="lblBuild" runat="server" Text="Build:"></asp:Label>
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

            <br />

            <%--TODO: customer validator for height fields--%>
            <div class="row">
                <div class="span5">
                    <div class="row">
                        <div class="span2 lbltxtalign">
                            <asp:Label ID="lblHeight" 
                                runat="server" 
                                Text="Height Range:"></asp:Label>
                        </div>
                        <div class="span1">
                            <asp:TextBox ID="txtHeightFt1" 
                                runat="server"
                                MaxLength="1">
                            </asp:TextBox>
                            <asp:RegularExpressionValidator 
                                ID="heightValidation" 
                                runat="server" 
                                ControlToValidate="txtHeightFt1" 
                                Display="Dynamic"
                                ErrorMessage="Please enter a valid Height." 
                                ValidationExpression="\d{1,2}" 
                                ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="span1">
                            <asp:TextBox ID="txtHeightIn1" 
                                runat="server" 
                                MaxLength="2"></asp:TextBox>
                            <asp:RegularExpressionValidator 
                                ID="revHeightIn" 
                                runat="server" 
                                ControlToValidate="txtHeightIn1" 
                                Display="Dynamic"
                                ErrorMessage="Please enter a valid Height." 
                                ValidationExpression="\d{1,2}" 
                                ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="span1 lblalign">
                            <asp:Label ID="lblHeightUOM" 
                                runat="server" 
                                Text="Ft / In">
                            </asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="span1 offset1 lblalign right">
                            <p>To:</p>
                        </div>
                        <div class="span1">
                            <asp:TextBox ID="txtHeightFt2" 
                                runat="server" 
                                MaxLength="1"></asp:TextBox>
                            <asp:RegularExpressionValidator 
                                ID="revHeightFtTo" 
                                runat="server" 
                                ControlToValidate="txtHeightFt2" 
                                Display="Dynamic"
                                ErrorMessage="Please enter a valid Height." 
                                ValidationExpression="\d{1,2}" 
                                ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="span1">
                            <asp:TextBox ID="txtHeightIn2" 
                                runat="server" 
                                MaxLength="2">
                            </asp:TextBox>
                            <asp:RegularExpressionValidator 
                                ID="revHeightInTo" 
                                runat="server" 
                                ControlToValidate="txtHeightIn2" 
                                Display="Dynamic"
                                ErrorMessage="Please enter a valid Height." 
                                ValidationExpression="\d{1,2}" 
                                ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>

                <div class="span6">
                    <div class="row">
                        <div class="span2 lbltxtalign">
                            <asp:Label ID="lblWeight" 
                                runat="server" 
                                Text="Weight Range:"></asp:Label>
                        </div>
                        <div class="span1">
                            <asp:TextBox ID="txtWeightFrom" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator 
                                ID="revWeightFrom" 
                                runat="server" 
                                ControlToValidate="txtWeightFrom" 
                                Display="Dynamic"
                                ErrorMessage="Please enter a valid Weight." 
                                ValidationExpression="\d{1,4}" 
                                ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="span1 lblalign right">
                            <p>To:</p>
                        </div>
                        <div class="span1">
                            <asp:TextBox ID="txtWeightTo" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator 
                                ID="revWeightTo" 
                                runat="server" 
                                ControlToValidate="txtWeightTo" 
                                Display="Dynamic"
                                ErrorMessage="Please enter a valid Weight." 
                                ValidationExpression="\d{1,4}" 
                                ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </div>

                        <div class="span1 lblalign">
                            <asp:Label ID="lblWeightUOM"
                                runat="server" 
                                Text="lbs">
                            </asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="span2 lbltxtalign">
                    <asp:Label ID="lblRecordNo" runat="server" Text="Record Number:"></asp:Label>
                </div>
                <div class="span2">
                    <asp:TextBox ID="txtRecordNo" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator 
                        ID="recordNumValidation" 
                        runat="server" 
                        ControlToValidate="txtRecordNo" 
                        Display="Dynamic"
                        ErrorMessage="Please enter a valid record number."
                        ForeColor="#FF3300"
                        ValidationExpression="\d{1,7}">
                    </asp:RegularExpressionValidator>
                </div>
            </div>
        </div>
        <br />

        <div class="row">
<%--            <div class="span1">
                <a data-toggle="collapse" data-target="#parameters"><i class="icon-plus"></i></a>
            </div>--%>
            <div class="span2 offset2">
                <asp:Button ID="btnSearch" 
                    runat="server" 
                    OnClick="search_Click" 
                    Text="Search" 
                    CssClass="btn btn-primary btn-block" />
            </div>
            <div class="span2 offset4">
                <asp:HyperLink 
                    ID="hylGallery" 
                    runat="server" 
                    CssClass="btn btn-block"
                    Text="View Gallery" 
                    NavigateUrl="~/gallery.aspx">
                </asp:HyperLink>
            </div>
        </div>

        <hr />
        <asp:Panel ID="pnlResults" 
            runat="server">
            <div class="row">
                <div class="span12">
                    <h4>
                        <asp:Label ID="lblResults" 
                            runat="server" 
                            Text="Results">
                        </asp:Label>
                    </h4>
                </div>
            </div>

            <div class="row" id="results">
                <div class="span12">
                    <asp:GridView ID="gdvResults" 
                        runat="server"
                        GridLines="None"
                        CssClass="table table-striped table-hover"
                        AutoGenerateColumns="false"
                        AllowPaging="true"
                        PageSize="10"
                        OnPageIndexChanging="gdvResults_PageIndexChanging"
                        OnPageIndexChanged="search_Click">
                        <Columns>
                            <asp:ImageField DataImageUrlField="ImageURL">
                                <HeaderStyle CssClass="span2" />
                            </asp:ImageField>
                            <asp:BoundField DataField="Name"
                                HeaderText="Name">
                                <HeaderStyle CssClass="span2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DoB"
                                HeaderText="Age">
                                <HeaderStyle CssClass="span1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Gender"
                                HeaderText="Gender">
                                <HeaderStyle CssClass="span1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FormattedHeight"
                                HeaderText="Height">
                                <HeaderStyle CssClass="span1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Weight"
                                HeaderText="Weight">
                                <HeaderStyle CssClass="span1" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataTextField="RegistrantID"
                                DataTextFormatString="View Profile"
                                HeaderText="Profile"
                                DataNavigateUrlFields="RegistrantID"
                                DataNavigateUrlFormatString="~\profile.aspx?registrantID={0}">
                                <HeaderStyle CssClass="span2" />
                            </asp:HyperLinkField>
                        </Columns>
                        <PagerSettings Mode="NumericFirstLast"
                            PageButtonCount="5" />
                    </asp:GridView>
                </div>
            </div>
        </asp:Panel>
    </section>

</asp:Content>


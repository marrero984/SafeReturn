<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="quicksearch.aspx.cs" Inherits="quicksearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">

    <section class="container">

        <div class="row">
            <div class="span12">
                <h1>Search for a Record</h1>
                <p><small>*This search will return active and inactive profile records</small></p>
            </div>
        </div>

        <hr />

        <div class="row">
            <div class="span2 lbltxtalign">
                <asp:Label ID="lblRecordNo" runat="server" Text="Record Number:"></asp:Label>
            </div>
            <div class="span2">
                <asp:TextBox ID="txtRecordNo" runat="server" MaxLength="10"></asp:TextBox>
                <asp:RegularExpressionValidator 
                    ID="recordNumValidation" 
                    runat="server" 
                    ControlToValidate="txtRecordNo" 
                    ErrorMessage="Please enter a valid Record Number." 
                    ValidationExpression="\d{1,7}" 
                    ForeColor="#FF3300"
                    Display="Dynamic">
                </asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="row">
            <div class="span2 lbltxtalign">
                <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
            </div>
            <div class="span3">
                <asp:TextBox ID="txtFirstName" runat="server" MaxLength="25"></asp:TextBox>
                <asp:RegularExpressionValidator 
                    ID="firstNameValidation" 
                    runat="server" ControlToValidate="txtFirstName"
                    Display="Dynamic" 
                    ErrorMessage="Please enter a valid First Name." 
                    ForeColor="Red" 
                    ValidationExpression="[a-zA-Z]*$">
                </asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="row">
            <div class="span2 lbltxtalign">
                <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
            </div>
            <div class="span3">
                <asp:TextBox ID="txtLastName" runat="server" MaxLength="25"></asp:TextBox>
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

       <div class="row">
            <div class="span2 offset2">
                <asp:Button ID="btnSearch" 
                    runat="server" 
                    OnClick="search_Click" 
                    Text="Search" 
                    CssClass="btn btn-primary btn-block" />
            </div>
        </div>

        <hr />

        <div class="row">
            <div class="span12">
                <h4>Results</h4>
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
                    OnPageIndexChanged="search_Click"
                    AllowSorting="true">
                    <Columns>
                        <asp:ImageField DataImageUrlField="ImageURL">
                            <HeaderStyle CssClass="span2" />
                        </asp:ImageField>
                        <asp:BoundField DataField="Name"
                            HeaderText="Name">
                            <HeaderStyle CssClass="span2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Age"
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
    </section>
</asp:Content>


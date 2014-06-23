<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profileCreateImages.aspx.cs" Inherits="profileCreateImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">

    <div class="container">
        <div class="row">
            <h2 class="span12">Add Images</h2>         
        </div>
        <hr />
        <div class="row">
            <section class="span12 profile">
                <div class="row">
                    <h4>Add Images</h4>
                </div>

                <div class="row">
                    <div class="span10">
                        <asp:Label ID="lblSelectImage" runat="server" Text="Select an image to upload:"></asp:Label>
                        <asp:FileUpload id="fuImageUpload" runat="server"></asp:FileUpload>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="span1">
                        <asp:Label ID="lblImgCaption" runat="server" Text="Caption"></asp:Label>
                    </div>
                    <div class="span6">
                        <asp:TextBox ID="txtImgCaption" runat="server" Rows="3" Width="100%" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="span4 offset1">
                        <div class="checkbox">
                            <asp:CheckBox ID="cbPrimaryPhoto" runat="server" Text="Make primary photo" ToolTip="Check if this should be the profile's primary photo" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <asp:Button ID="btnAddPhoto" runat="server" Text="Add" CssClass="btn btn-primary offset1" OnClick="btnAddPhoto_Click"/>
                    <asp:Label ID="lblInvalidFile" 
                        runat="server" 
                        Text="Only image files can be uploaded"
                        Visible="false"
                        ForeColor="Red"
                        Font-Size="Small"></asp:Label>
                    </div>

                <hr />

                <div class="row">
                    <div class="span12">
                        <asp:Table ID="tblImages" runat="server" CssClass="table">
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell Text=" " Width="200"></asp:TableHeaderCell>
                                <asp:TableHeaderCell Text="Caption" Width="450"></asp:TableHeaderCell>
                                <asp:TableHeaderCell Text="Primary"></asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                        </asp:Table>
                    </div>
                </div>
                
                <hr />

                <div id="buttonrow" class="row">
                    <div class="span2 offset10">
                        <asp:HyperLink ID="hylProfile" runat="server" Text="Done" CssClass="btn btn-primary span2"></asp:HyperLink>
                    </div>
                </div>
            </section> 
        </div>
     </div><%--End container div--%>

</asp:Content>


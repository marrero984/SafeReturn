<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editImage.aspx.cs" Inherits="editImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">

    <div class="container">
        <div class="row">
            <div class="span6">
                <h2>
                    Edit Image
                </h2>
            </div>
        </div>
        
        <hr />

        <div class="row">
            <div class="span3 offset1">
                <asp:Image ID="imgEdit" runat="server" CssClass="img-polaroid"/>
            </div>
            <div class="span3">
                <asp:HiddenField ID="hfRegistrantID" runat="server" Value=""/>
                <asp:HiddenField ID="hfImageID" runat="server" Value=""/>
            </div>
        </div>

        <br />
        
        <div class="row">
            <div class="span1 lbltxtalign">
                <asp:Label ID="lblCaption" runat="server" Text="Caption"></asp:Label>
            </div>
            <div class="span5">
                <asp:TextBox ID="txtCaption" runat="server" Rows="3" TextMode="MultiLine" Width="100%"></asp:TextBox>
            </div>
        </div>
        
        <div class="row">
            <div class="span4 offset1">
                <div class="checkbox">
                    <asp:CheckBox ID="cbPrimaryPhoto" runat="server" Text="Make primary photo" ToolTip="Check if this should be the profile's primary photo" />
                </div>
            </div>
        </div>

        <br />

        <div class="row">
            <div class="span1 offset1">
                <asp:Button ID="btnSave" 
                    runat="server" 
                    Text="Save" 
                    CssClass="btn btn-primary btn-block" 
                    OnClick="btnSave_Click" />
            </div>
            <div class="span1">
                <asp:Button ID="btnCancel" 
                    runat="server" Text="Cancel" 
                    CssClass="btn btn-block" 
                    OnClick="btnCancel_Click"/>
            </div>
            <div class="span1 offset2">
                <asp:Button ID="btnDelete" 
                    runat="server" 
                    Text="Delete" 
                    CssClass="btn btn-block btn-danger" 
                    OnClick="btnDelete_Click"/>
            </div>
        </div>

    </div>

</asp:Content>
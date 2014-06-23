<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profileCreateGenInfo.aspx.cs" Inherits="profileCreateGenInfo" %>

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
                    <h4>General Information</h4>
                </div>

                <div id="generalinfo">
                    <div class="row">
                        <div class="span10">
                            <div class="row">
                                <div class="span2 lbltxtalign">
                                    <asp:Label ID="lblDisability" runat="server" Text="Impairment or Disability"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtDisability" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>
                
                            <div class="row">
                                <div class="span2 lbltxtalign">
                                    <asp:Label ID="lblVerbalAbility" runat="server" Text="Verbal Ability"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtVerbalAbility" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign">
                                    <asp:Label ID="lblMedConditions" runat="server" Text="Medical Conditions"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtMedConditions" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign">
                                    <asp:Label ID="lblMedications" runat="server" Text="Medications"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtMedications" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign">
                                    <asp:Label ID="lblSafetyConcerns" runat="server" Text="Safety Concerns"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtSafetyConcerns" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign">
                                    <asp:Label ID="lblCharacteristics" runat="server" Text="Physical Charcteristics"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtCharacteristics" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign">
                                    <asp:Label ID="lblClothing" runat="server" Text="Typical Clothing"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtClothing" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign">
                                    <asp:Label ID="lblHobbies" runat="server" Text="Hobbies"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtHobbies" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign">
                                    <asp:Label ID="lblFascinations" runat="server" Text="Fascinations"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtFascinations" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign">
                                    <asp:Label ID="lblFreqLocations" runat="server" Text="Frequent Locations"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:TextBox ID="txtFreqLocations" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 lbltxtalign">
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


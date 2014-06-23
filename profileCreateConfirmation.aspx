<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profileCreateConfirmation.aspx.cs" Inherits="profileCreateConfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">

    <div class="container">
        <div class="row">
            <h2 class="span12">Create New Profile: Confirmation</h2>
             
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
                                <div class="span2 right">
                                    <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="txtFirstName" runat="server"></asp:Label>
                                </div>
                               <div class="span2 right">
                                    <asp:Label ID="lblMidInitial" runat="server" Text="Mid Initial"></asp:Label>
                                </div>
                                <div class="span1">
                                    <asp:Label ID="txtMidInitial" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="row">

                            </div>

                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="txtLastName" runat="server"></asp:Label>
                                </div>
                                
                            </div>

                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblDoB" runat="server" Text="Date of Birth"></asp:Label>
                                </div>
                                <div class="span2 right">
                                    <asp:Label ID="txtDoB" runat="server"></asp:Label>
                                </div>
                                <div class="span1">
                                    <asp:Label ID="lblDateFormat" runat="server">mm/dd/yyyy</asp:Label>
                                </div>
                                <div class="span2 right"> 
                                    <asp:Label ID="lblGender" text="Gender " runat="server"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="ddlGender" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblHeight" runat="server" Text="Height"></asp:Label>
                                </div>
                                <div class="span1">
                                    <asp:Label ID="txtHeightFt" runat="server" MaxLength="1"></asp:Label>
                                </div>
                                <div class="span1">
                                    <asp:Label ID="txtHeightIn" runat="server" MaxLength="2"></asp:Label>
                                </div>
                                <div class="span2"> 
                                    <asp:Label ID="lblHeightUOM" runat="server" Text="Feet / Inches"></asp:Label>
                                </div>
                                <div class="span1"> 
                                    <asp:Label ID="lblWeight" runat="server" Text="Weight"></asp:Label>
                                </div>
                                <div class="span1">
                                    <asp:Label ID="txtWeight" runat="server" MaxLength="4"></asp:Label>
                                </div>
                                <div class="span2 right"> 
                                    <asp:Label ID="lblWeightUOM" runat="server" Text="Lbs"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblHairColor" runat="server" Text="Hair Color"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="ddlHairColor" runat="server"></asp:Label>
                                </div>
                                <div class="span2 right"> 
                                    <asp:Label ID="lblEyeColor" runat="server" Text="Eye Color"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="ddlEyeColor" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblRace" runat="server" Text="Race"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="ddlRace" runat="server"></asp:Label>
                                </div>
                                <div class="span2 right"> 
                                    <asp:Label ID="lblComplexion" runat="server" Text="Complexion"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="ddlComplexion" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblBuild" runat="server" Text="Build"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="ddlBuild" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <hr />

                <div class="row">                  
                    <h4>Address & Contact Information</h4>    
                </div>
                
                <div id="address">
                    <div class="row">
                        <div class="span5">
                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblStreet1" runat="server" Text="Street"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="txtStreet1" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span3 offset2">
                                    <asp:Label ID="txtStreet2" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="txtCity" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                                </div>
                                <div class="span1">
                                    <asp:Label ID="txtState" runat="server"></asp:Label>
                                </div>
                                <div class="span1"> 
                                    <asp:Label ID="lblZip" runat="server" Text="Zip"></asp:Label>
                                </div>
                                <div class="span1">
                                    <asp:Label ID="txtZip" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="txtCountry" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>

                        <div class="span5">
                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblPhone1" runat="server" Text="Phone"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="txtPhone1" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblPhone2" runat="server" Text="Mobile"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="txtPhone2" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="txtEmail" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <hr />

                <div class="row">                  
                    <h4>General Information</h4>    
                </div>

                <div id="generalinfo" >
                    <div class="row">
                        <div class="span10">

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblDisability" runat="server" Text="Impairment or Disability"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtDisability" runat="server"  ></asp:Label>
                                </div>
                            </div>
                
                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblVerbalAbility" runat="server" Text="Verbal Ability"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtVerbalAbility" runat="server"  ></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblMedConditions" runat="server" Text="Medical Conditions"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtMedConditions" runat="server"  ></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblMedications" runat="server" Text="Medications"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtMedications" runat="server"  ></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblSafetyConcerns" runat="server" Text="Safety Concerns"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtSafetyConcerns" runat="server"  ></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblCharacteristics" runat="server" Text="Physical Charcteristics"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtCharacteristics" runat="server"  ></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblClothing" runat="server" Text="Typical Clothing"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtClothing" runat="server"  ></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblHobbies" runat="server" Text="Hobbies"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtHobbies" runat="server"  ></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblFascinations" runat="server" Text="Fascinations"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtFascinations" runat="server"  ></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblFreqLocations" runat="server" Text="Frequent Locations"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtFreqLocations" runat="server"  ></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblMisc" runat="server" Text="Misc"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtMisc" runat="server"  ></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <hr />

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
                                    <asp:Label ID="txtECFirstName" runat="server"></asp:Label>
                                </div>
                                <div class="span2 right"> 
                                    <asp:Label ID="lblECLastName" runat="server" Text="Last Name"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="txtECLastName" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblECRelationship" runat="server" Text="Relationship"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="txtECRelationship" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span5">
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECStreet" runat="server" Text="Street"></asp:Label>
                                        </div>
                                        <div class="span3">
                                            <asp:Label ID="txtECStreet1" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="span3 offset2">
                                            <asp:Label ID="txtECStreet2" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECCity" runat="server" Text="City"></asp:Label>
                                        </div>
                                        <div class="span3">
                                            <asp:Label ID="txtECCity" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECState" runat="server" Text="State"></asp:Label>
                                        </div>
                                        <div class="span1">
                                            <asp:Label ID="txtECState" runat="server"></asp:Label>
                                        </div>
                                        <div class="span1"> 
                                            <asp:Label ID="lblECZip" runat="server" Text="Zip"></asp:Label>
                                        </div>
                                        <div class="span1">
                                            <asp:Label ID="txtECZip" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECCountry" runat="server" Text="Country"></asp:Label>
                                        </div>
                                        <div class="span3">
                                            <asp:Label ID="txtECCountry" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECPhone1" runat="server" Text="Phone"></asp:Label>
                                        </div>
                                        <div class="span3">
                                            <asp:Label ID="txtECPhone1" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECPhone2" runat="server" Text="Mobile"></asp:Label>
                                        </div>
                                        <div class="span3">
                                            <asp:Label ID="txtECPhone2" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECEmail" runat="server" Text="Email"></asp:Label>
                                        </div>
                                        <div class="span3">
                                            <asp:Label ID="txtECEmail" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                   
                    </div>
                </div>

                <hr />

                <div id="buttonrow" class="row">
                    <div class="span2 right">
                        <asp:Button ID="btnBack" runat="server" Text="&laquo; Back" CssClass="btn btn-inverse btn-block" OnClick="btnBack_Click"/>
                    </div>
                    <div class="span2 offset8">
                        <asp:HyperLink ID="hylCreateProfile" runat="server" role="button" CssClass="btn btn-primary btn-block" NavigateUrl="#mdlCreateProfile" Text="Create Profile" data-toggle="modal"></asp:HyperLink>
                    </div>

                     <!-- Create profile modal -->
                    <div id="mdlCreateProfile" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="CreateProfileModal" aria-hidden="true">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h3 id="H3">Confirm</h3>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="span6">
                                    <p>This will add the profile to the database.  You will have an opportunity to add photos and police record references in the next steps.  <br />Are you sure you'd like to proceed?</p>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                            <asp:Button ID="btnCreate" runat="server" Text="Create" CssClass="btn btn-primary" OnClick="btnCreate_Click"/>
                        </div>
                    </div> <!--End modal-->
                </div>

            </section> 
        </div>
    </div>

</asp:Content>


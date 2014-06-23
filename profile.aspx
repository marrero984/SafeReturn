<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
    <style>
        h4 {
            padding-left: 20px;
        }

        hr {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        a, a:hover, a:focus {
            text-decoration: none;
            color: #333333;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">

    <asp:HiddenField ID="hfAlertRecID" runat="server" />
    <asp:HiddenField ID="hfRegID" runat="server" />
    
    <div class="container">
        <div class="row">
            <h2 class="span6">Profile: 
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
            </h2>
        </div>
        <hr />
        <div class="row">
            <aside class="span2">
                <asp:Image ID="imgProPrimaryPic" runat="server" CssClass="img-polaroid"/>
                <br />
                <br />
                <asp:HyperLink ID="hylCreateAlert" runat="server" role="button" CssClass="btn btn-primary btn-block" NavigateUrl="#mdlCreateAlert" Text="Create Alert" data-toggle="modal"></asp:HyperLink>

            </aside>

            <section class="span10">
                <div class="row">
                    <h4><a data-toggle="collapse" data-target="#personalinfo"><i class="icon-plus"></i>Personal Information</a></h4>
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
                                <div class="span2">
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
                                <div class="span1 right"> 
                                    <asp:Label ID="lblWeight" runat="server" Text="Weight"></asp:Label>
                                </div>
                                <div class="span1">
                                    <asp:Label ID="txtWeight" runat="server" MaxLength="4"></asp:Label>
                                </div>
                                <div class="span2"> 
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
                                    <asp:Label ID="txtComplexion" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblBuild" runat="server" Text="Build"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="txtBuild" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <hr />

                <div class="row">                  
                    <h4><a data-toggle="collapse" data-target="#address"><i class="icon-plus"></i>Address & Contact Information</a></h4>    
                </div>
                
                <div id="address" class="row collapse">
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
                                <div class="span1 right"> 
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
                                    <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="txtPhone" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="span2 right"> 
                                    <asp:Label ID="lblMobile" runat="server" Text="Mobile"></asp:Label>
                                </div>
                                <div class="span3">
                                    <asp:Label ID="txtMobile" runat="server"></asp:Label>
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
                    <h4><a data-toggle="collapse" data-target="#emercontact"><i class="icon-plus"></i>Emergency Contact</a></h4>
                </div>

                <div id="emercontact" class="row collapse">
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
                                    <asp:Label ID="txtECRelatoinship" runat="server"></asp:Label>
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
                                        <div class="span1 right"> 
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
                                            <asp:Label ID="lblECPhone" runat="server" Text="Phone"></asp:Label>
                                        </div>
                                        <div class="span3">
                                            <asp:Label ID="txtECPhone" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="span2 right"> 
                                            <asp:Label ID="lblECPhoneMobile" runat="server" Text="Mobile"></asp:Label>
                                        </div>
                                        <div class="span3">
                                            <asp:Label ID="txtECMobile" runat="server"></asp:Label>
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

                <div class="row">
                    <h4><a data-toggle="collapse" data-target="#generalinfo"><i class="icon-plus"></i>General Information</a></h4>
                </div>

                <div id="generalinfo" class="row collapse">
                    <div class="row">
                        <div class="span10">

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblDisability" runat="server" Text="Impairment or Disability"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtDisability" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:Label>
                                </div>
                            </div>
                
                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblVerbal" runat="server" Text="Verbal Ability"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtVerbal" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblMedical" runat="server" Text="Medical Conditions"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtMedical" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblMedications" runat="server" Text="Medications"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtMedications" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblSafety" runat="server" Text="Safety Concerns"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtSafety" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblCharacteristics" runat="server" Text="Physical Charcteristics"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtCharacteristics" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblClothing" runat="server" Text="Typical Clothing"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtClothing" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblHobbies" runat="server" Text="Hobbies"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtHobbies" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblFascinations" runat="server" Text="Fascinations"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtFascinations" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblFreqLocations" runat="server" Text="Frequent Locations"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtFreqLocations" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="span2 right">
                                    <asp:Label ID="lblMisc" runat="server" Text="Misc"></asp:Label>
                                </div>
                                <div class="span8">
                                    <asp:Label ID="txtMisc" runat="server" TextMode="MultiLine" Width="100%" Rows="4"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <hr />

                <div class="row">
                    <h4><a data-toggle="collapse" data-target="#policeRec"><i class="icon-plus"></i>Police Record History</a></h4>
                </div>

                <div id="policeRec" class="row collapse">
                    <div class="row">
                        <div class="span10">
                            <p><small>This section includes police record numbers that the individual has been involved in.  It does not link to any outside data source and is intended only for reference purposes.</small></p>
                        </div>
                        <div class="span10">
                            <asp:Table ID="tblPoliceRec" 
                                runat="server" 
                                CssClass="table table-hover table-striped table-bordered">
                                <asp:TableHeaderRow>
                                    <asp:TableHeaderCell Text="Record No."></asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
                        </div>
                    </div>
                </div>

                <hr />

                <div class="row">
                    <h4><a data-toggle="collapse" data-target="#alerthistory"><i class="icon-plus"></i>Alert History</a></h4>
                </div>

                <div id="alerthistory" class="row collapse">
                    <div class="row">
                        <div class="span10">
                            <asp:Table ID="tblAlertHistory" runat="server" 
                                CssClass="table table-hover table-striped table-bordered">
                                <asp:TableHeaderRow>
                                    <asp:TableHeaderCell Text="#" Width="20"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell Text="Created Date" Width="100"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell Text="Time" Width="80"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell Text="End Date" Width="80"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell Text="Time" Width="80"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell Text="Information" Width="360"></asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
                        </div>
                    </div>
                </div>
                                                                
                <hr />

                <div class="row">
                    <h4><a data-toggle="collapse" data-target="#images"><i class="icon-plus"></i>Images</a></h4>
                </div>

                <div id="images" class="row collapse">
                    <div class="row">
                        <div class="span10">
                            <asp:Table ID="tblImages" runat="server" CssClass="table">
                                <asp:TableHeaderRow
                                    BackColor="#f9f9f9">
                                    <asp:TableHeaderCell Text=" " Width="200"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell Text="Caption" Width="450"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell Text="Primary"></asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
                        </div>
                    </div>
                </div>

                <hr />

                <div id="buttonrow" class="row">
                    <div class="span2">
                        <asp:Button ID="btnUpdateProfile" 
                            runat="server" 
                            Text="Update Profile" 
                            CssClass="btn btn-primary btn-block" 
                            OnClick="btnUpdateProfile_Click"
                            Visible="false" />
                    </div>
                </div>
            </section> 
        </div>


        <!-- Create Alert modal -->
        <div id="mdlCreateAlert" class="modal modal-wide hide fade" tabindex="-1" role="dialog" aria-labelledby="CreateAlertModal" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="H2">Create Alert for <asp:Label ID="lblFullNameAlertModal" runat="server" Text=""></asp:Label></h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="span6">
                        <p>This will create a system-wide alert for the above individual.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="span2">
                        <p>Additional information: </p>
                    </div>
                    <div class="span6">
                        <asp:Textbox ID="txtAlertInfo" runat="server" TextMode="MultiLine" Rows="8" CssClass="span6"></asp:Textbox>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                <asp:Button ID="btnSaveAlert" runat="server" Text="Create" CssClass="btn btn-primary" OnClick="btnSaveAlert_Click"/>
            </div>
        </div> <!--End modal-->

        <!-- End Alert modal -->
        <div id="mdlEndAlert" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="EndAlertModal" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="H3">End Alert for <asp:Label ID="lblFullNameEndAlertModal" runat="server" Text=""></asp:Label></h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="span6">
                        <p>This will end the system-wide alert for the above individual.  Are you sure you'd like to proceed?</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
                <asp:Button ID="btnEndAlert" runat="server" Text="Yes" CssClass="btn btn-primary" OnClick="btnEndAlert_Click"/>
            </div>
        </div> <!--End modal-->
     </div><%--End container div--%>
</asp:Content>
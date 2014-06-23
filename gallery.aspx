<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="articlePlaceHolder" Runat="Server">
    <div class="container">
        <h1>Browse Primary Profile Images</h1>
        <p><small>*Excludes inactive profiles and profiles that do not have a primary profile image.</small></p>
         <div class="row">
                    <h4><a data-toggle="collapse" data-target="#attributeFilters"><i class="icon-plus"></i>Attributes Filter</a></h4>
         </div>
        <div class="row collapse" id="attributeFilters" style="height:0">
            <div class="span2" id="genderFilter">
              <p class="pull-left"><h5>Gender</h5></p>
                <div class="controls span5">
                    <label class="checkbox">
                            <input class="checkbox" value="G" type="radio" name="gender" checked="checked"> All
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="GMale" type="radio" name="gender"> Male
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="GFemale" type="radio" name="gender"> Female
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="GTransgender" type="radio" name="gender"> Transgender
                    </label>
               </div>
            </div>
           <div class="span2" id="raceFilter">
              <p class="pull-left"><h5>Race</h5></p>
                <div class="controls span5">
                    <label class="checkbox">
                            <input class="checkbox" value="R" type="radio" name="race" checked="checked"> All
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="RAsian" type="radio" name="race">  Asian
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="RBlack" type="radio" name="race">  Black
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="RHispanic" type="radio" name="race">  Hispanic
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="RNative American" type="radio" name="race">  Native American
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="RWhite" type="radio" name="race">  White
                    </label>
               </div>
            </div>
            <div class="span2" id="hairFilter">
              <p class="pull-left"><h5>Hair Color</h5></p>
                <div class="controls span5">
                    <label class="checkbox">
                            <input class="checkbox" value="H" type="radio" name="hair" checked="checked">  All
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="HBald" type="radio" name="hair">  Bald
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="HBlonde" type="radio" name="hair">  Blonde
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="HBlack" type="radio" name="hair">  Black
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="HBrown" type="radio" name="hair">  Brown
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="HGrey" type="radio" name="hair">  Grey
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="HRed" type="radio" name="hair">  Red
                    </label>
               </div>
            </div>
            <div class="span2" id="eyeFilter">
              <p class="pull-left"><h5>Eye Color</h5></p>
                <div class="controls span5">
                    <label class="checkbox">
                            <input class="checkbox" value="E" type="radio" name="eye" checked="checked">  All
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="EBlue" type="radio" name="eye">  Blue
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="EBrown" type="radio" name="eye">  Brown
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="EGray" type="radio" name="eye">  Gray
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="EGreen" type="radio" name="eye">  Green
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="EHazel" type="radio" name="eye">  Hazel
                    </label>
               </div>
            </div>
            <div class="span2" id="complexionFilter">
              <p class="pull-left"><h5>Complexion</h5></p>
                <div class="controls span5">
                    <label class="checkbox">
                            <input class="checkbox" value="C" type="radio" name="complexion" checked="checked">  All
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="CFair" type="radio" name="complexion">  Fair
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="CPale" type="radio" name="complexion">  Pale
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="CTan" type="radio" name="complexion">  Tan
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="CDark" type="radio" name="complexion">  Dark
                    </label>
               </div>
            </div>
            <div class="span2" id="buildFilter">
              <p class="pull-left"><h5>Build</h5></p>
                <div class="controls span5">
                    <label class="checkbox">
                            <input class="checkbox" value="B" type="radio" name="build" checked="checked">  All
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="BLight" type="radio" name="build">  Light
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="BMedium" type="radio" name="build">  Medium
                    </label>
                    <label class="checkbox">
                            <input class="checkbox" value="BHeavy" type="radio" name="build">  Heavy
                    </label>
               </div>
            </div>
      </div>
        <div id="gallery">
                <asp:ListView ID="photoListView" runat="server" GroupItemCount="8">
                    <LayoutTemplate>
                        <table cellpadding="4" runat="server" id="galleryTable">
                            <tr runat="server" id="groupPlaceholder">
                            </tr>
                        </table>
<%--                        <asp:DataPager runat="server" ID="DataPager" PageSize="10">
                            <Fields>
                                <asp:NumericPagerField ButtonCount="5" PreviousPageText="Previous" NextPageText="Next" />
                            </Fields>
                        </asp:DataPager>--%>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <tr runat="server" id="galleryRow">
                            <td runat="server" id="itemPlaceholder"></td>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <td class="registrant" valign="top" runat="server" attr-data='<%#string.Format("G{0};R{1};H{2};E{3};C{4};B{5}", DataBinder.Eval(Container.DataItem, "Gender"), DataBinder.Eval(Container.DataItem, "Race"),DataBinder.Eval(Container.DataItem, "HairColor"),DataBinder.Eval(Container.DataItem, "EyeColor"),DataBinder.Eval(Container.DataItem, "Complexion"),DataBinder.Eval(Container.DataItem, "Build"))%>'>
                        <asp:HyperLink ID="galleryLink" runat="server" NavigateUrl='<%#string.Format("profile.aspx?RegistrantID={0}", DataBinder.Eval(Container.DataItem, "RegistrantID")) %>'>
                                <asp:Image id="galleryPic" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"ImageURL") %>' height="150" width="100" />
                                <br />
                                <asp:Label ID="galleryLabel" runat="server" Text='<%#string.Format("{0}&nbsp;{1}", DataBinder.Eval(Container.DataItem,"FirstName"),DataBinder.Eval(Container.DataItem,"LastName"))%>'></asp:Label>
                        </asp:HyperLink>
                        </td>
                    </ItemTemplate>
                </asp:ListView>
        </div>
        <script>
            //stores all selected values
            var values = new Array();
            //check registrants attributes
            function checkRegistrants() {
                $('.registrant').each(function (i, e) {
                    $element = $(this)
                    $(this).show()
                    $.each(values, function (index, value) {
                        $(this).show()
                        //hide unwanted images
                        if ($element.attr('attr-data').indexOf(value) < 0)
                            $element.hide()
                    })
                });
            }
            //checkbox change listener
            $('.checkbox').change(function () {
                var attribute = $(this).val();
                if(attribute)
                {
                    //check if I already selected a value for that attribute
                    values = $.grep(values, function (val) {
                        //first character identifies attribute
                        return val.charAt(0) != attribute.charAt(0);
                    });
                    //add new value
                    if (attribute.length > 1)
                        values.push(attribute)
                    checkRegistrants()
                }
            });
        </script>
        <br />
        <br />

        <div class="row">
            <div class="span2">
                <asp:HyperLink ID="hylSearch" 
                    runat="server"
                    NavigateUrl="~/search.aspx"
                    CssClass="btn btn-block"
                    Text="Search by Parameter">
                </asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>


//Image type validation
function imageValidate() {
    var result = false;
    var upfile = document.getElementById("FileUpload1").value;
    if (upfile != "") {
        var accept = "png,gif,jpg,jpeg".split(',');
        var getExtention = upfile.split('.');
        var extention = getExtention[getExtention.length - 1];
        for (i = 0; i < accept.length; i++) {
            if (accept[i] == extention) {
                result = true;
                break;
            }
        }
        if (!result) {
            alert("allowed file extention are png,gif,jpg,jpeg");
        }
    }
    else {
        alert("select image to Upload");
    }
    return result;
}
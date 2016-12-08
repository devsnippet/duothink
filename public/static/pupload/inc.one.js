/**
 * Created by imdnte on 7/22/2016.
 */
var shopThumbString='';
var uploader = new plupload.Uploader({
    runtimes : 'html5,flash,silverlight,html4',
    browse_button : 'pickfiles', // you can pass an id...
    container: document.getElementById('am-widget-pupload'), // ... or DOM Element itself
    url : "/common/helper/uploader.html?filename=file",
    flash_swf_url : '../js/Moxie.swf',
    silverlight_xap_url : '../js/Moxie.xap',
    filters : {
        max_file_size : '10mb',
        mime_types: [
            {title : "Image files", extensions : "jpg,gif,png"},
            {title : "Zip files", extensions : "zip"}
        ]
    },
    multi_selection: false, //多文件上传true，
    init: {
        FilesAdded: function(up, files) {
            uploader.start(); //添加自动上传
        },
        //文件上传完成，接受返回数据
        FileUploaded: function(up, file, info) {
            var $con = $('.am-widget-pupload');
            $con.append('<img src="'+info.response+'"><input type="hidden" name="thumb" value="'+info.response+'">');
        }
    }
});
uploader.init();
function removeShopThumb(e,f){
    $('#'+e).remove();
    $('#thumb-'+e).remove();
    $.get('/api/helper/unlink_file',{file:f});
}
wangEditor.config.printLog = false;
var editor = new wangEditor(editorTarget);
editor.config.uploadImgUrl = '/plugin/helper/uploader.html?filename=wangEditorH5File';
editor.config.menus = [ 'source', '|', 'bold', 'underline', 'italic', 'strikethrough', 'forecolor', 'bgcolor', 'quote', 'fontsize', 'head', 'unorderlist', 'orderlist', 'alignleft', 'aligncenter', 'link', 'unlink', 'table', 'img', 'video', 'location', 'insertcode', 'fullscreen' ];
editor.create();
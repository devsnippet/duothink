/*
 * author:@Abelw
 * date:2016-10-04 18:22
 * qq:673162780
 * email:vicenwe@163.com
 */
'use strict';
(function(that, fn) {
    if(that){
        fn(that);
    }
    else{
        fn(this);
    }
})(window?window:this, function(that) {
    Object.prototype.addListener = function(str, fn, boolean){
        if(isNaN(parseInt(this.length))) {
            if(this.addEventListener){
                this.addEventListener(str, fn, boolean||false);
            }else{
                this.attachEvent("on"+str,fn);
            }
        }else if(this.length > 0){
            this.forEach(function(that){
                if(this.addEventListener){
                    that.addEventListener(str, fn, boolean||false);
                }else{
                    that.attachEvent("on"+str, fn);
                }
            })
        }
        return this;
    };
    var Abel = function() {};
    var defaultAbel = {
            filterType:"length",
            length:20,
            callback:function() {
                console.log("超出限制");
            }
        },
        init = function(abel, obj) {
            if(obj){
                if(obj.filterType){
                    switch(obj.filterType){
                        case 'length':
                            addlistenter(abel.obj, "keyup", function(){
                                var len = obj.length||20;
                                if(this.value.length > len){
                                    obj.callback.apply(this, null);
                                }
                            });
                            break;
                        case 'RegExp':
                            addlistenter(abel.obj, "keyup", function(){
                                if(this.value.match(obj.reg)){
                                    obj.callback.apply(this, null);
                                }
                            });
                            break;
                    }
                }
            }else{
                init(abel, defaultAbel);
            }
        },
        addlistenter = function(obj, event, callback) {
            obj.addListener(event, function(){
                callback.apply(this, null);
            });
        };
    function O(obj) {
        var o = new Abel();
        o.obj = obj.obj;
        init(o, obj);
        return o;
    }
    that.statistics = O;
});
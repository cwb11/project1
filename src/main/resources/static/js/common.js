/**
 * 公共弹出层
 * @param url
 * @param title
 */

function openLayer(url,title) {
    $.ajaxSettings.async=false//先设置为同步
    $.get(url,function (res) {
        layer.open({
            type: 1
            , title: title
            , area:['800px', '450px']
            , content: res
        });
    });
    $.ajaxSettings.async=true//后设置异步，因为这是if判断
}

/**
 * 监听提交事件
 * @param filter
 * @param type
 */
function mySubmit(filter,type,func) {
    layui.form.on('submit('+filter+')',function(data){

        if (typeof (func) !='undefined'){
            func(data.field);
        }

        $.ajax({
            url: data.form.action,
            async:false,
            type:type,
            contentType:'application/json;charset=utf-8',
            data:JSON.stringify(data.field),
            success:function(res){
                if(res.code==0){
                    layer.closeAll();
                    query();
                }else{
                    layer.alert(res.msg);
                }
            }
        })
        return false
    })

}

/**
 * 公共删除方法
 * @param url
 * @param type
 */

function myDelete(url){
    $.ajax({
        url: url,
        async:false,
        type:'DELETE',
        success:function(res){
            if(res.code==0){
                query();
            }else{
                layer.alert(res.msg);
            }
        }
    })
}
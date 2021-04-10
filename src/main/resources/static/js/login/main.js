/**
 * 打开选项卡，进入相应的模板主页
 * @param url
 * @param name
 * @param id
 */

function showTab(url,name,id) {

    var length=$("li[lay-id="+id+"]").length;
    var element=layui.element;
    if(length==0){
        var fullUrl="/"+url;
        var height=$(window).height() - 185;
        var content='<iframe style="width: 100%;height:'+height+'px" src="'+fullUrl+'" frameborder="0" scrolling="no">'
        element.tabAdd('menu',{
            title:name,
            content:content,
            id:id
        });
    }
    element.tabChange("menu",id);
}
// adminLayuiSetting.js
// 后台layui设置
// create : 2019-5-4
$(function(){
    $.pjax.defaults.timeout = 5000;
    $.pjax.defaults.maxCacheLength = 0;
    
    $(document).pjax('a:not(a[target="_blank"])', {container:'#pjax-container', fragment:'#pjax-container'});
    
    $(document).on('submit', 'form[pjax-search]', function(event) {
        $.pjax.submit(event, {container:'#pjax-container', fragment:'#pjax-container'})
    })
    
    $(document).on('pjax:send', function() { NProgress.start(); });
    $(document).on('pjax:complete', function() { NProgress.done(); });
    
    //鍒嗛〉select閫夋嫨椤垫暟
    $('body').off('change', '.pagination select');
    $('body').on('change', '.pagination select', function(event){
        var _href = $(this).find('option:selected').data('href');
        $.pjax({url:_href, container: '#pjax-container', fragment:'#pjax-container'})
    });
    
    //鍒嗛〉input閫夋嫨椤垫暟
    $('body').off('keypress', '.pagination input');
    $('body').on('keypress', '.pagination input', function(event){
        if(event.keyCode == '13'){
            var _href = $(this).data('href')+'&list_rows='+$(this).val();
           $.pjax({url:_href, container: '#pjax-container', fragment:'#pjax-container'})
        }
    });
    
    //涓嬫媺閫夋嫨鎼滅储
    $('body').off('click', '.search-ul li a');
    $('body').on('click', '.search-ul li a', function(event){
        var _this = $(this);
        var _field = _this.data('field');
        var _html = _this.html();
        var _box = _this.closest('.input-group-btn');
        _box.find('.search_field').val(_field);
        _box.find('.dropdown-toggle span').html(_html);
        _box.next('input').attr('placeholder', _html);
    });
    
    //鎻愪氦
    $('body').off('click', '.submits');
    $('body').on('click', '.submits', function(event){
        var _this = $(this);
        _this.button('loading');
        var form = _this.closest('form');
        if(form.length){
            var ajax_option={
                dataType:'json',
                success:function(data){
                    if(data.status == '1'){
                        layer.msg(data.info, {icon: 1});
                        if(data.url != ''){
                            $.pjax({url: data.url, container: '#pjax-container', fragment:'#pjax-container'});
                        }
                    }else{
                        _this.button('reset');
                        layer.msg(data.info, {icon: 2});
                    }
                }
            }
            form.ajaxSubmit(ajax_option);
        }
    });
    
    //鐘舵€乻tatus鍒楄〃淇敼锛堝彧鑳借繘琛�0鍜�1鍊肩殑鍒囨崲锛�
    $('body').off('click', 'td a.editimg');
    $('body').on('click', 'td a.editimg', function(event){
        var addclass;
        var removeclass;
        var pvalue;   //鎻愪氦鍊�
        var _this = $(this);
        var field = _this.data('field');
        var id = _this.data('id');
        var value = _this.data('value');
        var url = _this.data('url');
        if ( value == 1){
            pvalue = 0;
            addclass = 'fa-check-circle text-green';
            removeclass = 'fa-times-circle text-red';
        }else{
            pvalue = 1;
            addclass = 'fa-times-circle text-red';
            removeclass = 'fa-check-circle text-green';
        }
        var dataStr = jQuery.parseJSON( '{"id":"'+id+'","'+field+'":"'+pvalue+'"}' );   //瀛楃涓茶浆json
        $.ajax({
            type : 'post',
            url : url,
            dataType : 'json',
            data : dataStr,
            success : function(data) {
                if(data.status == '1'){
                    _this.data('value', pvalue);
                    _this.removeClass(addclass);
                    _this.addClass(removeclass);
                    layer.msg(data.info, {icon: 1});
                }else{
                    layer.msg(data.info, {icon: 2});
                }
            }
        });
    });
    
    //鍗曟潯鍒犻櫎-鎵归噺鍒犻櫎
    $('body').off('click', '.btn-confirm');
    $('body').on('click', '.btn-confirm', function(event){
        event.preventDefault();
        var _this = $(this);
        var title = _this.data('title')?_this.data('title'):'鍒犻櫎';
        var url_del = _this.data('url')||'';
        var message = _this.data('message')?_this.data('message'):'纭鎿嶄綔锛�';
        var id = _this.data('id')||'';
        if(id == ''){       //鎵归噺鍒犻櫎
            var str = '';
            var table_box = _this.closest('.box-header').next('.box-body').find('.table tr td input[name="id[]"]');
            $(table_box).each(function(){
                if(true == $(this).is(':checked')){
                    str += $(this).val() + ',';
                }
            });
            if(str.substr(str.length-1)== ','){
                id = str.substr(0, str.length-1);
            }
        }
        if(id && url_del){
            layer.confirm(message, {
                title : title,
                btn: ['纭畾', '鍙栨秷'] //鎸夐挳
            }, function(){
                $.ajax({
                    type : 'post',
                    url : url_del,
                    dataType : 'json',
                    data : { id:id, },
                    success : function(data) {
                        if(data.status == '1'){
                            layer.msg(data.info, {icon: 1});
                            if(data.url != ''){
                                $.pjax({url: data.url, container: '#pjax-container', fragment:'#pjax-container'})
                            }
                        }else{
                            layer.msg(data.info, {icon: 2});
                        }
                    }
                });
            });
        }
    });
    
    //鑿滃崟鏍峰紡
    $('body').off('click', '.sidebar-menu li.treeview li');
    $('body').on('click', '.sidebar-menu li.treeview li', function(event){
        var _this = $(this);
        $('.sidebar-menu li').removeClass('active');
        _this.addClass('active');
        _this.closest('li.treeview').addClass('active');
    });
    $('body').off('click', '.sidebar-menu > li:eq(0)');
    $('body').on('click', '.sidebar-menu > li:eq(0)', function(event){
        $('.sidebar-menu li').removeClass('active');
        var _this = $(this).addClass('active');
    });
})

function index_list_init(){
    /*ajax椤甸潰鍔犺浇icheck锛屾湁璇ユ帶浠剁殑椤甸潰鎵嶉渶瑕�*/
    $('.icheck').iCheck({ checkboxClass:'icheckbox_flat-green', radioClass: 'iradio_flat-green'});
    
    /*鍏ㄩ€�-鍙嶉€�*/
    $('.checkbox-toggle').on('ifChecked', function(event){
        $(this).closest('.table').find('tr td input[type="checkbox"]').iCheck('check');
    }).on('ifUnchecked', function(event){
        $(this).closest('.table').find('tr td input[type="checkbox"]').iCheck('uncheck');
    });
}
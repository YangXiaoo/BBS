$(function(){
    $.pjax.defaults.timeout = 5000;
    $.pjax.defaults.maxCacheLength = 0;
    
    toastr.options = {
        closeButton: true,
        debug: false,
        progressBar: true,
        positionClass: "toast-top-right",
        showDuration: "300",
        preventDuplicates: true,
        hideDuration: "300",
        timeOut: "3000",
        extendedTimeOut: "1000",  
        showEasing: "swing",                
        hideEasing: "linear",
        showMethod: "fadeIn",
        hideMethod: "fadeOut"
    };
    
    
    $('body').off('click', '.login_out');
    $('body').on("click", '.login_out', function(event){
        var url = $(this).attr('href');
        window.location.href=url;
        return false;
    });

    
    $(document).pjax('a:not(a[target="_blank"])', {container:'#pjax-container', fragment:'#pjax-container'});



    $('body').off('click', '#category');
    $('body').on("click", '#category', function(event){
        var url = $(this).attr('href');
        window.location.href=url;
        return false;
    });

    $('body').off('click', '#index');
    $('body').on("click", '#index', function(event){
        var url = $(this).attr('href');
        window.location.href=url;
        return false;
    });

    $(document).on('submit', 'form[pjax-search]', function(event) {
        var _this = $(this);
        $.pjax.submit(event, {container:'#pjax-container', fragment:'#pjax-container'});
        _this.find('input[name="k"]').val('');
    })
    
    $(document).on('pjax:send', function() { NProgress.start(); });
    $(document).on('pjax:complete', function() { NProgress.done(); });

    // 消息
    $('[data-toggle="tooltip"]').tooltip();

    // 首页
    $('body').off('click', '.article');
    $('body').on('click', '.article', function(event){
        var _this = $(this);
        _this.addClass('on');
    });
    $('body').off('click', '.login-btn');
    $('body').on("click", '.login-btn', function(event){
        var _this = $(this);
        var url = _this.data('url');
        var title = '登录';
        var message = '<div class="login-dialog"><form method="POST" action="'+url+'" enctype="multipart/form-data" ><input type="username" name="username" /><input type="password" name="password"/></form></div>';
        // layer.confirm(message, {
        //     title : title,
        //     btn : ['确定', '取消']
        // }, function() {
        //     var form = $('.login-dialog').find('form');
        //     var ajax_option={
        //         dataType:'json',
        //         success:function(data){
        //             if(data.status == '1'){
        //                 layer.msg("登录成功", {icon: 1});
        //                 location.reload();
        //             }else{
        //                 layer.msg("登录失败", {icon: 2});
        //             }
        //         }
        //     }
        //     form.ajaxSubmit(ajax_option);
        // }, function(){
        //     layer.msg("取消成功", {icon: 6});
        // });
        BootstrapDialog.confirm({
            title: title,
            message: message,
            btnCancelLabel: '取消',
            btnOKLabel: '登录',
            callback: function(result) {
                if(result) {
                    var form = $('.login-dialog').find('form');
                    var ajax_option={
                        dataType:'json',
                        success:function(data){
                            if(data.status == '1'){
                                layer.msg(data.info, {
                                    offset: 't',
                                      anim: 6
                                    });
                                location.reload();
                            }else{
                                layer.msg(data.info, {icon: 2});
                            }
                        }
                    }
                    form.ajaxSubmit(ajax_option);
                }
            }
        });
    });

});

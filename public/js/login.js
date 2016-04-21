/* login js by daimingru */
//页面跳转js
function checkformgo(){
    var username = $('#username').val();
    var password = $('#password').val();
    if(username && password ){
        $.ajax({
            type: 'post',
            data:{username:username,password:password},
            dataType: "json",
            url: '/login',
            beforeSend: function (){
                $('.loading').css('display','block');
            },
            success: function (data) {
                  if(data.success){
                    alert('恭喜！登录成功！');
                    window.location.href = "/admin";
                  }else{
                    alert('邮箱或密码错误，请重新输入！');
                  }
                  $('.loading').css('display','none');
            },error:function(XMLHttpRequest, textStatus, errorThrown){
                console.log(XMLHttpRequest.status);
                console.log(XMLHttpRequest.readyState);
                alert('对不起，发生了错误！');
                console.log(textStatus);
                $('.loading').css('display','none');
            }
        });
    }else{
        alert('邮箱或密码不能为空，请重新输入！');
    }
    
}
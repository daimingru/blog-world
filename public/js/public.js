/* public js by daimingru */

//文章标题效果
function actionAnimate(){
      if(event.type == "mouseover"){
        $(this).addClass('titlego');
      }else if(event.type == "mouseout"){
        $(this).removeClass('titlego');
      }
}

var loading = {
    Start:function(){
        $('.loading').css('display','block');
    },
    Close:function(){
        $('.loading').css('display','none');
    }
}


/* public js by daimingru */

//文章标题效果
function actionAnimate(){
      if(event.type == "mouseover"){
        $(this).addClass('titlego');
      }else if(event.type == "mouseout"){
        $(this).removeClass('titlego');
      }
}

//文章关闭效果
function CloseArticle(){
      $('.articlebox').addClass('articleback');
      document.body.scrollTop = scrollTop;
}


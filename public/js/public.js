/* public js by daimingru */
//页面跳转js
function SelectMenuPage(obg){
  $('.articlebox').css('display','none');	
  var path = $(obg).attr('data_src');
  $.ajax({
			type: 'post',
			dataType: "html",
			url: path,
			beforeSend:function(){
				$('.loading').css('display','block');
			},
			success: function (data) {
					$('.rightcont').html(data);
					$('.blog_title').on('mouseover mouseout',actionAnimate);
					$('.loading').css('display','none');
			},error:function(XMLHttpRequest, textStatus, errorThrown){
				console.log(XMLHttpRequest.status);
				console.log(XMLHttpRequest.readyState);
				alert('对不起，发生了错误！');
				console.log(textStatus);
				$('.loading').css('display','none');
			}
   });
}

//详情页页面跳转js
function ArticleMenuPage(obg){
  $('.articlebox').css('display','block');
  $('.articlebox').removeClass('articlego');
  $('.articlebox').removeClass('articleback');
  var path = $(obg).attr('data-href');
  $.ajax({
			type: 'post',
			dataType: "html",
			url: path,
			beforeSend:function(){
				$('.loading').css('display','block');
			},
			success: function (data) {
				    var scrollTop=document.body.scrollTop;
					$('.articlebox').html(data);
					$('.articlebox').css('top',scrollTop);
					$('.articlebox').addClass('articlego');
					$('.loading').css('display','none');
			},error:function(XMLHttpRequest, textStatus, errorThrown){
				console.log(XMLHttpRequest.status);
				console.log(XMLHttpRequest.readyState);
				alert('对不起，发生了错误！');
				console.log(textStatus);
				$('.loading').css('display','none');
			}
   });
}

//文章标题效果
function actionAnimate(){
      if(event.type == "mouseover"){
        $(this).addClass('titlego');
      }else if(event.type == "mouseout"){
        $(this).removeClass('titlego');
      }
}

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
}
/* public js by daimingru */
//页面跳转js
function SelectMenuPage(obg){
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
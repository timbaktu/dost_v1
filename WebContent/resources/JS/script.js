$( document ).ready(function() {
		
		/*applying properties based on url*/
		var url = $(location).attr("pathname").split("/");
		$('#main-navbar .menuItems a[href="'+url[url.length-1]+'"]').parent("li").addClass("active");
		
		if(url[url.length-3] ==('posts' || 'forums')){
			$('li#discussions').addClass("active");			
		}
		
		
		if(window.location.href.indexOf("counselor") > -1){
			$("body").addClass("theme-default-counselor");
		}
		
		if(window.location.href.indexOf("login") > -1){
			$(".login_now").hide();
		}
		
		if(window.location.href.indexOf("signupNow") > -1){
			$(".signup_now").hide();
		}
		/*end of applying properties based on url*/	
		
		
		/*styling the favorite discussion iframe*/
		setTimeout(function(){
			$("iframe.popularDiscussions").contents().find("li").css({
					'list-style':'none',
					'margin-bottom':'10px',
					
			});
			
			$("iframe.popularDiscussions").contents().find("a").css({
				'color':'#333333',
				'font-family':'Arial,Helvetica,sans-serif',
				'font-size':'12px',
				'text-decoration': 'none',
			});

			$("iframe.popularDiscussions").contents().find("a:hover").css({
				'text-decoration': 'underline',
			});
			
			$("iframe.popularDiscussions").contents().find("ul").css({
				'padding-left': '0',
			});
		},100);
		/*end of styling the favorite discussion iframe*/
});
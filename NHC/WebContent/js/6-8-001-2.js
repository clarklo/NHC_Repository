$(function(){

	$("#MENU1").hover(
		function(){
			$("#SUB1").stop(true, true).slideDown(700);	
		},
		function(){
			$("#SUB1").stop(true, true).slideUp(700);	
		});
	
	$("#MENU2").hover(
		function(){
			$("#SUB2").stop(true, true).slideDown(700);	
		},
		function(){
			$("#SUB2").stop(true, true).slideUp(700);	
		});
		
	$("#MENU3").hover(
		function(){
			$("#SUB3").stop(true, true).slideDown(700);	
		},
		function(){
			$("#SUB3").stop(true, true).slideUp(700);	
		});
		
	$("#MENU4").hover(
		function(){
			$("#SUB4").stop(true, true).slideDown(700);	
		},
		function(){
			$("#SUB4").stop(true, true).slideUp(700);	
		});
		
	$("#MENU5").hover(
		function(){
			$("#SUB5").stop(true, true).slideDown(700);	
		},
		function(){
			$("#SUB5").stop(true, true).slideUp(700);	
		});
		
});

/*-------開闔------*/

$(function(){
	
	$(".COURSE h3").click( function(){
		
		$(this).siblings().slideToggle(500);
		
		return false;
		
	});
	$(".COURSE h3").click(function(){
			$(this).parents('.qa_content').prev().click();
			return false;
		});
		
});

/*-------頁籤------*/

$(function(){
		// 預設顯示第一個 Tab
		var _showTab = 0;
		var $defaultLi = $('ul.tabs li').eq(_showTab).addClass('active');
		$($defaultLi.find('a').attr('href')).siblings().hide();
		
		// 當 li 頁籤被點擊時...
		// 若要改成滑鼠移到 li 頁籤就切換時, 把 click 改成 mouseover
		$('ul.tabs li').click(function() {
			// 找出 li 中的超連結 href(#id)
			var $this = $(this),
				_clickTab = $this.find('a').attr('href');
			// 把目前點擊到的 li 頁籤加上 .active
			// 並把兄弟元素中有 .active 的都移除 class
			$this.addClass('active').siblings('.active').removeClass('active');
			// 淡入相對應的內容並隱藏兄弟元素
			$(_clickTab).stop(false, true).fadeIn().siblings().hide();

			return false;
		}).find('a').focus(function(){
			this.blur();
		});
	});

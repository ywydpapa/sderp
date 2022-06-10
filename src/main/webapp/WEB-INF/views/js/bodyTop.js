$(document).ready(function(){
	$("#sideMenu ul").not("#work, #panel").hide();
	
	$("#mainTopMenu ul li button").mouseover(function(){
		$(this).prop("style", "background: linear-gradient(to bottom, #ffffff 95%, #302D81 5%); cursor: pointer;");
	}).mouseout(function(){
		if($(this).attr("class") !== "active"){
			$(this).prop("style", "background: linear-gradient(to bottom, #ffffff 100%, #302D81 0%); cursor: pointer;");
		}
	});
	
	$("#sideMenu").find("ul li").mouseover(function(){
		$(this).prop("style", "background-color:#EDEDF4; cursor: pointer;");
		if($(this).parent().attr("id") !== "panel"){
			$(this).find("span").css("color", "");
			$(this).find("span").css("color", "#302D81");
			$(this).find("img").prop("src", $(this).find("img").prop("src").replace(".png", "_hover.png"));
		}else{
			$(this).find("a").css("color", "");
			$(this).find("a").css("color", "#302D81");
		}
	}).mouseout(function(){
		if($(this).parent().attr("id") !== "panel"){
			if($(this).attr("class") !== "active"){
				$(this).css("background-color", "");
				$(this).css("background-color", "#302D81");
				$(this).find("span").css("color", "");
				$(this).find("span").css("color", "#ffffff");
				$(this).find("img").prop("src", $(this).find("img").prop("src").replace("_hover.png", ".png"));
			}
		}else{
			$(this).css("background-color", "");
			$(this).css("background-color", "#302D81");
			$(this).find("a").css("color", "");
			$(this).find("a").css("color", "#ffffff");
		}
	});
	
	$("#sideMenu").find("ul li a").click(function(){
		let panel = $(this).next();
		
		if($(this).parent().parent().attr("id") !== "panel"){
			if(panel.css("display") === "block"){
				$("#sideMenu").find("ul li a").removeAttr("class");
				$(this).removeAttr("class");
				panel.slideToggle(1000, "easeInOutElastic");
			}else{
				$("#sideMenu").find("ul li a").removeAttr("class");
				$(this).attr("class", "active");
				panel.slideToggle(1000, "easeInOutElastic");
			}
		}
	});
});

function bodyTopPageClick(e){
	let id = $(e).attr("data-keyword");
	
	$("#mainTopMenu ul li button").removeAttr("class");
	$("#mainTopMenu ul li button").prop("style", "background: linear-gradient(to bottom, #ffffff 100%, #302D81 0%); cursor: pointer;");
	
	$(e).attr("class", "active");
	$(e).prop("style", "background: linear-gradient(to bottom, #ffffff 95%, #302D81 5%); cursor: pointer;");
	
	$("#sideMenu").find("ul").not("#panel").hide();
	$("#sideMenu").find("#" + id).fadeIn(400);
	
	localStorage.setItem("setSideMenu", id);
}

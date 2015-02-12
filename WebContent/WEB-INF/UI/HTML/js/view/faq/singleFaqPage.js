define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/faq/singleFaqlayout',
	'event/dispatcher',
	'model/login',
	'view/faq/faqCategoryView',
    'hbs!../../template/faq/addFaq',
    'hbs!../../template/faq/editFaq',         
    'view/basemodal/BaseModal' 
], function($, _, Backbone, SingleFaqPageLayout, Dispatcher, LoginStatus, FaqCategoryView, addFaqModalTemp, editModal, BaseModalView) {
	var SingleFaqPage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			// body...
			Dispatcher.trigger("header:changeDocumentTitle", "FAQ");
		},
		events: {
			"click #btn-createFaq": "createClicked",
			"click #btn-editFaq": "editClicked",
			"click #btn-deleteFaq": "deleteClicked"
			//"click #btn-prev": "prevClicked",
			//"click #btn-next": "nextClicked"
		},
		render: function() {
			var self = this;
			var fid=window.location.hash.split("/")[1];
			$.ajax("http://localhost:8800/dost/api/faq/"+fid).done(function(response){
				if(!_.isEmpty(LoginStatus.attributes)&&LoginStatus.attributes.dbUserRole.role=="ROLE_ADMIN"){
					response["admin"]=true;
				}			
				$("#main-content").html(SingleFaqPageLayout(response));
				$("#main-content .answer").html(response.answer);
				$.ajax("http://localhost:8800/dost/api/faq/"+fid+"?type=PREVIOUS").done(function(data){
					if(data.faqId){
						$("#btn-prev").attr("href","#faq/"+data.faqId);
					}
					else{
						$("#btn-prev").attr("disabled","disabled");
					}
				})
				$.ajax("http://localhost:8800/dost/api/faq/"+fid+"?type=NEXT").done(function(data){
					if(data.faqId){
						$("#btn-next").attr("href","#faq/"+data.faqId);
					}
					else{
						$("#btn-next").attr("disabled","disabled");
					}
				})
				if(LoginStatus.get("isLoggedIn")!== true){
					$(".banner").show();
					Dispatcher.trigger("header:bindBanner");
				}
			});
		},
		editClicked: function(e){
			e.preventDefault();
			e.stopPropagation();
			var self = this;
			var fid=window.location.hash.split("/")[1];
			$modalBody ="";
			$.ajax("http://localhost:8800/dost/api/faq/"+fid).done(function(response){
				$modalBody = $('<div>').html(editModal(response));
				var editFaqModal = new BaseModalView({
	                title: "",
	                headerHidden: true,
	                className : 'modal fade compose-message-modal',
	                buttonList: [
	                    ['SEND NOW', function(modal, event){
	                    	var self = this;
	                    	var data=response;
	                    	response.question=$(".editFaq-modal .edit-question").val();
	                    	response.answer=$(".editFaq-modal .edit-faq-answer").val();
	                    	response["id"]=response.faqId;
	                    	response["category"]=response.categoryName;
	                    	response["categoryId"]=response.faqCategoryId;
	                    	delete response["faqId"];
	                    	delete response["categoryName"];
	                    	delete response["faqCategoryId"];
	                    	$.ajax({
	                    		type:"PUT",
	                    		url: "http://localhost:8800/dost/api/faq/update",
	                    		contentType: 'application/json',
	                    		data:JSON.stringify(response),
	                    		dataType:"jsonP"
	                    	}).done(function(){
	                    		alert(3);
	                    	});
	                    	modal.teardown();                    	
	                    }.bind(self), 'option-btn composeMsg-send btn']
	                ],
	                body: $modalBody,
	                //data: usernames
	            });
				editFaqModal.show();
				
			});
		},
		prevClicked: function(e){
			if(!$("#btn-prev").hasClass("disabled")){
				var fid=window.location.hash.split("/")[1];
				$.ajax("http://localhost:8800/dost/api/faq/"+fid+"?type=PREVIOUS").done(function(response){
					window.location.href="http://localhost:8800/dost/UI/index.html#faq/"+response.faqId;
				});
			}			
		},
		nextClicked: function(e){
			if(!$("#btn-next").hasClass("disabled")){
				var fid=window.location.hash.split("/")[1];
				$.ajax("http://localhost:8800/dost/api/faq/"+fid+"?type=NEXT").done(function(response){
					window.location.href="http://localhost:8800/dost/UI/index.html#faq/"+response.faqId;
				});
			}
		},
		deleteClicked: function(e){
			var fid=window.location.hash.split("/")[1];
			$.ajax({
        		type:"DELETE",
        		url: "http://localhost:8800/dost/api/faq/"+fid+"/delete"
        	}).done(function(){
        		alert(3);
        	});
		},
		createClicked: function(e){
			e.preventDefault();
			e.stopPropagation();
			var self = this;
			var data={
				"question":	$(".question").val(),
				"answer":$(".new-answer").val(),
				"category":$(".category").val()
			};
        	$.ajax({
        		type:"POST",
        		url: "http://localhost:8800/dost/api/faq/add",
        		contentType: 'application/json',
        		data:JSON.stringify(data),
        		dataType:"jsonP"
        	}).done(function(){
        		console.log(3);
        	});
        	$(".create-newFaq").fadeOut();			
		}
	});

	SingleFaqPage.prototype.remove = function() {

	};
	SingleFaqPage.prototype.clean = function() {

	};
	return SingleFaqPage;
});
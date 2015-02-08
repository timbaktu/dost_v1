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
			"click #btn-deleteFaq": "deleteClicked",
			"click #btn-prev": "prevClicked",
			"click #btn-next": "nextClicked"
		},
		render: function() {
			var self = this;
			var fid=window.location.hash.split("/")[1];
			$.ajax("http://localhost:8800/dost/api/faq/"+fid).done(function(response){
				$("#main-content").html(SingleFaqPageLayout(response));
				$("#main-content .answer").html(response.answer);
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
			var fid=window.location.hash.split("/")[1]-1;
			window.location.href="http://localhost:8800/dost/UI/index.html#faq/"+fid;
		},
		nextClicked: function(e){
			var fid=window.location.hash.split("/")[1]
			fid=parseInt(fid)+1;
			window.location.href="http://localhost:8800/dost/UI/index.html#faq/"+fid;
		},
		deleteClicked: function(e){
			var fid=window.location.hash.split("/")[1];
			$.ajax({
        		type:"DELETE",
        		url: "http://localhost:8800/dost/api/faq/"+fid
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
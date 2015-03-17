define([
  'jquery'
], function($){
	
	var utils  = new function () {
	    
	    this.getDateDiff = function(dateString){
	    	if(!dateString){
	    		return "";
	    	}
	    	var date = moment(dateString, "YYYY-MM-DD h:mm:ss");
			var d = moment.duration(moment().diff(date));
			if (d.asDays() > 2){
				return date.format(" Do MMM'YY ha");
			} else if ( d.asDays() < 2 && d.asDays() >= 1){
				return Math.floor(d.asDays()) + " day ago";
			} 
			if(d.asHours() < 24 && d.asHours() > 1){
				return Math.floor(d.asHours()) + " hours ago";
			} else if (d.asHours() < 1){
				return Math.floor(d.asMinutes()) + " minutes ago";
			} else if (d.asMinutes() < 1){
				return Math.floor(d.asSeconds()) + " seconds ago";
			}
	    };
	    
	    this.contextPath = function(){
	    	var path="http://localhost:8800/dost";
	    	return path;
	    }
	};
	return utils;

});
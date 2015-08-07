$(window).load(function(){
	
	$('#to').bind('keypress', function (event) {
	    var regex = new RegExp("^[a-zA-Z0-9-_.;@\b]+$");
	    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	    if (!regex.test(key)) {
	       event.preventDefault();
	       return false;
	    }
	});	
	
	$('#CC').bind('keypress', function (event) {
	    var regex = new RegExp("^[a-zA-Z0-9-_.;@\b]+$");
	    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	    if (!regex.test(key)) {
	       event.preventDefault();
	       return false;
	    }
	});
	
	$('#BCC').bind('keypress', function (event) {
	    var regex = new RegExp("^[a-zA-Z0-9-_.;@\b]+$");
	    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	    if (!regex.test(key)) {
	       event.preventDefault();
	       return false;
	    }
	});

jQuery.validator.addMethod(
    "multiemails",
     function(value, element) {
         if (this.optional(element)) 
             return true;
         var emails = value.split(/[;,]+/);
         valid = true;
         for (var i in emails) {
             value = emails[i];
             valid = valid &&
                     jQuery.validator.methods.email.call(this, $.trim(value), element);
         }
         return valid;
     },

   jQuery.validator.messages.multiemails
);

jQuery.validator.addMethod('selectcheck', function (value) {
        return (value != '0');
    }, jQuery.validator.messages.selectcheck);


$("#templateform").validate({
     rules: {
    	        "eventid" : {required: true, selectcheck: true },
    	        "etemplates": {selectcheck:true},
                "templateName" : {
                	required: true,
                	maxlength: 150
                	},
				"to": { 
					required: true, 
					multiemails: true,
					maxlength: 150
					},
				"CC": { 
					multiemails: true,
					maxlength: 150	
				},
				"BCC":{ multiemails: true,
					maxlength: 150 },
				"subject": {required: true,maxlength: 150},
				etrigger : "required"
            },
     messages: {
    	            eventid:{selectcheck: "Business Event is required" },
    	            etemplates:{selectcheck: "You must select an template"  },
    	            templateName:{ required: "Template Name  is required" },
					to: {
                                required: "Recipients field is required",
                                multiemails: "Enter valid e-mail address seperated with(;)"
                            },
					CC: {
                                multiemails: "Enter valid e-mail address seperated with(;)"
                          },
					BCC: {
                                multiemails: "Enter valid e-mail address seperated with(;)"
                          },
					subject:{ required: "Subject is required" },
					etrigger: "Template Trigger is required"
               },
      errorPlacement: function(error, element) {
                   var obj = $('[name="'+element.attr('name')+'"]');
                   if (obj.length > 1) {
                       error.insertAfter(obj.last().parent());
                   } else {
                       error.insertAfter(obj);
                   }
               }

});
});

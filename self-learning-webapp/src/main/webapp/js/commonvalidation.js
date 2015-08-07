/*function closewindow() {

	var strconfirm = confirm('Are you sure you want to logout?');
	if (strconfirm == true) {

		window.location = "partnerintegrity.jsp";
		return true;
	} else {
				
		return false;
	}
}*/

function logout() {

	document.getElementById('myform').submit();
}

	//Bulk Answer - MultiChoice - Dropdown
		jQuery('body').on('click','.multiple-choice-dropdown .save-bulkanswer', function(e){
			e.stopPropagation();
			var jQuerycontainer = jQuery(this).closest('#multiple-choice-dropdown'),
			    textVal = jQuerycontainer.find('textarea').val(),
			    appTo = jQuerycontainer.find('.mc_dd_opt');
			
			 if(textVal.trim() != ""){
/*				 jQuery(appTo).find('li.clearfix').each(function(index) {
					 if(index != 0) {
						 jQuery(this).remove();
					 }	 
				 });*/
				 
				 var len = jQuery(appTo).find('li.clearfix .bulk').length;
				 
				    for(var count= len-1; count > 0; count--) {
					     if(jQuery(appTo).find('li.clearfix .bulk').eq(count).val().trim() == "" && count > 0) {
					    	 jQuery(appTo).find('li.clearfix').eq(count).remove();	 
					      }
					     else {
					    	 break;
					     }
					}
				 
				 
				 var arr = (textVal).split(';'),
				     index = arr.length;
				 for(var i=0; i < index; i++){
					if(arr[i].trim() != ''){
				     if(i == 0 && count < 3){
	    				 var jQuerythis = jQuery('<li class="clearfix"></li>');	 
	    				 jQuery('<input type="text" name="a" class="bulk require" value="'+ arr[i]+'" />').appendTo(jQuerythis);			 
	    				 jQuery('<input type="text" name="s" class="qt_score" /><button class="qt_add"></button>').appendTo(jQuerythis);
	    				 jQuery(jQuerythis).appendTo(appTo);
				     } else {
	    				 var jQuerythis = jQuery('<li class="clearfix"></li>');	 
	    				 jQuery('<input type="text" name="a" class="bulk require" value="'+ arr[i]+'" />').appendTo(jQuerythis);			 
	    				 jQuery('<input type="text" name="s" class="qt_score" /><button class="qt_add"></button><button class="qt_remove"></button>').appendTo(jQuerythis);
	    				 jQuery(jQuerythis).appendTo(appTo); 
				     }
					}
			   } 
			 }
			  jQuery('textarea').val('');
			  jQuery('.bulk-answer-panel').hide();
		});

		jQuery('body').on('click','.multiple-select-dropdown .save-bulkanswer', function(e){
			e.stopPropagation();
			var jQuerycontainer = jQuery(this).closest('#multiple-select-dropdown'),
			    textVal = jQuerycontainer.find('textarea').val(),
			    appTo = jQuerycontainer.find('.mc_dd_opt');
			   if(textVal.trim() != ""){
				   
				   
					 var len = jQuery(appTo).find('li.clearfix .bulk').length;
					 
					    for(var count = len-1; count > 0; count--) {
						     if(jQuery(appTo).find('li.clearfix .bulk').eq(count).val().trim() == "" && count > 0 && jQuery(appTo).find('li.clearfix').eq(count).hasClass('hidden') == false) {
						    	 jQuery(appTo).find('li.clearfix').eq(count).remove();	 
						      }
						     else {
						    	 break;
						     }
						}  
				 
				 
				 var arr = (textVal).split(';'),
				    index = arr.length; 
				 for(var i=0; i < index; i++){
    				 if(arr[i].trim() != ''){ 
    					 if(i == 0  && count < 3) {
    	    				 var jQuerythis = jQuery('<li class="clearfix"></li>');	
    	    				 jQuery('<label for="mcheckbox52'+ i +'"></label><div class="checkWrapQuest1"><input class="checkbox" name="checkbox521" id="mcheckbox522"'+ i +' type="checkbox"><div class="checkWrapClickQuest"></div></div>').appendTo(jQuerythis); 
    	    				 jQuery('<input type="text" name="a" class="bulk require" value="'+ arr[i]+'" />').appendTo(jQuerythis);			 
    	    				 jQuery('<input type="text" name="s" class="qt_score" /><button class="qt_add"></button>').appendTo(jQuerythis);
    	    				 jQuery(jQuerythis).appendTo(appTo);
    					 } else {
    	    				 var jQuerythis = jQuery('<li class="clearfix"></li>');	
    	    				 jQuery('<label for="mcheckbox52'+ i +'"></label><div class="checkWrapQuest1"><input class="checkbox" name="checkbox521" id="mcheckbox522"'+ i +' type="checkbox"><div class="checkWrapClickQuest"></div></div>').appendTo(jQuerythis); 
    	    				 jQuery('<input type="text" name="a" class="bulk require" value="'+ arr[i]+'" />').appendTo(jQuerythis);			 
    	    				 jQuery('<input type="text" name="s" class="qt_score" /><button class="qt_add"></button><button class="qt_remove"></button>').appendTo(jQuerythis);
    	    				 jQuery(jQuerythis).appendTo(appTo);
    					 }

    		      } 
    			} 
			 }
			   jQuery('textarea').val('');
  			   jQuery('.bulk-answer-panel').hide();
		});

		

	  var dupTags = true; 	 
	  jQuery('.questContainer').on('click', '.save.fr', function() {
		  jQuery(this).closest('.settings-panel').find('.switch-slider').removeClass('clicked');
		  duplicateTags();
	  });
	  
	  function duplicateTags() {
		  var tagContainer = [] ;
	      jQuery('.questContainer').find('.tag').each(function(index) {
	    	  tagContainer.push(jQuery(this).val());   
	      });
	      
	       var totalTag = tagContainer.length;
	       
	      for(var i=0; i < totalTag; i++) {
	         for(var j=i+1; j< totalTag; j++) {
	           if(tagContainer[i] == tagContainer[j] && tagContainer[i].trim() != '') {
	           	  jQuery('.questContainer').find('.tag').eq(i).addClass("errorInput").closest('.settings-panel').show();
	              jQuery('.questContainer').find('.tag').eq(j).addClass("errorInput").closest('.settings-panel').show();
	              jQuery('.duplicate').show();
	              dupTags = false;
	              return;
	            }
	           else {
	        	   jQuery('.questContainer').find('.tag').removeClass("errorInput").closest('.settings-panel').hide();
	        	   jQuery('.duplicate').hide();
	        	   dupTags = true;
	           }
	         } 
	      } 
	  }


		  

			jQuery.ui.autocomplete.filter = function (array, term) {
		    var matcher = new RegExp("^" + jQuery.ui.autocomplete.escapeRegex(term), "i");
		    return jQuery.grep(array, function (value) {
		        return matcher.test(value.label || value.value || value);
		    });
		};
		
		//AutoComplete Business case
		
		  jQuery('.questContainer').on('click','.icon-settings', function(){
			  jQuery('.questContainer').find('.settings-panel').hide();
			  jQuery(this).siblings('.settings-panel').show();
			  jQuery('.bulk-answer-panel').hide();
		  });	
		  
		  jQuery('.container').on('click', '.switch-light', function() {
			    jQuery(this).addClass('clicked'); 
	      });
		  
		  jQuery('.container').on('click', '.settings-panel .cancel', function() {
			   jQuery(this).closest('.settings-panel').find('.clicked').each(function() {
				 if(jQuery(this).find('input[type="checkbox"]').is(':checked')) {
			        jQuery(this).removeClass('clicked').trigger('click');
				 } else {
					 jQuery(this).removeClass('clicked');
				 }
			   });
			  jQuery(this).closest('.settings-panel').find('.tag').val('').removeClass('errorInput');
			});

			  
			  (function() { 
					//alert("inside");
					//var userId = null;		

						//alert("search");
					jQuery(".search-table").autocomplete({ 
						source : function(request, response) { 
						
						jQuery.getJSON('getlegalnames', { term : request.term}, function(result) { 
							response(jQuery.map(result, function(item) { 
							//orgNameAndId = orgId+"|"+orgName;
		                        console.log(item.companyLegalName);
								return {
									      id : item.legalNameId,
							              label : item.companyLegalName
									}; 
						})); 
						}); 
						
						}, 
						select : function(event, ui) { 
							 // jQuery(this).closest('.container').find("#searchUserMap").val(orgName);
			   				 jQuery(this).closest('.bussinessCase').find('.hiddenId').val(ui.item.id);
							 //jQuery(".NewAddressContainer").empty();
			   				 
			   			}, 
			   		    open: function() { 
			   		    	jQuery('.ui-autocomplete').css("width", "200px");
			   		    }
						}); 
						
				
					jQuery('input').attr('autocomplete', 'off');				
					
					})(); 
			  
		jQuery(document).ready(function() {
		  jQuery('.fl label').on('click', function() { 
			  if(jQuery('#selectAll').prop('checked') == false) {
				  jQuery('#submit-questionnaire').find('.questionQ').each(function() { 
					   if(jQuery(this).prop('checked') == false) {
						   jQuery(this).trigger('click');
					   }
				  });
			  }	
			  else {
				  jQuery('#submit-questionnaire').find('.questionQ').each(function() { 
					   if(jQuery(this).prop('checked') == true) {
						   jQuery(this).trigger('click');
					   }
				  });
			  }
		  });	
		  
		  if(jQuery('.categorypopup').val() == "create") {
			  jQuery('#createCategory').modal('show');
		  } else if(jQuery('.categorypopup').val() == "update") {
			  jQuery('#editCategory').modal('show');
		  }
		  
		  if(jQuery('.qstBankPopup').val() == "true") {
			  jQuery('.popupBg, .questPopupEdit').show();
		  }
		 	
		}); 	  
			  
			  
		
		 
/*		 console.log("Checked");
		
		     console.log(jQuery(this).is(':selected'));
		     if(jQuery(this).is(':selected') == false) {
		       jQuery(this).trigger('click');
		     }
		 });
		}
		 else {
			 jQuery('#submit-questionnaire .current').find('.customCheckboxNewQuest').each(function() {
			     console.log(jQuery(this).is(':selected'));
			     if(jQuery(this).is(':selected') == true) {
			         jQuery(this).trigger('click');
			     }
			 });
			 }
		});*/
		
		jQuery('body').on('mouseenter', '.icons', function() {
			 var widgetName = jQuery(this).siblings('.widgetName').text(),
			     offset = jQuery(this).offset();
			 jQuery('.tooltipQst').text(widgetName).show();
			 var length = jQuery('.tooltop').height() + 22;
			 jQuery('.tooltipQst').css({'top': offset.top - length +"px", 'left': 232 + "px"});
		});	
		
		jQuery('body').on('mouseleave', '.icons', function() {
			 jQuery('.tooltipQst').text('').hide();
		}); 
		
		
		jQuery('.container').on('mouseenter', '.questionnaire', function(){
	         var offset = jQuery(this).offset(),
	         descText = jQuery(this).closest('tr').find('.qstDescription').text();
	         if(descText.length > 0) {
	        	 jQuery('.tooltop').text(descText).show();
	        	 var length = jQuery('.tooltop').height() + 22;
	             jQuery('.tooltop').css({'top': offset.top - length +"px", 'left': 58 + "px"}).text(descText).show();
	         }   
	      });
		
			 jQuery('.container').on('mouseleave', '.questionnaire', function(){ 
	         jQuery('.tooltop').hide();
	       });

		jQuery('.qstBankContainer').on('mouseenter', '.link', function() {
			 var widgetText = jQuery(this).text(),
				  offset = jQuery(this).offset();
			    	  jQuery('.tooltop').text(widgetText).show();
			          var length = jQuery('.tooltop').height() + 22;
				     jQuery('.tooltop').css({'top': offset.top - length +"px", 'left': 70 + "px"});
		});		 
	   
		jQuery('.qstBankContainer').on('mouseleave', '.link', function(){ 
	         jQuery('.tooltop').hide();
	    });	  
			  
/*	     jQuery('.container').on('mouseenter', '.questTitleEdit', function(){
	         var offset = jQuery(this).offset();
	         jQuery('.tooltop').css({'top': offset.top - 30 + "px", 'left': offset.left - 190 +"px"}).text("Edit").show();
	       });
			 jQuery('.container').on('mouseleave', '.questTitleEdit', function(){ 
	         jQuery('.tooltop').hide();
	       });*/
		 
			 
			   jQuery('.container').on('mouseenter', '.qrName', function(event){
			         var descText = jQuery('.quesDesc').val(),
			             offset = jQuery(this).offset();
			         if(descText.length > 0) { 
			           jQuery('.tooltop').text(descText).show();
			           var length = jQuery('.tooltop').height() + 22;
			           jQuery('.tooltop').css({'top': offset.top - length + "px", 'left': offset.left - 200 +"px"});
			         }
			       });
			   
					 jQuery('.container').on('mouseleave', '.qrName', function(){ 
			         jQuery('.tooltop').hide();
			       });

		     
		
					 
	   //Bulk answer toggle
		jQuery('.container').on('click', '.bulk-answer', function(e){
							e.stopPropagation();
							jQuery('.bulk-answer-panel').hide();
					  		jQuery(this).siblings('.bulk-answer-panel').show();	
					  		jQuery('.settings-panel').hide();
		});	
		
		
		jQuery(document).keypress(function(event){
		    var keycode = (event.keyCode ? event.keyCode : event.which);
		    if(keycode == '13'){
		        return false;   
		    }
		});
		
    	jQuery(document).mouseup(function(e){
    		var container = jQuery(".dropdown");
    		if(!container.is(e.target) && container.has(e.target).length === 0){
    			container.each(function() {
    			  if(jQuery(this).hasClass('show')) {
    				  jQuery(this).addClass('hide');
    				  jQuery(this).removeClass('show')
    			  }	
    			});
    		}
    	});
    	
    	jQuery(document).on("click", ".radioWrapQuest input", function(){
    		if(jQuery(this).is(":checked")){
    			jQuery(this).next().css("background-position","-34px -18px");
    		}else{
    			jQuery(this).next().css("background-position","0 -18px");
    		}
    	});
			
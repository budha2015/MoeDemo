// JavaScript Document
	var jq=$.noConflict();	
    jQuery(document).ready(function(){
    	/*	jQuery('.um-form').on('click', '.rem_list', function(e){
		 	//e.stopImmediatePropagation();
            var jqthis = jQuery(this);
            jqthis.parents('.link_to').remove();
		 });
		jQuery('.row.addressDetails').on('click', '.rem_clon', function(e){
		 	e.stopImmediatePropagation();
            var jqthis = jQuery(this);
            jqthis.parents('.col-md-4').remove();
		 });*/
		   jQuery('.row').on('click', '.addElement, .removeElement', function(e){
            e.stopPropagation();
            var jqthis = jQuery(this);
			var el = jqthis.closest('.leftColFields');
		  	var labelVal = el.children('label').html();
            if(jqthis.hasClass('addElement')){						
				el.clone().find('select').attr('name', labelVal).end().find('input').attr('name', labelVal).end().find('.addElement').hide().end().find('.removeElement').removeClass('hidden').end().insertAfter(el);			
            }
            else {
            el.remove();
          }
        });
	/*	   jQuery('.um-form').on('click', '.add_clon', function(e){
            e.stopPropagation();
            var jqthis = jQuery(this);
			var el = jqthis.siblings('.addressDetails').find('.col-md-4:first');
			var labelVal = el.find('label').html();
            if(jqthis.hasClass('add_clon')){						
			el.clone().find('select').attr('name', labelVal).end().find('input').attr('name', labelVal).end().insertAfter(el);			
            
			}
            else {
            el.remove();
          }
        });*/
		   
		   /*  clone  
		   
		   jQuery('.um-form').on('click', '.list_clon', function(e){
			e.stopPropagation();
            var jqthis = jQuery(this);
			var el = jqthis.siblings('.link_to_parent').find('.link_to:first');
		  	var labelVal = el.find('label').html();
            if(jqthis.hasClass('list_clon')){
			el.clone().find('select').attr('name', labelVal).end().find('input').attr('name', labelVal).end().insertAfter(el);			
            }
            else {
            el.remove();
          }
        });
		   
		   */
		 
        
		   jQuery('.btn-business').on('click', function(e) {
				e.preventDefault();
				jQuery('.businessCases').val('businessCase');
				document.qbank.method = "post";
				document.qbank.action = "/partnerintegrity/postquestionnaire";
				document.qbank.submit();
			});
	   
		   

	jQuery('.top_menu ul li').click(function(e){
		var li_class = jQuery(this).attr('class');
		jQuery('.top_submenu').hide();
		jQuery('.top_menu ul li').css('height','44px');
		jQuery(this).css('height','44px');
		jQuery(this).children('ul').addClass(li_class).show();
		
		e.stopPropagation();
		
	});
	jQuery('body').click(function(){
		jQuery('.top_menu ul li').css('height','44px');
		jQuery('.top_submenu').hide();
			
	});
	jQuery('#srchIcon').click(function(){
		jQuery('.srch_box').animate({width: "175px", marginLeft: "0.6in" }, 250 ).show();
		
		});		
	jQuery('.menuTog').click(function(){
		jQuery('.top_menu ul').toggle();
		})
	
	jq( window ).resize(function() {
	  if(jq( window ).width() > '750' ) {
		  console.log('under resize metod');
		  jq('.top_menu ul').show();
		  jq('.top_submenu').hide().stop();
		  
	  }
	  else {
		 /* console.log("window width: "+ jq(window).width());*/
		  jq('.top_menu ul').hide();
		  jq('.top_submenu').hide();
		  stop();
	  }
	});
	
	var placeholderVal = "";
	jQuery(".text_box").focus(function() {
	placeholderVal = jQuery(this).attr('placeholder');
	this.placeholder = '';
    })
    .blur(function() {
        if (this.value === '') {
            this.placeholder = placeholderVal;
        }
    });
		//Popup 	
	jQuery('.createQuest, .questTitleEdit').on('click', function(){
		showPopup('.questPopup');
		jQuery('.popupBg').show();
	});
	jQuery('.closePopup, .closeBtn').on('click', function(){
		hidePopup('questPopup');
	});
	jQuery('#gen_key, #email_lic,#del_cont').on('click', function(){
		var pop_id = jQuery(this).attr('id');
		/*showPopup(pop_id);*/
		if(jQuery(this).hasClass('view_page_lic')) {
			showPopup2(pop_id);
			console.log("in popup2");
		}
		else {
			showPopup(pop_id);
			console.log("in original popup");
		}
		//jQuery('.'+pop_id).show();
		//jQuery('.popupBg').show();
	});

/* code for role management*/
	jQuery('.user_initial_text').each(function(){
		var initials = jQuery(this).text();
		if(initials == "Ajay Giri"){
			jQuery('.top_menu_ul').hide();			
			}
			else if(initials == "Poornima Krishnamurthy"){
				jQuery('.top_menu_ul').hide();				
			
			}
			else if(initials == "Arvind Jha" || initials == "Arvind jha" || initials == "Arun Pr" || initials == "Arun pr"){
			jQuery('.mngmnt_menu').hide();
			}
		
			
		var letter = /^[A-Z]$/;
		var newVal ='' ;
		for(var i = 0;i<initials.length;i++)
		{
			if(initials[i].match(letter)){
                  newVal+=initials[i];
            }	
		}
		if(newVal.length<=2)
		{
		jQuery(this).parents().prev('.user_prof').html(newVal);
		}
		else{
		var newValue = newVal.substring(0,2);
		jQuery(this).parents().prev('.user_prof').html(newValue);
		}
		});
	jQuery('.key_prin').click(function(){
		console.log("tprmDT.js....key princ..");
		jQuery(this).toggleClass('tog_clr');
		if(jQuery(this).hasClass('tog_clr'))
		{
		jQuery(this).attr('title','Not a Key Principal');
		jQuery('#keyPrincipleId').attr('value','0');
		}
		else
		{
		jQuery(this).attr('title','Key Principal');	
		jQuery('#keyPrincipleId').attr('value','1');
		}
		});
	jQuery(document).on('click','.IndividualAddress .chk_address',function(){
		console.log("aaaa");
		if(jQuery(this).is(":checked"))
		{
		jQuery(this).parents('.customCheckBox').attr('title','Unselect address')
		}else
		{
		jQuery(this).parents('.customCheckBox').attr('title','Select address')
		}
		});
	jQuery(document).on('click','.IndividualAddress',function(){
		console.log("boxxxx");
		jQuery(this).find('.chk_address').trigger('click');
		})
		
		
		//Role Mgmt Summary page popup 	
		jQuery('span.viewUser').on('click', function(){
			showPopupView('viewUser_popup');
			jQuery('.popupBg').show();
		});
		jQuery('.viewed_user').on('click', function(){
			hidePopup('viewUser_popup');
		});
		
		jQuery('.deleteBtn').on('click', function(){
			showPopupUser('delete_user');
			jQuery('.popupBg').show();
		});
		jQuery('.cancel_popup').on('click', function(){
			hidePopup('delete_user');
		});
		
		//Add Role js 
		
		  
		 /*var i = 0; 
		 
		 jq('.data-display-body').on('click', '.addElement, .removeElement', function(e){
	           e.stopPropagation();
			   var j = jq('body .branching').length-1;
			   //alert(j);
			   var toClone = '<div class="body branching branch'+i+'"> <div class="data target-question"> <select class="customSelectNew" id="userRelationId'+j+'"> <option>Business Case</option> <option>Third Party</option> <option>Remediation</option> </select> </div><div class="switchContainer"> <div class="switchInsideContainer"> <div class="customInput customCheckBox"> <input type="checkbox" name="readonly_priv" id="readonly_priv'+j+'" class="readonly_priv"/> <label for="readonly_priv'+j+'">Read only</label> </div><div class="customInput customCheckBox"> <input type="checkbox" name="write_priv" id="write_priv'+j+'" class="biased_priv"/> <label for="write_priv'+j+'">Write</label> </div><div class="customInput customCheckBox"> <input type="checkbox" name="delete_priv" id="delete_priv'+j+'" class="biased_priv"/> <label for="delete_priv'+j+'">Delete</label> </div><div class="customInput customCheckBox"> <input type="checkbox" name="reject_priv" id="review_priv'+j+'" class="biased_priv"/> <label for="review_priv'+j+'">Review</label> </div><div class="customInput customCheckBox"> <input type="checkbox" name="approve_priv" id="approve_priv'+j+'" class="biased_priv"/> <label for="approve_priv'+j+'">Approve</label> </div></div></div><div class="data add-target"><span class="addElement"></span><span class="removeElement removeRole"></span></div></div>';
		
			
	           var jqthis = jq(this);
			   var tr = jq(this).closest('.branching');
	           var el = tr.closest('.data-display-body');
	            if(jqthis.hasClass('addElement')){		
				i++;
				
				jQuery('.data-display-body').append(toClone);
				
	          }
	          else {
				
				if(jqthis.closest('.branching').hasClass('root')) {
					i--;
					jq(".branch"+i).remove();
				}
				else {
					tr.remove();	
				}
				
				
	          }
			   //for new dropdown 
			   var elm = jQuery(this).closest('.branching').next().find(".customSelectNew");
			   elm.wrap("<div class='customSelectWrapper'></div>");
			   elm.after("<div class='customSelectClick'></div>");
			   
			   elm.each(function(){
				  jQuery(this).next().html(jQuery(this).find('option:selected').text());
			   });

			   elm.on("change", function(){
				jQuery(this).next().html(jQuery(this).find('option:selected').text());			  			 
			   });

			   var maxLength = 30;
			   jQuery('.customSelectNew > option').text(function(i, text) {
				  if (text.length > maxLength) {
					 return text.substr(0, maxLength) + '...';  
				  }
			   });
			  
			 
	        });
						
			var elemselected = jq(".customSelectNew");	
			var onboardValue = 1;	
			 jQuery(document).on('change',".customSelectNew" , function(){  
					 
				  if(jQuery(this).find('option:selected').text() == 'Third Party') {				
					jQuery(this).closest('.branching').find('.switchInsideContainer').append('<div class="customInput customCheckBox"> <input type="checkbox" name="onboard_priv" id="onboard_priv'+onboardValue+'" class="biased_priv"/> <label for="onboard_priv'+onboardValue+'">Onboard</label> </div>');
					onboardValue++;
				  }
				  else {
					onboardValue--;
				    jQuery(this).closest('.branching').find('#onboard_priv'+onboardValue).parent().remove();
				  
					//jQuery('#onboard_priv').parent().remove();
				  }
			   });*/
		
    });
  
  function showPopup(clsName){
	 
   var windowWidth = document.documentElement.clientWidth;
   var windowHeight = document.documentElement.clientHeight;
   var popupHeight = jQuery('.'+clsName).height();
   var popupWidth = jQuery('.'+clsName).width();
   jQuery('.'+clsName).css({"position": "absolute","top": windowHeight*.5-popupHeight*.5,"left": (windowWidth*.5-popupWidth*.5)});
   jQuery('.'+clsName).show();
jQuery('.popupBg').show();
   //this is needed for ie6
   jQuery(".popupBg").css({ "height": windowHeight });
}
  
  function showPopupView(clsName){
		 
	   var windowWidth = document.documentElement.clientWidth;
	   var windowHeight = document.documentElement.clientHeight;
	   var popupHeight = jQuery('.'+clsName).height();
	   var popupWidth = jQuery('.'+clsName).width();
	   jQuery('.'+clsName).css({"position": "fixed","top": (windowHeight*.5-popupHeight*.5)/1.1,"left": (windowWidth*.5-popupWidth*.5)});
	   jQuery('.'+clsName).show();
	jQuery('.popupBg').show();
	   //this is needed for ie6
	   jQuery(".popupBg").css({ "height": windowHeight });
	}
  
  function showPopupUser(clsName){
		 
	   var windowWidth = window.innerWidth;
	   var windowHeight = window.innerHeight;
	   console.log("width: "+ windowWidth + "height: "+ windowHeight);
	   var popupHeight = jQuery('.'+clsName).height();
	   var popupWidth = jQuery('.'+clsName).width();
	   jQuery('.'+clsName).css({"position": "fixed","top": (windowHeight*.5-popupHeight*.5)/1.1,"left": (windowWidth*.5-popupWidth*.5)/1.1});
	   jQuery('.'+clsName).show();
	jQuery('.popupBg').show();
	   //this is needed for ie6
	   //jQuery(".popupBg").css({ "height": windowHeight });
	}
  
  function showPopup2(clsName){
		 
	   var windowWidth = document.documentElement.clientWidth;
	   var windowHeight = document.documentElement.clientHeight;
	   var popupHeight = jQuery('.'+clsName).height();
	   var popupWidth = jQuery('.'+clsName).width();
	   jQuery('.'+clsName).css({"position": "absolute","top": windowHeight*.5-popupHeight*.5,"left": (windowWidth*.5-popupWidth*.5)/1.6});
	   jQuery('.'+clsName).show();
	jQuery('.popupBg').show();
	   //this is needed for ie6
	   jQuery(".popupBg").css({ "height": windowHeight });
	}

//This will disable the popup when needed
function hidePopup(clsName){
jQuery('.'+clsName).hide();
jQuery('.popupBg').hide();
}








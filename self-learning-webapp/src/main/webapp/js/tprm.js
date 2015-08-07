// JavaScript Document
	var jq=$.noConflict();	
    jq(document).ready(function(){
    	fileUpload();
    	
    	//console.log("Confirm rahull...");
    	/*Date Picker*/
    			jq( ".datepicker1" ).datepicker({
    			changeMonth: true,
    			changeYear: true,
    			numberOfMonths: 1,
    			showOn: "both",				
    			showAnim: "slideDown",
    			dateFormat: "dd/mm/yy",
    			});
    			
    			
    			
	jq('.top_menu ul li').click(function(e){
		var li_class = jq(this).attr('class');
		jq('.top_submenu').hide();
		jq('.top_menu ul li').css('height','44px');
		jq(this).css('height','44px');
		jq(this).children('ul').addClass(li_class).show();
		
		e.stopPropagation();
		
	});
	jq('body').click(function(){
		jq('.top_menu ul li').css('height','44px');
		jq('.top_submenu').hide();
			
	});
	jq('#srchIcon').click(function(){
		jq('.srch_box').animate({width: "175px", marginLeft: "0.6in" }, 250 ).show();
		
		})		
	jq('.menuTog').click(function(){
		jq('.top_menu ul').toggle();
		})
		
	jq( window ).resize(function() {
	  if(jq( window ).width() > '750' ) {
		  console.log('under resize metod');
		  jq('.top_menu ul').show();
		  jq('.top_submenu').hide().stop();
		  
	  }
	  else {
		  /*console.log("window width: "+ jq(window).width());*/
		  jq('.top_menu ul').hide();
		  jq('.top_submenu').hide();
		  stop();
	  }
	});
		
	jq( ".datepicker1" ).datepicker({
		changeMonth: true,
		changeYear: true,
		numberOfMonths: 1,
		showOn: "both",				
		showAnim: "slideDown",
		dateFormat: "dd/mm/yy",
		});
		
	/**Remediation tab functionality starts***/	
	jq('.RM_datatable_tab span').click(function(){
		jq('.RM_datatable_tab span').removeClass('active_tab');
		jq(this).addClass('active_tab');
		jq('.remdTab').hide();
		var tab_id = jq(this).attr('id');
		jq('.'+tab_id).show();
		changeTableObject();
		});
		
	/**Remediation tab functionality ends***/	
	
	jq('test').insertBefore('#lmsTable2_info');
	
	///start master data
	
	function hide_popup() {
		jq('.admin_popup').hide();		
		jq('.popupBg').hide();
	}	
	function hide_popup2() {		
		jq('.add_admin_popup').hide();
		jq('.popupBg').hide();
	}	
	jq('.edit_admin').on('click', function(){
		var v = jq(this).closest('td').prev('td').text();
		jq('.admin_popup .admin_name').val(v);
		var pop_id = jq(this).attr('class');
		jq('#'+pop_id).show();		
		jq('.popupBg').show();					
		
	});
	jq('#add_admin').on('click', function(){
		var pop_id = jq(this).attr('id');
		jq('.'+pop_id).show();		
		jq('.popupBg').show();					
		
	});
	jq('.cancel_admin, .closeBtn').on('click', function(){
		hide_popup();
		hide_popup2();
	});
	
	jq('.submit_admin_edit').on('click', function(){									
			hide_popup();
		});
	jq('.submit_admin_add').on('click', function(){	
			hide_popup2();
		});
	
	//end master data
	
	
	/*Chandan*/
	/*****contracts*******/
	jq('#yes_type').click(function(){
	if(jq(this).is(':checked'))
	{
		jq('.yes_type').css('display','block');

	}
	});
	
	
	jq('#no_type').click(function(){
	if(jq(this).is(':checked'))
	{
		jq('.yes_type').css('display','none');
	}
	});
	
	jq('.exampl').tooltip();
	jq('.examplRem').tooltip();
	
	var placeholderVal = jq(".text_box").attr('placeholder');
	jq(".text_box").focus(function() {	
	this.placeholder = '';
    })
    .blur(function() {
        if (this.value === '') {
            this.placeholder = placeholderVal;
        }
    });
	
	jq("#list1").change(function (e) {

		// Find the selected value from List1
		var selectedValue = jq(this).val();
		var list2 = jq("#list2");

		if (selectedValue) {			
			list2.removeAttr('disabled');
		}
		if (selectedValue == 'hclt') {		
			list2.find('option:not(.hclt,.default)').hide();
		}
		else {
			list2.find('option:not(.hclt,.default)').show();
		}
			
		if(selectedValue == 'hclinfo') {
			list2.find('option:not(.hclinfo,.default)').hide();
		}
		if(selectedValue == 'oracle') {
			list2.find('option:not(.oracle,.default)').hide();					
		}
				
	  
	});
	
	jq("input[type='text']").on('focusout blur',function(){
		//console.log("remoaja....");
		jq(this).removeAttr('placeholder');
	});
	
	if(jq('#deploymentType').attr('disabled') == 'disabled') {
		/*console.log('inside disabled');*/
		jq('.customSelectWrapper').find('.customSelectClick').css('background','url(./images/icons/blue_dd_disabled.png) right center #EBEBE4 no-repeat')
	}
	
	
	//Role Management
	
	jq(".switchInsideContainer label").css('display', 'none');
	
	jq(document).on('change','.target-question select', function (e) {
		jq(this).closest('.branching').find(".switchInsideContainer label").css('display', 'none');
	    var optionSelected = jq(this).find("option:selected");
	    var valueSelected = optionSelected.attr('value');	   
	    console.log("selected module ID: "+valueSelected);
	    
	    var jsonmap = jq('.privjson').attr('value');
	    console.log("Json :"+jsonmap);
	    var jsonarray = [];
	   
		 jq.each(jq.parseJSON(jsonmap), function(k, v) {
				console.log("Key is "+k+" & Value is "+v);
				if(k == valueSelected) {
					console.log("k: "+k + " & valueselected: "+valueSelected);
					
					jsonarray = v;
				}
				
			});
		 console.log("array from json "+jsonarray);
	    
		 var checkboxList = [];
		 
		 checkboxList = jq('#priviList').attr('value');
		 console.log('checkboxList '+checkboxList);
		
		 
		 jq(this).closest('.branching').find(".switchInsideContainer input[type='checkbox']").each(function() {
			 var thisValue = jq(this).attr('value');
			 console.log("checkbox value: "+ thisValue);
			 if(jq.inArray(thisValue,jsonarray) !== -1){
				 console.log("its present");
				 jq(this).next('label').css('display', 'block');
			 }
			 else {
				 console.log("not present");
			 }
		 });
		 
	});
	
	
	//clone code below
	var countCheck = 996;
	
	var branchingCount = jQuery(document).find(".branching").length; 
	console.log("branching count: "+ branchingCount);
	branchingCount--;
	
	jq(document).on('click','.addEle', function(){
		console.log("clone role.....");
		
		
var jqthis = jq(this);
        var el = jqthis.closest('.branch-container').find('.branching:last');
       // var labelVal = el.find('label').html();
        //e1.find(".switchInsideContainer label").css('display', 'none');
        var lastInstance = el.find(".target-question select").attr("name");
        //console.log("lastInstance : " + lastInstance);
        var numberlastInstance = lastInstance.indexOf("[");
        var numberlastInstanceEnd  = lastInstance.indexOf("]");  //index for 0
        var res = lastInstance.substring(numberlastInstance+1, numberlastInstanceEnd);   //finding 0
        res = parseInt(res);   //parse to num
        /*if(res < branchingCount) {
        	var newInstance = branchingCount+1;
        }
        else {
        	var newInstance = res+1;
        }*/
        
        var newInstance = res+1;
        
        
        //var numItems = jq('.link_to_parent .link_to').length;
       /*  if( numItems == 1){newInstance = 0;}else{} */ 
        var StringNewInstanceDTOList;
        var StringNewInstancePriviligeList;
        //var StringNewInstanceReadOnly;
       
        StringNewInstanceDTOList = "modulePrivilegeDTOList["+newInstance+"].moduleId";
        StringNewInstancePriviligeList = "modulePrivilegeDTOList["+newInstance+"].privilegeList";
       // StringNewInstanceReadOnly = "readonly_priv["+newInstance+"]";
        
        
        //var appendID = "readonly_priv";
        //console.log("id of checkbox:" + appendID);
        
                el.clone()
                	.find('#moduleid').attr('name', StringNewInstanceDTOList).val("").end()
                	.find(".switchInsideContainer input[type='checkbox'] ").attr('name', StringNewInstancePriviligeList).end()
                	/*.find(".switchInsideContainer span:eq(0) input").attr('id', jq(".switchInsideContainer span:eq(0) input").attr('id')+countCheck).end()
                	.find(".switchInsideContainer span:eq(0) label").attr('for', jq(".switchInsideContainer span:eq(0) label").attr('for')+countCheck).end()
                	.find(".switchInsideContainer span:eq(1) input").attr('id', jq(".switchInsideContainer span:eq(1) input").attr('id')+countCheck).end()
                	.find(".switchInsideContainer span:eq(1) label").attr('for', jq(".switchInsideContainer span:eq(1) label").attr('for')+countCheck).end()
                	.find(".switchInsideContainer span:eq(2) input").attr('id', jq(".switchInsideContainer span:eq(2) input").attr('id')+countCheck).end()
                	.find(".switchInsideContainer span:eq(2) label").attr('for', jq(".switchInsideContainer span:eq(2) label").attr('for')+countCheck).end()
                	.find(".switchInsideContainer span:eq(3) input").attr('id', jq(".switchInsideContainer span:eq(3) input").attr('id')+countCheck).end()
                	.find(".switchInsideContainer span:eq(3) label").attr('for', jq(".switchInsideContainer span:eq(3) label").attr('for')+countCheck).end()
                	.find(".switchInsideContainer span:eq(4) input").attr('id', jq(".switchInsideContainer span:eq(4) input").attr('id')+countCheck).end()
                	.find(".switchInsideContainer span:eq(4) label").attr('for', jq(".switchInsideContainer span:eq(4) label").attr('for')+countCheck).end()*/
                	.find(".switchInsideContainer span input").each( function () { jq(this).attr('id', jq(this).attr('id')+countCheck); }).end()
                	.find(".switchInsideContainer span label").each( function () { jq(this).attr('for', jq(this).attr('for')+countCheck); }).end()
                	.find(".switchInsideContainer input[type='checkbox']").removeAttr('checked disabled').end()
                	.find('.customSelectClick').html('--- Select Module ---').end()
                	.find(".errorMessage").hide().end()
                	.find(".switchInsideContainer label").css('display', 'none').end()
                	.find(".addEle").addClass('hidden').end()
                	.find(".removeRole").removeClass('hidden').css('margin-left', '0').end()
                	//.insertAfter(el);
                	.appendTo('.branch-container .data-display-body');
// console.log("lastt....");
                countCheck++;
}); 
	
	
	
	
	
	/*if(jQuery('#errorflag').attr('value') == 'true') {
		console.log("error on the page.");
		jQuery('.switchInsideContainer input[type="checkbox"]').each(function(){
			
	     if(jQuery(this).is(':checked')) {
	    	 jQuery(".switchInsideContainer input[type='checkbox']").removeAttr('disabled');
	     }
	    });
	}*/
	
	
	jQuery(document).on('click', '.removeRole', function(e){
		console.log("Delete role...");
        e.stopImmediatePropagation();
		var jqthis = jQuery(this);
		jqthis.closest('.branching').remove();
		
		jQuery('.data-display-body').find('.branching').each(function(index) {
			
		                         console.log("inside branch index: " + index);
		             if(index > 0) {
                         var idx = index;
                         console.log("index value: "+index);
                        jQuery(this)
                        	.find("#moduleid").attr('name', 'modulePrivilegeDTOList['+idx+'].moduleId').end()
                        	.find(".switchInsideContainer input[type='checkbox']").attr('name', 'modulePrivilegeDTOList['+idx+'].privilegeList');
                        	/*.find(".linkDesc").attr('name', 'orgRelationshipList[' + idx + '].linkDescription').end()
                        	.find("select").attr('name', 'orgRelationshipList[' + idx + '].relationTypeId');*/
		            }
		         });
		});
	
	  
	//embedded js from role pages
	
	
	
	jQuery(document).on('click','#saveRole', function (e) {
	
		e.stopPropagation();
		
		jQuery(document).find(".customSelectNew").each(function() {
			console.log('inside select before submit');
			var optionSelected = jQuery(this).find("option:selected");
		    var valueSelected = optionSelected.attr('value');	   
		    //console.log("selected module ID: "+valueSelected);
		    
		    var jsonmap = jQuery('.privjson').attr('value');
		   // console.log("Json :"+jsonmap);
		    var jsonarray = [];
		   
		    jQuery.each(jQuery.parseJSON(jsonmap), function(k, v) {
					//console.log("Key is "+k+" & Value is "+v);
					if(k == valueSelected) {
						//console.log("k: "+k + " & valueselected: "+valueSelected);
						jsonarray = v;
					}
					
				});
			 //console.log("array from json "+jsonarray);
			 
		     var readOnlyPriv = '1';
			 
			 if(!(jq.inArray(readOnlyPriv,jsonarray) !== -1)){
				 console.log("this does not have readOnly Priv");
				 jq(this).closest('.branching').find('.switchInsideContainer span:eq(0) input').removeAttr('checked');
			 }
			
		});
		
		setTimeout( function () { 
	        jQuery('.roleForm').submit();
	    }, 300);
	});
	
	
	jQuery(document).on('click','#editRoleButton', function (e) {
		
		e.stopPropagation();
		
		jQuery(document).find(".customSelectNew").each(function() {
			console.log('inside select before submit');
			var optionSelected = jQuery(this).find("option:selected");
		    var valueSelected = optionSelected.attr('value');	   
		    //console.log("selected module ID: "+valueSelected);
		    
		    var jsonmap = jQuery('.privjson').attr('value');
		   // console.log("Json :"+jsonmap);
		    var jsonarray = [];
		   
		    jQuery.each(jQuery.parseJSON(jsonmap), function(k, v) {
					//console.log("Key is "+k+" & Value is "+v);
					if(k == valueSelected) {
						//console.log("k: "+k + " & valueselected: "+valueSelected);
						jsonarray = v;
					}
					
				});
			 //console.log("array from json "+jsonarray);
			 
		     var readOnlyPriv = '1';
			 
			 if(!(jq.inArray(readOnlyPriv,jsonarray) !== -1)){
				 console.log("this does not have readOnly Priv");
				 jq(this).closest('.branching').find('.switchInsideContainer span:eq(0) input').removeAttr('checked');
			 }
			
		});
		
		setTimeout( function () { 
	        jQuery('.editRoleForm').submit();
	    }, 300);
	});
	
	
	
	//Code when validation error happens in role
	
	jQuery(document).find(".rolePanel .customSelectNew").each(function() {
		console.log('inside select');
		var optionSelected = jQuery(this).find("option:selected");
	    var valueSelected = optionSelected.attr('value');	   
	    //console.log("selected module ID: "+valueSelected);
	    
	    var jsonmap = jQuery('.privjson').attr('value');
	   // console.log("Json :"+jsonmap);
	    var jsonarray = [];
	   
	    jQuery.each(jQuery.parseJSON(jsonmap), function(k, v) {
				//console.log("Key is "+k+" & Value is "+v);
				if(k == valueSelected) {
					//console.log("k: "+k + " & valueselected: "+valueSelected);
					jsonarray = v;
				}
				
			});
		 //console.log("array from json "+jsonarray);
		 
		 
		 jQuery(this).closest('.branching').find(".switchInsideContainer input[type='checkbox']").each(function() {
			 var thisValue = jQuery(this).attr('value');
			 //console.log("checkbox value: "+ thisValue);
			 if(jQuery.inArray(thisValue,jsonarray) !== -1){
				// console.log("its present");
				 jQuery(this).next('label').css('display', 'block');
			 }
			 else {
				// console.log("not present");
			 }
		 });
		 
	});
	
	
	
		 jQuery(document).on('change','.customCheckBox input[type="checkbox"]' , function(e){    
			 
			 jQuery(this).parents('.switchInsideContainer').find('span input[type="checkbox"]').removeClass('readonly_priv');
			 jQuery(this).parents('.switchInsideContainer').find('span:eq(0) input').removeClass('biased_priv').addClass('readonly_priv');
			console.log('inside main checkss');

		       e.stopPropagation();
			

		        if (jQuery(this).prop('checked')==true){ 
					jQuery(this).attr({checked:'checked'});
		           if(jQuery(this).hasClass('biased_priv')) {
		              /*jQuery(this).parents(".switchInsideContainer").find('.readonly_priv').attr({checked:'checked', disabled:'disabled'});*/
		        	   jQuery(this).parents(".switchInsideContainer").find('.readonly_priv').attr({checked:'checked'});
		        	   jQuery(this).parents(".switchInsideContainer").find('.readonly_priv').prop('checked', true);
		           }            
		        }

				else if (jQuery(this).prop('checked')==false){
					jQuery(this).removeAttr('checked');
					/*if(jQuery(this).parents(".switchInsideContainer").find('.customCheckBox input:checkbox:checked').length == 1) {          
					 
					  console.log('inside 1');
					  if(jQuery(this).parents(".switchInsideContainer").find('.biased_priv').is(':checked')) {
					    jQuery(this).parents(".switchInsideContainer").find(".readonly_priv").prop("checked", true) ; 
						  jQuery(this).parents(".switchInsideContainer").find('.readonly_priv').attr({checked:'checked', disabled:'disabled'});
					    jQuery(this).parents(".switchInsideContainer").find('.readonly_priv').attr({checked:'checked'});
						  console.log('length is'+jQuery(this).parents(".switchInsideContainer").find('.customCheckBox input:checkbox:checked').length);
					   }       
						else {
							 //jQuery(this).parents(".switchInsideContainer").find('.readonly_priv').removeAttr('disabled');
						}
					}*/
				}
				
				/*if(jQuery(this).parents(".switchInsideContainer").find('.customCheckBox input:checkbox:checked').length == 0) {                   
		          console.log('inside 0');
		          if(jQuery(this).parents(".switchInsideContainer").find('.biased_priv').is(':checked')) {
		              jQuery(this).parents(".switchInsideContainer").find(".readonly_priv").prop("checked", true) ; 
		           }       
					else {			
					jQuery(this).parents(".switchInsideContainer").find('.readonly_priv').removeAttr('checked');
						 //jQuery(this).parents(".switchInsideContainer").find('.readonly_priv').removeAttr('disabled');
					}
		        }*/

		    });
			
		    jQuery('.customCheckBox input[type="checkbox"]').change(function(){
		      console.log(jQuery('.customCheckBox input:checkbox:checked').length);
		    });

			
		    jQuery(".rolePanel").css({'min-height':'660px'});
		    jQuery(".rolePanel .TPRM_bg").css({'min-height':'660px'});
	
	 
			

  });  /*End tag for document.ready*/
    
    
    /* file upload  script starts */
    function fileUpload()
    {
    	jq(".browseBtn").click(function(){	
    	var file=(jq(this).parent().find('.file'));
    	var uploadText=(jq(this).parent().find('.uploadText'));
    	jq(file).trigger('click');
    	jq(file).change(function(){
    		if((jq(file).val()))
    		{
    			jq(uploadText).val(jq(file).val());
    		}
    	    });	
    	});
    }
    /* file upload  script ends  */
    
    
    

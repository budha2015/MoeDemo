// JavaScript Document
var showFlag = true;
    jQuery(document).ready(function(){  	
    	
		fileUpload();
	//Organisation 
	   jQuery('.row').on('click', '.addElement, .removeElement', function(e){
           e.stopPropagation();
            var jqthis = jQuery(this);
            var el = jqthis.closest('.row');
		  	var labelVal = el.children('label').html();
            if(jqthis.hasClass('addElement')){						
				el.clone().find('select').attr('name', labelVal).end().find('input').attr('name', labelVal).end().find('.addElement').hide().end().find('.removeElement').removeClass('hidden').end().insertAfter(el);			
            }
            else {
            el.remove();
          }
        });
		
	jQuery('.eContainer').on('click', '.aElement, .rElement', function(e){
	    e.stopPropagation();
		var jqthis = jQuery(this),
        el = jqthis.closest('.row'),
		container = jqthis.closest('.eContainer');
		
		if(jqthis.hasClass('aElement')) {
		 jqthis.closest('.eContainer').find('.hidden').clone().removeClass('hidden').find('select').addClass('customSelect').closest('.row').appendTo(container);
	     customSelect();
		}
		else{
		   el.remove();
		}
	   });	

	//Address Duplication
		 jQuery('.addAddress').on('click', function(){
				jQuery('.addressContainer').children('.hidden').clone().find('select').addClass('customSelect').end().removeClass('hidden').appendTo('.addressContainer');
				customSelect();
			 });
		jQuery('.addressContainer').on('click', '.removeAddress',function(){
		  jQuery(this).parents('.row').remove();
		});
		
		jQuery('.addressContainer').on('click', '.addElement, .removeElement', function(e){
           e.stopPropagation();
           var jqthis = jQuery(this),
               el = jqthis.closest('.row'),
               parentId = jqthis.closest('.outerdiv'),
               elNum = parentId.find('.row').length,
               elId = parentId.attr('data-id'),
               labelVal = el.children('label').html();
            if(jqthis.hasClass('addElement')){
             el.clone().find('input').attr('name', labelVal).end().find('.addElement').hide().end().find('.removeElement').removeClass('hidden').end().appendTo(parentId);
            }
          else {
            el.remove();
            parentId.find('.row').each(function(index){ 
              jQuery(this).find('input').attr('for', elId + (index+1));
            });
          }
        });
		
		//Score Schema starts
		jQuery('.questContainer').on('click', '.addElement, .removeElement', function(e){
			
		        e.stopPropagation();
		        var jqthis = jQuery(this);
		        var i = 0;
				   var tr = jQuery(this).closest('.branching');
		        var el = tr.closest('.branchingHead');
		       // checkOnOff();
		         if(jqthis.hasClass('addElement')){		
						el.find('.hidden').clone(true).find('select').addClass('customSelect').end().removeClass('hidden').insertAfter(tr);
						customSelect();
					   }
		       else {
					  tr.remove();
					
		       }
				 
		     });
		
		var removeBranchingIdsList = [];		
	jQuery('.removeElement').on('click', function () {
		console.log('deleteed id is:'+jQuery(this).closest('.add-target').find('.deletedId').text());
		removeBranchingIdsList.push(jQuery(this).closest('.add-target').find('.deletedId').text());
		console.log("removeBranchingIdsList is :"+removeBranchingIdsList);
		jQuery('.removeBranchingIdsList').attr('value', removeBranchingIdsList);
		
	})
	var delIdArr = [];
	var uniqueVal = [];;
	jQuery('.branchingHead').find('input[type=checkbox],select').change(function(){
		var delId = jQuery(this).parents('.branching').find('.deletedId').text();
		delIdArr.push(delId);
		console.log(delIdArr)
		
	});
	jQuery('.branch-right').on('click', function (){
		uniqueVal = delIdArr.filter(function(item,i,delIdArr){
			return i == delIdArr.indexOf(item);
		})
		console.log(uniqueVal)
		jQuery('.updateBranchingIdsList').attr('value', uniqueVal);
		
	});
	
	
	
	 //Custom Select Menu
      function customSelect() {
          jQuery(".customSelect").selectmenu({
        	    appendTo: '#targetSelect',
                close: function( event, ui ) {
                jQuery(this).siblings('.ui-selectmenu-button').children('.ui-icon').removeClass('active');},
                change: function( event, ui ) {
                	console.log(event);
                	console.log(ui);
                	delIdArr.push(jQuery(event.target).parents('.branching').find('.deletedId').text());
                	console.log(delIdArr)
                }
          });
          jQuery(".customSelect").selectmenu({
              open: function( event, ui ) {
              jQuery(this).siblings('.ui-selectmenu-button').children('.ui-icon').addClass('active');}
        });
                             
        } 
        customSelect();


        jQuery('#send_task').on('click', function() {
           jQuery(this).wrap('<form method="post" action="/partnerintegrity/responsedatacollection"></form>');
           jQuery(this).closest('form').submit();
        });	      
	
	
	//Licence manager Save Tenant page ... pop up forGenerate licence key
        
	jQuery('.createQuest, .questTitleEdit, .gen_key #email_lic').on('click', function(){
		jQuery('.gen_key').hide();
		jQuery('.email_lic').show();
		console.log('inside the click event...');
	});
	jQuery('.email_lic .closePopup,.email_lic .closeBtn , .genkeyPopup .closePopup, .genkeyPopup .closeBtn').on('click', function(){
		console.log("Rahul Close,....");
		jQuery('.genkeyPopup').hide();
		jQuery('.email_lic').hide();
	});
	
	
	jQuery('#gen_key').click(function(e){
		e.preventDefault();
		jQuery('.gen_key').show();
		jQuery('.popupBg').show();
		console.log("Id: " + jQuery('#gen_key').val());
		jQuery.post('getlicenseKey', {licenseId: jQuery('#gen_key').val()}, function(data) {
			  jQuery('#licenseKey').text(data);
			  console.log("data: " + data);
			});
	});
	
	jQuery('#email_lic').click(function(e){
		jQuery('.email_lic').show();
		jQuery('.popupBg').show();
		e.preventDefault();
	});
	
	jQuery('#terminate_lic').on('click', function(){
		var pop_id = jQuery(this).attr('id');		
		jQuery('.'+pop_id).show();
		jQuery('.popupBg').show();
	});
	
	//Email license Radio
	jQuery(".toEmailId").hide();
	jQuery(".toEmailId").removeAttr('placeholder');
	jQuery(".othr_cntct").css('visibility','hidden');
	jQuery(".pT15 .submitToggleBtn").css('visibility','hidden');
	jQuery(document).on("change","input[name='title']",function(){
		var thisElement = jQuery(this);
		var thisRadio = thisElement.attr("id");
		var radioValue;
		if(thisRadio=='accept'){
			thisElement.parents(".email_lic").find("#toEmailId").val("").css('visibility','hidden');
			//radioValue = jQuery('.tenantContact').text();
			jQuery(".pT15 .submitToggleBtn").css('visibility','visible');
			//console.log("Inside if" +  radioValue);
		}else if(thisRadio=='defer'){
			thisElement.parents(".email_lic").find("#toEmailId").val("").css('visibility','visible');
			jQuery(".pT15 .submitToggleBtn").css('visibility','hidden');
			jQuery("#toEmailId").on('keyup blur',function(){
				radioValue = jQuery('.othr_cntct').val();
				if(radioValue == ''){
					jQuery(".pT15 .submitToggleBtn").css('visibility','hidden');
				}else{
					jQuery(".pT15 .submitToggleBtn").css('visibility','visible');
				}
				//console.log("Else  " +  radioValue);
			});
		}
		//jQuery(".emailLicVal").attr('value',radioValue);
	});
	
	jQuery('#email_lic').on('click', function() {
		jQuery('.terminate_lic').hide();
	})
		
	
	//jQuery('.comments-trail').find('.isPrivates').hide();
	//jQuery('.privateError').hide();
	//Tabs
/*	jQuery(".panel-tabs li").click(function() {
        jQuery(".panel-tabs li").removeClass('active');
        jQuery(this).addClass("active");
        if(jQuery(this).find('a').attr('href') == '#public') {      
        	jQuery("#ajaxResponse").hide();
        	clearInterval(privateInterval);
        	RefeshPublicComment();
        	publicInterval = setInterval(RefeshPublicComment, 100000);        	
        }
        else if (jQuery(this).find('a').attr('href') == '#private'){           	
        	clearInterval(publicInterval);
        	RefeshPrivateComment();
        	privateInterval = setInterval(RefeshPrivateComment, 100000);        	
        }
         jQuery(".tab_content").hide();
        var selected_tab = jQuery(this).find("a").attr("href");
        jQuery(selected_tab).fadeIn();
        return false;
    });*/
	
	
	
	//Section Title Change
	jQuery('.sectionTitle').hide();
	jQuery('#sectionTitle').on('blur',function(){
		var secTitleVal =  jQuery('#sectionTitle').val();
		if(secTitleVal === '') {
			  jQuery(this).show(); 
		}
		else {		 
			jQuery('.sectionTitle').text(secTitleVal).show(); 
			jQuery('.sectionTitle').attr('title',secTitleVal);
			jQuery(this).hide(); 
		}	   
	 });
	
	jQuery('.sectionTitle').on('click', function(){
		jQuery(this).hide();
		jQuery('#sectionTitle').show();
	});
		
		jQuery('.sectionTitle').on('blur', function(){		
			var sectionVal = jQuery(this).val();
			jQuery('.sectionTitle').replaceWith('<p class="sectionTitleStyle">'+sectionVal+'<p>');	
		});				
			jQuery('.sectionTitleStyle').on('click' , function(){
				jQuery(this).replaceWith('<input type="text" placeholder="Untitled" class="sectionTitle" />');
			});				
			
	//Dynamic Tab	
	(function(){
		jQuery('.addSection').on('click', function(){
			 jQuery('.tab').removeClass('active');
			 var dataValue = jQuery('.addSection').prev().data('link').split('').reverse().join('');
			 var newVal = "abc" + (parseInt(dataValue) + 2);
		     jQuery('.blueprintTab').clone().find('label').attr('for', newVal + 51).end().find('input').attr('id', (newVal + 51)).end().removeClass('blueprintTab').removeClass('hidden').addClass('active').attr('data-link', newVal).insertBefore('.addSection');
             jQuery('.questionContainer').hide();  
             jQuery('.blueprint').clone().removeClass('blueprint').removeClass('hidden').attr('id', newVal).show().appendTo('.questContainer');
     });
  
       jQuery('.questContainer').on('click', '.tab', function(){
	       var showContainer = jQuery(this).attr('data-link');
	       jQuery('.tab').removeClass('active');
	       jQuery(this).addClass('active');	
	       jQuery('.questionContainer').hide();
	       jQuery('#' + showContainer).show();
	    });
	 })();
	
	//Section Title Change
	jQuery('.qt_editBox').hide();
	jQuery('#qt_editBox').on('blur',function(){
	var secTitleVal =  jQuery('#qt_editBox').val();
    if(secTitleVal === '')
		  jQuery(this).show();  
	  else
	  {		 
		jQuery('.qt_editBox').text(secTitleVal).show(); 
		jQuery('.qt_editBox').attr('title',secTitleVal);
		jQuery(this).hide(); 
	  }
	   
	 });
	
	jQuery('.qt_editBox').on('click', function(){
		jQuery(this).hide();
		jQuery('#qt_editBox').show();
	});
		
		jQuery('.qt_editBox').on('blur', function(){		
			var sectionVal = jQuery(this).val();
			jQuery('.qt_editBox').replaceWith('<p class="editStyle">'+sectionVal+'<p>');	
		});				
			jQuery('.editStyle').on('click' , function(){
				jQuery(this).replaceWith('<input type="text" placeholder="Untitled" class="qt_editBox" />');
			});	
				
	//Add Multiple TextBox Rows	
			jQuery('.qt_multiTxtBoxList').on('click', '.qt_add', function(e){
				e.stopPropagation();
		        e.preventDefault();
				jQuery(this).parents('.qt_multiTxtBoxList').append('<li class="clearfix qt_multiTxtBox_row"><input type="text" name="question" class="qt_ansOpt"/><input type="text" name="question" class="qt_score"/><button class="qt_add"></button><button class="qt_remove"></button></li>');		
			
			});
	//Remove Multiple TextBox Rows
	jQuery('.qt_multiTxtBoxList').on('click','.qt_remove', function(){
		if(jQuery('.qt_multiTxtBox_row').length > 3){
			jQuery(this).parents('.qt_multiTxtBox_row').remove();
		}
		else {alert('You cant delete further');}
		
	});	
	
	//Add Multiple Select CheckBox Rows
	jQuery('.qt_multiChkBoxList').on('click', '.qt_add', function(e){
		e.stopPropagation();
        e.preventDefault();	
		jQuery(this).parents('.qt_multiChkBoxList').append('<li class="clearfix qt_multiChkBox_row"><input type="checkbox" class="qt_ms_chkbox" /><label></label><input name="question" class="qt_ansOpt" type="text"><input name="question" class="qt_score" type="text"><button class="qt_add"></button><button class="qt_remove"></button></li>');		
	
	});
	//Remove Multiple CheckBox Rows
	jQuery('.qt_multiChkBoxList').on('click','.qt_remove', function(){
		if(jQuery('.qt_multiChkBox_row').length > 3){
			jQuery(this).parents('.qt_multiChkBox_row').remove();
		}
		else {alert('You cant delete further');}
		
	});
	 	 
	/* Class Naming
	mc-radio = bulkAnswer-multiChoice-radio;
	mc-dropdown = bulkAnswer-multiChoice-dropdown;
	ms-chkbox = bulkAnswer-multipleSelect-checkbox;
	ms-dropdown = bulkAnswer-multipleSelect-dropdown;	
	*/    
	//Bulk Answer - MultiChoice - Radio
	jQuery('.mc-radio').find('.save-bulkanswer').on('click',function(e){
		e.stopPropagation();
		var textVal = jQuery('.mc-radio').find('textarea').val();
		 if(typeof textVal != ""){
			 var arr = (textVal).split(';');
			 var index = arr.length;
			 for(var i=0; i < index; i++){	
				jQuery('<div class="clearfix">').appendTo('.mc-radio .qt_mc_radio');
				jQuery('<input class="checkbox" type="radio"/>').appendTo('.mc-radio .qt_mc_radio');		 
				 jQuery('<input />',{
				  value : arr[i]
				//  class : 'qt_ansOpt' 
				 }).appendTo('.mc-radio .qt_mc_radio');			 
				 jQuery('<input class="qt_score"/>').appendTo('.qt_mc_radio');
				  jQuery(this).parents('.mc-radio').find('textarea').val("");
			  } 
		  }			
			  jQuery('.mc-radio .bulk-answer-panel').hide();
	});
	
	//Bulk Answer - MultiChoice - Dropdown
	jQuery('.mc-dropdown').find('.save-bulkanswer').on('click', function(e){
		e.stopPropagation();
		var textVal = jQuery('.mc-dropdown').find('textarea').val();		
		 if(typeof textVal != ""){
			 var arr = (textVal).split(';');
			 var index = arr.length;
			 for(var i=0; i < index-1; i++){
			 jQuery('<input />',{
			  value : arr[i]
			 // class : 'bulk' 
			 }).appendTo('.mc-dropdown .mc_dd_opt');			 
			 jQuery('<input class="score"/>').appendTo('.mc-dropdown .mc_dd_opt');
		  	} 
		 }
		  jQuery('.bulk-answer-panel').hide();
	});
	//Bulk Answer - Multiple Select - Checkbox
	jQuery('.ms-chkbox').find('.save-bulkanswer').on('click', function(e){
		e.stopPropagation();
		var textVal = jQuery('.ms-chkbox').find('textarea').val();		
		 if(typeof textVal != ""){
			 var arr = (textVal).split(';');
			 var index = arr.length;
			 for(var i=0; i < index-1; i++){
		 		jQuery('<input class="checkbox" type="checkbox"/>').appendTo('.ms-chkbox .qt_field_opt');		 
			 	jQuery('<input />',{
			  	value : arr[i]
			  //	class : 'qt_ansOpt' 
			 }).appendTo('.ms-chkbox .qt_field_opt');			 
			 jQuery('<input class="qt_score"/><div class="clearfix">').appendTo('.ms-chkbox .qt_field_opt');
		  	} 
		 }
		  jQuery('.bulk-answer-panel').hide();
	});
	//Bulk Answer - Multiple Select - Dropdown
	jQuery('.ms-dropdown').find('.save-bulkanswer').on('click', function(e){
		e.stopPropagation();
		var textVal = jQuery('.ms-dropdown').find('textarea').val();		
		 if(typeof textVal != ""){
			 var arr = (textVal).split(';');
			 var index = arr.length;
			 for(var i=0; i < index-1; i++){	
				jQuery('<input class="checkbox" type="checkbox"/>').appendTo('.ms-dropdown .mc_dd_opt');		 
				 jQuery('<input />',{
				  value : arr[i]
				 // class : 'bulk' 
				 }).appendTo('.ms-dropdown .mc_dd_opt');			 
				 jQuery('<input class="score"/><div class="clearfix">').appendTo('.ms-dropdown .mc_dd_opt');
			  } 
		 }
		  jQuery('.bulk-answer-panel').hide();
	});
	
	//Bulk Answer Drop down Menu
	jQuery('.mc_dd_opt').hide();
	jQuery('.multiChoice_dd_select').on('click', function(e){
		e.stopPropagation();
		jQuery(this).toggleClass('toggle').siblings('.mc_dd_opt').toggle();	
	});	
	
    jQuery('#acc').click(function(){
        jQuery('#cc').show();
        jQuery(this).hide();
        return false;
    });
    
    jQuery('#abcc').click(function(){
        jQuery('#bcc').show();
        jQuery(this).hide();
        return false;
    });
    
	// Switch Yes/No 
  	//jQuery('input.switch').bootstrapSwitch();
	
	jQuery('.bulk-answer').on('click', function(e){
		e.stopPropagation();
  		jQuery(this).siblings('.bulk-answer-panel').toggle();	
  	});
	
	// open Settings panel
  	jQuery('.icon-settings').on('click', function(e){
		e.stopPropagation();
  		jQuery(this).siblings('.settings-panel').toggle();
  	});
  	jQuery('.settings-btn button').on('click', function(){
  		jQuery('.settings-panel').hide();
	});
	jQuery('button.cancel, button.save').on('click', function(){
  		jQuery('.bulk-answer-panel').hide();
	});
	
	/****** Comments Start *********/
	jQuery('.textArea textarea').keypress(function(e){
        var textareaLength = jQuery(this).val();

        if (textareaLength.length > 255){
                        e.preventDefault();
        }
	});

	var emailArr = [];
    function split( val ) {
          return val.split( /,\s*/ );
        }
        function extractLast( term ) {
          return split( term ).pop();
        }
    
        jQuery( ".commentEmailPrivate" ).bind( "keydown", function( event ) {
            if ( event.keyCode === jq.ui.keyCode.TAB &&
                jQuery( this ).autocomplete( "instance" ).menu.active ) {
              event.preventDefault();
            }
          })
          .autocomplete({
            source: function( request, response ) {
              jq.getJSON( "/partnerintegrity/searchUser", {
                term: extractLast( request.term )
              }, response );
            },
            search: function() {
              // custom minLength
              var term = extractLast( this.value );
              //alert("inside serach");
              if ( term.length < 1 ) {
                return false;
              }
            },
            focus: function() {
              // prevent value inserted on focus
              return false;
            },
            select: function( event, ui ) {
              jQuery('.viewCommentsContainer').show();	
              var terms = split( this.value );
              // remove the current input
              terms.pop();
              // add the selected item
              terms.push( ui.item.value );
              // add placeholder to get the comma-and-space at the end
              var el = ui.item.value,
                        storeEl = jQuery('.storeVal').val(),
                        toValues = jQuery('.toRecepient').val();
                        jQuery('.commentEmailPrivate').val(toValues + " " + el.substring(0, el.indexOf('<') - 1) + "; ");
                        jQuery('.storeVal').val(storeEl + " " + el + "; ");
/*                        if(jQuery('.textArea').find('textarea').val() != 'Start Typing...') {
                               jQuery('.textArea').siblings('.btn').removeAttr('disabled');      
                        }*/
              if(showFlag){
            	  emailArr = [];
            	  showFlag = false;
              }
              var start = el.indexOf('<'),
                        end = el.indexOf('>'),
                          emailVal = el.substring(start+1, end);
                        console.log("value of emailVal"+ emailVal);
                         emailArr.push(emailVal);
                         console.log("value of emaill Array for whole "+ emailArr);
                  jQuery('.emailIdValue').val(emailArr.join(';'));
              
              terms.push( "" );
              this.value = terms.join( ", " );
              return false;
            }
          });
                 });

				
	/*jQuery('.toRecepient').on('focus click', function(){
	   jQuery(this).val('');	
    });*/
	
/*	jQuery('.toRecepient').on('click keyup keydown mousedown', function(){		
		jQuery("#ajaxResponse").hide();
		if(jQuery(this).val==''){alert('inside If empty');jQuery("#ajaxResponse").hide();
		}
	});*/
	
	//pushing public comments to UI
/*	function RefeshPublicComment() {
		jq.ajax({
		      url: '/partnerintegrity/fetchPublicComments',
		      type: 'GET',
		      cache: false,
			  dataType : "json",
		      success: function(data){
		    	  var err = JSON.stringify(data);
			    	parsedError = JSON.parse(err);			    	
			    	if(parsedError["errorMsg"] == 'There is no public comments!!'){
			    		jQuery('.errorMsg').hide();
		    		  jQuery('.publicContainer').find('li').hide();
		    		  //jQuery('.publicError').html("<font color=red size=3 face=verdana>There is no public comments!</font>").fadeIn("slow");
			      }		    	 
		    	  else{
			    		//jQuery('.errorMsg').show();
			    		var el = JSON.stringify(data),
				    	newEl = JSON.parse(el),
				    	elements = '';
				    	jq.each(newEl, function(index, value){
				    		elements += jQuery('<ul class="commentsTails"><li class="clearfix">'+
				    		'<button class="btn-reply hidden btn btn-xs '+ value.replyEnable + "comment" +'" value="'+ value.commentThreadId +'" name="replyButton" onclick="assignThreadId(' + value.commentThreadId + ');">Reply</button>'+
							'<input name="assignedThreadId" id="assignedThreadId" type="hidden" />'+ 
							'<input name="threadId1" class="threadId1" value="'+ value.commentThreadId +'" type="text" hidden="true" />'+
													'<div class="clearfix comments-trail-container">' +
														'<span class="comments-image"><img src="images/comments-jc.gif" /></span>'+
														'<div class="comments-details clearfix">' +
															'<input name="threadId" class="threadIds" value="' + value.commentThreadId + '" type="text" hidden="true" />'+
															'<div class="rName">'+ value.commenterName +'</div>' +
															'<div class="date-time">' + value.commentedDate + '</div>'+
														'</div><div class="comments-desc">' + value.commentedText +'</div>'+
														'<button class="btn-recepient btn-xs"><i class="icon-comments icon-recepient"></i>Participants'+
														//'</button><span class="rName-detail"> <a href="mailto:'+ value.participients +'">'+
														'</button><span class="rName-detail">'+
							'<label class="rec1">' + value.participients + '</label></a></span></div></li></ul>').html();
				    	});
				    	jQuery('.errorMsg').show();
				    	jQuery('.publicContainer').html(elements);
				    	jQuery('.1comment').removeClass('hidden');
				    	
				    	jQuery('.comments-reply').clone().find('textarea').attr('name', 'pRely').end().addClass('reply-btn1').appendTo('.publicContainer');
			    	}
		      },
		      error: function(e){
		    	  //var el = JSON.stringify(e);
			       //alert(el["errorMsg"]);
			        //jQuery('.publicError').html("<font color=red size=3 face=verdana>We are unable to fetch public comments!</font>").fadeIn("slow");
		      }
		    });	
	}*/
	
	/*if(jQuery('.fieldValue').val() == '') {
		console.log("RefeshPublicComment---");
		RefeshPublicComment();	
		var publicInterval = setInterval(RefeshPublicComment, 100000);
	}
	else {
		console.log("RefeshPrivateComment---");
		RefeshPrivateComment();
		var privateInterval = setInterval(RefeshPrivateComment, 100000);
		
	}*/
	
	//pushing the comments to UI Ends
	
	
	//Publishing comment for questionnaire linking page
	/*function RefreshPublicCommentQuesLinking() {
		jq.ajax({
		      url: '/partnerintegrity/fetchPublicComments',
		      type: 'GET',
		      cache: false,
			  dataType : "json",
		      success: function(data){
		    	  var err = JSON.stringify(data);
			    	parsedError = JSON.parse(err);			    	
			    	if(parsedError["errorMsg"] == 'There is no public comments!!'){
			    		jQuery('.errorMsg').hide();
		    		  jQuery('.publicContainerQues').find('li').hide();
		    		  //jQuery('.publicError').html("<font color=red size=3 face=verdana>There is no public comments!</font>").fadeIn("slow");
			      }		    	 
		    	  else{
			    		//jQuery('.errorMsg').show();
			    		var el = JSON.stringify(data),
				    	newEl = JSON.parse(el),
				    	elementsQues = '';
				    	jq.each(newEl, function(index, value){
				    		elementsQues += jQuery('<ul class="commentsTails"><li class="clearfix">'+
				    		//'<button class="btn-reply hidden btn btn-xs '+ value.replyEnable + "comment" +'" value="'+ value.commentThreadId +'" name="replyButton" onclick="assignThreadId(' + value.commentThreadId + ');">Reply</button>'+
							'<input name="assignedThreadId" id="assignedThreadId" type="hidden" />'+ 
							'<input name="threadId1" class="threadId1" value="'+ value.commentThreadId +'" type="text" hidden="true" />'+
													'<div class="clearfix comments-trail-container">' +
														'<span class="comments-image"><img src="images/comments-jc.gif" /></span>'+
														'<div class="comments-details clearfix">' +
															'<input name="threadId" class="threadIds" value="' + value.commentThreadId + '" type="text" hidden="true" />'+
															'<div class="rName">'+ value.commenterName +'</div>' +
															'<div class="date-time">' + value.commentedDate + '</div>'+
														'</div><div class="comments-desc">' + value.commentedText +'</div>'+
														'<span class="rName-detail">'+
							'<label class="rec1">' + value.participients + '</label></a></span></div></li></ul>').html();
				    	});
				    	jQuery('.errorMsg').show();
				    	jQuery('.publicContainerQues').html(elementsQues);
				    	jQuery('.1comment').removeClass('hidden');
				    	
				    	jQuery('.comments-reply').clone().find('textarea').attr('name', 'pRely').end().addClass('reply-btn1').appendTo('.publicContainerQues');
			    	}
		      },
		      error: function(e){
		    	  //var el = JSON.stringify(e);
			       //alert(el["errorMsg"]);
			        //jQuery('.publicError').html("<font color=red size=3 face=verdana>We are unable to fetch public comments!</font>").fadeIn("slow");
		      }
		    });	
	}
	
	RefreshPublicCommentQuesLinking();*/
	
	
	//pushing public comments to UI
	/*function RefeshPrivateComment() {
		
		jq.ajax({
		      url: '/partnerintegrity/fetchPrivateComments',
		      type: 'GET',
		      cache: false,
			  dataType : "json",
		      success: function(data){
		    	  var err = JSON.stringify(data);
			    	parsedError = JSON.parse(err);
			    	
		    	    if(parsedError["errorMsg"] == 'There is no private comments'){	
		    	    	//alert(data);
		    	    	jQuery('.errorMsg').hide();
		    	    	jQuery('.publicContainer').find('li').hide();
		    	    	 //jQuery('.publicError').html("<font color=red size=3 face=verdana>There is no private comments!</font>").fadeIn("slow"); 
			    	}
		    	    else if(parsedError == 'undefined'){
		    	    	 //jQuery('.publicError').html("<font color=red size=3 face=verdana>There is no private comments!</font>").fadeIn("slow"); 
		    	    } else{
		    	    	//alert(data);
		    	    	jQuery('.errorMsg').hide();
			    		var el = JSON.stringify(data),
				    	newEl = JSON.parse(el),
				    	elements = '';
				    	jq.each(newEl, function(index, value){
				    		elements += jQuery('<ul class="commentsTails"><li class="clearfix">'+
							'<button class="btn-reply hidden btn btn-xs '+ value.replyEnable + "comment" +'" value="'+ value.commentThreadId +'" name="replyButton" onclick="assignThreadId(' + value.commentThreadId + ');">Reply</button>'+
							'<input name="assignedThreadId" id="assignedThreadId" type="hidden" />'+ 
							'<input name="threadId1" class="threadId1" value="'+ value.commentThreadId +'" type="text" hidden="true" />'+
										'<div class="clearfix comments-trail-container">' +
														'<span class="comments-image"><img src="images/comments-jc.gif" /></span>'+
														'<div class="comments-details clearfix">' +
															'<input name="threadId" class="threadIds" value="' + value.commentThreadId + '" type="text" hidden="true" />'+
															'<div class="rName">'+ value.commenterName +'</div>' +
															'<div class="date-time">' + value.commentedDate + '</div>'+
														'</div><div class="comments-desc">' + value.commentedText +'</div>'+
														'<button class="btn-recepient btn-xs"><i class="icon-comments icon-recepient"></i>Participants'+
														//'</button><span class="rName-detail"> <a href="mailto:'+ value.participients +'">'+
														'</button><span class="rName-detail">'+
							'<label class="rec1">' + value.participients + '</label></a></span></div></li></ul>').html();
				    	});
				    	 
				    	jQuery('.publicContainer').html(elements);
						jQuery('.1comment').removeClass('hidden');
						
						jQuery('.comments-reply').clone().find('textarea').attr('name', 'pRely').end().addClass('reply-btn1').appendTo('.publicContainer');
						//jQuery((this).find('a').attr('href') == '#public').hide();
			    	}
		    	   // jQuery((this).find('a').attr('href') == '#public').show();
		      },
		      
		      error: function(e){
		    	//  var el = JSON.stringify(e);
		      //  alert(el["errorMsg"]);
		    	  //jQuery('.publicError').html("<font color=red size=3 face=verdana>We are unable to fetch private comments!</font>").fadeIn("slow");
		      }
		    });	
	}
	*/
	
	//Private comments
	
/*	 jQuery('body').on('click', '.btn-reply', function(e){
		 e.preventDefault();
		 e.stopPropagation();
		 var $this = jQuery(this);
	  	jQuery('.reply-btn1').insertBefore($this).toggleClass('hidden');
	 });*/


	//Textarea Placeholder	
/*	jQuery('body').on('click keydown focusout mousedown', '.textArea textarea', function(){	 
		if(jQuery(this).val() == jQuery(this).attr('data-placeholder'))
			jQuery(this).val(''); 
	  });*/
	  
	  
/*	  
	jQuery('body').on('keyup focusout', '.textArea textarea', function(){
		  var placeholder = jQuery(this).attr('data-placeholder');			
		  if(jQuery(this).val() == ''){
			  jQuery(this).val(placeholder);
			  jQuery(this).parents('.textArea').siblings('.btn').attr('disabled', 'disabled');  
			  
		  }
		  else if( (jQuery(this).parents('.textArea').siblings('input').hasClass('toRecepient')) == true && jQuery('.toRecepient').val() == '') {  
			  jQuery(this).parents('.textArea').siblings('.btn').attr('disabled', 'disabled');   
		  }	 
		  else {
			   jQuery(this).parents('.textArea').siblings('.btn').removeAttr('disabled');  
		  }
	  });*/
	
/*	jQuery(".toRecepient, .textArea textarea").on("keyup focusout", function(){
		if(jQuery(this).val() === ''){
			jQuery("#private-comment").attr('disabled', 'disabled');
		}else{
			jQuery("#private-comment").removeAttr('disabled');
		}
	});*/
	
	
	//Button Participant
	 jQuery('.comments-trail').on('click', '.btn-recepient',function(e){
		 e.stopPropagation();
		 e.preventDefault();
		jQuery(this).siblings('.rName-detail').toggle();
		jQuery(this).toggleClass('toggle');	
	 });
	 jQuery('.comments-reply .btn-post').on('click', function(){
		jQuery(this).parents('').hide();	 
	 });
	 jQuery('.comments-trail h1 .icon-toggle').click(function(){
		 jQuery(this).toggleClass('active').parents('h1').siblings('ul').slideToggle('slow');
	 });
	 
	 //jQuery('comments-attach').on('click', function(){
	 	//logic
	 //});
	 //* ***** Comments Ends *********
	 
/*	jQuery('.commentEmailPrivate').on('keydown mousedown', function(e){
		 if(e.keyCode == 8 || e.keyCode == 46 || e.which === 1)
			 return true;
		 else
			 return false;		 
	 });
*/
	 jQuery('body').on('keydown', '.commentTextarea', function(e){
		 if(jQuery(this).val() == '' && e.keyCode == 32)
			 return false;
		 
	 });
	
	 jQuery('body').on('keydown keyup change paste', '.commentTextarea', function() {
		    var currentText = jQuery(this).val();
		                //jQuery(this).val(currentText.slice(0, 255));
		    if(currentText.length > 256) {
		    	//return false;
		        jQuery(this).val(currentText.slice(0, 256)); 
		                                }                              
		});

/*	  jQuery('.icon-toggle').on('click', function(){
		 jQuery('.publicContainer').toggle();  
	  });*/
	 
	 
	  /****** Contract External Org search code ******/
	  /*
	  jQuery(".externalOrgSearch").autocomplete({
		  
		  source : function(request, response) { 
			  
			jq.getJSON('searchTpOrganisation', { 
					term : request.term 
			}, 
				function(result) { 
					response(jq.map(result, function(item) { 
						//alert(item.orgName);
						return {
							label : item.orgName
							//organisationId : item.organisationId
						}; 
			})); 
			}); 
			
			},
			select: function(event, ui){
				
			}
		});
	  
	  */
	  /****** Contract External Org search code Ends******/
	  
	  
	 /****** Login Starts ********/
	 jQuery('#forgotPwd-submit').click(function(){
		 jQuery('#resetPwdDiv').show();
	});
	 
	 /****** Login Ends ********/
	 
	//Sorting questions panel
   	jQuery('.sortable').sortable({
		connectWith: ".qt_settings",
		handle: ".icon-sort"
	});
	
	//Deleting questions panel
	jQuery('.icon-delete').click(function(){
  		jQuery(this).parents('.sortable > div').hide();
  	});
	
		//Score Textbox
/*	jQuery('.qt_score, .score').on('keypress focus',function (e) {
		var key = window.e ? e.keyCode : e.which;
		if (e.keyCode == 8 || e.keyCode == 46
		 || e.keyCode == 37 || e.keyCode == 39) {
			return true;
		}
		else if ( key < 48 || key > 57 ) {
			return false;
			
		}
		else return true;
	}); */  
	jQuery('.bulk-answer-panel, .settings-panel, .mc_dd_opt').click( function(e){
        e.stopPropagation();
    });
	jQuery('html').click( function(){
        jQuery('.bulk-answer-panel, .settings-panel, .mc_dd_opt').hide();
    });
  
  // Drag and Drop
	jQuery( ".questionn" ).sortable({
		revert: true
	});
	
	jQuery('#questType li').draggable({ 
		connectToSortable: ".questionn",
		helper: "clone",
		revert: "invalid"   
	});
					
	jQuery('.questionn').droppable({
	  drop: function(event, ui){
		  ui.draggable.find('.hide').show().end().find('.show').hide();
	  }
	}
	);
	  
  	//Date Picker
	jQuery(".datepicker").datepicker({
		showOn: "button",
		changeMonth: true,
		changeYear: true
	});
	jQuery(".ui-datepicker-trigger").empty().html('<i class="icon-datePicker">');
	  
	 //Randon ID generator
		 function randonNumber(){
		  var rNum = Math.floor((Math.random() + 1) * 0x1000000000).toString(36).substring(1);                             
		  return rNum;                             
		}    			 
	jQuery('.publicContainer').on('click', '.btn-reply', function() {
		jQuery('.btn-post').val(jQuery(this).val());
	});	
		// user preference vertical menu
	jQuery('.TPRM_vert_tab li').click(function(){
		jQuery('.TPRM_vert_tab li').removeClass('vert_tab_active');
		jQuery(this).addClass('vert_tab_active');
		var userPref_id = jQuery(this).attr('id');
		jQuery('.userPref_hide').hide();
		jQuery('.'+userPref_id).show();
		jQuery('.successMsgUSP').hide();
		});
	
	
	// License Manager Summary
	
	jQuery('.btn-toggle').click(function() {
    jQuery(this).find('.btn').toggleClass('active');  
    
    if (jQuery(this).find('.btn-primary').size()>0) {
    	jQuery(this).find('.btn').toggleClass('btn-primary');
    }
    if (jQuery(this).find('.btn-danger').size()>0) {
    	jQuery(this).find('.btn').toggleClass('btn-danger');
    }
    if (jQuery(this).find('.btn-success').size()>0) {
    	jQuery(this).find('.btn').toggleClass('btn-success');
    }
    if (jQuery(this).find('.btn-info').size()>0) {
    	jQuery(this).find('.btn').toggleClass('btn-info');
    }
    
    jQuery(this).find('.btn').toggleClass('btn-default');
       
});
	jQuery( ".datepicker1" ).datepicker({
    changeMonth: true,
    changeYear: true,
    numberOfMonths: 1,
    showOn: "both",
    buttonImage: "images/datepicker_icon.png",
    buttonImageOnly: true,
    showAnim: "slideDown",
    dateFormat: "dd/mm/yy",
    });
	
	jQuery('.radio-grp button').click(function(){
	jQuery(this).parent().find('button').toggleClass('deactive'); // switch button
		});
		
	/**Remediation tab functionality starts***/	
	jQuery('.TPRM_datatable_tab span').click(function(){
		jQuery('.TPRM_datatable_tab span').removeClass('active_tab');
		jQuery(this).addClass('active_tab');
		jQuery('.remdTab').hide();
		var tab_id = jQuery(this).attr('id');
		jQuery('.'+tab_id).show();
		changeTableObject();
		});
		
	/**Remediation tab functionality ends***/	
	
	/***Add new tenant deployment type starts***/	
	var menu_id = jQuery('.add_tent_deploy').attr('id')+'-menu';
	var button_id = jQuery('.add_tent_deploy').attr('id')+'-button';
	jQuery('#'+menu_id).click(function(){
	//jQuery('#'+menu_id+' li:first').hide();

	var menu_txt = jQuery('#'+button_id).text();
	
	if(menu_txt == 'On-Premis')
	{
		jQuery('#act_license').hide();
		jQuery('#gen_license').show();
	}	
	else if(menu_txt == 'Cloud' || menu_txt == 'Hybrid')
	{
		jQuery('#gen_license').css('display','none');
		jQuery('#act_license').css('display','block');
	}
	else
	{
		jQuery('#gen_license').css('display','none');
		jQuery('#act_license').css('display','none');
		
	}
		});
		
	/***Add new tenant deployment type ends***/	
	
	
	/*****contracts*******/
	jQuery('#yes_type').click(function(){
	if(jQuery(this).is(':checked'))
	{
		jQuery('.yes_type').css('display','block');

	}
	});
	jQuery('#no_type').click(function(){
	if(jQuery(this).is(':checked'))
	{
		jQuery('.yes_type').css('display','none');
	}
	});
	jQuery('.exampl').tooltip();
	var placeholderVal = jQuery(".text_box").attr('placeholder');
	jQuery(".text_box").focus(function() {	
	this.placeholder = '';
    })
    .blur(function() {
        if (this.value === '') {
            this.placeholder = placeholderVal;
        }
    });
	
	/***update tenant deployment type starts***/	
	var menu_id_upd = jQuery('.update_tent_deploy').attr('id')+'-menu';
	var button_id_upd = jQuery('.update_tent_deploy').attr('id')+'-button';
	jQuery('#'+menu_id_upd).click(function(){
	//jQuery('#'+menu_id+' li:first').hide();

	var menu_txt_upd = jQuery('#'+button_id_upd).text();
	
	if(menu_txt_upd == 'On-Premis')
	{
		jQuery('#generate_lic,#sur_license').show();
		jQuery('#ren_license,#can_license').hide();
	}	
	else if(menu_txt_upd == 'Cloud' || menu_txt_upd == 'Hybrid')
	{
		jQuery('#generate_lic,#can_license').show();
		jQuery('#sur_license,#ren_license').hide();
	}
	else
	{
		jQuery('#generate_lic,#can_license,#sur_license').hide();
		jQuery('#ren_license').show();
	}
		});
		
	/***update tenant deployment type ends***/	
	
	/*********Left menu navigation********/
		   	jQuery(".left_panel .menus li .icon_header").on("click", function(e){
    			var displayVal = jQuery(this).closest(".menus li").hasClass('active');
    			jQuery(".menus li.active").removeClass("active");
					if(!displayVal){
    			jQuery(this).closest(".menus li").addClass("active");
				}
				if(!displayVal){
				jQuery(this).closest(".menus li").addClass("active");
	               }
	    	});
	    	jQuery(".collapse_right").on("click", function(e){
	    		e.preventDefault();
	    		if(jQuery(this).closest(".left_panel").hasClass("expanded")){
		jQuery(this).find('img').attr('src','images/left-pane-left-arw.png');
	    		}
	    		else{
		jQuery(this).find('img').attr('src','images/leftmenuarrow-right_normal.png');
	    		}
	    		jQuery(".left_panel").toggleClass("expanded")
	    	});
			jQuery('.dash_board').click(function(){
				jQuery(this).off('click');
				})
		jQuery('.sub_level2').click(function(){
			
			jQuery(this).next('.subMenuLevel2').toggle();
			if(jQuery(this).next('.subMenuLevel2').css('display')=='block')
			{
			jQuery(this).find('b').remove();
			jQuery(this).append('<b>V</b>');
			}
			else{
			jQuery(this).find('b').remove();
			jQuery(this).append('<b> > </b>');
			}
			
			});
	
	// date picker script starts here
jQuery(function() {
jQuery("#date_from").datepicker({
    changeMonth: true,
    changeYear: true,
    numberOfMonths: 1,
    showOn: "both",//button
	buttonImage: "images/icons/datepicker_icon.png",
    buttonImageOnly: true,
    showAnim: "slideDown",
    dateFormat: "dd-mm-yy",
    onClose: function(selectedDate) {
        $("#date_to").datepicker("option", "minDate", selectedDate);
    }
}).css({width:'90px',});


jQuery("#date_to").datepicker({
    changeMonth: true,
    changeYear: true,
    numberOfMonths: 1,
    showOn: "both",//button
	buttonImage: "images/icons/datepicker_icon.png",
    buttonImageOnly: true,
    showAnim: "slideDown",
    dateFormat: "dd-mm-yy",
    onClose: function(selectedDate) {
        $("#date_from").datepicker("option", "maxDate", selectedDate);
    }
}).css({width:'90px',});

jQuery("#date_approval").datepicker({
    changeMonth: true,
    changeYear: true,
    numberOfMonths: 1,
    showOn: "both",//button
	buttonImage: "images/icons/datepicker_icon.png",
    buttonImageOnly: true,
    showAnim: "slideDown",
    dateFormat: "dd-mm-yy",
    onClose: function(selectedDate) {
        $("#date_approval").datepicker("option", "maxDate", selectedDate);
    }
}).css({width:'90px',});
});
 // date picker script ends here 

/* file upload  script starts */
function fileUpload()
{
	jQuery(".browseBtn").click(function(){	
	var file=(jQuery(this).parent().find('.file'));
	var uploadText=(jQuery(this).parent().find('.uploadText'));
	jQuery(file).trigger('click');
	jQuery(file).change(function(){
		if((jQuery(file).val()))
		{
		jQuery(uploadText).val(jQuery(file).val());
		}
	    });	
	});
}
/* file upload  script ends  */


  

jQuery(document).ready(function () {
	var contractId = jQuery('.contractIdHidden').val();
    currentPage = jQuery('.currentPage').val();
	RefeshAllComment(contractId, currentPage);
	publicInterval = '';
	privateInterval = '';
	 jQuery(document).on("click", ".commentIcon", function(){
		 //console.log(jQuery('body .currentPage').val().trim());
		//console.log(jQuery('body').find('.currentPage').val() == "remediation"); 
		console.log("contract ID for comment is "+ jQuery(this).closest('tr').find("#viewData").attr('value'));
		jQuery('.contractIdHidden').attr('value', jQuery(this).closest('tr').find("#viewData").attr('value')); 
		jQuery('.contractIdPrivateHidden').attr('value', jQuery(this).closest('tr').find("#viewData").attr('value')); 
		var comentOffset = jQuery(this).offset();
		jQuery('.commentEmailPrivate').val('');
	    jQuery('.comentsTab').eq(0).trigger('click');
 	    console.log('comentOffset: '+comentOffset.top);
 	   emailArr = [];
 	   console.log("Array is reset" + emailArr);
 	    var top_offset;
		if(jQuery(window).width() < "700"){
			jQuery(".viewCommentsContainer").show();
			jQuery(".viewCommentsContainer").css({"left":comentOffset.left - 145, "top":comentOffset.top + 20});
		}else{
			if(comentOffset.top > '340') {
				console.log('inside if');
				top_offset = comentOffset.top/2;
				jQuery(".viewCommentsContainer").show();
				jQuery(".viewCommentsContainer").css({"left":comentOffset.left - 230, "top":comentOffset.top - 250});
				jQuery(".viewCommentsContainer").animate({
					left:comentOffset.left - 250
				});
			}
			else {
				jQuery(".viewCommentsContainer").show();
				jQuery(".viewCommentsContainer").css({"left":comentOffset.left - 230, "top":comentOffset.top - 30});
				jQuery(".viewCommentsContainer").animate({
					left:comentOffset.left - 250
				});
			}
			
			
		}
		
		if(jQuery(this).closest('tr').find('.contractId').val() != undefined) {
			console.log("under contractIDHidden if");
	     	jQuery('.contractIdHidden, .contractIdPrivateHidden').val(jQuery(this).closest('tr').find('.contractId').val().replace('$', ''));
		}
		if(jQuery('body').find('.currentPage').val() == "remediation") {
			console.log("Inside Remediations");
			jQuery('.contractIdHidden, .contractIdPrivateHidden').val(jQuery('.remediationComments').val());
		}
 	    var contractId = jQuery('.contractIdHidden').val(),
	        currentPage = jQuery('.currentPage').val();
 	    	RefeshPublicComment(contractId, currentPage)
            publicInterval = setInterval(RefeshPublicComment(contractId, currentPage), 10000); 
 	    	
 	    	  showFlag = true;
 	    	
	}); 
	 
	//For comment tab
		jQuery("body").on("click", '.comentsTab', function(){
			event.preventDefault();
			var tab = jQuery(this).attr("data");
			jQuery(this).addClass("comentsTabActive");
			jQuery(this).siblings().removeClass("comentsTabActive");
			jQuery(".tabContainer").hide();
			jQuery("#"+tab).show();
		});
		
		jQuery(".commentTextarea").on("keyup focus", function(){
			if(jQuery(".commentTextarea").val() == ""){
				jQuery(".commentBtn").prop("disabled", true).css({"background":"rgb(210, 210, 210)"});
			}else{
				jQuery(".commentBtn").prop("disabled", false).css({"background":"rgb(48, 91, 127)"});
			}
		});
		
		jQuery(".commentTextareaPrivate, .commentEmailPrivate").on("keyup focus", function(){
			if(jQuery(".commentTextareaPrivate").val() == "" || jQuery(".commentEmailPrivate").val() == ""){
				jQuery(".commentBtnPrivate").prop("disabled", true).css({"background":"rgb(210, 210, 210)"});
			}else{
				jQuery(".commentBtnPrivate").prop("disabled", false).css({"background":"rgb(48, 91, 127)"});
			}
		});
		
		jQuery(document).mouseup(function(e){
			var container = jQuery(".viewCommentsContainer");
			    
			if((!container.is(e.target) && container.has(e.target).length === 0) && jQuery('.commentIcon').html() != undefined){
				jQuery('.replyComment').remove();
				container.hide();
				
					clearInterval(publicInterval);
					clearInterval(privateInterval);
			}
		});
		

	//end for view comment 
		
		function RefeshPublicComment(contractId, contractName) {
			//var contractId = jQuery(".contractId").val();
			//console.log("contractId is ----- "+contractId);
			jQuery.ajax({
			      url: '/partnerintegrity/fetchPublicComments?param='+contractId+'&referenceType='+contractName,
			      type: 'GET',
			      cache: false,
				  dataType : "json",
			      success: function(data){
			    	  var comments = JSON.stringify(data),
			    	      publicComment = JSON.parse(comments);
				    	    //console.log("Errr----" + comments);  	 
					    	elements = '';
					    	
		     		    for(var i= 0; i < publicComment.length ; i++) {
				    			  elements += '<li class="firstLi"><span class="replybtn one'+ publicComment[i].replyEnable +'">Reply</span><input class="hidden threadId" type="text" value="'+ publicComment[i].commentThreadId + '" /><div class="clearfix comments-contractSummary"><span class="commentsNotify"><span class="user_prof"></span>'
				    			  elements += '<span class="prof_init"><span class="user_initial">'+ publicComment[i].commenterName +'</span></span></span>';
				    			  elements += '<div class="date-time">' + publicComment[i].commentedDate + '</div>';
				    			  elements += '<div class="comments-desc">' + publicComment[i].commentedText + '</div>';
				    			  elements += '<button class="btn-recepient btn-xs" style="padding:5px;font-size: 9px;line-height: 1.5;margin-top: 5px;margin-bottom: 20px;">'
				    			  elements += '<i class="icon-comments icon-recepient"></i>Recipients</button>';
				    			  elements += '<span class="rName-detail">' + publicComment[i].participients + '</span></div></li>';
					    	}
			
				    		jQuery('.comments-trail #tab-1 ul').html(elements);
				    		
				    		jQuery('.one1').each(function() {
				    			jQuery(this).closest('li').addClass('addBorder');
				    		});
				    
			      },
			      error: function(error){
			    	  console.log(error + "!");
			    	  //var el = JSON.stringify(e);
				       //alert(el["errorMsg"]);
				        //jQuery('.publicError').html("<font color=red size=3 face=verdana>We are unable to fetch public comments!</font>").fadeIn("slow");
			      }
			    });	
		}

		function RefeshPrivateComment(contractId, contractName) {
			//var contractId = jQuery(".contractId").val();
			//console.log("contractId is ----- "+contractId);
			jQuery.ajax({
			      url: '/partnerintegrity/fetchPrivateComments?param='+contractId+'&referenceType='+contractName,
			      type: 'GET',
			      cache: false,
				  dataType : "json",
			      success: function(data){
			    	  var comments = JSON.stringify(data),
			    	      publicComment = JSON.parse(comments);
				    	    //console.log("Errr----" + comments);  	 
					    	elements = '';
					    	
		     		    for(var i= 0; i < publicComment.length ; i++) {
				    			  elements += '<li class="firstLi"><span class="replybtn one'+ publicComment[i].replyEnable +'">Reply</span><input class="hidden threadId" type="text" value="'+ publicComment[i].commentThreadId + '" /><div class="clearfix comments-contractSummary"><span class="commentsNotify"><span class="user_prof"></span>'
				    			  elements += '<span class="prof_init"><span class="user_initial">'+ publicComment[i].commenterName +'</span></span></span>';
				    			  elements += '<div class="date-time">' + publicComment[i].commentedDate + '</div>';
				    			  elements += '<div class="comments-desc">' + publicComment[i].commentedText + '</div>';
				    			  elements += '<button class="btn-recepient btn-xs" style="padding:5px;font-size: 9px;line-height: 1.5;margin-top: 5px;margin-bottom: 20px;">'
				    			  elements += '<i class="icon-comments icon-recepient"></i>Recipients</button>';
				    			  elements += '<span class="rName-detail">' + publicComment[i].participients + '</span></div></li>';
					    	}
			
				    		jQuery('.comments-trail #tab-2 ul').html(elements);
				    		jQuery('.one1').each(function() {
				    			jQuery(this).closest('li').addClass('addBorder');
				    		});
				    
			      },
			      error: function(error){
			    	  console.log(error + "!");
			    	  //var el = JSON.stringify(e);
				       //alert(el["errorMsg"]);
				        //jQuery('.publicError').html("<font color=red size=3 face=verdana>We are unable to fetch public comments!</font>").fadeIn("slow");
			      }
			    });	
		}

		//Function to fetch all comments for logged in user(External user)
		
		function RefeshAllComment(contractId, contractName) {
			//var contractId = jQuery(".contractId").val();
			//console.log("contractId is ----- "+contractId);
			jQuery.ajax({
			      url: '/partnerintegrity/fetchLoggedInUserComments?param='+contractId+'&referenceType='+contractName,
			      type: 'GET',
			      cache: false,
				  dataType : "json",
			      success: function(data){
			    	  var comments = JSON.stringify(data),
			    	      publicComment = JSON.parse(comments);
				    	    //console.log("Errr----" + comments);  	 
					    	elements = '';
					    	
		     		    for(var i= 0; i < publicComment.length ; i++) {
				    			  elements += '<li class="firstLi"><span class="replybtn one'+ publicComment[i].replyEnable +'">Reply</span><input class="hidden threadId" type="text" value="'+ publicComment[i].commentThreadId + '" /><div class="clearfix comments-contractSummary"><span class="commentsNotify"><span class="user_prof"></span>'
				    			  elements += '<span class="prof_init"><span class="user_initial">'+ publicComment[i].commenterName +'</span></span></span>';
				    			  elements += '<div class="date-time">' + publicComment[i].commentedDate + '</div>';
				    			  elements += '<div class="comments-desc">' + publicComment[i].commentedText + '</div>';
				    			  elements += '<button class="btn-recepient btn-xs" style="padding:5px;font-size: 9px;line-height: 1.5;margin-top: 5px;margin-bottom: 20px;">'
				    			  elements += '<i class="icon-comments icon-recepient"></i>Recipients</button>';
				    			  elements += '<span class="rName-detail">' + publicComment[i].participients + '</span></div></li>';
					    	}
			
				    		jQuery('.comments-trail #tab-1 ul').html(elements);
				    		
				    		jQuery('.one1').each(function() {
				    			jQuery(this).closest('li').addClass('addBorder');
				    		});
				    
			      },
			      error: function(error){
			    	  console.log(error + "!");
			    	  //var el = JSON.stringify(e);
				       //alert(el["errorMsg"]);
				        //jQuery('.publicError').html("<font color=red size=3 face=verdana>We are unable to fetch public comments!</font>").fadeIn("slow");
			      }
			    });	
		}
		
		//End of fetch all comments for logged in user(External user)
		
			jQuery('.commentBtn').on('click', function() {
				var commentsContent = jQuery('.commentTextarea').val(),
				    currentPage = jQuery('.currentPage').val(),
				    currentId = jQuery('.contractIdHidden').val(),
				    sendToTP = jQuery('.sendToTPChecked').val();
				    console.log("sendToTP : " + sendToTP);
				    //console.log("commentsContent : " + commentsContent);
				    console.log("currentId : " + currentId); 
			    jQuery.post('/partnerintegrity/savePublicComments', {publicComment: commentsContent, refType: currentPage, parmaId: currentId, sendToTP: sendToTP }).done(function(data) {
			    	clearInterval(publicInterval);
			    	RefeshPublicComment(currentId, currentPage);	
			    	 publicInterval = setInterval(RefeshPublicComment(contractId, currentPage), 100000); 
			    	console.log("New commments Returns");
			    }).fail(function() { console.log("Failed to sub	mit comments") });
			    
			    jQuery('.commentTextarea').val('');
			    jQuery('.viewCommentsContainer').hide();
			});
			
			jQuery('.commentBtnPrivate').on('click', function() {
				var commentsContent = jQuery('.commentTextareaPrivate').val(),
				    currentPage = jQuery('.currentPagePrivate').val(),
				    currentId = jQuery('.contractIdPrivateHidden').val(),
				    currentEmail = jQuery('.commentEmailPrivate').val(),
				    emailIdValue = jQuery('.emailIdValue').val();
				   
			    jQuery.post('/partnerintegrity/savePrivateComments', {privateComment: commentsContent, refType: currentPage, parmaId: currentId, commentEmailPrivate: emailIdValue }).done(function(data) {
			    	clearInterval(privateInterval);
			    	RefeshPrivateComment(currentId, currentPage);
			    	privateInterval = setInterval(RefeshPrivateComment(contractId, currentPage), 5000);  
			    	console.log("New commments Returns");
			    });
			    jQuery('.commentTextareaPrivate').val('');
			    jQuery('.viewCommentsContainer').hide();
			});
			

			
			jQuery('body').on('click', '.replybtn', function(e){
				e.stopPropagation();
				e.preventDefault();
				var el = jQuery(this).closest('li');
				
				if(jQuery(el).find('.commentBtnReply').length == 0) {
				jQuery(el).prepend(jQuery('<div class="replyComment"><textarea class="commentTextareaReply" placeholder="Start typing..."></textarea><input disabled="disabled" type="button" value="Post" name="submit" class="commentBtnReply" style="background: rgb(48, 91, 127);"></div>'));
			  }
			});
			
			
			jQuery("body").on("keyup focus", '.commentTextareaReply', function(){
				if(jQuery(".commentTextareaReply").val() == ''){
					jQuery(".commentBtnReply").prop("disabled", true).css({"background":"rgb(210, 210, 210)"});
				}else{
					jQuery(".commentBtnReply").prop("disabled", false).css({"background":"rgb(48, 91, 127)"});
				}
			});
			
		 	jQuery('.viewCommentsContainer').on('click', '.commentBtnReply', function(e) {
			    var threadId = jQuery(this).closest('li').find('.threadId').val(),
			        replyComments = jQuery(this).closest('li').find('.commentTextareaReply').val();
			    console.log('threadId is ---- ' + threadId);
			    //console.log("comment is----" + replyComments);
				jQuery.post('/partnerintegrity/saveRepliedComments', {assignedThreadId: threadId, pRely: replyComments});
				jQuery('.replyComment').remove();
				jQuery('.viewCommentsContainer').hide();
			}); 
		 	
		 	jQuery('.comentsTab').on('click', function() {
		 	   var attr = jQuery(this).attr('data');
		 	   if(attr == "tab-1") {
		 	     jQuery('#tab-2').css('display', 'none');
		 	     jQuery('#tab-1').css('display', 'block');
		 	   
		 	    var contractId = jQuery('.contractIdHidden').val(),
		 	        currentPage = jQuery('.currentPage').val();
		 	    if(privateInterval != undefined) {
		 	    	clearInterval(privateInterval);
		 	    }	
			    publicInterval = setInterval(RefeshPublicComment(contractId, currentPage), 100000);
		 	   }
		 	   else {
			 	    var contractId = jQuery('.contractIdHidden').val(),
			        currentPage = jQuery('.currentPage').val();
		 		  RefeshPrivateComment(contractId, currentPage);   
		 	     jQuery('#tab-1').css('display', 'none');
		 	     jQuery('#tab-2').css('display', 'block');

		  	    clearInterval(publicInterval);
			    privateInterval = setInterval(RefeshPrivateComment(contractId, currentPage), 5000); 
		 	   }
		 	});
		 	
		 	  jQuery('.data-display-body').on('mouseenter', '.idText', function(){
		          var offset = jQuery(this).offset();
		          var descText = jQuery(this).text();
		          jQuery('.tooltop').css({'top': offset.top - 56 +"px", 'left': offset.left - 177 + "px"}).text(descText).show();
		        });
		     jQuery('.data-display-body').on('mouseleave', '.idText', function(){ 
		          jQuery('.tooltop').hide();
		        });
		     
		 	jQuery(document).mouseup(function(e){
				var container = jQuery(".brc_edit_wraper");
				var create_cont = jQuery(".create_new_brc_dropdown");
				
				if(!container.is(e.target) && container.has(e.target).length === 0){
					container.hide();
				}
				if(!create_cont.is(e.target) && create_cont.has(e.target).length === 0){
					
					create_cont.hide();
				}
			});
			


	
});





// JavaScript Document
	var jq=$.noConflict();	
    jq(document).ready(function(){
	//Organisation 
	   jq('.row').on('click', '.addElement, .removeElement', function(e){
           e.stopPropagation();
            var jqthis = jq(this);
            var el = jqthis.closest('.row');
		  	var labelVal = el.children('label').html();
            if(jqthis.hasClass('addElement')){						
				el.clone().find('select').attr('name', labelVal).end().find('input').attr('name', labelVal).end().find('.addElement').hide().end().find('.removeElement').removeClass('hidden').end().insertAfter(el);			
            }
            else {
            el.remove();
          }
        });
		
	jq('.eContainer').on('click', '.aElement, .rElement', function(e){
	    e.stopPropagation();
		var jqthis = jq(this),
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
		 jq('.addAddress').on('click', function(){
				jq('.addressContainer').children('.hidden').clone().find('select').addClass('customSelect').end().removeClass('hidden').appendTo('.addressContainer');
				customSelect();
			 });
		jq('.addressContainer').on('click', '.removeAddress',function(){
		  jq(this).parents('.row').remove();
		});
		
		jq('.addressContainer').on('click', '.addElement, .removeElement', function(e){
           e.stopPropagation();
           var jqthis = jq(this),
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
              jq(this).find('input').attr('for', elId + (index+1));
            });
          }
        });
	
	 //Custom Select Menu
      function customSelect() {
          jq(".customSelect").selectmenu({
                close: function( event, ui ) {
                jq(this).siblings('.ui-selectmenu-button').children('.ui-icon').removeClass('active');}
          });
          jq(".customSelect").selectmenu({
              open: function( event, ui ) {
              jq(this).siblings('.ui-selectmenu-button').children('.ui-icon').addClass('active');}
        });
                             
        } 
        customSelect();


	//Popup 	
	jq('.createQuest, .questTitleEdit').on('click', function(){
		jq('.questPopup').show();
		jq('.popupBg').show();
	});
	jq('.closePopup, .closeBtn').on('click', function(){
		jq('.questPopup').hide();
		jq('.popupBg').hide();
	});
	
	//jq('.comments-trail').find('.isPrivates').hide();
	jq('.privateError').hide();
	//Tabs
	jq(".panel-tabs li").click(function() {
        jq(".panel-tabs li").removeClass('active');
        jq(this).addClass("active");
        if(jq(this).find('a').attr('href') == '#public') {      
        	jq("#ajaxResponse").hide();
        	clearInterval(privateInterval);
        	RefeshPublicComment();
        	publicInterval = setInterval(RefeshPublicComment, 100000);        	
        }
        else if (jq(this).find('a').attr('href') == '#private'){           	
        	clearInterval(publicInterval);
        	RefeshPrivateComment();
        	privateInterval = setInterval(RefeshPrivateComment, 100000);        	
        }
         jq(".tab_content").hide();
        var selected_tab = jq(this).find("a").attr("href");
        jq(selected_tab).fadeIn();
        return false;
    });
	
	
	
	//Section Title Change
	jq('.sectionTitle').hide();
	jq('#sectionTitle').on('blur',function(){
		var secTitleVal =  jq('#sectionTitle').val();
		if(secTitleVal === '') {
			  jq(this).show(); 
		}
		else {		 
			jq('.sectionTitle').text(secTitleVal).show(); 
			jq('.sectionTitle').attr('title',secTitleVal);
			jq(this).hide(); 
		}	   
	 });
	
	jq('.sectionTitle').on('click', function(){
		jq(this).hide();
		jq('#sectionTitle').show();
	});
		
		jq('.sectionTitle').on('blur', function(){		
			var sectionVal = jq(this).val();
			jq('.sectionTitle').replaceWith('<p class="sectionTitleStyle">'+sectionVal+'<p>');	
		});				
			jq('.sectionTitleStyle').on('click' , function(){
				jq(this).replaceWith('<input type="text" placeholder="Untitled" class="sectionTitle" />');
			});				
			
	//Dynamic Tab	
	(function(){
		jq('.addSection').on('click', function(){
			 jq('.tab').removeClass('active');
			 var dataValue = jq('.addSection').prev().data('link').split('').reverse().join('');
			 var newVal = "abc" + (parseInt(dataValue) + 2);
		     jq('.blueprintTab').clone().find('label').attr('for', newVal + 51).end().find('input').attr('id', (newVal + 51)).end().removeClass('blueprintTab').removeClass('hidden').addClass('active').attr('data-link', newVal).insertBefore('.addSection');
             jq('.questionContainer').hide();  
             jq('.blueprint').clone().removeClass('blueprint').removeClass('hidden').attr('id', newVal).show().appendTo('.questContainer');
     });
  
       jq('.questContainer').on('click', '.tab', function(){
	       var showContainer = jq(this).attr('data-link');
	       jq('.tab').removeClass('active');
	       jq(this).addClass('active');	
	       jq('.questionContainer').hide();
	       jq('#' + showContainer).show();
	    });
	 })();
	
	//Section Title Change
	jq('.qt_editBox').hide();
	jq('#qt_editBox').on('blur',function(){
	var secTitleVal =  jq('#qt_editBox').val();
    if(secTitleVal === '')
		  jq(this).show();  
	  else
	  {		 
		jq('.qt_editBox').text(secTitleVal).show(); 
		jq('.qt_editBox').attr('title',secTitleVal);
		jq(this).hide(); 
	  }
	   
	 });
	
	jq('.qt_editBox').on('click', function(){
		jq(this).hide();
		jq('#qt_editBox').show();
	});
		
		jq('.qt_editBox').on('blur', function(){		
			var sectionVal = jq(this).val();
			jq('.qt_editBox').replaceWith('<p class="editStyle">'+sectionVal+'<p>');	
		});				
			jq('.editStyle').on('click' , function(){
				jq(this).replaceWith('<input type="text" placeholder="Untitled" class="qt_editBox" />');
			});	
				
	//Add Multiple TextBox Rows	
	jq('.qt_multiTxtBoxList').on('click', '.qt_add', function(e){
			
		jq(this).parents('.qt_multiTxtBoxList').append('<li class="clearfix qt_multiTxtBox_row"><input type="text" name="question" class="qt_ansOpt"/><input type="text" name="question" class="qt_score"/><button class="qt_add"></button><button class="qt_remove"></button></li>');		
	
	});
	//Remove Multiple TextBox Rows
	jq('.qt_multiTxtBoxList').on('click','.qt_remove', function(){
		if(jq('.qt_multiTxtBox_row').length > 3){
			jq(this).parents('.qt_multiTxtBox_row').remove();
		}
		else {alert('You cant delete further');}
		
	});	
	
	//Add Multiple Select CheckBox Rows
	jq('.qt_multiChkBoxList').on('click', '.qt_add', function(e){
			
		jq(this).parents('.qt_multiChkBoxList').append('<li class="clearfix qt_multiChkBox_row"><input type="checkbox" class="qt_ms_chkbox" /><label></label><input name="question" class="qt_ansOpt" type="text"><input name="question" class="qt_score" type="text"><button class="qt_add"></button><button class="qt_remove"></button></li>');		
	
	});
	//Remove Multiple CheckBox Rows
	jq('.qt_multiChkBoxList').on('click','.qt_remove', function(){
		if(jq('.qt_multiChkBox_row').length > 3){
			jq(this).parents('.qt_multiChkBox_row').remove();
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
	jq('.mc-radio').find('.save-bulkanswer').on('click',function(e){
		e.stopPropagation();
		var textVal = jq('.mc-radio').find('textarea').val();
		 if(typeof textVal != ""){
			 var arr = (textVal).split(';');
			 var index = arr.length;
			 for(var i=0; i < index; i++){	
				jq('<div class="clearfix">').appendTo('.mc-radio .qt_mc_radio');
				jq('<input class="checkbox" type="radio"/>').appendTo('.mc-radio .qt_mc_radio');		 
				 jq('<input />',{
				  value : arr[i]
				//  class : 'qt_ansOpt' 
				 }).appendTo('.mc-radio .qt_mc_radio');			 
				 jq('<input class="qt_score"/>').appendTo('.qt_mc_radio');
				  jq(this).parents('.mc-radio').find('textarea').val("");
			  } 
		  }			
			  jq('.mc-radio .bulk-answer-panel').hide();
	});
	
	//Bulk Answer - MultiChoice - Dropdown
	jq('.mc-dropdown').find('.save-bulkanswer').on('click', function(e){
		e.stopPropagation();
		var textVal = jq('.mc-dropdown').find('textarea').val();		
		 if(typeof textVal != ""){
			 var arr = (textVal).split(';');
			 var index = arr.length;
			 for(var i=0; i < index-1; i++){
			 jq('<input />',{
			  value : arr[i]
			 // class : 'bulk' 
			 }).appendTo('.mc-dropdown .mc_dd_opt');			 
			 jq('<input class="score"/>').appendTo('.mc-dropdown .mc_dd_opt');
		  	} 
		 }
		  jq('.bulk-answer-panel').hide();
	});
	//Bulk Answer - Multiple Select - Checkbox
	jq('.ms-chkbox').find('.save-bulkanswer').on('click', function(e){
		e.stopPropagation();
		var textVal = jq('.ms-chkbox').find('textarea').val();		
		 if(typeof textVal != ""){
			 var arr = (textVal).split(';');
			 var index = arr.length;
			 for(var i=0; i < index-1; i++){
		 		jq('<input class="checkbox" type="checkbox"/>').appendTo('.ms-chkbox .qt_field_opt');		 
			 	jq('<input />',{
			  	value : arr[i]
			  //	class : 'qt_ansOpt' 
			 }).appendTo('.ms-chkbox .qt_field_opt');			 
			 jq('<input class="qt_score"/><div class="clearfix">').appendTo('.ms-chkbox .qt_field_opt');
		  	} 
		 }
		  jq('.bulk-answer-panel').hide();
	});
	//Bulk Answer - Multiple Select - Dropdown
	jq('.ms-dropdown').find('.save-bulkanswer').on('click', function(e){
		e.stopPropagation();
		var textVal = jq('.ms-dropdown').find('textarea').val();		
		 if(typeof textVal != ""){
			 var arr = (textVal).split(';');
			 var index = arr.length;
			 for(var i=0; i < index-1; i++){	
				jq('<input class="checkbox" type="checkbox"/>').appendTo('.ms-dropdown .mc_dd_opt');		 
				 jq('<input />',{
				  value : arr[i]
				 // class : 'bulk' 
				 }).appendTo('.ms-dropdown .mc_dd_opt');			 
				 jq('<input class="score"/><div class="clearfix">').appendTo('.ms-dropdown .mc_dd_opt');
			  } 
		 }
		  jq('.bulk-answer-panel').hide();
	});
	
	//Bulk Answer Drop down Menu
	jq('.mc_dd_opt').hide();
	jq('.multiChoice_dd_select').on('click', function(e){
		e.stopPropagation();
		jq(this).toggleClass('toggle').siblings('.mc_dd_opt').toggle();	
	});	
	
    jq('#acc').click(function(){
        jq('#cc').show();
        jq(this).hide();
        return false;
    });
    
    jq('#abcc').click(function(){
        jq('#bcc').show();
        jq(this).hide();
        return false;
    });
    
	// Switch Yes/No 
  	//jq('input.switch').bootstrapSwitch();
	
	jq('.bulk-answer').on('click', function(e){
		e.stopPropagation();
  		jq(this).siblings('.bulk-answer-panel').toggle();	
  	});
	
	// open Settings panel
  	jq('.icon-settings').on('click', function(e){
		e.stopPropagation();
  		jq(this).siblings('.settings-panel').toggle();
  	});
  	jq('.settings-btn button').on('click', function(){
  		jq('.settings-panel').hide();
	});
	jq('button.cancel, button.save').on('click', function(){
  		jq('.bulk-answer-panel').hide();
	});
	
	/****** Comments Start *********/
	jq('.textArea textarea').keypress(function(e){
        var textareaLength = jq(this).val();

        if (textareaLength.length > 255){
                        e.preventDefault();
        }
	});

	 var emailArr = [];
	 
	jq(".fetchRecepient").autocomplete({
		source: function(request, response){
			jq.ajax({
				url : "/partnerintegrity/searchUser",
				type : "GET",
				data : {
					term : request.term
				},
				dataType : "json",
				success : function(data) {
					if(data){
						response(data);
					}
					if(data == ""){
						jq("#ajaxResponse").show();
						jq("#ajaxResponse").html("<div class='status-warn' style='margin-bottom:1em'>No user found!</div>");
					}
				},
				error: function(){
			
				}
			});
		},
		select: function(event, ui){
			var el = ui.item.value,
			storeEl = jq('.storeVal').val(),
			toValues = jq('.toRecepient').val();
			jq('.toRecepient').val(toValues + " " + el.substring(0, el.indexOf('<') - 1) + "; ");
			jq('.storeVal').val(storeEl + " " + el + "; ");
			if(jq('.textArea').find('textarea').val() != 'Start Typing...') {
				jq('.textArea').siblings('.btn').removeAttr('disabled');	
			}
			
			var start = el.indexOf('<'),
			 end = el.indexOf('>'),
		   	 emailVal = el.substring(start+1, end);
			 
			 emailArr.push(emailVal);
              jq('.emailIdValue').val(emailArr.join(';'));

		}
	});
				
	jq('.fetchRecepient').on('focus click', function(){
	   jq(this).val('');	
    });
	
	jq('.fetchRecepient').on('click keyup keydown mousedown', function(){		
		jq("#ajaxResponse").hide();
		if(jq(this).val==''){alert('inside If empty');jq("#ajaxResponse").hide();
		}
	});
	
	//pushing public comments to UI
	function RefeshPublicComment() {
		jq.ajax({
		      url: '/partnerintegrity/fetchPublicComments',
		      type: 'GET',
		      cache: false,
			  dataType : "json",
		      success: function(data){
		    	  var err = JSON.stringify(data);
			    	parsedError = JSON.parse(err);			    	
			    	if(parsedError["errorMsg"] == 'There is no public comments!!'){
		    		  jq('.publicError').show();
		    		  jq('.publicContainer').find('li').hide();
		    		  jq('.publicError').html("<font color=red size=3 face=verdana>There is no public comments!</font>").fadeIn("slow");
			      }		    	 
		    	  else{
			    		jq('.publicError').hide();
			    		var el = JSON.stringify(data),
				    	newEl = JSON.parse(el),
				    	elements = '';
				    	jq.each(newEl, function(index, value){
				    		elements += jq('<ul class="commentsTails"><li class="clearfix">'+
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
														'</button><span class="rName-detail"> <a href="mailto:john@xyz.com">'+ 
							'<label class="rec1">' + value.participients + '</label></a></span></div></li></ul>').html();
				    	});
				    	jq('.publicContainer').html(elements);
				    	jq('.1comment').removeClass('hidden');
				    	
				    	jq('.comments-reply').clone().find('textarea').attr('name', 'pRely').end().addClass('reply-btn1').appendTo('.publicContainer');
			    	}
		      },
		      error: function(e){
		    	  //var el = JSON.stringify(e);
			       //alert(el["errorMsg"]);
			        //jq('.publicError').html("<font color=red size=3 face=verdana>We are unable to fetch public comments!</font>").fadeIn("slow");
		      }
		    });	
	}
	
	RefeshPublicComment();
	
	var publicInterval = setInterval(RefeshPublicComment, 100000);
	var privateInterval;
	
	//pushing the comments to UI Ends
	

	//pushing public comments to UI
	function RefeshPrivateComment() {
		
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
		    	    	
		    	    	jq('.publicContainer').find('li').hide();
		    	    	 jq('.publicError').html("<font color=red size=3 face=verdana>There is no private comments!</font>").fadeIn("slow"); 
			    	}
		    	    else if(parsedError == 'undefined'){
		    	    	 jq('.publicError').html("<font color=red size=3 face=verdana>There is no private comments!</font>").fadeIn("slow"); 
		    	    } else{
		    	    	//alert(data);
		    	    	jq('.publicError').hide();
			    		var el = JSON.stringify(data),
				    	newEl = JSON.parse(el),
				    	elements = '';
				    	jq.each(newEl, function(index, value){
				    		elements += jq('<ul class="commentsTails"><li class="clearfix">'+
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
														'</button><span class="rName-detail"> <a href="mailto:john@xyz.com">'+ 
							'<label class="rec1">' + value.participients + '</label></a></span></div></li></ul>').html();
				    	});
				    	 
				    	jq('.publicContainer').html(elements);
						jq('.1comment').removeClass('hidden');
						
						jq('.comments-reply').clone().find('textarea').attr('name', 'pRely').end().addClass('reply-btn1').appendTo('.publicContainer');
						//jq((this).find('a').attr('href') == '#public').hide();
			    	}
		    	   // jq((this).find('a').attr('href') == '#public').show();
		      },
		      
		      error: function(e){
		    	//  var el = JSON.stringify(e);
		      //  alert(el["errorMsg"]);
		    	  //jq('.publicError').html("<font color=red size=3 face=verdana>We are unable to fetch private comments!</font>").fadeIn("slow");
		      }
		    });	
	}
	
	
	//Private comments
	
	 jq('body').on('click', '.btn-reply', function(e){
		 e.preventDefault();
		 e.stopPropagation();
		 var $this = jq(this);
	  	jq('.reply-btn1').insertBefore($this).toggleClass('hidden');
	 });


	//Textarea Placeholder	
	jq('body').on('click keydown focusout mousedown', '.textArea textarea', function(){	 
		if(jq(this).val() == jq(this).attr('data-placeholder'))
			jq(this).val(''); 
	  });
	  
	  
	  
	jq('body').on('keyup focusout', '.textArea textarea', function(){
		  var placeholder = jq(this).attr('data-placeholder');			
		  if(jq(this).val() == ''){
			  jq(this).val(placeholder);
			  jq(this).parents('.textArea').siblings('.btn').attr('disabled', 'disabled');  
			  
		  }
		  else if( (jq(this).parents('.textArea').siblings('input').hasClass('toRecepient')) == true && jq('.toRecepient').val() == '') {  
			  jq(this).parents('.textArea').siblings('.btn').attr('disabled', 'disabled');   
		  }	 
		  else {
			   jq(this).parents('.textArea').siblings('.btn').removeAttr('disabled');  
		  }
	  });
	
	//Button Participant
	 jq('.comments-trail').on('click', '.btn-recepient',function(e){
		 e.stopPropagation();
		 e.preventDefault();
		jq(this).siblings('.rName-detail').toggle();
		jq(this).toggleClass('toggle');	
	 });
	 jq('.comments-reply .btn-post').on('click', function(){
		jq(this).parents('').hide();	 
	 });
	 jq('.comments-trail h1 .icon-toggle').click(function(){
		 jq(this).toggleClass('active').parents('h1').siblings('ul').slideToggle('slow');
	 });
	 //jq('comments-attach').on('click', function(){
	 	//logic
	 //});
	 //* ***** Comments Ends *********
	 
	 jq('.toRecepient').on('keydown mousedown', function(e){
		 if(e.keyCode == 8 || e.keyCode == 46 || e.which === 1)
			 return true;
		 else
			 return false;		 
	 });
	 
	 jq('body').on('keydown', '.textArea textarea', function(e){
		 if(jq(this).val() == '' && e.keyCode == 32)
			 return false;
		 
	 });
	
	 jq('body').on('keydown keyup change paste', '.textArea textarea', function() {
		    var currentText = jq(this).val();
		                //jq(this).val(currentText.slice(0, 255));
		    if(currentText.length > 255) {
		    	//return false;
		        jq(this).val(currentText.slice(0, 255)); 
		                                }                              
		});

	  jq('.icon-toggle').on('click', function(){
		 jq('.publicContainer').toggle();  
	  });
	 
	 /****** Login Starts ********/
	 jq('#forgotPwd-submit').click(function(){
		 jq('#resetPwdDiv').show();
	});
	 
	 /****** Login Ends ********/
	 
	//Sorting questions panel
   	jq('.sortable').sortable({
		connectWith: ".qt_settings",
		handle: ".icon-sort"
	});
	
	//Deleting questions panel
	jq('.icon-delete').click(function(){
  		jq(this).parents('.sortable > div').hide();
  	});
	
		//Score Textbox
	jq('.qt_score, .score').on('keypress focus',function (e) {
		var key = window.e ? e.keyCode : e.which;
		if (e.keyCode == 8 || e.keyCode == 46
		 || e.keyCode == 37 || e.keyCode == 39) {
			return true;
		}
		else if ( key < 48 || key > 57 ) {
			return false;
			
		}
		else return true;
	});   
	jq('.bulk-answer-panel, .settings-panel, .mc_dd_opt').click( function(e){
        e.stopPropagation();
    });
	jq('html').click( function(){
        jq('.bulk-answer-panel, .settings-panel, .mc_dd_opt').hide();
    });
  
  // Drag and Drop
	jq( ".questionn" ).sortable({
		revert: true
	});
	
	jq('#questType li').draggable({ 
		connectToSortable: ".questionn",
		helper: "clone",
		revert: "invalid"   
	});
					
	jq('.questionn').droppable({
	  drop: function(event, ui){
		  ui.draggable.find('.hide').show().end().find('.show').hide();
	  }
	}
	);
	  
  	//Date Picker
	jq(".datepicker").datepicker({
		showOn: "button",
		changeMonth: true,
		changeYear: true
	});
	jq(".ui-datepicker-trigger").empty().html('<i class="icon-datePicker">');
	  
	 //Randon ID generator
		 function randonNumber(){
		  var rNum = Math.floor((Math.random() + 1) * 0x1000000000).toString(36).substring(1);                             
		  return rNum;                             
		}    			 
	jq('.publicContainer').on('click', '.btn-reply', function() {
		jq('.btn-post').val(jq(this).val());
	});	
	
	/*
	jq('#private-comment').click(function() {
		setTimeout(RefeshPrivateComment, 13000);
	});
	
	jq('#public-comment').click(function() {
		setTimeout(RefeshPublicComment, 13000);
	});*/
	
	// user preference vertical menu
	jq('.user_pref_vert_tab li').click(function(){
		jq('.user_pref_vert_tab li').removeClass('vert_tab_active');
		jq(this).addClass('vert_tab_active');
		})	
	// License Manager Summary
	
	jq('.btn-toggle').click(function() {
    jq(this).find('.btn').toggleClass('active');  
    
    if (jq(this).find('.btn-primary').size()>0) {
    	jq(this).find('.btn').toggleClass('btn-primary');
    }
    if (jq(this).find('.btn-danger').size()>0) {
    	jq(this).find('.btn').toggleClass('btn-danger');
    }
    if (jq(this).find('.btn-success').size()>0) {
    	jq(this).find('.btn').toggleClass('btn-success');
    }
    if (jq(this).find('.btn-info').size()>0) {
    	jq(this).find('.btn').toggleClass('btn-info');
    }
    
    jq(this).find('.btn').toggleClass('btn-default');
       
});
	jq( ".datepicker1" ).datepicker({
    changeMonth: true,
    changeYear: true,
    numberOfMonths: 1,
    showOn: "both",
    buttonImage: "images/datepicker_icon1.png",
    buttonImageOnly: true,
    showAnim: "slideDown",
    dateFormat: "dd-mm-yy",
    });
	
	jq('.radio-grp button').click(function(){
	jq(this).parent().find('button').toggleClass('deactive');
		});

	/*
	jq('#private-comment').click(function() {
		setTimeout(RefeshPrivateComment, 13000);
	});
	
	jq('#public-comment').click(function() {
		setTimeout(RefeshPublicComment, 13000);
	});*/
	
  });
	
  
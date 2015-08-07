$(document).ready(function() {

var output = JSON.parse(jsonOutput);
var oldRId = '';
var oldQId = '';
jQuery('.radioQst').each(function() {
	if(jQuery(this).is(':checked')) {
		showHideRadio(jQuery(this));	
	}
});

jQuery('.checkboxQst').each(function() {
	if(jQuery(this).is(':checked')) {
		showHideCheckbox(jQuery(this));	
	}
});

jQuery('.selectedVal').each(function() {
	if(jQuery(this).selectedIndex != 0) {
		showHideSelect(jQuery(this));	  	
	}	
});



function showHideRadio(currentVal) {
	var rId = jQuery(currentVal).val().substring(0,1),
    qId = jQuery(currentVal).closest('.boxContainer').find('.qIds').val(),
    id = (qId + " " + rId),
    oldId = oldQId + " " + oldRId;
    
	if(output[id] != undefined) {
	   var length = output[id].split(' ').length;
	}
	
	if(output[oldId] != undefined) {
	   var oldLength = output[oldId].split(' ').length;
	}
	
	for(var count = 0; count < oldLength; count = count+3) {
	  
    if(qId == oldQId && output[oldId] != undefined) {
        var myOldArray = output[oldId].split(' '), 
        start = parseInt(qId) + 1,
        end = parseInt(myOldArray[count + 2]);
    
    if(myOldArray[count] == "true" ) {
        for(var i=start; i<end; i++) {
           $('.'+ i).closest('.ui-widget-content').removeClass('hidden').removeClass('skipVal').find('.redTxt').removeClass('hidden');
        }
        $("." + end).closest('.ui-widget-content').removeClass('skipVal').find('.redTxt').removeClass('hidden');
    }       
  }
}

if(output[id] != undefined) {	
  var myArray = output[id].split(' '),
  start = parseInt(qId) + 1;
} 
    
  for(var count = 0; count < length; count = count+3) {
    if(output[id] != undefined) {
       var end = parseInt(myArray[count + 2]);

       if(myArray[count] == "true") {
           for(var i=start; i<end; i++) {
              $('.'+ i).closest('.ui-widget-content').addClass('hidden');
           }
             if(myArray[count + 1] ==  'false')
              $("." + end).closest('.ui-widget-content').addClass('skipVal').find('.redTxt').addClass('hidden');
             else {
            	 $("." + end).closest('.ui-widget-content').removeClass('skipVal').find('.redTxt').removeClass('hidden');
             }
       } 
       start = end + 1;
    }
  } 

    oldRId = rId;
    oldQId = qId;

    var currentPage = $('.' + qId).closest('.questionContainer').attr('id');
    console.log("Current Page: " + currentPage);
    $('li[data-link="'+ currentPage +'"]').trigger('click'); 
  
}

//showHideRadio();

$('input[type="radio"]').on('click', function(e) {
	var $this = $(this);
	showHideRadio($this);
});

function showHideCheckbox(currentVal) {
	var rId = $(currentVal).val().substring(0,1),
    qId = $(currentVal).closest('.boxContainer').find('.qIds').val();
    id = (qId + " " + rId);
    
    if(output[id] != undefined)
    	var length = output[id].split(' ').length;
    
    for(var count = 0; count < length; count = count + 3) {
    	
    if(output[id] != undefined && $(currentVal).is(':checked')) {
       var myArray = output[id].split(' '),
           start = parseInt(qId) + 1,
           end = parseInt(myArray[count + 2]);
       
       if(myArray[count] == "true") {
           for(var i=start; i<end; i++) {
              $('.'+ i).closest('.ui-widget-content').removeClass('hidden').removeClass('skipVal').find('.redTxt').removeClass('hidden');
           }
           if(myArray[count + 1] ==  'false') {
               $("." + end).closest('.ui-widget-content').addClass('skipVal').find('.redTxt').addClass('hidden');
           } else {
        	   $("." + end).closest('.ui-widget-content').removeClass('skipVal').find('.redTxt').removeClass('hidden');
           }
       }
          
    }

/*    if(output[id] != undefined && $(currentVal).is(':checked') == false) {

           var myArray = output[id].split(' '),
           start = parseInt(qId) + 1,
           end = parseInt(myArray[1]);
       
       if(myArray[0] == "true") {
           for(var i=start; i<end; i++) {
              console.log("i " + i);
              $('.'+ i).closest('.ui-widget-content').removeClass('hidden').removeClass('skipVal').find('.redTxt').show();
           }
           $("." + end).closest('.ui-widget-content').removeClass('skipVal').find('.redTxt').show(); 
       }

       if(myArray[3] != undefined && myArray[3] == "true") {
          var start1 = parseInt(myArray[4]);
          for(var i=end; i<start1; i++) {
              console.log("i " + i);
              $('.'+ i).closest('.ui-widget-content').removeClass('hidden');
           }                     
       }
	   }*/


    var currentPage = $('.' + qId).closest('.questionContainer').attr('id');
    console.log("Current Page: " + currentPage);
    $('li[data-link="'+ currentPage +'"]').trigger('click');
   
   }
}

$('input[type="checkbox"]').on('click', function(e) {   
	showHideCheckbox($(this));
});


 

function showHideSelect(currentVal) {
	   var rId = $(currentVal)[0].selectedIndex;
	   qId = $(currentVal).closest('.boxContainer').find('.qIds').val();
    id = (qId + " " + rId);
    var oldId = oldQId + " " + oldRId;
    
    if(output[id] != undefined) {
 	   var length = output[id].split(' ').length;
 	}
 	
 	if(output[oldId] != undefined) {
 	   var oldLength = output[oldId].split(' ').length;
 	}
    
   for(var count = 0; count < oldLength; count = count+3) {
    
    if(qId == oldQId && oldRId != 0 && output[oldId] != undefined) {
        
        
        var myOldArray = output[oldId].split(' '), 
        start = parseInt(qId) + 1,
        end = parseInt(myOldArray[count + 2]);
    
        if(myOldArray[count] == "true" ) {
            for(var i=start; i<end; i++) {
               $('.'+ i).closest('.ui-widget-content').removeClass('hidden').removeClass('skipVal').find('.redTxt').removeClass('hidden');
            }
            $("." + end).closest('.ui-widget-content').removeClass('skipVal').find('.redTxt').removeClass('hidden');
        }        
    }
   }
   
   
   if(output[id] != undefined) {	
	   var myArray = output[id].split(' '),
	   start = parseInt(qId) + 1;
	 }
   for(var count = 0; count < length; count = count+3) {
    if(output[id] != undefined && rId != 0) {
       var end = parseInt(myArray[count + 2]);
       if(myArray[count] == "true") {
           for(var i=start; i<end; i++) {
              $('.'+ i).closest('.ui-widget-content').addClass('hidden');
           }
             if(myArray[count + 1] ==  'false') {
               $("." + end).closest('.ui-widget-content').addClass('skipVal').find('.redTxt').addClass('hidden');
             } else {
            	 $("." + end).closest('.ui-widget-content').removeClass('skipVal').find('.redTxt').removeClass('hidden'); 
             }
       }
     }
    start = end + 1;
   }
    oldRId = rId;
    oldQId = qId;


    var currentPage = $('.' + qId).closest('.questionContainer').attr('id');
    console.log("Current Page: " + currentPage);
    $('li[data-link="'+ currentPage +'"]').trigger('click');
     
}

 
$('.selectedVal').on('change', function() {
	showHideSelect($(this)); 
});


if($('.mandatoryField').val() == 'true') {
	jQuery('.redTxt').each(function() {
		$(this).addClass('hidden');
	});
}


});




$(document).ready(function() {
	
		//Date Picker
		var date = new Date();
		date.setDate(date.getDate() - 1);

		jQuery(".datepicker").datepicker({
		    dateFormat: "dd/mm/yy",
		    defaultDate: date,
			showOn: "button",
			changeMonth: true,
			changeYear: true,
		    onSelect: function () {
		        selectedDate = jQuery.datepicker.formatDate("dd/mm/yy", jQuery(this).datepicker('getDate'));
				jQuery(".datepicker").val(selectedDate);
				calculateQst();
		    }
		});

		 
		jQuery(".ui-datepicker-trigger").empty().html('<i class="dp-icon">');
			
		   function randonNumber(){
			  var rNum = Math.floor((Math.random() + 1) * 0x1000000000).toString(36).substring(1);                             
			  return rNum;                             
		}
 	
	function calculateQst() {
		    var totalA = 0;
		    
		   jQuery('#submit-questionnaire').find('.ui-widget-content').each(function() {
			   if(jQuery(this).hasClass('hidden')) {
				   totalA++;
			   }
		   });
		     
		   console.log("TotalA: " + totalA);
		   
		     var totalQ = jQuery('#submit-questionnaire').find('.boxContainer').length,
		       totalLength = parseInt(totalQ),
		       totalQs = totalQ - totalA,
		   	   total = parseInt(totalQs),
	           ansQ = 0;
		     
		     console.log("Total: " + total);
	    
		   for(var i = 0; i < totalLength; i++) {
			  
			   var container = jQuery('.boxContainer').eq(i),
			       id = jQuery(container).find('.qtQstner').val();

			   switch(id) {
			    case '1':
			    case '2':
			    case '3':
			    case '4':
			    	  if(jQuery(container).closest('.ui-widget-content').hasClass('hidden') == true) {
			    		  console.log("1,2,3,4");
			    	  } else if(jQuery(container).find('.qt_ansOpt.submt').val().trim() != '') {
			    	    ansQ++;	  
			    	  }
			    	  break;
			    case '6':
			    case '8':
			    	  if(jQuery(container).closest('.ui-widget-content').hasClass('hidden') == true) {
			    		  console.log("6,8");
			    	  } else if(jQuery(container).find('select')[0].selectedIndex != '0') {
			    		ansQ++;  
			    	  } 
			    	 break; 
			    case '11':
			    	  if(jQuery(container).closest('.ui-widget-content').hasClass('hidden') == true) {
			    		  console.log("11");
			    	  } else if (jQuery(container).find('.date')[0].selectedIndex != '0' && jQuery(container).find('.month')[0].selectedIndex != '0' && jQuery(container).find('.year')[0].selectedIndex != '0') {
			    		  ansQ++;  
			    	  }
			    	  break; 
			    case '5':
			    case '7':
			    case '9':
			    case '10':
			    	if(jQuery(container).closest('.ui-widget-content').hasClass('hidden') == false) {
			    	 jQuery(container).find('.chkQ, .qt_ms_chkbox, .booleanRadio, .multiRadio').each(function() {
			    		 if(jQuery(this).is(':checked') == true) {
			    			 ansQ++;
			    			return false;
			    		 }
			    	 });	
			    	}
			      	 break;
	         case '12':
	        	    if(jQuery(container).closest('.ui-widget-content').hasClass('hidden') == true) {
	        	    	console.log("date picker");
	        	    }
	        	    else if((jQuery(container).find('.hasDatepicker').val() == undefined || jQuery(container).find('.hasDatepicker').val().trim() != '')) {		
			    	   ansQ++;
			    	   console.log("4--datepicker");
			    	}
	        	    else {
	        	    	console.log("none");
	        	    }
			   }
		   }
		   
		   console.log("Ans " + ansQ + " " + "total: " + total);
		   
		   $('.totalAns').text(ansQ);
		   $('.totalQuest').text(totalQs);
		   var perCompleted;
		   if(totalQs == 0){
			   perCompleted = 0;
		   }
		   else {
			   perCompleted = Math.round((ansQ/total)*100);   
		   }
		   
		   $('.tooltipInner span').text(perCompleted);
		   $('.statusBar').css('width', perCompleted + '%');
	}

	calculateQst();
	
	$('.questContainer').on('focusout', '.qt_ansOpt.submt, .hasDatepicker', function(e) {
		   e.stopPropagation();
		   calculateQst();  		       
	});

	$('.questContainer').on('click', '.multiRadio, .qt_ms_chkbox, .booleanRadio, .qt_ms_chkbox, select', function(e) {
		   e.stopPropagation();
		   calculateQst(); 
	});	
	
	
	
	
	function dates() {
		   
		   jQuery('.questionContainer.current').on('change', '#dt-select select', function() {
			   
			   if(jQuery(this).hasClass('mm')){  
				   
				  var mm = jQuery(this)[0].selectedIndex,
				      len =  jQuery('.dd').find('option').length;
				  
				  if (mm==4 || mm==6 || mm==9 || mm==11){
					 if(len < 31){
						 for(var i = len; i < 31; i++){
							  $('<option>'+ (i+1) +'</option>').appendTo('.dd'); 
						  }
				      	 
					 }
					 else {
						 jQuery('.dd').find('option').eq(31).remove();
					 }
					  
				  }
				  
				  else if (mm==1 || mm==3 || mm==5 || mm==7 || mm==8 || mm==10 || mm==12){
					  for(var i = len; i < 32; i++){
						  $('<option>'+i+'</option>').appendTo('.dd'); 
					  }
				  }
				  
				  else {
					    if(isLeapYear(yy) && mm==2) {
						  for(var i = len; i > 29; i--) {
							  jQuery('.dd').find('option').eq(i+1).remove(); 
						  }  
						  }	 
					    if(mm==2 && !isLeapYear(yy)) {
							  for(var i = len; i > 28; i--) {
								  jQuery('.dd').find('option').eq(i+1).remove(); 
							  } 
						
					  }
				  }
				    
			   }   
			   
			   
			    if(jQuery(this).hasClass('yy')) {
			       var yy = jQuery(this).val();
			       if(isLeapYear (yy)){
			    	   $('<option>29</option>').appendTo('.dd');  
			       }
			    }  
		   });
		   ////alert(n);
	   }
	   
	   function getDaysInMonth(month,year)  {
		   var days;
		   if (month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12)  days=31;
		   else if (month==4 || month==6 || month==9 || month==11) days=30;
		   else if (month==2)  {
		   if (isLeapYear(year)) { days=29; }
		   else { days=28; }
		   }
		   return (days);
		}
	   
	   function isLeapYear (Year) {
		   if (((Year % 4)==0) && ((Year % 100)!=0) || ((Year % 400)==0)) {
		   return (true);
		   } else { return (false); }
		   }
	   
	   dates();

    
});


    jQuery('.closePopup').on('click', function() {
    	jQuery(this).closest('.questPopup').hide();
		jQuery('.popupBg').hide();
    });

	jQuery('.draftPopup').on('click', '.closePopup', function() {
		jQuery('#submit-questionnaire').submit();
	});
	
  	jQuery('.saveAsDraft').on('click', function(e) {
		   e.preventDefault();
		   e.stopPropagation();
		   jQuery('.draftPopup, .popupBg').show();
		  // $.post('savequestionnairerespose', $('#submit-questionnaire').serialize());
	});





	$('.questionContainer').each(function(index) {
		  $('.questionContainer').eq(index).find('.qt_No').each(function(index) {
		       $(this).text(index+1 + ". "); 
		    });   
	});

(function() {
		  function numberIncrementor() {
			  //Dynamic ID generation for Questionnaire
			jQuery('.questionContainer li.canvas-element').each(function(i,el){	
				el = i+1;

				jQuery(this).find(".hq").attr('name', function(i,v){
					return v.replace(/[0-9]/g, '')+el; 				
				});
				//Settings 
				jQuery(this).find(".settings-panel input").attr('name', function(i,v){
					return v.replace(/[0-9]/g, '')+el; 				
				});
				//Text value
				jQuery(this).find("input[type='text']").attr('name', function(i,v){
					if(v != undefined) {
					  return v.replace(/[0-9]/g, '')+el; 
					}	
				});

				//checkbox value
				jQuery(this).find("input[type='checkbox'], select.currency").attr('name', function(i,v){
					return v.replace(/[0-9]/g, '')+el; 				
				});
				//Select Category
			   jQuery(this).find(".qt_settings .controlPanel li select").attr('name', function(i, v){
					return v.replace(/[0-9]/g, '')+el; 
				});
			   jQuery(this).find(".dateSel select").attr('name', function(i, v){
					return v.replace(/[0-9]/g, '')+el; 
				});
			  jQuery(this).find('.widgetsEl li input[type="text"]').attr('name', function(i,v){
				  if(v != undefined) {
							return v.replace(/[0-9]/g, '')+el;
				  }
				});	
			
	 		});
	   }

	   numberIncrementor();

	  })();

	



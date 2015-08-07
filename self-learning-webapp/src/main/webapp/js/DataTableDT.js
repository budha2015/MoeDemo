
jQuery(window).load(function(){
	console.log("window start...");
	jQuery(".mainpanel.TPRM_bg").css({'height':'833px','max-height':'833px','min-height':'833px'});
	console.log("window ends...");
});

jQuery(document).ready(function () {
	//starts for view comment 17-12-2014
	jQuery(document).on("click", ".commentIcon", function(){
		var comentOffset = jQuery(this).offset();
		if(jQuery(window).width() < "700"){
			jQuery(".viewCommentsContainer").show();
			jQuery(".viewCommentsContainer").css({"left":comentOffset.left - 145, "top":comentOffset.top + 20});
		}else{
			jQuery(".viewCommentsContainer").show();
			jQuery(".viewCommentsContainer").css({"left":comentOffset.left - 230, "top":comentOffset.top + 20});
			jQuery(".viewCommentsContainer").animate({
				left:comentOffset.left - 250
			});
		}
	});
	
	jQuery(document).mouseup(function(e){
		var container = jQuery(".viewCommentsContainer");
		if(!container.is(e.target) && container.has(e.target).length === 0){
			container.hide();
		}
	});
	//end for view comment 
	
/* datatable */
  var table = jQuery('#lmsTable').DataTable({
  "lengthMenu": [[10, 20, 50, 100], [10, 20, 50, 100]],
  //"iDisplayLength": 5,
  "responsive": true,
  "oLanguage": {
	  "sSearch": " ",
      "sLengthMenu": "view _MENU_ items/page",
      "sInfo": " ",
      "sInfoEmpty": " "
	},
  "pagingType": "full_numbers",
	  });

	  
  jQuery('.chk-box.sorting_1').hide();
  jQuery('.chk-box.sorting_1,th.chk-box').hide();

/* sortingStarts */  
	//table.find("th").off("click.DT");
	jQuery("th").off("click");
	
	
jQuery('.qb_question .atoz').click(function() {
    table.order([1,'asc']).draw();
});
jQuery('.qb_question .ztoa').click(function() {
   table.order([1,'desc']).draw();
});

jQuery('.qb_questionType .atoz').click(function() {
    table.order([2,'asc']).draw();
});
jQuery('.qb_questionType .ztoa').click(function() {
   table.order([2,'desc']).draw();
});

jQuery('.qb_category .atoz').click(function() {
    table.order([3,'asc']).draw();
});
jQuery('.qb_category .ztoa').click(function() {
   table.order([3,'desc']).draw();
});

jQuery('.qb_template .atoz').click(function() {
    table.order([4,'asc']).draw();
});
jQuery('.qb_template .ztoa').click(function() {
   table.order([4,'desc']).draw();
});

jQuery('.qb_startDate .atoz').click(function() {
    table.order([5,'asc']).draw();
});
jQuery('.qb_startDate .ztoa').click(function() {
   table.order([5,'desc']).draw();
});

jQuery('.qb_endDate .atoz').click(function() {
    table.order([6,'asc']).draw();
});
jQuery('.qb_endDate .ztoa').click(function() {
   table.order([6,'desc']).draw();
}); 

jQuery('.qb_status .atoz').click(function() {
    table.order([7,'asc']).draw();
});
jQuery('.qb_status .ztoa').click(function() {
   table.order([7,'desc']).draw();
});

jQuery('.qb_statusNew .atoz').click(function() {
    table.order([8,'asc']).draw();
});
jQuery('.qb_statusNew .ztoa').click(function() {
   table.order([8,'desc']).draw();
});

jQuery('.qb_risklevel .atoz').click(function() {
    table.order([8,'asc']).draw();
});
jQuery('.qb_risklevel .ztoa').click(function() {
   table.order([8,'desc']).draw();
});


 /* sorting ends/
 /* search starts*/
    jQuery(".search-box").keyup(function() {
       table.search( this.value,false,false,true ).draw();
	});
/* search ends */
	/* filter starts */
  jQuery("#lmsTable thead th.filterHead").each(function(i){
   var selectVar="";
      table.column( i ).data().unique().sort().each( function ( d, j ) {
          selectVar+='<div class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+d+'"><label></label>'+d+'</div>';
        } ); 
       jQuery("#col"+i).append(selectVar);
               
    }); 
	   jQuery(".filter-Chkbox1").click(function(){
            var chkId = '';
        jQuery('.filter-Chkbox1:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 1 )
                    .search(chkId, true, false )
                    .draw();
          
    });
        jQuery(".filter-Chkbox2").click(function(){
        //("hello");
        var chkId = '';
        jQuery('.filter-Chkbox2:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        //(chkId);
        var escapeRegex = false;
            table.column( 2 )
                    .search(chkId, true, false )
                    .draw();
       
    });
        jQuery(".filter-Chkbox3").click(function(){
            var chkId = '';
        jQuery('.filter-Chkbox3:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        var escapeRegex = false;
        table.column( 3 )
                    .search(chkId, true, false )
                    .draw();
    });
 jQuery(".filter-Chkbox4").click(function(){
            var chkId = '';
        jQuery('.filter-Chkbox4:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        var escapeRegex = false;
        table.column( 4 )
                    .search(chkId, true, false )
                    .draw();
    });

     jQuery(".filter-Chkbox5").click(function(){
            var chkId = '';
        jQuery('.filter-Chkbox5:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 5 )
                    .search(chkId, true, false )
                    .draw();
          
    });

         jQuery(".filter-Chkbox6").click(function(){
            var chkId = '';
        jQuery('.filter-Chkbox6:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 6 )
                    .search(chkId, true, false )
                    .draw();
          
    });

             jQuery(".filter-Chkbox7").click(function(){
            var chkId = '';
        jQuery('.filter-Chkbox7:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 7 )
                    .search(chkId, true, false )
                    .draw();
          
    });
	
	jQuery(".filter-Chkbox8").click(function(){
            var chkId = '';
        jQuery('.filter-Chkbox8:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 8 )
                    .search(chkId, true, false )
                    .draw();
          
    });
	
	jQuery(".filter-Chkbox9").click(function(){
            var chkId = '';
        jQuery('.filter-Chkbox9:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 9 )
                    .search(chkId, true, false )
                    .draw();
          
    });
	
	

	// Clear filter for first column
	    jQuery('.clear-filter').click(function(event) {  //on click 
        if(this.checked) { // check select status
	
            jQuery('.filter-Chkbox1').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"
					//jQuery(".link-questionnire").css("background","#11b1aa");
            });
        }else{
            jQuery('.filter-Chkbox1').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"  
				//jQuery(".link-questionnire").css("background","#CCC");	
    var chkId = '';
        jQuery('.filter-Chkbox1:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 1 )
                    .search(chkId, true, false )
                    .draw();				
            });         
        }
    });
		// Clear filter for first column
	    jQuery('.clear-filter').click(function(event) {  //on click 
        if(this.checked) { // check select status
	
            jQuery('filter-Chkbox2').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"
            });
        }else{
            jQuery('.filter-Chkbox2').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"  
		var chkId = '';
        jQuery('.filter-Chkbox2:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 2 )
                    .search(chkId, true, false )
                    .draw();				
            });         
        }
    });
		// Clear filter for second column
		
		
	// Clear filter for second column
	    jQuery('.clear-filter').click(function(event) {  //on click 
        if(this.checked) { // check select status
	
            jQuery('filter-Chkbox3').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"
            });
        }else{
            jQuery('.filter-Chkbox3').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"  
		var chkId = '';
        jQuery('.filter-Chkbox3:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 3 )
                    .search(chkId, true, false )
                    .draw();				
            });         
        }
    });
		// Clear filter for third column
	    jQuery('.clear-filter').click(function(event) {  //on click 
        if(this.checked) { // check select status
	
            jQuery('filter-Chkbox4').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"
            });
        }else{
            jQuery('.filter-Chkbox4').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"  
		var chkId = '';
        jQuery('.filter-Chkbox4:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 4 )
                    .search(chkId, true, false )
                    .draw();				
            });         
        }
    });
	// Clear filter for fourth column
	    jQuery('.clear-filter').click(function(event) {  //on click 
        if(this.checked) { // check select status
	
            jQuery('filter-Chkbox5').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"
            });
        }else{
            jQuery('.filter-Chkbox5').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"  
		var chkId = '';
        jQuery('.filter-Chkbox5:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 5 )
                    .search(chkId, true, false )
                    .draw();				
            });         
        }
    });

        // Clear filter for fifth column
      jQuery('.clear-filter').click(function(event) {  //on click 
        if(this.checked) { // check select status
  
            jQuery('filter-Chkbox6').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"
            });
        }else{
            jQuery('.filter-Chkbox6').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"  
    var chkId = '';
        jQuery('.filter-Chkbox6:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 6 )
                    .search(chkId, true, false )
                    .draw();        
            });         
        }
    });

              // Clear filter for sixth column
      jQuery('.clear-filter').click(function(event) {  //on click 
        if(this.checked) { // check select status
  
            jQuery('filter-Chkbox7').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"
            });
        }else{
            jQuery('.filter-Chkbox7').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"  
    var chkId = '';
        jQuery('.filter-Chkbox7:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 7 )
                    .search(chkId, true, false )
                    .draw();        
            });         
        }
    });
	
	// Clear filter for sixth column
      jQuery('.clear-filter').click(function(event) {  //on click 
        if(this.checked) { // check select status
  
            jQuery('filter-Chkbox8').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"
            });
        }else{
            jQuery('.filter-Chkbox8').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"  
    var chkId = '';
        jQuery('.filter-Chkbox8:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 8 )
                    .search(chkId, true, false )
                    .draw();        
            });         
        }
    });
	
	// Clear filter for sixth column
      jQuery('.clear-filter').click(function(event) {  //on click 
        if(this.checked) { // check select status
  
            jQuery('filter-Chkbox9').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"
            });
        }else{
            jQuery('.filter-Chkbox9').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"  
    var chkId = '';
        jQuery('.filter-Chkbox9:checked').each(function() {
          chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        
        var escapeRegex = false;
        table.column( 9 )
                    .search(chkId, true, false )
                    .draw();        
            });         
        }
    });
  
	
/* datatable ends */

jQuery(".qb_question span").click(function(){
	if(jQuery(".qb_question .dropdown").hasClass("show")){
		jQuery(".qb_question .dropdown").addClass("hide");
		jQuery(".qb_question .dropdown").removeClass("show");		
	}

	else {
	jQuery(".qb_question .dropdown").addClass("show");
	jQuery(".qb_question .dropdown").removeClass("hide");
	}
});


jQuery(".qb_questionType span").click(function(){
	if(jQuery(".qb_questionType .dropdown").hasClass("show")){
		jQuery(".qb_questionType .dropdown").addClass("hide");
		jQuery(".qb_questionType .dropdown").removeClass("show");		
	}

	else {
	jQuery(".qb_questionType .dropdown").addClass("show");
	jQuery(".qb_questionType .dropdown").removeClass("hide");
	}
});

jQuery(".qb_category span").click(function(){
	if(jQuery(".qb_category .dropdown").hasClass("show")){
		jQuery(".qb_category .dropdown").addClass("hide");
		jQuery(".qb_category .dropdown").removeClass("show");		
	}

	else {
	jQuery(".qb_category .dropdown").addClass("show");
	jQuery(".qb_category .dropdown").removeClass("hide");
	}
});

jQuery(".qb_template span").click(function(){
	if(jQuery(".qb_template .dropdown").hasClass("show")){
		jQuery(".qb_template .dropdown").addClass("hide");
		jQuery(".qb_template .dropdown").removeClass("show");		
	}

	else {
	jQuery(".qb_template .dropdown").addClass("show");
	jQuery(".qb_template .dropdown").removeClass("hide");
	}
});

jQuery(".qb_startDate span").click(function(){
  if(jQuery(".qb_startDate .dropdown").hasClass("show")){
    jQuery(".qb_startDate .dropdown").addClass("hide");
    jQuery(".qb_startDate .dropdown").removeClass("show");   
  }

  else {
  jQuery(".qb_startDate .dropdown").addClass("show");
  jQuery(".qb_startDate .dropdown").removeClass("hide");
  }
});

jQuery(".qb_endDate span").click(function(){
  if(jQuery(".qb_endDate .dropdown").hasClass("show")){
    jQuery(".qb_endDate .dropdown").addClass("hide");
    jQuery(".qb_endDate .dropdown").removeClass("show");   
  }

  else {
  jQuery(".qb_endDate .dropdown").addClass("show");
  jQuery(".qb_endDate .dropdown").removeClass("hide");
  }
});

jQuery(".qb_status span").click(function(){
  if(jQuery(".qb_status .dropdown").hasClass("show")){
    jQuery(".qb_status .dropdown").addClass("hide");
    jQuery(".qb_status .dropdown").removeClass("show");   
  }

  else {
  jQuery(".qb_status .dropdown").addClass("show");
  jQuery(".qb_status .dropdown").removeClass("hide");
  }
});

jQuery(".qb_statusNew span").click(function(){
  if(jQuery(".qb_statusNew .dropdown").hasClass("show")){
    jQuery(".qb_statusNew .dropdown").addClass("hide");
    jQuery(".qb_statusNew .dropdown").removeClass("show");   
  }

  else {
  jQuery(".qb_statusNew .dropdown").addClass("show");
  jQuery(".qb_statusNew .dropdown").removeClass("hide");
  }
});

jQuery(".qb_risklevel span").click(function(){
  if(jQuery(".qb_risklevel .dropdown").hasClass("show")){
    jQuery(".qb_risklevel .dropdown").addClass("hide");
    jQuery(".qb_risklevel .dropdown").removeClass("show");   
  }

  else {
  jQuery(".qb_risklevel .dropdown").addClass("show");
  jQuery(".qb_risklevel .dropdown").removeClass("hide");
  }
});

jQuery('.cancel,.ok').on('click' ,function(){
	jQuery(this).parents(".dropdown").removeClass('show').addClass('hide');
/*	if(jQuery(".qb_template .dropdown").hasClass("show")){
		jQuery(".qb_template .dropdown").addClass("hide");
		jQuery(".qb_template .dropdown").removeClass("show");		
	}

	else {
	jQuery(".qb_template .dropdown").addClass("show");
	jQuery(".qb_template .dropdown").removeClass("hide");
	} */
});

    jQuery('#selecctall').click(function(event) {  //on click 
        if(this.checked) { // check select status
            jQuery('.checkbox1').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"
            });
        }else{
            jQuery('.checkbox1').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"
            });         
        }
    });
    



jQuery(".save-template-popup .cancel").click(function(){
		jQuery(".save-template-popup").css("display","none");
		jQuery(".popupBg").css("display","none");
	  //(jQuery("#container").html());
});

jQuery(".save-template-popup .submitQ").click(function(){
		jQuery(".save-template-popup").css("display","none");
		jQuery(".popupBg").css("display","none");
		alert(templatename = jQuery(".template-name").val());
		alert(templatename +"<br>"+templatedata);
});



	 //Custom DataTable UI Change
	 jQuery('.dataTables_length').insertAfter('#lmsTable');
	 //	jQuery('.dataTables_filter').find('label').html('<input type="search" class=" search-table" placeholder="Search" aria-controls="lmsTable">');
	 jq(".dataTables_length select").selectmenu({
				open: function( event, ui ) {
          jq(this).siblings('.ui-selectmenu-button').children('.ui-icon').addClass('active');
      },
      close: function( event, ui ) {
        jq(this).siblings('.ui-selectmenu-button').children('.ui-icon').removeClass('active');
      },
      change:function(event, ui){
        jq(".dataTables_length select").val(ui.item.label).trigger('change');
      }
	});
	
	
});



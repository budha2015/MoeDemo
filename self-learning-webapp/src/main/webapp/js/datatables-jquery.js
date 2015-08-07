
jQuery(window).load(function(){
	//console.log("window start...");
	jQuery(".mainpanel.TPRM_bg").css({'min-height':'760px'});
	console.log("window ends...");
});

jQuery(document).ready(function () {
	//starts for view comment 17-12-2014

	
	jQuery('.data-display-body').on('mouseenter', '.idText', function(){
        var offset = jQuery(this).offset();
        var descText = jQuery(this).text();
        jQuery('.tooltop').css({'top': offset.top - 34 +"px", 'left': offset.left - 145 + "px"}).text(descText).show();
      });
   jQuery('.data-display-body').on('mouseleave', '.idText', function(){ 
        jQuery('.tooltop').hide();
      });
	
/* datatable */
  var table = jQuery('#lmsTable').DataTable({
	  "bPaginate":true,
	  "pagingType": "full_numbers",
  "lengthMenu": [[10, 20, 50, 100], [10, 20, 50, 100]],
  //"iDisplayLength": 5,
  "responsive": true,
	 "bFilter": true,
	 "oLanguage": {
		  "sSearch": " ",
		  "oPaginate": {"sFirst": "F","sPrevious": "P","sNext": "N","sLast": "L"},
		  "sLengthMenu": "view _MENU_ items/page",
		  "sInfo": " ",
		  "sInfoEmpty": " "
		},
	"aoColumns": [
				  null,
	              null,
	              null,
	              { "sType": "date-uk" },	              
	              { "sType": "date-uk" },
	              null
	              
	          ],
		/*"order": [[4,"desc"]]*/
	  });

  jQuery.extend( jQuery.fn.dataTableExt.oSort, {
	  "date-uk-pre": function ( a ) {
	      var ukDatea = a.split('/');
	      return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
	  },

	  "date-uk-asc": function ( a, b ) {
	      return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	  },

	  "date-uk-desc": function ( a, b ) {
	      return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	  }
	  } );
  /*Global Search - Match only words starts with searched keyword */
  jQuery.fn.dataTable.ext.search.push( function (settings, searchData) {
      var currSearchRegex = new RegExp("^" + jQuery("div.dataTables_filter input").val(), 'i');

      for(i in searchData) {
          if(currSearchRegex.test(searchData[i])){
              return true;
          }
      }
      return false;
  });
  /* search ends */	
  
  jQuery('.chk-box.sorting_1').hide();
  jQuery('.chk-box.sorting_1,th.chk-box').hide();

/* sortingStarts */  
	//table.find("th").off("click.DT");
	jQuery("th").off("click");
	
	
jQuery('.qb_question .atoz').click(function() {
    table.order([1,'asc']).draw();
    jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});
jQuery('.qb_question .ztoa').click(function() {
   table.order([1,'desc']).draw();
   jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});

jQuery('.qb_questionType .atoz').click(function() {
    table.order([2,'asc']).draw();
    jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});
jQuery('.qb_questionType .ztoa').click(function() {
   table.order([2,'desc']).draw();
   jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});

jQuery('.qb_category .atoz').click(function() {
    table.order([3,'asc']).draw();
    jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});
jQuery('.qb_category .ztoa').click(function() {
   table.order([3,'desc']).draw();
   jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});

jQuery('.qb_template .atoz').click(function() {
    table.order([4,'asc']).draw();
    jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});
jQuery('.qb_template .ztoa').click(function() {
   table.order([4,'desc']).draw();
   jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});

jQuery('.qb_startDate .atoz').click(function() {
    table.order([5,'asc']).draw();
    jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});
jQuery('.qb_startDate .ztoa').click(function() {
   table.order([5,'desc']).draw();
   jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});

jQuery('.qb_endDate .atoz').click(function() {
    table.order([6,'asc']).draw();
    jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});
jQuery('.qb_endDate .ztoa').click(function() {
   table.order([6,'desc']).draw();
   jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
}); 

jQuery('.qb_status .atoz').click(function() {
    table.order([7,'asc']).draw();
    jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});
jQuery('.qb_status .ztoa').click(function() {
   table.order([7,'desc']).draw();
   jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});

jQuery('.qb_statusNew .atoz').click(function() {
    table.order([8,'asc']).draw();
    jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});
jQuery('.qb_statusNew .ztoa').click(function() {
   table.order([8,'desc']).draw();
   jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});

jQuery('.qb_risklevel .atoz').click(function() {
    table.order([8,'asc']).draw();
    jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});
jQuery('.qb_risklevel .ztoa').click(function() {
   table.order([8,'desc']).draw();
   jQuery('.dropdown').addClass('hide');
	jQuery('.dropdown').removeClass('show');
});


 /* sorting ends/
 /* search starts*/
  /*  jQuery(".search-box").keyup(function() {
       table.search( this.value,false,false,true ).draw();
	});*/
/* search ends */
	/* filter starts */
    
    jQuery("th").off("click");

    /*jQuery("#lmsTable thead th.filterHead").each(function(i){
	  	   var selectVar="";
	  	      table.column( i ).data().unique().sort().each( function ( d, j ) {
	  	    	  var s = d.replace(/(<([^>]+)>)/ig,"").trim(); 	    	
	  	    	  if(s == "") { 	  	    		
	  	    		selectVar+='<div title="Blank" class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="Blank"><label></label>Blank</div>';
	  	    	  }
	  	    	  else { 	  	    		
	  	    		selectVar+='<div title="'+s+'" class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+s+'"><label></label>'+s+'</div>';
	  	    	  }  	          
	  	        }); 
	  	       jQuery("#col"+i).append(selectVar);
	  	               
	  	    }); */
    
	
    /*jQuery("#lmsTable thead th.filterHead").each(function(i){
		   var selectVar="";
		  	  sortVal = table.column( i ).data().unique().sort(function(a,b){
				   
					var alc = a.toLowerCase(), blc = b.toLowerCase();
				    return alc > blc ? 1 : alc < blc ? -1 : 0;
				});
		  	  
		      sortVal.unique().sort().each( function ( d, j ) {
		    	  console.log("value of d: "+d);
		    	  var s = d.replace(/(<([^>]+)>)/ig,"").trim();
		    	  console.log("value of s: "+s);
		    	  if(s == "") { 
		  	    		console.log("inside blank");
		    		selectVar+='<div title="'+s+'" class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+s+'"><label></label>Blank</div>';
						
		  	    	  }
		    	  else { 	  	    	
		  	    	  	
		    		selectVar+='<div title="'+s+'" class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+s+'"><label></label>'+s+'</div>';
					
		  	    	  }  
				  
				 
		        } ); 
		       jQuery("#col"+i).append(selectVar);
		               
		    });  */ 
    
    
    jQuery("#lmsTable thead th.filterHead").each(function(i){
    	   var selectVar="";
    	  sortVal = table.column( i ).data().unique().sort(function(a,b){
    	    console.log(table.column( i ).data())
    	                var alc = a.toLowerCase(), blc = b.toLowerCase();
    	    return alc > blc ? 1 : alc < blc ? -1 : 0;
    	});
    	      sortVal.each( function ( d, j ) {
    	    	  
    	    	  var s = d.replace(/(<([^>]+)>)/ig,"").trim();
    	    	  
                  if(s == '')
                  {
                   selectVar+='<div title="'+s+'" class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+s+'"><label></label>BLANK</div>';
                  }
                  else
                  {
    	          selectVar+='<div title="'+s+'" class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+s+'"><label></label>'+s+'</div>';
    	          }
    	                                
    	        } ); 
    	       jQuery("#col"+i).append(selectVar);
    	               
    	    });

    
    /*jQuery(".ok").click(function(){
		   var chkId = '';
		jQuery(this).closest('.dropdown').find('input:checkbox:checked').each(function() {
       
          chkId += jQuery(this).val() + "|";
          console.log('checkbox hitted');
        });
        chkId = chkId.slice(0,-1);
        console.log('checkId value is:'+chkId );
        var thiscol = jQuery(this).closest('.dropdown').find('.column_number').text();
        console.log('column hit'+ thiscol);
       
        table.column( thiscol )
                    .search(chkId, true, false )
                    .draw();
          
    });*/
    
    
    jQuery(".ok").click(function(){
        var chkId = '';
        jQuery(this).closest('.dropdown').find('input:checkbox:checked').each(function() {
      	  chkId += "^"+jQuery(this).val() + "$|";
        });
var thiscol = jQuery(this).parents('th').index();
if(chkId){
chkId = chkId.substring(0,chkId.length-1)
        table.column( thiscol ).search(chkId, true, false ).draw();
                 }
        else{
        table.column( thiscol).search(chkId, true, false ).draw();
                 }
       }); 

 // Clear filter starts
    jQuery('.clear-filter').click(function(event) {

           jQuery(this).next(".list-item").find('input[type="checkbox"]').each(function(){
           this.checked = false;
           table.column(jQuery(this).parents('th').index()).search("", true, false ).draw();
           jQuery('.dropdown').addClass('hide');
           jQuery('.dropdown').removeClass('show');
       })
    });
    // Clear filter ends
	
/* datatable ends */
      
      
      jQuery(document).on("click",function() {
  		
    		jQuery('.dropdown').addClass('hide');
    		jQuery('.dropdown').removeClass('show');
    		})
    			
    		
    		jQuery('#lmsTable thead th.filterHead span,.dropdown').click(function(e){
    				e.stopPropagation();
    				
    				});

 jQuery(".filterHead span").click(function(){ 	
	
	if(jQuery(this).next('.dropdown').hasClass('show')) {
		jQuery(this).next('.dropdown').removeClass('show').addClass('hide');
	} 
	else {
		jQuery(".dropdown").removeClass('show').addClass('hide');
		jQuery(this).next('.dropdown').removeClass('hide').addClass('show');
	}
	 
 });

jQuery('.cancel,.ok').on('click' ,function(){
	jQuery(this).parents(".dropdown").removeClass('show').addClass('hide');

});

/*jQuery('.cancel').on('click' ,function(){	
	jQuery(this).closest('.dropdown').find('input:checkbox').each(function() { //loop through each checkbox
	this.checked = false; //deselect all checkboxes with class "checkbox1"  
	var chkId = '';
	jQuery(this).closest('.dropdown').find('input:checkbox:checked').each(function() {
	  chkId += jQuery(this).val() + "|";
	});
	chkId = chkId.slice(0,-1);
	
	var thiscol = jQuery(this).closest('.dropdown').find('.column_number').text();
	
	var escapeRegex = false;
	table.column( thiscol )
	            .search(chkId, true, false )
	            .draw();        
	    }); 
});*/

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
	 
	 jQuery('.dataTables_length').insertAfter('.dataTables_paginate');
	 jQuery('#lmsTable_info').insertAfter('#lmsTable_length');
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
	
	 jQuery('#lmsTable_wrapper').addClass('dt-wrapper');
});


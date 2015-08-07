var table;
var tableId;

function changeTableObject(){
 jQuery('.tprmTable').each(function(){
  if(jQuery(this).is(":visible")){
    table = jQuery('#'+jQuery(this).attr('id')).DataTable();
   if(!jQuery(this).next().hasClass('dataTables_length')){
      jQuery('.dataTables_length').insertAfter(jQuery(this));
    }
  }
});
}


// JavaScript Document
jQuery(document).ready(function () {
/* datatable */


jQuery('.tprmTable').each(function(){
tableId = jQuery(this).attr('id');
tableId = jQuery('#'+jQuery(this).attr('id')).DataTable({
  "lengthMenu": [[10, 15, 20], [10, 15, 20]],
  //"iDisplayLength": 5,
  "oLanguage": {
  "sSearch": " ",
  "sLengthMenu": "view _MENU_ items/page",
  "sInfo": " ",
  "sInfoEmpty": " "
  },
  "pagingType": "full_numbers"
  });
});

	  
  jQuery('.chk-box.sorting_1').hide();
  jQuery('.chk-box.sorting_1,th.chk-box').hide();

/* sortingStarts */  
	//table.find("th").off("click.DT");
jQuery("th").off("click");



jQuery('.tprmTable').each(function(){
  if(jQuery(this).is(":visible")){
    table = jQuery('#'+jQuery(this).attr('id')).DataTable();
  }
});
jQuery('.atoz').click(function(i,val) {
    table.order([jQuery(this).parents('th').index(),'asc']).draw();
});
jQuery('.ztoa').click(function() {
   table.order([jQuery(this).parents('th').index(),'desc']).draw();
});


 /* sorting ends/
 /* search starts*/
    jQuery(".search-box").keyup(function() {
       table.search(this.value,false,false,true ).draw();
	});
/* search ends */


	/* filter starts */
jQuery(".tprmTable").each(function(i){
	var tableObject = jQuery('#'+jQuery(this).attr('id')).DataTable();
  jQuery(this).find("th.filterHead").each(function(i){
   var selectVar="";
      tableObject.column(i).data().unique().sort().each( function ( d, j ) {
          selectVar+='<div class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+d+'">'+d+'</div>';
        }); 
       jQuery(this).find("#col"+i).append(selectVar);      
    }); 
});


    jQuery(".dropdown input[type='checkbox']").click(function(){
       var chkId = '';
        jQuery(this).parents('.list-item').find('input:checked').each(function(){
           chkId += jQuery(this).val() + "|";
        });
        chkId = chkId.slice(0,-1);
        var escapeRegex = false;
        table.column(jQuery(this).parents('th').index()).search(chkId, true, false ).draw();
    });

	// Clear filter functionality

	    jQuery('.clear-filter').click(function(event) {  //on click 
        jQuery(this).next('.list-item').find('div').each(function(){
        jQuery(this).find("input[type='checkbox']").prop('checked',false);
        table.column(jQuery(this).parents('th').index()).search('', true,false).draw();  				
           });        
    });
  
	
/* datatable ends */

jQuery(".tprmTable th span").click(function(){
    if(jQuery(this).next(".dropdown").hasClass("show")){
    jQuery(this).next(".dropdown").addClass("hide");
    jQuery(this).next(".dropdown").removeClass("show");   
  }

  else {
  jQuery(this).next(".dropdown").addClass("show");
  jQuery(this).next(".dropdown").removeClass("hide");
  }
});



jQuery('.cancel,.ok').on('click' ,function(){
	jQuery(this).parents(".dropdown").removeClass('show').addClass('hide');
});

    jQuery('#selecctall').click(function(event) {  //on click 
        if(this.checked) { // check select status
            jQuery('.checkbox1').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"
					jQuery(".link-questionnire").css("background","#11b1aa");
            });
        }else{
            jQuery('.checkbox1').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"  
				jQuery(".link-questionnire").css("background","#CCC");				
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


jQuery(".questPopup .submitQ").click(function(){
		jQuery(".quest-tabs .active.tab").css("z-index","0");
		jQuery(".questPopup").css("display","none");
		jQuery(".popupBg").css("display","none");
});
//Custom DataTable UI Change
	
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


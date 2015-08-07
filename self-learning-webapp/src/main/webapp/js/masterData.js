// JavaScript Document
    jQuery(document).ready(function(){
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
		
		})		
	jQuery('.menuTog').click(function(){
		jQuery('.top_menu ul').toggle();
		})
	function hide_popup() {
		jQuery('.admin_popup').hide();		
		jQuery('.popupBg').hide();
	}	
	function hide_popup2() {		
		jQuery('.add_admin_popup').hide();
		jQuery('.popupBg').hide();
	}	
	jQuery('.edit_admin').on('click', function(){
		var nam = jQuery(this).closest('td').prev('td').text();
		var typeId=jQuery(this).closest('td').prev('td').find('input').val();
		jQuery('.admin_popup .admin_name').val(nam);
		jQuery('.admin_popup .admin_Id').val(typeId);
		var pop_id = jQuery(this).attr('class');
		jQuery('#'+pop_id).show();		
		jQuery('.popupBg').show();					
		
	});
	jQuery('.edit_master').on('click', function(){
		var code = jQuery(this).closest('td').prev('td').prev('td').text();
		var type = jQuery(this).closest('td').prev('td').text();
		var typeId=jQuery(this).closest('td').prev('td').prev('td').find('input').val();
		alert(code+'-'+type+'-'+typeId);
		jQuery('.admin_popup .admin_code').val(code);
		jQuery('.admin_popup .admin_Id').val(typeId);
		jQuery('.admin_popup .admin_name').val(type);
		var pop_id = jQuery(this).attr('class');
		alert(pop_id);
		jQuery('#'+pop_id).show();		
		jQuery('.popupBg').show();					
		
	});
	
	jQuery('.edit_vendor').on('click', function(){
		
		alert("Came to Edit Vendor");
		var name = jQuery(this).closest('td').prev('td').prev('td').text();
		var type = jQuery(this).closest('td').prev('td').text();
		var typeId=jQuery(this).closest('td').prev('td').prev('td').find('input').val();
		alert(name+'-'+type+'-'+typeId);
		jQuery('.admin_popup .vendor_name').val(name);
		jQuery('.admin_popup .admin_Id').val(typeId);
		jQuery('.admin_popup .vendor_type').val(type);
		var pop_id = jQuery(this).attr('class');
		alert(pop_id);
		jQuery('#'+pop_id).show();		
		jQuery('.popupBg').show();					
		
	});
	

	jQuery('#add_admin').on('click', function(){
		var pop_id = jQuery(this).attr('id');
		jQuery('.'+pop_id).show();		
		jQuery('.popupBg').show();					
		
	});
	jQuery('.submit_admin_edit').on('click', function(){									
		hide_popup();
		document.editForm.submit;
	});
jQuery('.submit_admin_add').on('click', function(){									
		hide_popup2();
		document.addForm.submit;
	});
	jQuery('.cancel_admin, .closeBtn').on('click', function(e){
		hide_popup();
		hide_popup2();
		 e.stopPropagation();
		 e.preventDefault();
	});
	

	
  });


jQuery(window).load(function() {
   
   // Page Preloader
   jQuery('#status').fadeOut();
   jQuery('#preloader').delay(350).fadeOut(function(){
      jQuery('body').delay(350).css({'overflow-y':'visible'});
   });
});

jQuery(document).ready(function() {
	
	
	//<i> tag remove form LeftPanel fa.fa-caret-right
	var arrow = jQuery(".leftPanelLinks").find('i.fa-caret-right');
	arrow.css('display','none');
    //console.log(arrow+"Cleared..<i>fa-caret-right tags...");
    
    
   
   
    
	
	//Rahul Search form display Clear when clicked
	
	
	jQuery(document).on('focus','form.searchform input[name="keyword"]',function(){
		console.log("entered...");
		jQuery(this).removeAttr('placeholder');
		
	});
	
	jQuery(document).on('blur','form.searchform input[name="keyword"]',function(){
		console.log("left...");
		var textContained = jQuery(this).attr('placeholder');
		console.log(textContained);
		if(textContained == ''|| textContained == undefined){
			jQuery(this).attr('placeholder','Search here...');
		}
	});
	
	
   
   // Toggle Left Menu
   jQuery('.leftpanel .nav-parent > a').on('click', function() {
      
      var parent = jQuery(this).parent();
      var sub = parent.find('> ul');
      
      // Dropdown works only when leftpanel is not collapsed
      if(!jQuery('body').hasClass('leftpanel-collapsed')) {
         if(sub.is(':visible')) {
            sub.slideUp(200, function(){
               parent.removeClass('nav-active');
               jQuery('.mainpanel').css({height: ''});
               adjustmainpanelheight();
            });
         } else {
            closeVisibleSubMenu();
            parent.addClass('nav-active');
            sub.slideDown(200, function(){
               adjustmainpanelheight();
            });
         }
      }
      return false;
   });
   
   function closeVisibleSubMenu() {
      jQuery('.leftpanel .nav-parent').each(function() {
         var t = jQuery(this);
         if(t.hasClass('nav-active')) {
            t.find('> ul').slideUp(200, function(){
               t.removeClass('nav-active');
            });
         }
      });
   }
   
   function adjustmainpanelheight() {
	      // Adjust mainpanel height
	      var docHeight = jQuery(document).height();
	      var screenHeight = jQuery(window).height(); 
	     // jQuery('.leftpanel').css('height' , docHeight);
	        mainHeight = jQuery('.mainpanel').css('min-height',docHeight);

	           if(mainHeight < docHeight  ) {
	                jQuery('.mainpanel').css('height' , docHeight); 
	           }
	           if(mainHeight < screenHeight) { 
	        	   jQuery('.mainpanel').css('height' , screenHeight); }
	           }
	          adjustmainpanelheight();
	 jQuery('*').on('click' , function(){
	      adjustmainpanelheight;
	 });

   
   // Tooltip
   jQuery('.tooltips').tooltip({ container: 'body'});
   
   // Popover
  // jQuery('.popovers').popover();
   
   // Close Button in Panels
   jQuery('.panel .panel-close').click(function(){
      jQuery(this).closest('.panel').fadeOut(200);
      return false;
   });
   
   // Form Toggles
  // jQuery('.toggle').toggles({on: true});
   
 //  jQuery('.toggle-chat1').toggles({on: false});
   
   /*Sparkline
   jQuery('#sidebar-chart').sparkline([4,3,3,1,4,3,2,2,3,10,9,6], {
	  type: 'bar', 
	  height:'30px',
      barColor: '#428BCA'
   });
   
   jQuery('#sidebar-chart2').sparkline([1,3,4,5,4,10,8,5,7,6,9,3], {
	  type: 'bar', 
	  height:'30px',
      barColor: '#D9534F'
   });
   
   jQuery('#sidebar-chart3').sparkline([5,9,3,8,4,10,8,5,7,6,9,3], {
	  type: 'bar', 
	  height:'30px',
      barColor: '#1CAF9A'
   });
   
   jQuery('#sidebar-chart4').sparkline([4,3,3,1,4,3,2,2,3,10,9,6], {
	  type: 'bar', 
	  height:'30px',
      barColor: '#428BCA'
   });
   
   jQuery('#sidebar-chart5').sparkline([1,3,4,5,4,10,8,5,7,6,9,3], {
	  type: 'bar', 
	  height:'30px',
      barColor: '#F0AD4E'
   });
   
   */
   // Minimize Button in Panels
   jQuery('.minimize').click(function(){
      var t = jQuery(this);
      var p = t.closest('.panel');
      if(!jQuery(this).hasClass('maximize')) {
         p.find('.panel-body, .panel-footer').slideUp(200);
         t.addClass('maximize');
         t.html('&plus;');
      } else {
         p.find('.panel-body, .panel-footer').slideDown(200);
         t.removeClass('maximize');
         t.html('&minus;');
      }
      return false;
   });
   
   
   // Add class everytime a mouse pointer hover over it
   jQuery('.nav-bracket > li').hover(function(){
      jQuery(this).addClass('nav-hover');
   }, function(){
      jQuery(this).removeClass('nav-hover');
   });
   
   
   // Menu Toggle
   jQuery('.menutoggle').click(function(){
      
      var body = jQuery('body');
      var bodypos = body.css('position');
      
      if(bodypos != 'relative') {
         
         if(!body.hasClass('leftpanel-collapsed')) {
            body.addClass('leftpanel-collapsed');
            jQuery('.nav-bracket ul').attr('style','');
            
            jQuery(this).addClass('menu-collapsed');
            
         } else {
            body.removeClass('leftpanel-collapsed chat-view');
            jQuery('.nav-bracket li.active ul').css({display: 'block'});
            
            jQuery(this).removeClass('menu-collapsed');
            
         }
      } else {
         
         if(body.hasClass('leftpanel-show'))
            body.removeClass('leftpanel-show');
         else
            body.addClass('leftpanel-show');
         
         adjustmainpanelheight();         
      }

   });
   
   // Chat View
   jQuery('#chatview').click(function(){
      
      var body = jQuery('body');
      var bodypos = body.css('position');
      
      if(bodypos != 'relative') {
         
         if(!body.hasClass('chat-view')) {
            body.addClass('leftpanel-collapsed chat-view');
            jQuery('.nav-bracket ul').attr('style','');
            
         } else {
            
            body.removeClass('chat-view');
            
            if(!jQuery('.menutoggle').hasClass('menu-collapsed')) {
               jQuery('body').removeClass('leftpanel-collapsed');
               jQuery('.nav-bracket li.active ul').css({display: 'block'});
            } else {
               
            }
         }
         
      } else {
         
         if(!body.hasClass('chat-relative-view')) {
            
            body.addClass('chat-relative-view');
            body.css({left: ''});
         
         } else {
            body.removeClass('chat-relative-view');   
         }
      }
      
   });
   
   reposition_topnav();
   reposition_searchform();
   
   jQuery(window).resize(function(){
      
      if(jQuery('body').css('position') == 'relative') {

         jQuery('body').removeClass('leftpanel-collapsed chat-view');
         
      } else {
         
         jQuery('body').removeClass('chat-relative-view');         
         jQuery('body').css({left: '', marginRight: ''});
      }
      
      if(jQuery('.leftpanel .searchform').length == 0)
         reposition_searchform();
      reposition_topnav();
      
   });
   
   
   
   /* This function will reposition search form to the left panel when viewed
    * in screens smaller than 767px and will return to top when viewed higher
    * than 767px
    */ 
   function reposition_searchform() {
      if(jQuery('.searchform').css('position') == 'relative') {
         jQuery('.searchform').insertBefore('.leftpanelinner .userlogged');
      } else {
         jQuery('.searchform').insertBefore('.header-right');
      }
   }
   
   

   /* This function allows top navigation menu to move to left navigation menu
    * when viewed in screens lower than 1024px and will move it back when viewed
    * higher than 1024px
    */
   function reposition_topnav() {
      if(jQuery('.nav-horizontal').length > 0) {
         
         // top navigation move to left nav
         // .nav-horizontal will set position to relative when viewed in screen below 1024
         if(jQuery('.nav-horizontal').css('position') == 'relative') {
                                  
            if(jQuery('.leftpanel .nav-bracket').length == 2) {
               jQuery('.nav-horizontal').insertAfter('.nav-bracket:eq(1)');
            } else {
               // only add to bottom if .nav-horizontal is not yet in the left panel
               if(jQuery('.leftpanel .nav-horizontal').length == 0)
                  jQuery('.nav-horizontal').appendTo('.leftpanelinner');
            }
            
            jQuery('.nav-horizontal').css({display: 'block'})
                                  .addClass('nav-pills nav-stacked nav-bracket');
            
            jQuery('.nav-horizontal .children').removeClass('dropdown-menu');
            jQuery('.nav-horizontal > li').each(function() { 
               
               jQuery(this).removeClass('open');
               jQuery(this).find('a').removeAttr('class');
               jQuery(this).find('a').removeAttr('data-toggle');
               
            });
            
            if(jQuery('.nav-horizontal li:last-child').has('form')) {
               jQuery('.nav-horizontal li:last-child form').addClass('searchform').appendTo('.topnav');
               jQuery('.nav-horizontal li:last-child').hide();
            }
         
         } else {
            // move nav only when .nav-horizontal is currently from leftpanel
            // that is viewed from screen size above 1024
            if(jQuery('.leftpanel .nav-horizontal').length > 0) {
               
               jQuery('.nav-horizontal').removeClass('nav-pills nav-stacked nav-bracket')
                                        .appendTo('.topnav');
               jQuery('.nav-horizontal .children').addClass('dropdown-menu').removeAttr('style');
               jQuery('.nav-horizontal li:last-child').show();
               jQuery('.searchform').removeClass('searchform').appendTo('.nav-horizontal li:last-child .dropdown-menu');
               jQuery('.nav-horizontal > li > a').each(function() {
                  
                  jQuery(this).parent().removeClass('nav-active');
                  
                  if(jQuery(this).parent().find('.dropdown-menu').length > 0) {
                     jQuery(this).attr('class','dropdown-toggle');
                     jQuery(this).attr('data-toggle','dropdown');  
                  }
                  
               });              
            }
            
         }
         
      }
   }
   
   
   // Sticky Header
   if(jQuery.cookie('sticky-header'))
      jQuery('body').addClass('stickyheader');
      
   // Sticky Left Panel
   if(jQuery.cookie('sticky-leftpanel')) {
      jQuery('body').addClass('stickyheader');
      jQuery('.leftpanel').addClass('sticky-leftpanel');
   }
   
   // Left Panel Collapsed
   if(jQuery.cookie('leftpanel-collapsed')) {
      jQuery('body').addClass('leftpanel-collapsed');
      jQuery('.menutoggle').addClass('menu-collapsed');
   }
   
   // Changing Skin
   var c = jQuery.cookie('change-skin');
   if(c) {
      jQuery('head').append('<link id="skinswitch" rel="stylesheet" href="css/style.'+c+'.css" />');
   }
   
   // Changing Font
   var fnt = jQuery.cookie('change-font');
   if(fnt) {
      jQuery('head').append('<link id="fontswitch" rel="stylesheet" href="css/font.'+fnt+'.css" />');
   }
   
   // Check if leftpanel is collapsed
   if(jQuery('body').hasClass('leftpanel-collapsed'))
      jQuery('.nav-bracket .children').css({display: ''});
      
     
   // Handles form inside of dropdown 
   jQuery('.dropdown-menu').find('form').click(function (e) {
      e.stopPropagation();
    });
   
   // Third party orgnisation name No Contract section hide and show

	jQuery("#checkboxDefault").on("click", function(){
		if(jQuery(this).is(":checked")){
		   jQuery("#showRadio").show();
		}else{
			jQuery("#showRadio").hide();
		}	
	});
      

	// start 22-09-2014 by Ravi
    jQuery(".edit_brc").on("click", function(){
                    var pos = jQuery(this).closest("tr").position();
                    jQuery(this).next().css({
                                    left : pos.left,
                                    top : pos.top
                    });
                    jQuery(this).next().slideDown();
    });
      
    jQuery(".brc_cancel").on("click", function(){
                    jQuery(this).closest("div.brc_edit_wraper, div.create_new_brc_dropdown").slideUp();
    });
    
 
   
    var select_country = jQuery(".brc_select_country", ".brc_multi_choice_country");
    
    
    select_country.on("click", function(){
                    jQuery(this).parents(".brc_multi_choice_country").find(".searchContainer").show();
                    jQuery(this).parents(".brc_multi_choice_country").find(".searchContainer").val("");
                    jQuery(this).parents('.brc_multi_choice_country').find('.brc_country_dropdown').show();
                    
    });
    
    
/*    select_country.on("click", function(){
        jQuery(this).next().slideToggle('fast', function(){
                        if(jQuery(this).is(":visible")){
                                        jQuery(this).prev().css({"background-position" : "100% -25px"});
                        }else{
                                        jQuery(this).prev().css({"background-position" : "100% 0"});
                        }
        });
    });
 */
    
    
   /* jQuery(".delete_brc").on("click", function(){
                    jQuery(this).closest("tr").fadeOut(function(){
                                    jQuery(this).remove();
                    });
    });
      */
    jQuery(".brc_clear").on("click", function(){
                    jQuery(this).closest('ul.brc_edit_ul_wrapper').find(':input').each(function(){
                                    switch(this.type){
                                                    case 'text':
                                                                    jQuery(this).val('');
                                                                    break;
                                                    case 'checkbox':
                                                                    this.checked = false;
                                    }
                    });
    });
                    
    jQuery('.create_new_brc').click(function(){
                    jQuery(".create_new_brc_dropdown").slideDown();
                    jQuery('html, body').animate({
                                    scrollTop: jQuery(jQuery(this).attr('data') ).offset().top
                    }, 500);
                    return false;
    });
    
    jQuery(document).on("click", function(e){
                    if(jQuery(e.target).closest(".brc_multi_choice_country").get(0) == null)
                    jQuery(".brc_country_dropdown").hide();
               
    });
	
    
    jQuery(document).on("click",function(e){
    	var container = jQuery(".brc_multi_choice_country");
    	//console.log("my log");
    	if (!container.is(e.target) && container.has(e.target).length === 0){
    		//console.log("if log");
    		jQuery(".searchContainer").hide();
    	}
    	
    });
    
    
    
    
    
    
// Start 31-10-2014 for Document Management System(Dms)
	
	jQuery(document).on("click", ".dms_delete_select_all_input", function(){
		jQuery(this).is(":checked") ? jQuery("input", ".dms_delete_files").prop("checked", true) : jQuery("input", ".dms_delete_files").prop("checked", false);
	});
	
	/*jQuery(document).on("click", ".dms_delete_popup_btn", function(){
		jQuery("div.dms_delete_popup_confirmation").show();
		jQuery("div.dms_delete_popup").hide();
	});*/
	
		
	jQuery(".dms_close_popup, .dms_cancel_popup_btn").on("click", function(){
		jQuery(this).closest("div.dms_delete_popup, div.dms_delete_popup_confirmation, div.dms_upload_popup").hide();
		jQuery("div.dms_overlay").hide();
	});

	
	/*jQuery(".brc_close_popup, .brc_cancel_popup_btn").on("click", function(){
		jQuery(this).closest("div.brc_delete_popup_confirmation").hide();
		jQuery("div.dms_overlay").hide();
	});*/

	
	//for tooltip by Ravi
	jQuery(".allTooltip").on("mouseenter", function(){
		jQuery(this).css({"position":"relative"});
		var getTooltipValue = jQuery(this).attr("data-tooltip");
		jQuery(this).html("<div class='toolTipContainer'><b></b>" + getTooltipValue + "</div>");
	}).on("mouseleave", function(){
		jQuery(this).find(".toolTipContainer").hide();
		
	});
	
	//for new dropdown by Ravi
	var elm = jQuery(".customSelectNew");
	elm.wrap("<div class='customSelectWrapper'></div>");
	elm.after("<div class='customSelectClick'></div>");
	
	elm.each(function(){
		jQuery(this).next().html(jQuery(this).find('option:selected').text());
	});

	jQuery('body').on("change", ".customSelectNew", function(){
		jQuery(this).next().html(jQuery(this).find('option:selected').text());
	});

	var maxLength = 30;
	jQuery('body .customSelectNew > option').text(function(i, text) {
		if (text.length > maxLength) {
			return text.substr(0, maxLength) + '...';  
		}
	});
	
});
// JavaScript Document
	var jq=$.noConflict();	
    jq(document).ready(function(){
		jq('.um-form').on('click', '.rem_list', function(e){
		 	//e.stopImmediatePropagation();
            var jqthis = jq(this);
            jqthis.parents('.link_to').remove();
		 });
		jq('.row.addressDetails').on('click', '.rem_clon', function(e){
		 	e.stopImmediatePropagation();
            var jqthis = jq(this);
            jqthis.parents('.col-md-4').remove();
		 });
		   jq('.row').on('click', '.addElement, .removeElement', function(e){
            e.stopPropagation();
            var jqthis = jq(this);
			var el = jqthis.closest('.leftColFields');
		  	var labelVal = el.children('label').html();
            if(jqthis.hasClass('addElement')){						
				el.clone().find('select').attr('name', labelVal).end().find('input').attr('name', labelVal).end().find('.addElement').hide().end().find('.removeElement').removeClass('hidden').end().insertAfter(el);			
            }
            else {
            el.remove();
          }
        });
		   jq('.um-form').on('click', '.add_clon', function(e){
            e.stopPropagation();
            var jqthis = jq(this);
			var el = jqthis.siblings('.addressDetails').find('.col-md-4:first');
			var labelVal = el.find('label').html();
            if(jqthis.hasClass('add_clon')){						
			el.clone().find('select').attr('name', labelVal).end().find('input').attr('name', labelVal).end().insertAfter(el);			
            
			}
            else {
            el.remove();
          }
        });
		   jq('.um-form').on('click', '.list_clon', function(e){
            e.stopPropagation();
            var jqthis = jq(this);
			var el = jqthis.siblings('.link_to_parent').find('.link_to:first');
		  	var labelVal = el.find('label').html();
            if(jqthis.hasClass('list_clon')){
			el.clone().find('select').attr('name', labelVal).end().find('input').attr('name', labelVal).end().insertAfter(el);			
            }
            else {
            el.remove();
          }
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
		var placeholderVal = jq(".text_box").attr('placeholder');
	jq(".text_box").focus(function() {	
	this.placeholder = '';
    })
    .blur(function() {
        if (this.value === '') {
            this.placeholder = placeholderVal;
        }
    });
	jq('.user_initial').each(function(){
		var initials = jq(this).text();
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
		jq(this).parents().prev('.user_prof').html(newVal);
		}
		else{
		var newValue = newVal.substring(0,2);
		jq(this).parents().prev('.user_prof').html(newValue);
		}
		});		
	jq('.tog_btn').click(function(){
		jq(this).toggleClass('tog_clr');
		if(jq(this).hasClass('tog_clr'))
		{
		jq(this).attr('title','Not a Key Principal');
		}
		else
		{
		jq(this).attr('title','Key Principal');	
		}
		});
	jq('.IndividualAddress  .chk_address').click(function(){
		if(jq(this).is(":checked"))
		{
		jq(this).parents('.customCheckBox').attr('title','Unselect address')
		}else
		{
		jq(this).parents('.customCheckBox').attr('title','Select address')
		}
		})	
	jq( ".datepicker1" ).datepicker({
		changeMonth: true,
		changeYear: true,
		numberOfMonths: 1,
		showOn: "both",				
		showAnim: "slideDown",
		dateFormat: "dd/mm/yy",
		});

	//Popup 	
	jq('.createQuest, .questTitleEdit, .gen_key, .contract_upload').on('click', function(){
		jq('.questPopup').show();
		jq('.popupBg').show();
		//customSelect();
	});
	jq('.closePopup, .closeBtn').on('click', function(){
		jq('.questPopup').hide();
		jq('.popupBg').hide();
	});
	/* file upload  script starts */
	
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
	
	/* file upload  script ends  */

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
	var placeholderVal = jq(".text_box").attr('placeholder');
	jq(".text_box").focus(function() {	
	this.placeholder = '';
    })
    .blur(function() {
        if (this.value === '') {
            this.placeholder = placeholderVal;
        }
    });
  });

  
 /* remove dowload */
	 jq('.remve').click(function(){
		jq(this).parent('span').remove();
		})


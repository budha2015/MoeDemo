
	jq('.addressDiv').eq(0).find('.removeAdd').hide().end().find('.objectSelect').val('1').end().removeClass('hidden');
	jq('.addAdd').on('click', function(){
	   var i = jq('.indexInput').val();
	   var index = parseInt(i); 
	   jq('.addressContainer').children('.hidden').eq(0).find('.objectSelect').val("1").end().removeClass('hidden');
	   jq('.indexInput').val(++index);
	});
	
	jq('.removeAdd').on('click', function() {
	     jq(this).closest('.addressDiv').find('.objectSelect').val('0').end().addClass('hidden');	
	});
	
	
	(function() {
		 
		jq('.addEmailContainer').find('.row').eq(0).removeClass('hidden').find('.addPhone').removeClass('hidden').end().find('.removePhone').addClass('hidden');
		jq('.addEmailContainer').on('click', '.addPhone', function() {
		   var jqthis = jq(this).parents('.addEmailContainer');
		   //i = jqthis.children('.hiddenEmailPhone').val();
		   //jqthis.children('.row').eq(index).show();
		   jqthis.children('.hidden').eq(0).find('.phoneEl').val("1").end().removeClass('hidden');
		   //jqthis.children('.hiddenEmailPhone').val(++index);
		   //alert(jq(this).closest('.addressDiv').find('.objectSelect').val());
		});
		
		jq('.addEmailContainer').on('click', '.removePhone', function(){
			jq(this).closest('.row').find('.phoneEl').val("0").end().find('input').val('').end().addClass('hidden');
		});
		
	  	 jq('body').find('.1').each(function() {
	  		 jq(this).closest('.row').removeClass('hidden');
	  	 });
	  	 
	})();
	
	(function() {
		jq('.addPhoneContainer').find('.row').eq(0).removeClass('hidden').find('.addPhone').removeClass('hidden').end().find('.removePhone').addClass('hidden');
		jq('.addPhoneContainer').on('click', '.addPhone', function() {
		   var jqthis = jq(this).parents('.addPhoneContainer');
		  // i = jqthis.children('.hiddenEmailPhone').val(),
		   //index = parseInt(i);
		  // jqthis.children('.row').eq(index).show();
		  jqthis.children('.hidden').eq(0).find('.phoneEl').val("1").end().removeClass('hidden');
		   //jqthis.children('.hiddenEmailPhone').val(++index);
		   
		});
		jq('.addPhoneContainer').on('click', '.removePhone', function(){
   			//jq(this).closest('.row').find('.phoneEl').val("0").end().hide();
   			jq(this).closest('.row').find('.phoneEl').val("0").end().find('input').val('').end().addClass('hidden');
   			
   			
   		});
		
		jq('.addFaxContainer').find('.row').eq(0).removeClass('hidden').find('.addPhone').removeClass('hidden').end().find('.removePhone').addClass('hidden');
   		jq('.addFaxContainer').on('click', '.addPhone', function() {
   		   var jqthis = jq(this).parents('.addFaxContainer');
   		   //i = jqthis.children('.hiddenFax').val(),
   		   //index = parseInt(i);
   		  // jqthis.children('.row').eq(index).show();
   		  jqthis.children('.hidden').eq(0).find('.phoneEl').val("1").end().removeClass('hidden');
   		   //jqthis.children('.hiddenFax').val(++index);
   		   
   		});
   		jq('.addFaxContainer').on('click', '.removePhone', function(){
   		//	jq(this).closest('.row').find('.phoneEl').val("0").end().hide();
   			jq(this).closest('.row').find('.phoneEl').val("0").end().addClass('hidden');
   		});
		
		jq('.addRoleContainer').find('.row').eq(0).removeClass('hidden').find('.addPhone').removeClass('hidden').end().find('.removePhone').addClass('hidden');
		jq('.addRoleContainer').on('click', '.addPhone', function() {
		   var jqthis = jq(this).parents('.addRoleContainer');
		   //i = jqthis.children('.hiddenEmailPhone').val(),
		   //index = parseInt(i);
		   //jqthis.children('.row').eq(index).show();
		   jqthis.children('.hidden').eq(0).find('.phoneEl').val("1").end().removeClass('hidden');
		   //jqthis.children('.hiddenEmailPhone').val(++index);
		   
		});
		
		jq('.addRoleContainer').on('click', '.removePhone', function(){
			//jq(this).closest('.row').hide();
			jq(this).closest('.row').find('.phoneEl').val("0").end().addClass('hidden');
		});
		
	  	 jq('body').find('.1').each(function() {
	  		 jq(this).closest('.row').removeClass('hidden');
	  	 });
	})();
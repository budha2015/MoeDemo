	function getAjaxReceipt() {		
		$('#searchUser').val('');
		$("#searchUser").autocomplete({
			source : function(request, response) {
				$.ajax({
					url : "searchUser",
					type : "GET",
					data : {
						term : request.term
					},
					dataType : "json",
					success : function(data) {
						response(data);
					}
				});
			},
			select : function(a, b) {
				var email = populateEmail(b.item.value);
				var email2 = email.replace("<", "");
				var finalEmailId = email2.replace(">", "");
				document.ToForm.to.value = finalEmailId;
			}
		});
	}

	function populateEmail(reslt) {
		var outputstring = reslt;
		var tarray = [];
		tarray = outputstring.split(" ");
		
		var email = tarray[2];
		var email2 = email.replace("<", "");
		var finalEmailId = email2.replace(">", "");
		return finalEmailId;
	}

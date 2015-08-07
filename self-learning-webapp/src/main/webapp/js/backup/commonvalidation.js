/*function closewindow() {

	var strconfirm = confirm('Are you sure you want to logout?');
	if (strconfirm == true) {

		window.location = "partnerintegrity.jsp";
		return true;
	} else {
				
		return false;
	}
}*/

function logout() {

	document.getElementById('myform').submit();
}

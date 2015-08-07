jQuery(document).ready(function() {
							/* datatable */
							var mydata = 2;
							var table = jQuery('#myTable').DataTable({
												"pagingType" : "full_numbers",
												"drawCallback" : function(
														settings) {
													var oTable = this.api();
													var info = oTable.page
															.info();
													if(info.pages == 0) {
                                                           info.pages == 1;
													}
													jQuery(
															'.dataTables_paginate span')
															.html(
																	'Page '
																			+ '<input type="text" id="pageTxt" value="'
																			+ (info.page + 1)
																			+ '" > of '
																			+ info.pages);
												},
												"language" : {
													"lengthMenu" : "view _MENU_  items/page"
												}
											});
							/* Pagination */
							
							//Custom DataTable UI Change
							jQuery('.dataTables_length').insertAfter('#myTable');
							//	jQuery('.dataTables_filter').find('label').empty();
							jQuery('.dataTable').wrap(
									'<div class="dataTableContainer"></div>');
							//For Empty td values

							jQuery(".container").keypress(
									"#pageTxt",
									function(e) {
										if (e.keyCode == '13') {
											e.stopPropagation();
											e.preventDefault();
											var myPage = parseInt(jQuery(
													"#pageTxt").val());
											myPage = myPage - 1;
											table.page(myPage).draw(false);
										}
									});
							/* sortingStarts */

							jQuery("th").off("click");
							
							jQuery('.head .atoz').click(function() {
								var currIndex = jQuery('.atoz').index(this);
								console.log("curr1: " + currIndex);
								table.order([ currIndex+1 , 'asc' ]).draw();
							});
							
							jQuery('.head .ztoa').click(function() {
								var currIndex = jQuery('.ztoa').index(this);
								console.log("curr2: " + currIndex);
								table.order([ currIndex+1, 'desc' ]).draw();
							});
							
							
							
							/*jQuery('.qb_questionType .atoz').click(function() {
								table.order([ 2, 'asc' ]).draw();
							});
							jQuery('.qb_questionType .ztoa').click(function() {
								table.order([ 2, 'desc' ]).draw();
							});
							jQuery('.qb_category .atoz').click(function() {
								table.order([ 3, 'asc' ]).draw();
							});
							jQuery('.qb_category .ztoa').click(function() {
								table.order([ 3, 'desc' ]).draw();
							});
							jQuery('.qb_template .atoz').click(function() {
								table.order([ 4, 'asc' ]).draw();
							});
							jQuery('.qb_template .ztoa').click(function() {
								table.order([ 4, 'desc' ]).draw();
							});							
							*/
							/* sorting ends/
							/* search starts*/
							jQuery(".search-box").keyup(function() {
										table.search(this.value, false, false,
												true).draw();
									});
							/* search ends */
							/* filter starts */
							jQuery("#myTable thead th.filterHead")
									.each(
											function(i) {
												
												var selectVar = "";
												table
														.column(i + 1)
														.data()
														.unique()
														.sort()
														.each(
																function(d, j) {
																	if(d.indexOf('none') != -1){
                                                                       console.log(jQuery(d).text());
                                                                       selectVar += '<div class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+ jQuery(d).text() +'">'
																		+ d
																		+ '</div>';
																    }
																	else {
																	selectVar += '<div class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+ d+'">'
																			+ d
																			+ '</div>';
																	}
																});
												jQuery("#col" + i).append(selectVar);

											});
							
							jQuery(".ok").click(function() {
									var curr = jQuery(this).closest('.dropdown').find('.list-item div input:checked');
									var index = jQuery('.ok').index(this);
									var chkId = '';
								jQuery(curr).each(function() {
									chkId += jQuery(this).val() + "|";
								});								
								chkId = chkId.slice(0, -1);
								//(chkId);
								table.column(index+1).search(chkId, true, false).draw();
							});
							
							jQuery('.clear-filter').click(
									function(event) { //on click 
										var currInput = jQuery(this).closest('.dropdown').find('.list-item div input');
										if (this.checked) { // check select status
											jQuery(currInput).each(function() { 
													this.checked = true; 
									    });
										} else {
											jQuery(this).siblings('.select-all').find('input').prop('checked', false);
											jQuery(currInput).each(function() { //loop through each checkbox
											this.checked = false; 		
								});
							   }
							});
							
	

							/* datatable ends */

							jQuery('.dataTable').on('click', 'th span', function(e) {
								e.stopPropagation();
								jQuery('.dropdown').addClass('hide');
								jQuery(this).siblings('.dropdown').toggleClass('hide');
							});

						jQuery(document).on('click', function(e) {
								var dropable = jQuery('.dropdown');
								if(!dropable.is(e.target) && dropable.has(e.target).length == 0){
								    dropable.addClass('hide');
								}
							}); 

							jQuery('.cancel,.ok').on('click',function() {
										jQuery(this).parents(".dropdown")
												.removeClass('show').addClass(
														'hide');
							});
							
							//select all
							jQuery('.select-all input').click(function(event) { //on click
								if (this.checked) { // check select status
									jQuery(this).closest('.dropdown').find('.list-item div input').each(function() { //loop through each checkbox
														this.checked = true; //select all checkboxes with class "checkbox1"
													}); 
								} else {
									jQuery(this).closest('.dropdown').find('.list-item div input').each(function() { //loop through each checkbox
														this.checked = false; //deselect all checkboxes with class "checkbox1"
													});
								}
							});


							
					 jQuery('#myTable .dropdown').find('.empty').closest('div').append('blank(s)').end().remove();

							 jQuery(".dataTables_length select").selectmenu({
									open: function( event, ui ) {
						  jQuery(this).siblings('.ui-selectmenu-button').children('.ui-icon').addClass('active');
						},
						close: function( event, ui ) {
						jQuery(this).siblings('.ui-selectmenu-button').children('.ui-icon').removeClass('active');
						},
						change:function(event, ui){
						jQuery(".dataTables_length select").val(ui.item.label).trigger('change');
						}
								});

						});

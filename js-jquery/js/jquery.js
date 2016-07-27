$(document).ready(function(){

	var grid_size = 6;
	
	gridGen(grid_size);
  
  	$('#button').on('click',function(){
  		grid_size = prompt("What grid size?");
    
    	$('td').css('background-color','red');
    	$('table').remove();
    
    	gridGen(grid_size);
  });
});

function randomColorChange(){
    return '#'+(Math.floor(Math.random()*16777216)&0xFFFFFF).toString(16);
};

function gridGen(grid_size){
	$('body').append('<table class="grid"></table>');
		for(var i = 1; i <=grid_size;i++){
  $('table').append('<tr><td></td></tr>');
  };
  	for(var j = 1; j <grid_size;j++){
  $('tr').append('<td></td>')  
 	};
	  $('td').hover(function(){
  	$(this).css('background-color',randomColorChange());
  });
  	$('td').on('click',function(){
  	$(this).fadeOut('fast');
  });
};
// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){

  var page = 1;
  $("#next-link").click(function(){
    if(page != maximus){
      page += 1;
      swap_image();     
    }
    return false;
  });

  $("#previous-link").click(function(){
    if(page != 1){
      page -= 1;
      swap_image();
    };
    return false;
  });

  function swap_image(){
   $("#page").attr("src", "/pdfs/" + identifier + "/" + page + "_page.jpg");
  }
});


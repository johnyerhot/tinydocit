// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){

  var page = 1;
  $("#next-link").click(function(){
    page += 1;
    $("#page").attr("src", "/system/pdfs/" + identifier + "/" + page + "_page.jpg");

    return false;
  });

  $("#previous-link").click(function(){
    if(page != 1){
      page -= 1;
      $("#page").attr("src", "/system/pdfs/" + identifier + "/" + page + "_page.jpg");
    };
    return false;
  });

});
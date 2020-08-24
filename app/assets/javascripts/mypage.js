$(function() {
  let tabs = $(".Position__Name");

  function tabSwitch() {
    $(".Active").removeClass("Active");
    $(this).addClass("Active");
    const index = tabs.index(this);
    $(".User_posts").removeClass("Show").eq(index).addClass("Show");
  }
  tabs.click(tabSwitch);
});
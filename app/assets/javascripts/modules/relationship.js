$(function() {
  let tabs = $(".Follow_tab");

  function tabSwitch() {
    $(".Active").removeClass("Active");
    $(this).addClass("Active");
    const index = tabs.index(this);
    $(".Follow_list").removeClass("Show").eq(index).addClass("Show");
  }
  tabs.click(tabSwitch);
});
const modelName = "attendance";
window.onload = function () {
  clock();
  setInterval("clock()", 1000);
  $(document).on("load", set_ajax);
};
function clock() {
  const nowTime = new Date();
  const nowHour = ("00" + nowTime.getHours()).slice(-2);
  const nowMin = ("00" + nowTime.getMinutes()).slice(-2);
  const nowSec = ("00" + nowTime.getSeconds()).slice(-2);
  const strTime = nowHour + ":" + nowMin + ":" + nowSec;
  document.getElementById("current-time").innerHTML = strTime;
  document.getElementById(`${modelName}_start_time`).value = strTime;
  document.getElementById(`${modelName}_end_time`).value = strTime;
}
function set_ajax() {
  $("#for_ajax").on("ajax:success", function (e, xhr, status, error) {
    // [data, status, xhr] = e.detail;
    alert("成功！");
    console.log(e);
  });
  // $(".for_ajax").on("ajax:error", function (e) {
  //   alert("失敗！");
  // });
}

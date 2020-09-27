window.onload = function () {
  clock();
  setInterval("clock()", 1000);
};
function clock() {
  const nowTime = new Date();
  const nowHour = ("00" + nowTime.getHours()).slice(-2);
  const nowMin = ("00" + nowTime.getMinutes()).slice(-2);
  const nowSec = ("00" + nowTime.getSeconds()).slice(-2);
  const msg = nowHour + ":" + nowMin + ":" + nowSec;
  document.getElementById("time-area").innerHTML = msg;
}

// const btnKey = ["shukkin", "taikin"];
// document.getElementById("shukkin").addEventListener("click", function () {});

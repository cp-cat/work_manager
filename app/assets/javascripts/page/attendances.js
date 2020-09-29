const modelName = "attendance";
$(function () {
  clock();
  setInterval("clock()", 1000);
});
clock = () => {
  const now = new CustomDate();
  if ($id("current-time")) {
    $id("current-timeHM").innerHTML = now.strfdate("HH:mm");
    $id("current-timeS").innerHTML = now.strfdate("ss");
    $id(`${modelName}_start_time`).value = now.strfdate("HH:mm:ss");
    $id(`${modelName}_end_time`).value = now.strfdate("HH:mm:ss");
  }
};

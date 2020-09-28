const modelName = "attendance";
$(function () {
  clock();
  setInterval("clock()", 1000);
});
clock = () => {
  const now = new CustomDate();
  if ($id("current-time")) {
    $id("current-time").innerHTML = now.strfdate("HH:mm:ss");
    $id(`${modelName}_start_time`).value = now.strfdate("HH:mm:ss");
    $id(`${modelName}_end_time`).value = now.strfdate("HH:mm:ss");
  }
};

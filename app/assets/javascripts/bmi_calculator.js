$(function(){
  $('#bmi_unit_system').change(function(){
    var weight = $('#weight_unit');
    var height = $('#height_unit');

    if($('#bmi_unit_system').val() == 'e' ){
      weight.text('lb');
      height.text('in');
    } else {
      weight.text('kg');
      height.text('m');
    }
  });
});

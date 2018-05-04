var select_view = document.getElementById('select-view');

function init(){
  try {
    $('#calendar').fullCalendar({
      selectable: true,
      dayClick: function(date, allDay, jsEvent, view){
        $('#calendar').fullCalendar(
          'changeView',
          'agenda',
          date.format()
        );
        if (select_view.value != 'agenda'){
          select_view.value = 'agenda';
        }
        return true;
      },
      eventSources:[
        {
          url: "/owasp-halifax/assets/pages/calendar/json/calendar.json",
          type: "GET",
          color: "#7075a1",
          textColor: "white"
        }
      ],
      eventRender: function(event, element){
        if (element && event.description){
          element.qtip({
            style: {
              classes: 'qtip-bootstrap'
            },
            content: {
              title: event.title,
              text: '<strong>Time</strong><br>' + moment(event.start).format('hh:mm A') + ' - ' + moment(event.end).format('hh:mm A') + '<br><strong>Location</strong><br>' + event.location + '<br><strong>Description</strong><br>' + event.description
            }
          });
        }
      },
      weekends:true
    });
  } catch(error){
    throw error;
  }
}

function change_view(element, view){
  try {
    $(element).fullCalendar(
      'changeView',
      view
    );
    return true;
  } catch(error){
    throw error;
  }
}

window.onload = function(){
  try {
    init();
    $('#select-view').change(function(){
      change_view(
        '#calendar',
        $('#select-view').val()
      );
      return true;
    });
    return true;
  } catch(error){
    console.log(error);
    return false;
  }
};

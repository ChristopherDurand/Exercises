function cancelSchedule(scheduleId) {
  let xhr = new XMLHttpRequest();
  xhr.open('delete', 'api/schedules/' + String(scheduleId));
  xhr.send();

  xhr.addEventListener('load', event => {
    if (xhr.status === 403) {
      cancelBooking(scheduleId, () => {
        xhr.open('delete', 'api/schedules/' + String(scheduleId));
        xhr.send();
     });
    }
  });
}

function cancelBooking(scheduleId, callback) {
  let xhr = new XMLHttpRequest();
  xhr.open('PUT', 'api/bookings/'+String(scheduleId));
  xhr.send();
  if (typeof callback === 'function') callback();
}
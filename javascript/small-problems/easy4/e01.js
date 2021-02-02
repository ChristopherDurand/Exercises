const DEGREE = '\xB0';
const MINUTES_PER_DEGREE = 60;
const SECONDS_PER_MINUTE = 60;
const SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE;

function padLeft(string, length, char) {
  let result = string;
  while (result.length < length) {
    result = char + result;
  }
  return result;
}

function dms(angle) {
  let degrees = Math.floor(angle);
  let minutes = Math.floor((angle - degrees)*MINUTES_PER_DEGREE);
  let seconds = Math.floor((angle - degrees - minutes / SECONDS_PER_MINUTE) * SECONDS_PER_DEGREE);
  degrees = padLeft(String(degrees), 2, '0');
  minutes = padLeft(String(minutes), 2, '0');
  seconds = padLeft(String(seconds), 2, '0');
  console.log(`${degrees}${DEGREE}${minutes}'${seconds}"`)
}




dms(30);           // 30°00'00"
dms(76.73);        // 76°43'48"
dms(254.6);        // 254°35'59"
dms(93.034773);    // 93°02'05"
dms(0);            // 0°00'00"
dms(360);          // 360°00'00" or 0°00'00"
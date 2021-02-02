/*
The problem is that the user is calling stopPropogation 
and not preventDefault.

stopPropogation prevents the event from going further down the event 
chain; whereas preventDefault prevents the default action from working.

*/
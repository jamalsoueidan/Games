//http://stackoverflow.com/questions/4358135/how-to-make-omniauth-work-with-a-popup-window

var newwindow;
function login(provider_url, width, height) {
  var screenX     = typeof window.screenX != 'undefined' ? window.screenX : window.screenLeft,
      screenY     = typeof window.screenY != 'undefined' ? window.screenY : window.screenTop,
      outerWidth  = typeof window.outerWidth != 'undefined' ? window.outerWidth : document.body.clientWidth,
      outerHeight = typeof window.outerHeight != 'undefined' ? window.outerHeight : (document.body.clientHeight - 22),
      left        = parseInt(screenX + ((outerWidth - width) / 2), 10),
      top         = parseInt(screenY + ((outerHeight - height) / 2.5), 10),
      features    = ('width=' + width + ',height=' + height + ',left=' + left + ',top=' + top);

      newwindow = window.open(provider_url, 'Login', features);

  if (window.focus)
    newwindow.focus();

  return false;
}

/*window.onbeforeunload = function (e) {
  var message = "Your confirmation message goes here.",
  e = e || window.event;
  // For IE and Firefox
  if (e) {
    e.returnValue = message;
  }

  // For Safari
  return message;
};*/


//http://learnswfobject.com/advanced-topics/load-a-swf-using-javascript-onclick-event/

function removeSWFObject(targetID){
   var el = document.getElementById(targetID);
   if(el){
      var div = document.createElement("div");
      el.parentNode.insertBefore(div, el);
 
      //Remove the SWF
      swfobject.removeSWF(targetID);
 
      //Give the new DIV the old element's ID
      div.setAttribute("id", targetID);
   }
}

function reloadSWFObject(url, flashvars) {
	removeSWFObject('flash-content');
	swfobject.embedSWF(url, "flash-content", "100%", "100%", "10.2.0", "expressInstall.swf", flashvars);
}
// Get the modal
window.onload = function() {
   var modal = document.getElementById('myModal');
   // Get the button that opens the modal
   var btn = document.getElementById("myBtn");
   // var btn = document.getElementsByClassName("flexsearch--submit");
   // Get the <span> element that closes the modal
   var exit = document.getElementsByClassName("close");
   var exitno = document.getElementById("no");
   var next = document.getElementById("ya");
   // When the user clicks on the button, open the modal
   btn.onclick = function() {
      modal.style.display = "block";
   }

   // When the user clicks on (x), close the modal
   exit.onclick = function()
   {
      modal.style.display = "none";
   }
   exitno.onclick = function()
   {
      modal.style.display = "none";
   }
   next.onclick = function()
   {
      modal.location.reload(true);
   }
   // When the user clicks anywhere outside of the modal, close it
   window.onclick = function(event)
   {
      if (event.target == modal)
      {
           modal.style.display = "none";
      }
   }
}

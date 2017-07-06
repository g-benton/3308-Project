var sheepHead = document.getElementById("sheep-eating-head");
     
TweenMax.to(
  sheepHead,
  4.8,
  {
    y: '20px',
    rotation: -40,
    transformOrigin: 'center center',
    yoyo: true,
    ease: Power1.easeInOut,
    repeat: -1
  }
)

new Taggle('example1', {
   inputFormatter: recipeInputFormatter,
   tagFormatter: recipeTagFormatter,
   onTagAdd: onTagAdd
});
// getTagValues('example1');

function recipeInputFormatter( inputElement ) {
   inputElement.setAttribute('name','text_input');
   console.log(inputElement);
}

function recipeTagFormatter( element ) {
   element.removeChild(element.lastChild);
   // element.removeChild(element.getElementsByTagName('input'));
   return element;
} 

function onTagAdd( event, tag ) {
  var userInput = document.getElementsByName('text_input')[0];
  var tagString = userInput.getAttribute('value');
  if (!tagString) { 
	tagString = tag;
      }	else {
	tagString += "+" + tag;
}
  userInput.setAttribute('value',tagString); 
}

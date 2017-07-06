/* Below fancy_scroll:  Implement bounce feature in
overflow scrolling.  See https://github.com/peachananr/fancy-scroll
to implement additional features. */

$(window).fancy_scroll({
  animation: "bounce"
});

(function($){
   // var allrecipes = $('.recipelist').children('.singlerecipe');
   var allrecipes = $('.recipelist .singlerecipe');
   var currentrecipe = allrecipes.first();

//    allrecipes.each(function(i, r){
//       debugger;
//     r.find('.singlerecipe').click(function(){ all});
// });
   allrecipes.hide();
   currentrecipe.show();

   allrecipes.each(function(){
      var self = $(this);
      $(this).find('.dislike').click(function(){
         allrecipes.hide();
         self.next('.singlerecipe').show();
      });
   });
//    currentrecipe.find(".dislike").click(function(event){
//       currentrecipe.hide();
//       currentrecipe = currentrecipe.next('.singlerecipe');
//       currentrecipe.show();
// });

   // for (i=0; i < allrecipes.length; i++) {
   //    debugger;
   // }
   // $.each(allrecipes, function(i, r){
   //    debugger;
   //      var next = currentrecipe.next(".singlerecipe");
   //      currentrecipe.find('.dislike').click(function(event ){
   //       allrecipes.hide();
   //       next.show();
   // });
   // });
})(jQuery);

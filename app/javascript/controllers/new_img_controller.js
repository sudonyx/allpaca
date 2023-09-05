$(document).on('ready turbolinks:load', function() {
  console.log("Document is ready!");  // This should be logged when the page loads

  $('.form-control').on('focus', function() {
    console.log("Input focused!");  // This should be logged when an input is focused

    var imgPath = $(this).data('img');
    console.log(imgPath);  // This should log the path from the data-img attribute

    if (imgPath) {
      $('#dynamic-img').attr('src', imgPath);
    }
  });
});

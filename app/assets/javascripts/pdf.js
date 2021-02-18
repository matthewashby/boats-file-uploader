//= require jquery

// A4 paper size is 210mm x 297mm, or 8.267 inches x 11.692 inches.
var splitThreshold = 0, pdfPage = {
    width: 8.26, // inches
    height: 11.69, // inches
    margins: {
      top: 5 / 25.4,
      left: 0,
      right: 0,
      bottom: 15 / 25.4
    }
  };

function adjust_page() {
  var vars={};
  var x=document.location.search.substring(1).split('&');
  for(var i in x) {var z=x[i].split('=',2);vars[z[0]] = unescape(z[1]);}
  var x=['frompage','topage','page','webpage','section','subsection','subsubsection'];
  for(var i in x) {
    var y = document.getElementsByClassName(x[i]);
    for(var j=0; j<y.length; ++j) y[j].textContent = vars[x[i]];
  }

  // put payment details at bottom
  if ($('.align-bottom').length == 0) return;

  // get document resolution
  var dpi = $('<div id="dpi"></div>')
    .css({
      height: '1in', width: '1in',
      top: '-100%', left: '-100%',
      position: 'absolute'
    })
    .appendTo('body')
    .height();
  // page height in pixels
  var pageHeight = Math.ceil(
    (pdfPage.height - pdfPage.margins.top - pdfPage.margins.bottom) * dpi);
  // temporary set body's width and padding to match pdf's size
  var $body = $('body');
  $body.css('width', (pdfPage.width - pdfPage.margins.left - pdfPage.margins.right + 0.8)+'in');
  $body.css('padding-left', pdfPage.margins.left+'in');
  $body.css('padding-right', pdfPage.margins.right+'in');
  $body.css("margin-left", 'auto');
  $body.css("margin-right", 'auto');

  var $t = $('#data-rows'),
    ctop = $t.offset().top;

  $('tbody tr', $t).each(function() {
    var $tr = $(this);

    ctop += $tr.outerHeight();

    if (ctop > pageHeight - splitThreshold) {
      ctop = ctop - pageHeight;
    }
  });

  ctop += 40;

  var offset, block_height = $('.align-bottom').outerHeight();

  if (ctop > pageHeight - block_height - splitThreshold) {
    var $br = $('<div style="height: 1px;"></div>')
      .css('page-break-before', 'always');
    $br.insertAfter($t);
    offset = pageHeight - block_height;
  } else {
    offset = pageHeight - ctop - block_height - 40;
  }

  // debug code
  //$('body').css('border', '1px solid #000');
  //var txt = ctop + ' - ' + pageHeight + ' - ' + $('.align-bottom').outerHeight();
  //txt += '<br>' + offset; //$('.align-bottom').offset().top + '-' + $('.align-bottom').outerHeight();
  //$('#test').html(txt);

  $('.align-bottom').css('padding-top', offset + 'px');
}

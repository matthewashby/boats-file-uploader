// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery-validation')
require('./jssocials.min')

import "bootstrap"
import '../stylesheets/application'
import { initMedia } from 'pages/media'
import { stripeHandler } from 'stripe_handler'

function fixMenuClass() {
  const menuItems = $("nav a.nav-link span")

  $.each(menuItems, function(index, menu){
    if ($(menu).height() > 25) {
      $(menu).addClass("two-lines")
    } else {
      $(menu).removeClass("two-lines")
    }
  })
}

document.addEventListener("turbolinks:load", () => {
  const email = 'dan@citycareerlab.com';
  $('#home-index #emailinfo').attr('href', `mailto:${email}`);
  $('#home-index #emailtext').text(email);

  $('.navbar-collapse').on('show.bs.collapse', () => {
    $('.overlay').css('display', 'block');
  });
  $('.navbar-collapse').on('hide.bs.collapse', () => {
    $('.overlay').css('display', 'none');
  });

  $("#contact-form").validate()
  $("form.billing-detail-form").validate()
  
  initMedia()
  fixMenuClass()
  stripeHandler()
  window.ACUITY_MODAL_INIT = false

  $(window).resize(fixMenuClass)

  if ($("#show_appointment").length > 0) {
    console.log('found');
    setTimeout(function(){
      $(".btn-schedule-meeting")[0].click();
    }, 1000)
  }

  $('.arrow-upward img').on('click', () => {
    window.scroll({
      top: 0,
      left: 0,
      behavior: 'smooth'
    });
  });

  $('#accordionOne .collapse, ' +
    '#accordionTwo .collapse, ' +
    '#accordionThree .collapse, ' +
    '#accordionFour .collapse, ' +
    '#accordionFive .collapse, ' +
    '#accordionSix .collapse, ' +
    '#accordionSeven .collapse, ' +
    '#accordionEight .collapse, ' +
    '#accordionNine .collapse'
    ).on('show.bs.collapse', (e) => {
    $(e.target).siblings('.accodion-header').css('border-bottom-right-radius', '0');
    $(e.target).siblings('.accodion-header').css('border-bottom-left-radius', '0');
    $(e.target).siblings('.accodion-header').find('img').css('transform', 'scaleY(-1)');

  });

  $('#accordionOne .collapse, ' +
    '#accordionTwo .collapse, ' +
    '#accordionThree .collapse, ' +
    '#accordionFour .collapse, ' +
    '#accordionFive .collapse, ' +
    '#accordionSix .collapse, ' +
    '#accordionSeven .collapse, ' +
    '#accordionEight .collapse, ' +
    '#accordionNine .collapse'
    ).on('hidden.bs.collapse', (e) => {
    $(e.target).siblings('.accodion-header').css('border-bottom-right-radius', '4px');
    $(e.target).siblings('.accodion-header').css('border-bottom-left-radius', '4px');
    $(e.target).siblings('.accodion-header').find('img').css('transform', 'scaleY(1)');
  });

  $("#share-linkedin").jsSocials({
    shares: [{
      share: 'linkedin',
      logo: $("#share-linkedin").data('img')
    }],
    showLabel: false,
    showCount: false,
  });

  $("#share-facebook").jsSocials({
    shares: [{
      share: 'facebook',
      logo: $("#share-facebook").data('img')
    }],
    showLabel: false,
    showCount: false,
  });

  $("#share-twitter").jsSocials({
    shares: [{
      share: 'twitter',
      logo: $("#share-twitter").data('img')
    }],
    showLabel: false,
    showCount: false,
  });
})

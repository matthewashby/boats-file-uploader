function stripeHandler() {
  var checkoutContainer = $("#checkout");

  if (checkoutContainer.length == 0) {
    return;
  }

  var stripe = Stripe(checkoutContainer.data("stripePublicKey"));
  var elements = stripe.elements();
  var card = elements.create('card', { hidePostalCode: true });
  card.mount('#card-element');

  var form = $("#checkout form");

  form.submit(function (event) {
    if ($("input.payment_intent_id").length > 0) {
      return true;
    }

    event.preventDefault();

    form.find("input[type='submit']").attr("disabled", true);

    stripe.createPaymentMethod('card', card).then(function (result) {

      if (result.error) {
        alert(result.error.message);
        form.find("input[type='submit']").attr("disabled", false);
      } else {
        createIntent(result.paymentMethod.id);
      }
    });
  });
}

function addHiddenInput(name, value) {
  var form = $("#checkout form");
  var input = document.createElement('input')

  input.setAttribute('type', 'hidden')
  input.setAttribute('name', name)
  input.setAttribute('value', value)
  $(input).addClass(name)

  form.append(input)
}

function createIntent(paymentMethodId) {
  var form = $("#checkout form");

  addHiddenInput('payment_method_id', paymentMethodId)

  $.ajax({
    url: '/confirm_stripe_payment',
    type: 'post',
    dataType: 'json',
    data: form.serialize()
  }).done(function (data, textStatus, jQxhr) {
    if (data.status == "requires_action") {
      stripe.handleCardAction(data.client_secret).then(function (result) {
        if (result.error) {
          alert(result.error.message);
          form.find("input[type='submit']").attr("disabled", false);
        } else {
          addHiddenInput('payment_intent_id', data.id)
          form.submit();
        }
      });

    } else {
      addHiddenInput('payment_intent_id', data.id)
      form.submit();
    }
  }).fail(function (jqXhr, textStatus, errorThrown) {
    console.log(jqXhr);
    form.find("input[type='submit']").attr("disabled", false);
  });
}

export { stripeHandler };
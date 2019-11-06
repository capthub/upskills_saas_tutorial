/* global $, Stripe */
//Document ready
$(document).on('turbolinks:load', function(){
    var theForm = $('#pro_form');
    var submitBtn = $('#form_submit_btn');
    //Set Stripe public key
    Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content'));
    //When user clicks submit 
    submitBtn.click(function(event){
    //Prevent form submission 
        event.preventDefault
    //Collect card fields
    
    var ccNum = $('#card_number').val(),
        cvcNum = $('#card_code').val(),
        expMonth =$('#card_month').val(),
        expYear = $('#card_year').val();
        
    //Send Card info to Stripe
    Stripe.createToken({
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
    }, stripeResponseHandler);
    });

    //Stripe will return a card token
    //Inject the token as hidden field and submit form to rails app
    });
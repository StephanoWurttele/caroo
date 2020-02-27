// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

import "bootstrap";
if (document.getElementById('booking-form')){
    const dates = document.querySelectorAll('.form-inputs .form-group');
    const price = document.querySelector('#price');
    const rent = document.getElementById("hidden");
    dates.forEach((field) => {
        field.addEventListener('click', (event) => {
            const dayprice = parseInt(price.dataset.price);
            let startyear = document.querySelector('#booking_initial_date_1i').selectedOptions[0].innerHTML
            let startmonth = document.querySelector('#booking_initial_date_2i').selectedOptions[0].innerHTML
            let startday = document.querySelector('#booking_initial_date_3i').selectedOptions[0].innerHTML
            let startdate = new Date(`${startyear}-${startmonth}-${startday}`);
            let endyear = document.querySelector('#booking_final_date_1i').selectedOptions[0].innerHTML
            let endmonth = document.querySelector('#booking_final_date_2i').selectedOptions[0].innerHTML
            let endday = document.querySelector('#booking_final_date_3i').selectedOptions[0].innerHTML
            let enddate = new Date(`${endyear}-${endmonth}-${endday}`);
            let days = (enddate-startdate)/(1000 * 3600 * 24);
            let finalprice = (days+1)*dayprice
            price.innerHTML = `Total price: ${finalprice} £`;
            rent.value = finalprice;
        });
    });
}
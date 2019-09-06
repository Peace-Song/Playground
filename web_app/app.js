'use strict';
console.log("DEBUG MODE ACTIVATED.");

var today = new Date();
var formatDate = today.toDateString();
var selectElement = document.getElementById("date");
selectElement.innerHTML = formatDate;


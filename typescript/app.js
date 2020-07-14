"use strict";
var userInput;
userInput = 5;
userInput = 'Max';
function generateError(message, code) {
    // throw {message: message, errorCode: code};
    while (true) { }
}
var result = generateError('An error occurred!', 500);
console.log(result);

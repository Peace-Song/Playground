"use strict";
function _add(num1, num2, showResult, phrase) {
    const result = num1 + num2;
    if (showResult)
        console.log(phrase + result);
    else
        return result;
}
let number1 = 2.71;
const number2 = 3.14;
const print_Result = true;
const resultPhrase = 'Result is: ';
_add(number1, number2, print_Result, resultPhrase);

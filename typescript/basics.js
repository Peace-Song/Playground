"use strict";
function _add(num1, num2, showResult, phrase) {
    var result = num1 + num2;
    if (showResult)
        console.log(phrase + result);
    else
        return result;
}
var number1 = 2.71;
var number2 = 3.14;
var print_Result = true;
var resultPhrase = 'Result is: ';
_add(number1, number2, print_Result, resultPhrase);

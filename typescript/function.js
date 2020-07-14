"use strict";
function add(n1, n2) {
    return n1 + n2;
}
function printResult(num) {
    console.log('Result: ' + num);
}
console.log(printResult(add(10, 7)));
var combineval;
combineval = add;
console.log(combineval(1, 2));
console.log(typeof combineval);
var combineval2;
combineval2 = add;
function addAndHandle(n1, n2, cb) {
    var result = n1 + n2;
    cb(result);
}
addAndHandle(10, 20, function (result) { console.log(result); });

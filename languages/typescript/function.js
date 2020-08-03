"use strict";
function add(n1, n2) {
    return n1 + n2;
}
function printResult(num) {
    console.log('Result: ' + num);
}
console.log(printResult(add(10, 7)));
let combineval;
combineval = add;
console.log(combineval(1, 2));
console.log(typeof combineval);
let combineval2;
combineval2 = add;
function addAndHandle(n1, n2, cb) {
    const result = n1 + n2;
    cb(result);
}
addAndHandle(10, 20, (result) => { console.log(result); });

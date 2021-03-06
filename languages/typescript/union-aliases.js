"use strict";
const person = {
    name: 'peacesong',
    age: 26,
    hobbies: ['cooking', 'gaming'],
    role: [0, 'author']
};
function combine(input1, input2, resultConversion) {
    let result;
    if (typeof input1 === 'number' && typeof input2 === 'number' || resultConversion === 'as-number')
        result = +input1 + +input2;
    else
        result = input1.toString() + input2.toString();
    return result.toString();
}
let favoriteActivities;
favoriteActivities = ['sport', 2];
console.log(person.name);
person.hobbies.map(hobby => console.log(hobby));
person.role.push('hi');
console.log(person.role);
console.log(combine(30, 24, 'as-number'));
console.log(combine('30', '26', 'as-number'));
console.log(combine('Max', 'Anna', 'as-text'));

function add(n1: number, n2: number): number {
	return n1 + n2;
}

function printResult(num: number) {
	console.log('Result: ' + num);
}

console.log(printResult(add(10, 7)));

let combineval: Function;
combineval = add;
console.log(combineval(1, 2));
console.log(typeof combineval);

let combineval2: (a: number, b: number) => number;
combineval2 = add;

function addAndHandle(n1: number, n2: number, cb: (num: number) => void) {
	const result = n1 + n2;
	cb(result);
}

addAndHandle(10, 20, (result) => {console.log(result)});
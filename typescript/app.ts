let userInput: unknown;

userInput = 5;
userInput = 'Max';

function generateError(message: string, code: number): never {
	// throw {message: message, errorCode: code};
	while (true){}
}

const result = generateError('An error occurred!', 500);

console.log(result);
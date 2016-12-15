// function madLib(verb, adjective, noun) {
//   return `we shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`
// }
//
// console.log(madLib("make", "best", "guac"));

// function isSubstring(searchString, substring) {
//   return searchString.includes(substring);
// }
//
// console.log(isSubstring("time to program", "time"));
// console.log(isSubstring("Jump for joy", "joys"));

// function fizzBuzz(array) {
//   let answer = new Array()
//   for (let i = 0; i < array.length; i++) {
//     if (array[i] % 3 == 0 && array[i] % 5 == 0) {
//       //...
//     } else if (array[i] % 3 == 0) {
//       answer.push(array[i]);
//     } else if (array[i] % 5 == 0) {
//       answer.push(array[i]);
//     } else {
//       //...
//     }
//   }
//   return answer
// }
//
// console.log(fizzBuzz([1,2,3,4,5,6,7,8,9,10]))

// function isPrime(number) {
//   let i = 2;
//   while (i < number) {
//     if (number % i == 0) {
//       return false;
//     }
//     i++;
//   }
//   return true;
// }

// console.log(isPrime(2));
// console.log(isPrime(10));
// console.log(isPrime(15485863));
// console.log(isPrime(3548563));

// function sumOfNPrimes(n) {
//   let i = 2;
//   let counter = 0;
//   let sum = 0;
//   while (counter < n) {
//     if (isPrime(i)) {
//       sum += i;
//       counter++;
//     }
//     i++;
//   }
//   return sum
// }
//
// console.log(sumOfNPrimes(0))
// console.log(sumOfNPrimes(1))
// console.log(sumOfNPrimes(4))

function allOrNothing() {
  let args = arguments;
  let mod = args[0];
  for (let i = 1; i< arguments.length; i++) {
    if (args[i] % mod != 0) {
      return false
    }
  }
  return true
}

console.log(allOrNothing(3, 9, 12, 6))
console.log(allOrNothing(5, 1, 2, 10))

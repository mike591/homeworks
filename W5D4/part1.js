// setTimeout(function() {
//   alert('HAMMERTIME')
// }, 3000);

// function hammertime(time) {
//   setTimeout(function() {
//     alert(`${time} is hammertime!`)
//   }, time);
// }
//
// hammertime(1000)
//////////////////////////////////////////////////////////////////////////////////

// const readline = require('readline');
// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });
//
// function addTwoNumbers(callback) {
//   // Notice how nowhere do I return anything here! You never return in
//   // async code. Since the caller will not wait for the result, you
//   // can't return anything to them.
//
//   reader.question("Enter #1: ", function (numString1) {
//     reader.question("Enter #2: ", function (numString2) {
//       const num1 = parseInt(numString1);
//       const num2 = parseInt(numString2);
//
//       callback(num1 + num2);
//     });
//   });
// }
//
// addTwoNumbers(function (result) {
//   console.log(`The result is: ${result}`);
//   reader.close();
// });



const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  let first, second;

  reader.question('Would you like some tea?', (tea) => {
    console.log(`You replied ${tea} to tea.`);
    reader.question('Would you like some biscuits?', (bis) => {
      console.log(`You replied ${bis} to biscuits.`);
      first = tea;
      second = bis;
      response(first, second)
      reader.close();
    });
  });

  function response(first, second) {
    const firstRes = (first === 'yes') ? 'do' : 'don\'t';
    const secondRes = (second === 'yes') ? 'do' : 'don\'t';
    console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
  }
}

teaAndBiscuits();

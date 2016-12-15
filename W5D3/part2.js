// function printCallback(array) {
//   array.forEach(function(element) {
//     console.log(element);
//   });
// }
//
// function titleize(array, printCallback) {
//   let titleized = array.map(function(x) {
//     return `Mx ${x} Jingleheimer Schmidt`;
//   });
//   printCallback(titleized)
// }
//
// titleize(["Mary", "Brian", "Leo"], printCallback);

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}
Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}
Elephant.prototype.grow = function() {
  this.height += 12;
}
Elephant.prototype.addTrick = function(trick) {
  this.trick.push(trick);
}
Elephant.prototype.play = function() {
  
}

// cannot have any css or HTML code in this file as standalone code

alert("Hello from our external scratch file");

// Lesson 2 - Programming Bsics

var fName = prompt("What is your first name?", "");

document.write("Glad to see you " + fName);

var num1 = Number(prompt ("Enter a positve number ", "10"));

// While condition is true; continue - execute code ()'s
while (isNaN(num1) || num1 <= 0 ){
  var num1 = Number(prompt ("Reminder: Enter a positve number ", "10"));
}

var num2 = prompt ("Enter a positve number ", "5");
num2 = Number(num2)

while (isNaN(num2) || num2 <= 0 ){
  var num2 = Number(prompt ("Reminder: Enter a positve number ", "10"));
}

// display every odd number between 0 and num2
// for (initialization; condition; increment)

for(var i = 0; i <= num2; i++) {
  // display i only if it is an odd Number
  if (i % 2){
    document.write("i contains " + i + "<br>")
  }
}

// var result = num1 % num2;
// alert("result" + result);

if (num1 > num2){
  document.write("<h4>" + num1 + "is greater than " + num2 + "</h4>");
}
else if (num1 < num2){
    document.write("<h4>" + num1 + "is less than " + num2 + "</h4>");
}
else{
    document.write("<h4>" + num1 + "is equal to " + num2 + "</h4>");
}

//
// Array in Java Script
//
var creatureName = "Swamp Ape ";
var critters = Array("Bigfoot", "Sasquatch", "Yeti", "Kushtka", creatureName);
// var critters = [];

critters[critters.length] = "Abominable Snowman";
critters.push("Ohio Grassman", "Wildman", "Cheeze Monkey");

document.write("<h3>There are " + critters.length + " differnet names for this creature for this as Bigfoot");

critters.sort();
critters

// step through the critters array one element at a time
// display each element's value in a bulleted list

document.write("<ul>");

for (var i = 0; i < critters.length ; i++){
  document.write("<li>" + critters[i] + "</li>");
}

document.write("</ul>");


//
// Set up an associative array to store zipcodes
//

var zipCodes = [] // same as var zipCodes = new Array();

zipCodes["Strum"] = 54770;
zipCodes["Augusta"] = 54722;
zipCodes["Eau Claire"] = 54701;
zipCodes["Mondovi"] = 54755;
zipCodes["Fall Creek"] = 54742;

// step through the zipCodes associative array one element at a time
for (city in zipCodes){
  document.write("<li>The \t\t\tzip code for " + city + " is  " + zipCodes[city] + "</li>")
}


//
// User-defined functions in JavaScript
//

var playerName = prompt("Enter playername: ", "Casey");

var ba = battingAverage(prompt("number at bats", ""), prompt("number of hits", ""));

document.write(playerName + "'s batting average is " + trimNumber(String(ba.toFixed(3))));

// Define a function named battingAverage()

function battingAverage(numAtBats, numHits) {
  // statements in the body
  // var batAvg = numHits / numAtBats;

  // return batAvg;

  return numHits / numAtBats;

}


function trimNumber(strValue){
  return strValue.replace(/^0/,'')
}

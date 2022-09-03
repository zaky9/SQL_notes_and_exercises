// 281. Intoduction to node 

// console.log('Hello world');

// for(var i = 0; i < 500; i++) {
// 	console.log("Hello world!");
// };


//  284. Intro to NPM and Faker
// Faker: to generate fake data
// https://github.com/faker-js/faker
//  to install Faker from terminal
// npm install @faker-js/faker --save-dev

// to use Faker
// const { faker } = require('@faker-js/faker');

var faker = require('faker'); // Import faker 

function  generateAddress() { // function 
	console.log(faker.internet.email()); // fake email address 
	console.log(faker.date.past()); // fake date and time 
	console.log(faker.address.city); // fake city 
}

generateAddress();
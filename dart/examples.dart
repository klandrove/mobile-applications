// Comments
// Variable and Data Types
// Control Flow and Looping
// Functions and Methods
// void creates a function which does not return a value
// main() name of the function (reserved for dart)
// { code to be executed when the function runs } 
void main() {
  // call the function
  greeting();
  print(addTwo(100));

  int result = addTwo(30);
  print(result);

  var inferredString = "Kaitlyn";

  String explicitString = "Landrove";

  print(inferredString + " " + explicitString);

  // null safety
  int? someNumber;
  print(someNumber);
  someNumber = 12;
  print(someNumber);
  // late keyword
  late int willBeNumber;
  //
  int? goals;
  // control the flow of the program to avoid error
  if(goals != null){
    print(goals + 2);
  } else {
    print("the variable goals is null"); 
  }

  // Built-in data types
  // Numeric
  int age = 21;
  num count = 3;
  double temp = 29.9;
  // Booleans (true or false)
  bool isReady = false;
  // Collections: lists, arrays, and maps
  // Strings for expressing text
  String school = "University of Miami";
  print("My school is " + school);

  // Using placeholders to insert variables in side strings
  print("My school is $school");

  // Built-in types operations
  print("my school name has ${school.length} characters");

  if(school.length > 20){
    print("This name is really long");
  } else {
    print("Your school has a short name");
  }
  // control operators
  // > greater than
  // < less than
  // >= greater than or equals
  // <= less than or equals
  // == equals
  // != not equal
  // % modulus

  // Arithmetic operators
  // +
  // -
  // * multiplication
  // / division
  // % modulus
  // Math Shortcuts
  int x = 10;
  x = x + 5; // 15
  // same as
  x += 5; // 20 -= *= /=
  // ! the opposite of an expression at least one must be true
  bool isHere = false; // !isHere
  // ||
  if(isHere || (school.length < 10)){
    //do some code
  }
  // and operator all conditions must be true
    if(!isHere && (school.length < 10)){
      //do some code
    }

  // while loops
  int counter = 0;
  while(counter < 10){
    print("counter");
    counter++;
  }

  // do while
  do {
    print("counter");
    counter++;
  } 
  while(counter<20);
}

  

// variable declaration
// type identifier/name = value;
// var identifier/name = value;


// custom functions
void greeting() {
  print("hello");
}
// Operation with options or parameters
int addTwo(int number){
  return number + 2;
}

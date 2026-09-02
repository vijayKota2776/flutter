void main() {
  int dayNumber = 1; 
  print("=== Using If-Else ===");
  if (dayNumber == 1) {
    print("Sunday");
  } 
  
  if (dayNumber == 2){
    print("Monday");
  }
  
  else if (dayNumber == 2) {
    print("Monday");
  } else if (dayNumber == 3) {
    print("Tuesday");
  } else if (dayNumber == 4) {
    print("Wednesday");
  } else if (dayNumber == 5) {
    print("Thursday");
  } else if (dayNumber == 6) {
    print("Friday");
  } else if (dayNumber == 7) {
    print("Saturday");
  } else {
    print("Invalid day number! Enter a number between 1 and 7.");
  }
  print("\n=== Using Switch Case ===");
  switch (dayNumber) {
    case 1:
      print("Sunday");
      break;
    case 2:
      print("Monday");
      break;
    case 3:
      print("Tuesday");
      break;
    case 4:
      print("Wednesday");
      break;
    case 5:
      print("Thursday");
      break;
    case 6:
      print("Friday");
      break;
    case 7:
      print("Saturday");
      break;
    default:
      print("Invalid day number! Enter a number between 1 and 7.");
  }
}

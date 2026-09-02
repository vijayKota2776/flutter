void main(){

  var map = {
    'A' : 1100,
    'B' : 200,
    'C' : 600
  };

  print(map);

  map['T'] = 67;
  print(map);

  map['T'] = 677;
  print(map);

  print(map.keys);
  print(map.values);
  print(map.entries);

  for (var key in map.keys){
    print("Key :- $key : Value :- ${map[key]}");
  }

  for (var value in map.values){
    print("Value :- $value");
  }

  for (var entry in map.entries){
    print("Key :- ${entry.key} : Value :- ${entry.value}");
  }

  print(map);
  print(map.length);
  map.remove("B");
  print(map);
  print(map.length);
  
}
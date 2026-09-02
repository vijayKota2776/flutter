void main(){

  // var set = {1,2,3,4,5,6,6};
  // print(set);

  // set.add(99);
  // set.add(23);
  // set.add(23);
  // print(set);

  // print(set.length);

  // for (var x in set){
  //   print("Set :- $x");
  // }

  var list = [1,2,3,4,5,6,6,7,8,8,9];

  for (var x in list){
    print(x);
  }

  list.forEach((x){
    print(x);
  });

  list.forEach(print);

}
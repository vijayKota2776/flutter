void main(){

  var list = [11,2,4,55];
  print(list);

  // dynamic list = [11,2,4,55];
  // print(list);

  list.add(67);

  list.addAll([4,5,6,7]);
  print(list);

  list.insert(1,100);
  print(list);

  list.insertAll(1,[200,300]);
  print(list);

  list[1]=99;
  print(list);

  print(list.length);
  print(list.isEmpty);
  print(list.isNotEmpty);

  print(list);
  list.sort();
  print(list);

  list.sort((a,b)=>b.compareTo(a));
  print(list);

  list.remove(100);
  print(list);

  // list.clear();
  // print(list);

  list = list.reversed.toList();
  print(list);

}
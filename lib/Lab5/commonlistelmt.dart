import "dart:io";

void main(){
  List<int> lst1 = [];
  List<int> lst2 = [];

  for(int i=0;i<5;i++){
    print("Enter a number in list 1 at $i ");
    lst1.add(int.parse(stdin.readLineSync()!));
  }
  for(int i=0;i<5;i++){
    print("Enter a number in list 2 at $i ");
    lst2.add(int.parse(stdin.readLineSync()!));
  }

 Set<int> set1 = lst1.toSet();
  Set<int> set2 = lst2.toSet();

  Set<int> ans = set1.intersection(set2);

  print(ans);

}
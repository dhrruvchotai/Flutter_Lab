import "dart:io";

void main(){
  List<int> lst = [];

  for(int i=0;i<5;i++){
    print("Enter a number at $i ");
    lst.add(int.parse(stdin.readLineSync()!));
  }
  lst.sort();
  print(lst);
}
import "dart:io";

void main(){
  Map<String,int> mp1 = new Map();

  for(int i=0;i<2;i++){
    print("Enter name : ");
    String name = stdin.readLineSync()!;

    print("Enter Number : ");
    mp1[name] = int.parse(stdin.readLineSync()!);

  }
  print(mp1.entries);
}
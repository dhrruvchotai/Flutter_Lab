import "dart:io";

void main(){
  Map<String,Object> mp = {
    "Dhruv":{
        "Number":8320112313,
        "Age" : 18
    },
    "Chotai":{
        "Number":9123242423,
        "Age" : 20
    }
  };

  print("Enter name : ");
  String name = stdin.readLineSync()!;
  print(mp[name]);
}
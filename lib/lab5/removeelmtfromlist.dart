import "dart:io";

void main(){
  List<String> lst = [];
    lst.addAll(["Delhi", "Mumbai", "Bangalore", "Hyderabad","Ahmedabad"]);

    lst.replaceRange(4,5,["Surat"]);

  lst.sort();
  print(lst);
}
import "dart:io";

void main(){
  double ans = 0;
  print("Enter a string : ");
  String str = stdin.readLineSync()!;

  List ch = [];
  List nums = [];

  for(int i=0;i<str.length;i++){
    if(str[i] == '+'){
      ch.add('+');
    }
    else if(str[i] == '-'){
      ch.add('-');
    }
    else if(str[i] == '*'){
      ch.add('-');
    }
    if(str[i] == '/'){
      ch.add('/');
    }

  }

  print(ch);

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class newLayout extends StatelessWidget {
  const newLayout({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("New Layout")
      ),
      body: Expanded(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                    ),


                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.green,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.blue,
                                ),
                              ),
                                              
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.purple,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.pink,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.pinkAccent,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

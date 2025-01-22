import 'package:flutter/material.dart';

class Layout3 extends StatelessWidget {
  const Layout3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Layout3")),
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Colors.cyan,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.blue,
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
                                        color:Colors.purple,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.pink,
                                      ),
                                    )
                                  ],
                                ),
                              )
              
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
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
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(child: Container(color: Colors.cyanAccent)),
                                    Expanded(child: Container(color: Colors.brown),flex: 3,),
                                    Expanded(child: Container(color: Colors.cyan)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(child: Container(color: Colors.blueGrey),flex: 2,),
                                    Expanded(child: Container(color: Colors.purple),),
                                    Expanded(child: Container(color:Colors.lightGreen,))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(child: Container(color: Colors.orange),flex: 2,),
                                    Expanded(child: Container(color: Colors.black38)),
                                    Expanded(child: Container(color:Colors.deepPurple,),flex: 2,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(child:Container(
                          color: Colors.yellow,
                        )
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

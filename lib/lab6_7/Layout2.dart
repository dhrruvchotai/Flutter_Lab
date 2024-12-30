import 'package:flutter/material.dart';

class newLayout2 extends StatelessWidget {
  const newLayout2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Layout 2"),
      ),
      body: Expanded(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.brown,
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
                                  color: Colors.pink,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blueGrey,
                    ),
                  )
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
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
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
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.blue,
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
                                                    color: Colors.yellow,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    color: Colors.pink,
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
                                                    color: Colors.pink,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    color: Colors.orange,
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
                              )
                            ],
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
      
    );
  }
}

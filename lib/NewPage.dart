import 'package:demo/Game_Page.dart';
import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController rowNumber = TextEditingController();
    TextEditingController columnNumber = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.black38,
                        width: 2,
                      ),
                    ),
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: rowNumber,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter no. of Rows',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black38, width: 2)),
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: columnNumber,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter no. of Columns',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: const StadiumBorder(),
                        onPressed: () {
                          // ignore: avoid_print
                          print("Go to next page");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GamePage(
                                rowNumber: rowNumber.text,
                                columnNumber: columnNumber.text,
                              ),
                            ),
                          );
                        },
                        child: const Text("Submit"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

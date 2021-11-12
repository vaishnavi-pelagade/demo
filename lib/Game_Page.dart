import 'package:flutter/material.dart';
import 'package:word_search/word_search.dart';

class GamePage extends StatefulWidget {
  final String rowNumber;
  final String columnNumber;

  const GamePage(
      {Key key, @required this.rowNumber, @required this.columnNumber})
      : super(key: key);
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int rowC;
  int colC;

  ValueNotifier<List<List<String>>> listChars;

  void generateRandomWord() {
    final List<String> wl = ['hello', 'world', 'foo', 'bar', 'baz', 'dart'];
    // Create the puzzle sessting object
    final WSSettings ws = WSSettings(
      width: 10,
      height: 10,
      orientations: List.from([
        WSOrientation.horizontal,
        WSOrientation.horizontalBack,
        WSOrientation.vertical,
        WSOrientation.verticalUp,
      ]),
    );

    final WordSearch wordSearch = WordSearch();

    // Create a new puzzle
    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    if (newPuzzle.errors.isEmpty) {
      // List<List<String>> charArrays = newPuzzle.puzzle;
      listChars.value = newPuzzle.puzzle;
      // print("char ${charArrays.toString()}");
    }
  }

  Widget drawCrosswordBox() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: rowC,
          ),
          itemCount: rowC * colC,
          itemBuilder: (context, index) {
            String char = listChars.value.expand((e) => e).toList()[index];
            return Container(
              margin: EdgeInsets.all(1),
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(char),
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    listChars = new ValueNotifier<List<List<String>>>([]);
    generateRandomWord();
    rowC = int.parse(widget.rowNumber);
    colC = int.parse(widget.columnNumber);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            drawCrosswordBox(),
            // ignore: sized_box_for_whitespace
            // Container(
            //   height: 500,
            //   width: double.infinity,
            //   child: GridView.builder(
            //     itemCount: colC * rowC,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: rowC,
            //         childAspectRatio: colC * rowC / 2,
            //         crossAxisSpacing: 20,
            //         mainAxisSpacing: 10),
            //     shrinkWrap: true,
            //     itemBuilder: (context, index) => Container(
            //       color: Colors.greenAccent,
            //     ),
            //   ),
            // ),
            // Text("Row"),
            // TextField(
            //   controller: row,
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Text("Column"),
            // TextField(
            //   controller: column,
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // FlatButton(
            //     onPressed: () {
            //       rowC = int.parse(row.text);
            //       colC = int.parse(column.text);
            //       setState(() {});
            //     },
            //     child: Container(
            //         color: Colors.purple,
            //         padding: EdgeInsets.all(20),
            //         child: Text("Add")))
          ],
        ),
      ),
    );
  }
}

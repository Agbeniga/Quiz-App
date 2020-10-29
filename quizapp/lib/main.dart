import 'package:flutter/material.dart';
import 'package:quizapp/homeScreen.dart';
import 'questions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Philosophy Quiz',
      theme: ThemeData(primaryColor: Color(0xff1e2b74)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var summaryProvider;
  @override
  void initState() {
    super.initState();
    allQuestions.shuffle();
  }

  // var randomizeQuestions =Radio();
  PageController _controller = PageController();
  var _selected = '';
  // void next(int currentPage) {
  //   setState(() {
  //     var nextPage = currentPage++;
  //   });
  // }

  bool evaluateAnswer(String answer) {
    if (_selected == answer)
      return true;
    else
      return false;
  }

  int pageNumber = 0;

  bool correctAnswer(String answer, String option) {
    if (option == answer)
      return true;
    else
      return false;
  }

  select(String value) {
    setState(() {
      _selected = value;
    });
  }

  bool selected(String value) {
    if (_selected == '' || _selected != value)
      return false;
    else
      return true;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // border(bool value){
  //   if(value==null){

  //       return Colors.blueAccent;

  //   }else if(value){
  //     return Colors.greenAccent;
  //   }else if(value == false){
  //     return Colors.red;
  //   }
  // }

  var option1borderColor = Colors.blueAccent;
  var option2borderColor = Colors.blueAccent;
  var option3borderColor = Colors.blueAccent;
  var option4borderColor = Colors.blueAccent;
  bool quiz = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(quiz ? 'Summary' : 'Quiz',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, color: Colors.blueAccent)),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: ClipOval(
              child: RaisedButton(
                  child: Text(
                    quiz ? 'Quiz' : 'Summary',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {
                    setState(() {
                      quiz = !quiz;
                    });
                  }),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff04011d),
      body: quiz
          ? HomeScreen()
          : SafeArea(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    _selected = '';
                    option1borderColor = Colors.blueAccent;
                    option2borderColor = Colors.blueAccent;
                    option3borderColor = Colors.blueAccent;
                    option4borderColor = Colors.blueAccent;
                  });
                },
                physics: NeverScrollableScrollPhysics(),
                itemCount: allQuestions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Question ${index + 1}/${allQuestions.length}",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0,
                          ),
                        ),
                        Divider(),
                        Text(
                          "${allQuestions[index].question}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: option1borderColor),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    "${allQuestions[index].option1}",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  IconButton(
                                    icon: selected('a')
                                        ? Icon(Icons.check_circle,
                                            color: Colors.blueAccent)
                                        : Icon(Icons.check_circle_outline,
                                            color: Colors.blueAccent),
                                    onPressed: () {
                                      setState(() {
                                        _selected = 'a';
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: option2borderColor),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Expanded(
                                    child: Text(
                                  "${allQuestions[index].option2}",
                                  style: TextStyle(color: Colors.white),
                                )),
                                IconButton(
                                  icon: Icon(
                                      selected('b')
                                          ? Icons.check_circle
                                          : Icons.check_circle_outline,
                                      color: Colors.blueAccent),
                                  onPressed: () {
                                    setState(() {
                                      _selected = 'b';
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: option3borderColor),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: Text(
                                  "${allQuestions[index].option3}",
                                  style: TextStyle(color: Colors.white),
                                )),
                                IconButton(
                                  icon: Icon(
                                    selected('c')
                                        ? Icons.check_circle
                                        : Icons.check_circle_outline,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _selected = 'c';
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: option4borderColor),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: Text(
                                  "${allQuestions[index].option4}",
                                  style: TextStyle(color: Colors.white),
                                )),
                                IconButton(
                                  icon: Icon(
                                      selected('d')
                                          ? Icons.check_circle
                                          : Icons.check_circle_outline,
                                      color: Colors.blueAccent),
                                  onPressed: () {
                                    setState(() {
                                      _selected = 'd';
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            index == 0
                                ? Container()
                                : ClipOval(
                                    child: RaisedButton(
                                        child: Text(
                                          "Previous",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.blueAccent,
                                        onPressed: () {
                                          if (index != allQuestions.length) {
                                            int next = index--;
                                            if (_controller.hasClients) {
                                              _controller.animateToPage(
                                                next,
                                                duration: const Duration(
                                                    milliseconds: 400),
                                                curve: Curves.easeInOut,
                                              );
                                            }
                                          }
                                        }),
                                  ),
                            SizedBox(width: 20.0),
                            ClipOval(
                              child: RaisedButton(
                                  child: Text(
                                    "Answer",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Colors.blueAccent,
                                  disabledColor: Colors.blueGrey,
                                  onPressed: _selected == ''
                                      ? null
                                      : () {
                                          bool check = evaluateAnswer(
                                              allQuestions[index].answer);

                                          setState(() {
                                            option1borderColor = selected('a')
                                                ? check
                                                    ? Colors.greenAccent
                                                    : Colors.redAccent
                                                : correctAnswer(
                                                        allQuestions[index]
                                                            .answer,
                                                        'a')
                                                    ? Colors.greenAccent
                                                    : Colors.blueAccent;
                                            option2borderColor = selected('b')
                                                ? check
                                                    ? Colors.greenAccent
                                                    : Colors.redAccent
                                                : correctAnswer(
                                                        allQuestions[index]
                                                            .answer,
                                                        'b')
                                                    ? Colors.greenAccent
                                                    : Colors.blueAccent;
                                            option3borderColor = selected('c')
                                                ? check
                                                    ? Colors.greenAccent
                                                    : Colors.redAccent
                                                : correctAnswer(
                                                        allQuestions[index]
                                                            .answer,
                                                        'c')
                                                    ? Colors.greenAccent
                                                    : Colors.blueAccent;
                                            option4borderColor = selected('d')
                                                ? check
                                                    ? Colors.greenAccent
                                                    : Colors.redAccent
                                                : correctAnswer(
                                                        allQuestions[index]
                                                            .answer,
                                                        'd')
                                                    ? Colors.greenAccent
                                                    : Colors.blueAccent;
                                          });
                                        }),
                            ),
                            SizedBox(width: 20.0),
                            index == allQuestions.length
                                ? Container()
                                : ClipOval(
                                    child: RaisedButton(
                                        child: Text(
                                          "Next",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.blueAccent,
                                        disabledColor: Colors.blueGrey,
                                        onPressed: _selected == ''
                                            ? null
                                            : () {
                                                if (index !=
                                                    allQuestions.length) {
                                                  int next = index++;
                                                  if (_controller.hasClients) {
                                                    _controller.animateToPage(
                                                      next,
                                                      duration: const Duration(
                                                          milliseconds: 400),
                                                      curve: Curves.easeInOut,
                                                    );
                                                  }
                                                }
                                              }),
                                  ),
                          ],
                        ),
                        Spacer(),
                        Text("copyright \u00a9 caleb agbeniga",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}

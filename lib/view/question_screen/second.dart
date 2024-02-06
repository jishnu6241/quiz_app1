import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';
import 'package:quiz_app/utils/question_db.dart';
import 'package:quiz_app/view/result_screen/result_screen.dart';

class QnsQuiz extends StatefulWidget {
  const QnsQuiz(BuildContext context, {super.key});

  @override
  State<QnsQuiz> createState() => _QnsQuizState();
}

class _QnsQuizState extends State<QnsQuiz> {
  int questinindex = 0;
  int? selectedAnswerIndex;
  int righAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1c1c1c),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${questinindex + 1}/ ${QuestionDb.quizquestions.length}',
                style: TextStyle(color: ColorConstant.mycustomblue),
              ),
            )
          ],
        ),
        backgroundColor: ColorConstant.backgroundblack,
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 190,
                  width: 370,
                  decoration: BoxDecoration(
                      color: ColorConstant.mycustomgrey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      QuestionDb.quizquestions[questinindex]["question"],
                      style: TextStyle(
                          color: ColorConstant.backgroundwhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount:
                      QuestionDb.quizquestions[questinindex]["options"].length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedAnswerIndex = index;
                          if (selectedAnswerIndex != null &&
                              selectedAnswerIndex ==
                                  QuestionDb.quizquestions[questinindex]
                                      ["answer"]) {
                            righAnswer++;
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2, color: getRightAnswer(index)),
                          color: ColorConstant.backgroundblack,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                QuestionDb.quizquestions[questinindex]
                                    ["options"][index],
                                style: TextStyle(
                                    color: ColorConstant.backgroundwhite),
                              ),
                            ),
                            CircleAvatar(
                                radius: 9,
                                backgroundColor: getRightAnswer(index),
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: ColorConstant.mycustomgrey,
                                  child: iconshower(index),
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    selectedAnswerIndex = null;

                    if (questinindex < QuestionDb.quizquestions.length - 1) {
                      questinindex++;

                      setState(() {});
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              rightAnswer: righAnswer,
                            ),
                          ));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2, color: ColorConstant.mycustomgrey),
                      color: ColorConstant.mycustomblue,
                    ),
                    child: Center(
                        child: Text(
                      'Next',
                      style: TextStyle(color: ColorConstant.backgroundwhite),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getRightAnswer(int index) {
    if (selectedAnswerIndex != null &&
        index == QuestionDb.quizquestions[questinindex]["answer"]) {
      return ColorConstant.mycustomgreen;
    }
    if (selectedAnswerIndex == index) {
      if (selectedAnswerIndex ==
          QuestionDb.quizquestions[questinindex]["answer"]) {
        return ColorConstant.mycustomgreen;
      } else {
        return ColorConstant.mycustomred;
      }
    } else {
      return ColorConstant.mycustomgrey;
    }
  }

  Widget? iconshower(int index) {
    if (selectedAnswerIndex != null &&
        index == QuestionDb.quizquestions[questinindex]["answer"]) {
      return Icon(
        Icons.done,
        size: 10,
        color: ColorConstant.mycustomgreen,
      );
    }

    if (selectedAnswerIndex == index) {
      if (selectedAnswerIndex ==
          QuestionDb.quizquestions[questinindex]["answer"]) {
        return const Material();
      } else {
        return Icon(
          Icons.close,
          size: 10,
          color: ColorConstant.mycustomred,
        );
      }
    } else {
      return const Material();
    }
  }
}

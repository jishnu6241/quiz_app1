import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';
import 'package:quiz_app/utils/question_db.dart';
import 'package:quiz_app/view/question_screen/second.dart';

class ResultScreen extends StatefulWidget {
  final int rightAnswer;

  const ResultScreen({super.key, required this.rightAnswer});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundblack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Congrats!',
            style:
                TextStyle(color: ColorConstant.backgroundwhite, fontSize: 25),
          )),
          Text(
            '  ${(widget.rightAnswer / QuestionDb.quizquestions.length) * 100}%  Score',
            style: TextStyle(
                color: ColorConstant.mycustomgreen,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QnsQuiz(context),
                  ),
                  (route) => false);
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorConstant.backgroundwhite, width: 5),
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstant.mycustomorange,
                ),
                child: Text(
                  'Restart',
                  style: TextStyle(
                      color: ColorConstant.backgroundwhite,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}

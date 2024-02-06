import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';
import 'package:quiz_app/utils/question_db.dart';

class QnsScreen extends StatefulWidget {
  const QnsScreen({super.key});

  @override
  State<QnsScreen> createState() => _QnsScreenState();
}

class _QnsScreenState extends State<QnsScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  bool iscorrect = false;
  int anscorrect = 0;
  int isSelected = 4;

  QuestionDb questiondb = QuestionDb();
  @override
  void initState() {
    controller = TabController(length: 10, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1c1c1c),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${controller.index + 1}/10',
              style: TextStyle(color: ColorConstant.mycustomblue),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xff1c1c1c),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  QuestionDb.quizquestions[controller.index]["question"],
                  style: TextStyle(
                      color: ColorConstant.backgroundwhite,
                      fontWeight: FontWeight.bold),
                ),
              ),
              CustomBox(
                onTap: () {
                  setState(() {
                    isSelected = 0;
                  });
                },
                text: QuestionDb.quizquestions[controller.index]["options"][0],
                color: isSelected == 0
                    ? iscorrect
                        ? ColorConstant.mycustomgreen
                        : ColorConstant.mycustomblue
                    : ColorConstant.mycustomgrey,
                radioColor: isSelected == 0
                    ? ColorConstant.mycustomblue
                    : ColorConstant.mycustomgrey,
              ),
              CustomBox(
                onTap: () {
                  setState(() {
                    isSelected = 1;
                  });
                },
                text: QuestionDb.quizquestions[controller.index]["options"][1],
                color: isSelected == 1
                    ? iscorrect
                        ? ColorConstant.mycustomgreen
                        : ColorConstant.mycustomblue
                    : ColorConstant.mycustomgrey,
                radioColor: isSelected == 1
                    ? ColorConstant.mycustomblue
                    : ColorConstant.mycustomgrey,
              ),
              CustomBox(
                onTap: () {
                  setState(() {
                    isSelected = 2;
                  });
                },
                text: QuestionDb.quizquestions[controller.index]["options"][2],
                color: isSelected == 2
                    ? iscorrect
                        ? ColorConstant.mycustomgreen
                        : ColorConstant.mycustomblue
                    : ColorConstant.mycustomgrey,
                radioColor: isSelected == 2
                    ? ColorConstant.mycustomblue
                    : ColorConstant.mycustomgrey,
              ),
              CustomBox(
                onTap: () {
                  setState(() {
                    isSelected = 3;
                  });
                },
                text: QuestionDb.quizquestions[controller.index]["options"][3],
                color: isSelected == 3
                    ? iscorrect
                        ? ColorConstant.mycustomgreen
                        : ColorConstant.mycustomblue
                    : ColorConstant.mycustomgrey,
                radioColor: isSelected == 3
                    ? ColorConstant.mycustomblue
                    : ColorConstant.mycustomgrey,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          controller.index = controller.index + 1;
          setState(() {});
        },
        child: Container(
          height: 50,
          width: 370,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: ColorConstant.mycustomgrey),
            color: ColorConstant.mycustomblue,
          ),
          child: Center(
              child: Text(
            'Next',
            style: TextStyle(color: ColorConstant.backgroundwhite),
          )),
        ),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Color color, radioColor;
  const CustomBox({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
    required this.radioColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: color,
          ),
          color: ColorConstant.backgroundblack,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(color: ColorConstant.backgroundwhite),
            ),
            CircleAvatar(
              radius: 9,
              backgroundColor: ColorConstant.mycustomgrey,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: ColorConstant.backgroundblack,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: radioColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.mycustomblue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 55),
              child: Text(
                'Hi buddy !',
                style: TextStyle(
                    fontSize: 35,
                    color: ColorConstant.backgroundwhite,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, bottom: 100),
              child: Text(
                'lets make this day productive',
                style: TextStyle(
                    fontSize: 20,
                    color: ColorConstant.backgroundwhite,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorConstant.backgroundblack,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                  ),
                  children: [
                    SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "https://static.vecteezy.com/system/resources/previews/001/249/465/original/cute-science-lettering-and-laboratory-icons-banner-template-vector.jpg",
                            fit: BoxFit.fill,
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "https://1.bp.blogspot.com/-6nch2B8T22A/Xuc1c38ppUI/AAAAAAAAHWA/w2kd3GMnrUUiPvDs5olQE5gVqkx5jcoiQCK4BGAsYHg/s1500/dart.jpeg",
                            fit: BoxFit.fill,
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "https://i2.wp.com/softwareengineeringdaily.com/wp-content/uploads/2018/10/flutter.jpg?fit=1570%2C1500&ssl=1",
                            fit: BoxFit.cover,
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "https://st.depositphotos.com/1796303/4171/v/450/depositphotos_41711959-stock-illustration-games-flat-concept-icon-vector.jpg",
                            fit: BoxFit.cover,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

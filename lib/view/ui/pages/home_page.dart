import 'package:ecommerce_app/service/remote_data.dart';
import 'package:ecommerce_app/view/ui/widget/fade_text.dart';
import 'package:flutter/material.dart';

import '../style/color/my_color_app.dart';
import '../style/responsive/dimension.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  MealService service = MealService();
  late AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      body: FutureBuilder(
        future: service.getAll(),
        builder: (context, dataStat) {
          if (dataStat.hasData) {
            final meal = dataStat.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: responsive(context, 44),
                      left: responsive(context, 24),
                      right: responsive(context, 24),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.list,
                          color: ColorsApp.textColor,
                        ),
                        Icon(
                          Icons.shopping_basket,
                          color: ColorsApp.primaryColor,
                        )
                      ],
                    ),
                  ),
                  FadeText(
                    delay: Duration(milliseconds: 200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: responsive(context, 24),
                              top: responsive(context, 24)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Hello Tony, ',
                                    style: TextStyle(
                                      fontSize: responsive(context, 20),
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -1.1,
                                      color: ColorsApp.textColor,
                                    ),
                                  ),
                                  Text(
                                    'What fruit salad',
                                    style: TextStyle(
                                      fontSize: responsive(context, 20),
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -1.1,
                                      color: ColorsApp.textColor,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'combo do you want today?',
                                style: TextStyle(
                                  fontSize: responsive(context, 20),
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -1.1,
                                  color: ColorsApp.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: responsive(context, 22),
                            top: responsive(context, 16),
                          ),
                          child: Text(
                            'Recommended Combo',
                            style: TextStyle(
                              fontSize: responsive(context, 24),
                              fontWeight: FontWeight.w500,
                              letterSpacing: -1,
                              color: ColorsApp.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: responsive(context, 600),
                    child: GridView.builder(
                        itemCount: meal.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                                top: responsive(context, 16),
                                left: responsive(context, 16),
                                right: responsive(context, 16)),
                            height: responsive(context, 183),
                            width: responsive(context, 152),
                            margin: EdgeInsets.only(
                                left: responsive(context, 21),
                                right: responsive(context, 21),
                                bottom: responsive(context, 26)),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  responsive(context, 16)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(
                                      0x0D202020), // Equivalent to #2020200D (with 0D = 5% opacity)
                                  offset: Offset(0, 30), // X = 0, Y = 30
                                  blurRadius: 60, // blur radius
                                  spreadRadius: 0, // spread radius
                                ),
                              ],
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Align(
                                    child: Icon(
                                      Icons.favorite_outline,
                                      color: ColorsApp.primaryColor,
                                    ),
                                    alignment: Alignment.topRight,
                                  ),
                                  CircleAvatar(
                                    radius: responsive(context, 40),
                                    backgroundImage:
                                        NetworkImage(meal[index].strMealThumb),
                                  ),
                                  SizedBox(
                                    height: responsive(context, 8),
                                  ),
                                  Text(
                                    meal[index].strMeal,
                                    style: TextStyle(
                                      fontSize: responsive(context, 12),
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -1,
                                      color: ColorsApp.textColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: responsive(context, 12),
                                      // top: responsive(context, 10),
                                    ),
                                    child: Row(
                                      children: [
                                        // Text(
                                        //   meal[index].idMeal,
                                        //   style: TextStyle(
                                        //     fontSize: responsive(context, 16),
                                        //     fontWeight: FontWeight.w500,
                                        //     letterSpacing: -1,
                                        //     color: ColorsApp.primaryColor,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets/app_colors.dart';
import 'bmiresult.dart';
import 'dataofbmi.dart';

double weight = 50;
double age = 24;

class bmiscreen extends StatefulWidget {
  const bmiscreen({super.key});

  @override
  State<bmiscreen> createState() => _bmiscreenState();
}

class _bmiscreenState extends State<bmiscreen> {

  double height = 180;
  double bmi = 0;

  bool isMale = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,

        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [

            // Gender
            Expanded(
              child: Row(
                children: [

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },

                      child: gender(
                        Icons.male,
                        'male',
                        isMale,
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },

                      child: gender(
                        Icons.female,
                        'female',
                        !isMale,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Height
            Expanded(
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    const Text(
                      'Height',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 16,
                      ),
                    ),

                    Text(
                      '${height.toInt()} cm',

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Slider(
                      min: 50,
                      max: 220,
                      value: height,

                      activeColor: AppColors.pink,
                      inactiveColor: AppColors.grey,

                      onChanged: (value) {

                        setState(() {
                          height = value;
                        });

                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Weight + Age
            Expanded(
              child: Row(
                children: [

                  Expanded(
                    child: Dataofbmi(
                      'Weight',
                      weight,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Dataofbmi(
                      'Age',
                      age,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Calculate button
            SizedBox(
              width: double.infinity,
              height: 65,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.pink,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                onPressed: () {

                  bmi = weight /
                      ((height / 100) * (height / 100));

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Bmiresult(bmi),
                    ),
                  );
                },

                child: const Text(
                  'Calculate',

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Gender card
Widget gender(
  IconData icon,
  String text,
  bool selected,
) {

  return Container(

    decoration: BoxDecoration(
      color: selected
          ? AppColors.pink
          : AppColors.card,

      borderRadius: BorderRadius.circular(15),
    ),

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        Icon(
          icon,
          color: Colors.white,
          size: 75,
        ),

        const SizedBox(height: 10),

        Text(
          text,

          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}
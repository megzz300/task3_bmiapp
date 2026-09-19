import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets/app_colors.dart';

class Bmiresult extends StatelessWidget {

  final double bmi;

  const Bmiresult(
    this.bmi, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    String result;
    String message;

    if (bmi < 18.5) {

      result = 'UNDERWEIGHT';
      message = 'Your body weight is below normal';

    } else if (bmi < 25) {

      result = 'NORMAL';
      message = 'Your body weight is absolutely normal';

    } else if (bmi < 30) {

      result = 'OVERWEIGHT';
      message = 'Your body weight is above normal';

    } else {

      result = 'OBESE';
      message = 'Your body weight is much above normal';
    }

    return Scaffold(

      backgroundColor: AppColors.background,

      appBar: AppBar(

        backgroundColor: AppColors.background,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),

          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              'Your result',

              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Container(

                width: double.infinity,

                padding: const EdgeInsets.all(25),

                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(
                      result,

                      style: const TextStyle(
                        color: AppColors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 60),

                    Text(
                      bmi.toStringAsFixed(1),

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 60),

                    Text(
                      message,

                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

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
                  Navigator.of(context).pop();
                },

                child: const Text(
                  'Recalculate',

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
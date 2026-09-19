import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets/app_colors.dart';
import 'homebmi.dart';

class Dataofbmi extends StatefulWidget {

  final String text;
  final double data;

  const Dataofbmi(
    this.text,
    this.data, {
    super.key,
  });

  @override
  State<Dataofbmi> createState() => _DataofbmiState();
}

class _DataofbmiState extends State<Dataofbmi> {

  late double value;

  @override
  void initState() {
    super.initState();

    value = widget.data;
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Text(
            widget.text,

            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            value.toInt().toString(),

            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              // Minus
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.circle,

                child: IconButton(
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),

                  onPressed: () {

                    if (value > 1) {

                      setState(() {
                        value--;
                      });

                      if (widget.text == 'Weight') {
                        weight = value;
                      }

                      if (widget.text == 'Age') {
                        age = value;
                      }
                    }
                  },
                ),
              ),

              const SizedBox(width: 10),

              // Plus
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.circle,

                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),

                  onPressed: () {

                    setState(() {
                      value++;
                    });

                    if (widget.text == 'Weight') {
                      weight = value;
                    }

                    if (widget.text == 'Age') {
                      age = value;
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
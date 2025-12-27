import 'package:flutter/material.dart';

class AppButton extends StatelessWidget
{
  const AppButton({super.key, required this.title, this.onPressed});

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context)
  {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Colors.white,
              fontSize: 17
          ),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade900,
            fixedSize: Size(280, 55),
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(13))
        )
    );
  }
}

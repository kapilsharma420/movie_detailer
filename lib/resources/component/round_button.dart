import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mvvm/resources/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;

  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onpress,
  });
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //for debug print
        // print('clicked');

        //onpress per () lgani h call ker rahe hai
        
        onpress();
      },
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttoncolor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child:
              loading
                  ? CircularProgressIndicator(
                    color: AppColors.whiteColor,
                    strokeWidth: 5,
                  )
                  : Text(
                    title,
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
        ),
      ),
    );
  }
}

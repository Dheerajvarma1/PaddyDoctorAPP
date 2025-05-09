import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'findout.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.blue[600],
          body: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0.h, // Move image up if needed
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 1.0.sw, // Increase width (250% of screen width)
                    maxHeight:
                        1.0.sh, // Increase height (250% of screen height)
                  ),
                  child: Image.asset(
                    'assets/PaddyDoctor.png',
                    fit: BoxFit.cover, // Ensures the image fills space
                  ),
                ),
              ),
              // Image Section (Increase size here)
              Positioned(
                top: 350.h, // Move image up if needed
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 3.5.sw, // Increase width (250% of screen width)
                    maxHeight:
                        3.5.sh, // Increase height (250% of screen height)
                  ),
                  child: Image.asset(
                    'assets/farmer.png',
                    fit: BoxFit.cover, // Ensures the image fills space
                  ),
                ),
              ),
              // Get Started Button
              // Get Started Button
              Positioned(
                bottom: 1460.h,
                left: 450.h, // Increase this value to move the button UP
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                       builder: (context) =>  FindOutPage(),

                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: Size(450.w, 110.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 48.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.arrow_forward,
                        size: 70.sp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


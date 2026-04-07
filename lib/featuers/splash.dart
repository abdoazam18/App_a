import 'package:auth/core/assets/app_icone.dart';
import 'package:auth/core/assets/app_img.dart';
import 'package:auth/core/theme/app_colors.dart';
import 'package:auth/core/theme/app_text_style.dart';
import 'package:auth/core/utils/app_responsive.dart';
import 'package:auth/featuers/login/LoginScreen.dart';
import 'package:auth/featuers/registar/Registar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();

  
}
class _SplashState extends State<Splash> {



  @override
 void initState() {
  super.initState();
  
  Future.delayed(Duration(seconds: 10), () {

    Navigator.pushReplacement( context, MaterialPageRoute(builder: (_) =>Loginscreen()  ), );
        });
}

  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Appimg.splash),
            fit: BoxFit.cover,
          ),
        ),





        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SvgPicture.asset(
              APPicone.Icon,
              width: AppResponsiv.width(context) * 0.1, 
              height: AppResponsiv.height(context) * 0.1,
              colorFilter: ColorFilter.mode(AppColors.bgroundcolor, BlendMode.srcIn),
            ),

            SizedBox(height: 20),
            Text(
              "PlanrShop",
              style: AppTextStyle.txtbold20.copyWith(color: AppColors.bgroundcolor)
            ),


          ],
        ),
      ),
    );
  }
}
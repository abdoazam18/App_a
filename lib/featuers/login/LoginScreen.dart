import 'package:auth/core/assets/app_icone.dart';
import 'package:auth/core/theme/app_colors.dart';
import 'package:auth/core/theme/app_text_style.dart';
import 'package:auth/core/utils/app_responsive.dart';
import 'package:auth/featuers/registar/Registar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}



class _LoginscreenState extends State<Loginscreen> {
  // أضفنا مفتاح الفورم هنا تمهيداً لاستخدامه

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(

        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // لجعل العناصر في المنتصف عرضياً
              children: [
                SizedBox(height: AppResponsiv.height(context) * 0.05), // مسافة من الأعلى
                
                SvgPicture.asset(
                  APPicone.Icon,
                  width: AppResponsiv.width(context) * 0.1,
                  height: AppResponsiv.height(context) * 0.1,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),

                const SizedBox(height: 20),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Plant", style: AppTextStyle.txtsimbold16.copyWith(color: AppColors.hintcolor)),
                    Text("Shop", style: AppTextStyle.txtsimbold16.copyWith(color: AppColors.primaryColor)),
                  ],
                ),

                const SizedBox(height: 30),
                
                Text(
                  "Sign in to your account",
                  style: AppTextStyle.txtbold20.copyWith(color: AppColors.primaryColor),
                ),

                const SizedBox(height: 30),

                // 3. الجزء الذي سألت عنه بخصوص المارجن
                

                SizedBox(height: 10),

                // 3. الجزء الذي سألت عنه بخصوص المارجن
                  Container( 
                  margin:  EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // لجعل كلمة email تبدأ من اليسار
                    children: [
                      Text("Email Address", style: AppTextStyle.txtsimbold16.copyWith(color:AppColors.Textcolor)),
                       SizedBox(height: 8),
                      // أضفت لك هنا الـ TextFormField لترى كيف يوضع
                      TextFormField(
                        decoration:  InputDecoration(
                          hintText: 'Enter your Email Address',hintStyle:AppTextStyle.txtsid16.copyWith(color: AppColors.hintcolor),
                          
                          border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(15.0),

                            borderSide: BorderSide(
                            color:AppColors.primaryColor , // لون الإطار في الحالة العادية
                           width: 2.0,         // سماكة الخط
      ),
                          ),
                          
                          
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox( height: 10,),
                   Container(
  margin: EdgeInsets.symmetric(horizontal: 20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, // يضمن أن كل شيء يبدأ من البداية
    children: [
      Text(" Password", style: AppTextStyle.txtsimbold16.copyWith(color: AppColors.Textcolor)),
      SizedBox(height: 8),
      TextFormField(
        obscureText: true, // لإخفاء كلمات المرور (نقاط)
        decoration: InputDecoration(
          hintText: 'Enter your password',
          hintStyle: AppTextStyle.txtsid16.copyWith(color: AppColors.hintcolor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 2.0,
            ),
          ),
        ),
      ),
      
      // هنا جعلنا النص محاذى لليمين وقابل للضغط
      Align(
        alignment: Alignment.centerRight, // يمكنك تغييرها لـ centerLeft حسب لغة التطبيق
          child: Text(
            "Forgot password?",
            style: TextStyle(
              color: AppColors.primaryColor, // أو أي لون تختاره
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      
    ],
  ),
),

          

               SizedBox(height: 20,),

               Container(

                margin: EdgeInsets.all(20),
width: double.infinity,
                 child: ElevatedButton(
                   onPressed: () {
                   },
                   style: ElevatedButton.styleFrom(
                            
                     backgroundColor: AppColors.primaryColor, // لون الزر
                     foregroundColor: Colors.white, // لون النص
                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // الحجم
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(30), // زوايا منحنية
                     ),
                   ),
                   child: Text(" Sign in"),
                 ),

                 
               )
              
              ,
            Container(
              child:
             Align(
        alignment: Alignment.center, // يمكنك تغييرها لـ centerLeft حسب لغة التطبيق
          child: Text(
            "ve read and agreed to User \nAgreementand Privacy Policy?",
            style: TextStyle(
              color: const Color.fromARGB(255, 154, 165, 164), // أو أي لون تختاره
              fontWeight: FontWeight.bold,
            ),
          ),
        ),),

GestureDetector(
  onTap: () {
    // الكود المسؤول عن الانتقال لصفحة ثانية
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Registar()), // استبدل SecondPage باسم صفحتك
    );
  },
  child: Text("Don’t have an account? Create Account",
    style: TextStyle(
      color: const Color.fromARGB(255, 50, 92, 86), // لون أزرق ليعطي إيحاء بأنه رابط
      decoration: TextDecoration.underline, // وضع خط تحت النص
      fontSize: 18,
    ),
  ),

  
)

              ],
            ),




          ),
        ),
      ),
    );
  }
}
import 'package:fitness_tracker/common/color_extension.dart';
import 'package:fitness_tracker/common_widgets/on_boarding_page.dart';
import 'package:flutter/material.dart';

class OnBoardingview extends StatefulWidget {
  const OnBoardingview({super.key});

  @override
  State<OnBoardingview> createState() => _OnBoardingviewState();
}

class _OnBoardingviewState extends State<OnBoardingview> {
  int selectPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener((){
      selectPage = controller.page?.round() ?? 0;

      setState(() {
        
      });
    });
  }


  List pageArr = [
    {
      "title":"Track Your Goals",
      "subtitle":"Don't worry if you have trouble determining your goals, We can help you determine your goals and track your progress.",
      "image":"assets/Images/on_1.png"
    },
    {
      "title":"Burn Calories",
      "subtitle":"Let's keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever.",
      "image":"assets/Images/on_2.png"
    },
    {
      "title":"Eat Well",
      "subtitle":"Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun.",
      "image":"assets/Images/on_3.png"
    },
    {
      "title":"Improve Sleep \nQuality",
      "subtitle":"Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning.",
      "image":"assets/Images/on_4.png"
    },    
  ];

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Tcolor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [

          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context,index) {
              var pObj = pageArr[index] as Map ? ?? {};
              return OnBoardingPage(pObj: pObj);
            }
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: Tcolor.primaryColor1,
                    value: selectPage/4,  
                    strokeWidth: 2,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(color: Tcolor.primaryColor1, borderRadius: BorderRadius.circular(45)),
                  child: IconButton(icon: Icon(Icons.navigate_next,color: Tcolor.white),onPressed: () { 
                    if (selectPage < 3){
                      selectPage = selectPage + 1;                              
                      controller.jumpToPage(selectPage);
                
                    }else{
                      print("open welcome page");
                
                    }
                
                   },),
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
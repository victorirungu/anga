   import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return    Positioned(top: 0.0, child: 
        
        Container(
          width: MediaQuery.of(context).size.width,height: 70.0, color: Colors.transparent,
        child: 
        
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          
        const Padding(
           padding:  EdgeInsets.fromLTRB(20.0,12.0,0.0,0.0 ),
           child: Image(image: AssetImage("images/logo.png")),

         ) ,
         Row(
           children: [
             TextButton(onPressed: (){}, child: Text('Home  ',style: TextStyle(color: Colors.white,fontSize: 16.0, fontWeight: FontWeight.w300),)),
             TextButton(onPressed: (){}, child: Text('Events  ',style: TextStyle(color: Colors.white),)),
             TextButton(onPressed: (){}, child: Text('Schedule  ',style: TextStyle(color: Colors.white),)),
             TextButton(onPressed: (){}, child: Text('Coming soon  ',style: TextStyle(color: Colors.white),)),
             TextButton(onPressed: (){}, child: Text('My History  ',style: TextStyle(color: Colors.white),)),
             TextButton(onPressed: (){}, child: Text('Contact  ',style: TextStyle(color: Colors.white),)),
             
           ],
         ),
         Padding(
           padding: const EdgeInsets.only(right: 30.0),
           child: TextButton(onPressed: (){}, child: Text('Login',style: TextStyle(color: Colors.white),)),
         ),
        ],)
        
        ,));
  }
}

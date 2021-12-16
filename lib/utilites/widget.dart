import 'package:flutter/material.dart';

   const x=InputDecoration(
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color:Colors.blue,
      width: 2.0,
    ),
  ),
);

MaterialButton longButtons(String title, final VoidCallback? fun,
    {Color color: Colors.black, Color textColor: Colors.white}) {
  return MaterialButton(
    onPressed: fun,
    textColor: textColor,
    color: color,
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
    height: 45,
    minWidth: 600,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}

InputDecoration buildInputDecoration2(String hintText) {
  return InputDecoration(
    hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}


Container NewsWidget(){
  return Container(
                  height: 200,
                  width: 10,
                  color: Colors.black87,
                  child: Row(
                    
                    children: 
                    [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                          newsWidget1(),
                           newsWidget2(),
                           newsWidget3(),
                       ],

                      )
                  ],
                  ),
                  
                );
                
}

Container spaceNewsWidget(){
  return Container(height: 5,);
}

Container newsWidget1(){
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      
      children: [
        Text.rich(TextSpan(

           // default text style
          children: <TextSpan>[
            TextSpan(text: ' cairo news ', style: TextStyle(color: Colors.grey.withOpacity(0.7)),
            ),
            
          ],
        ),),

        Text.rich(TextSpan(
          
           // default text style
          children: <TextSpan>[
            TextSpan(text: 'messi scoring the second goal in the liverpool ', style: TextStyle(color: Colors.white.withOpacity(1)),
            ),
            
          ],
        ),),

        Text.rich(TextSpan(

           // default text style
          children: <TextSpan>[
            TextSpan(text: ' thursday, 16 December 2021 ', style: TextStyle(color: Colors.grey.withOpacity(0.7)),
            ),
            
          ],
        ),),

        
       
      ],
    ),
  );
}



Container newsWidget2(){
  return Container(
    child: Row(children: <Widget>[  
              Image.asset(
                'assets/images/news.jpg',
                 width: 340,
                 height: 120,
                 fit:BoxFit.fill
                 ),
                
            ],  ) 
  );
}

Container newsWidget3(){
  return Container(
    
    
    child: Row(
      
      children: [
        
        SizedBox(
  width: 40, 
  height: 30,
   // <-- Your width
  child: ElevatedButton(onPressed: (){}, child: Icon(Icons.favorite,size: 10,color: Colors.white,))
)
      ],
    ),
  );
}


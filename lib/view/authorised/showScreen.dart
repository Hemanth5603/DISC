import 'package:flutter/material.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({super.key});

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}
//https://istock.7xm.xyz/istock/images/7xm.xyz336064.jpg

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      bottomNavigationBar: Container(
        height: h * 0.09,
        width: w * 0.9,
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color:  Color.fromARGB(255, 33, 33, 33),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20,),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PRICE',style: TextStyle(fontSize: 15,fontFamily: 'sen',color: Color.fromARGB(255, 115, 115, 115)),),
                  SizedBox(height: 2),
                  Text('5.99 /song',style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: 'sen'),)
                ],
              ),
            ),
           const SizedBox(width: 70,),
            Container(
              width: 160,
              height: 50,
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                  Color.fromARGB(215, 69, 130, 209),
                  Color.fromARGB(197, 190, 113, 207),
                  ],
                )
              ),
              child:const Center(
                child: Text("Request a song",style: TextStyle(fontFamily: 'sen',fontSize: 16,color: Colors.white),),
              ),
            )
          ],
        ),
      ),
      body: Container(
        height: h * 0.9,
        width: w,
        child: Column(
          children: [
            Container(
              height: h * 0.4,
              width: w,
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    decoration:const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://img.freepik.com/free-photo/closeup-dj-working-blue-light_181624-18773.jpg?w=1060&t=st=1688849219~exp=1688849819~hmac=8e3c9ae92f564ba22be4e3d346d829b2adf013833c3311280cbb9d9c20a3b521'),
                        fit:BoxFit.cover,
                      )
                    ),
                  ),
                  Container(
                    decoration:const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromARGB(210, 16, 16, 16),
                          Color.fromARGB(0, 84, 84, 84),
                        ],
                        stops: [
                          0.2,
                          0.8
                        ]
                      )
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 50,
                    child: Text("Fuel Resto Bar",style: TextStyle(fontFamily: 'sen',fontSize: 25,color: const Color.fromARGB(255, 203, 203, 203)),),
                  )
                  
                ],
              ),
            )

          ],
        ),
      ),
  
    );
  }
}
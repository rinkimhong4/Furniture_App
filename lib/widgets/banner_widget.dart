import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        //
        Positioned(
          top: 50,
          right: -50,
          child: Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.skewX(-0.5),
            child: Container(
              width: 200,
              height: 70,
              decoration: BoxDecoration(color: Colors.blue.shade600),
            ),
          ),
        ),
        // Right-center image
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Image.network(
            'https://static.vecteezy.com/system/resources/thumbnails/034/629/699/small/stylish-scandinavian-style-armchair-with-mint-green-upholstery-wooden-legs-perfect-for-modern-home-interior-lounge-chair-on-transparent-background-cut-out-furniture-front-view-ai-generated-png.png',
            fit: BoxFit.contain,
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 16, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Summer Sale",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Up to 70% off selected items",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
                onPressed: () {
                  // print('Shop Now');
                },
                child: Text("Shop Now"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

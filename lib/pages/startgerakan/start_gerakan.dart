import 'package:flutter/material.dart';

import '../detectionpage/detect_page.dart';

class ExerciseDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(59, 120, 138, 0.7),
        title: Text('Bridge Pose'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage('assets/images/pose.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 200,
                width: double.infinity,
              ),
              SizedBox(height: 16),
              Text(
                'Bridge Pose ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  SizedBox(width: 4),
                  Text('3.8', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 16),
                  Icon(Icons.access_time, size: 20),
                  SizedBox(width: 4),
                  Text('13 min', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 16),
                  Icon(Icons.local_fire_department, size: 20),
                  SizedBox(width: 4),
                  Text('312 cal', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Latihan ini membantu memperkuat otot punggung, panggul, dan paha, serta membuka dada dan bahu. Selain itu, pose ini juga dapat meningkatkan fleksibilitas tulang belakang dan meredakan ketegangan pada bagian bawah punggung....',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetectPage(selectedPose: 'Bridge-Pose'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(59, 120, 138, 0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 0),
                ),
                child: Text(
                  'Start Training',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeatedAngels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(59, 120, 138, 0.7),
        title: Text('Seated Wall Angels'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage('assets/images/seated.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 200,
                width: double.infinity,
              ),
              SizedBox(height: 16),
              Text(
                'Seated Wall Angels ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  SizedBox(width: 4),
                  Text('3.8', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 16),
                  Icon(Icons.access_time, size: 20),
                  SizedBox(width: 4),
                  Text('13 min', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 16),
                  Icon(Icons.local_fire_department, size: 20),
                  SizedBox(width: 4),
                  Text('312 cal', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'latihan terapi yang efektif untuk meningkatkan mobilitas tulang belakang dan bahu dengan mengurangi ketegangan otot punggung atas melalui gerakan perlahan yang dilakukan sambil duduk menempel di dinding....',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetectPage(selectedPose: 'Seated-Wall-Angels'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(59, 120, 138, 0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 0),
                ),
                child: Text(
                  'Start Training',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

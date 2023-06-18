import 'package:flutter/material.dart';
import 'package:lms_fiverr/ui/my_lessons.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.7,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            color: Colors.blue,
            width: double.infinity,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.network(
                      'https://media.istockphoto.com/id/1440356809/photo/artificial-intelligence-technology-robot-futuristic-data-science-data-analytics-quantum.jpg?s=2048x2048&w=is&k=20&c=0xltOl6JlYJsVVkuBk3b5Qw1Y5TvqOme3lQwc8gFSy8=',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text(
                    'User',
                  ),
                  const Text('user@gmail.com')
                ],
              ),
            ),
          ),
          const Row(
            children: [
              Icon(
                Icons.home,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Text('Home')
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MyLessons()));
            },
            child: const Text('My Lessons'),
          ),
          const Expanded(child: SizedBox()),
          const Text('Logout'),
        ],
      ),
    );
  }
}

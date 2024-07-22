import 'dart:async';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map<String, String>> promotions = [];
  List<Map<String, String>> recommendations = [];

  final PageController _pageController = PageController(viewportFraction: 0.8);
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Simulate initial load of promotions and recommendations
    _loadPromotions();
    _loadRecommendations();
    // Start auto-scrolling
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _loadPromotions() {
    // Simulated data
    setState(() {
      promotions.addAll([
        {'name': 'Promotion 1', 'image': 'assets/promotion.jpg', 'price': '12.00'},
        {'name': 'Promotion 2', 'image': 'assets/promotion2.jpg', 'price': '15.00'},
        {'name': 'Promotion 3', 'image': 'assets/promotion3.jpg', 'price': '10.00'},
        {'name': 'Promotion 4', 'image': 'assets/promotion4.jpg', 'price': '18.00'},
        {'name': 'Promotion 5', 'image': 'assets/promotion5.jpg', 'price': '20.00'},
      ]);
    });
  }

  void _loadRecommendations() {
    // Simulated data
    setState(() {
      recommendations.addAll([
        {'name': 'Menu Item 1', 'image': 'assets/menu.jpg', 'price': '10.00'},
        {'name': 'Menu Item 2', 'image': 'assets/menu2.jpg', 'price': '11.00'},
        {'name': 'Menu Item 3', 'image': 'assets/menu3.jpg', 'price': '12.00'},
        {'name': 'Menu Item 4', 'image': 'assets/menu4.jpg', 'price': '13.00'},
      ]);
    });
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage < promotions.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Menu
            Text(
              'Beranda',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search menu...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Implement search functionality here
                print('Search keyword: $value');
              },
            ),
            SizedBox(height: 20),

            // Promotion Display with Horizontal Scroll
            SizedBox(height: 8),
            Container(
              height: 250,
              child: PageView.builder(
                controller: _pageController,
                itemCount: promotions.length,
                itemBuilder: (context, index) {
                  return _buildPromotionItem(promotions[index]);
                },
              ),
            ),

            // Recommendations Display
            SizedBox(height: 20),
            Text(
              'Recommendation',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 8),
            _buildRecommendationList(),
          ],
        ),
      ),
    );
  }

  Widget _buildPromotionItem(Map<String, String> promotion) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                promotion['image']!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    promotion['name']!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$${promotion['price']}',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75, // Adjust as needed
      ),
      itemCount: recommendations.length,
      itemBuilder: (context, index) {
        return _buildRecommendationItem(recommendations[index]);
      },
    );
  }

  Widget _buildRecommendationItem(Map<String, String> recommendation) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              recommendation['image']!,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recommendation['name']!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${recommendation['price']}',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeView(),
  ));
}

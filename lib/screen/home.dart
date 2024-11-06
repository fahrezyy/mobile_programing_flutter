import 'package:flutter/material.dart';
import 'product_detail.dart';
import 'cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _products = [
    {'title': 'Nike Jordan', 'price': 72.5, 'oldPrice': 84.5, 'imagePath': 'assets/nike_jordan.jpg'},
    {'title': 'Adidas Samba', 'price': 48.3, 'oldPrice': 54.3, 'imagePath': 'assets/samba.jpg'},
    {'title': 'Puma Classic', 'price': 65.0, 'oldPrice': 70.0, 'imagePath': 'assets/puma_classic.jpg'},
    {'title': 'Reebok Runner', 'price': 55.0, 'oldPrice': 60.0, 'imagePath': 'assets/reebok_runner.jpg'},
    {'title': 'Converse All Star', 'price': 50.0, 'oldPrice': 55.0, 'imagePath': 'assets/converse.jpg'},
    {'title': 'Vans Knu Skool', 'price': 62.0, 'oldPrice': 68.0, 'imagePath': 'assets/vans.jpg'},
    {'title': 'Nike Dunk', 'price': 60.0, 'oldPrice': 72.5, 'imagePath': 'assets/dunk.jpg'},
    {'title': 'Adidas Samba OG', 'price': 48.0, 'oldPrice': 54.5, 'imagePath': 'assets/adidas2.jpg'},
    {'title': 'Puma Ferrari', 'price': 82.5, 'oldPrice': 88.5, 'imagePath': 'assets/puma1.jpg'},
    {'title': 'Adidas Nizza', 'price': 42.0, 'oldPrice': 55.0, 'imagePath': 'assets/adidas3.jpg'},
  ];
  
  final List<String> _brandLogos = [
    'assets/logo_nike.png',
    'assets/logo_adidas.png',
    'assets/logo_puma.png',
    'assets/logo_reebok.png',
    'assets/logo_converse.png',
    'assets/logo_vans.png',
  ];

  int _displayCount = 4;

  void _viewMore() {
    setState(() {
      _displayCount = (_displayCount + 4 <= _products.length) ? _displayCount + 4 : _products.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.orange,
                        size: 18, // Sesuaikan ukuran ikon
                      ),
                      const SizedBox(width: 4), // Jarak antara ikon dan teks
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Send to:',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            'Solo, Indonesia',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart, color: Colors.grey),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartScreen()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 7),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search shoes...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'HOLIDAY EDITION',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'PROMO 75%',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/holiday.png',
                          width: 100,
                          height: 45,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 6),
                        ElevatedButton(
                          onPressed: () {
                            // Define your action here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                          child: const Text(
                            'Get Voucher',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _brandLogos.map((logoPath) {
                  return Image.asset(
                    logoPath,
                    width: 30,
                    height: 30,
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Product Popular',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (_displayCount < _products.length)
                    TextButton(
                      onPressed: _viewMore,
                      child: const Text(
                        'View More',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  itemCount: _displayCount,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return _buildProductCard(
                      context,
                      product['title'],
                      product['price'],
                      product['oldPrice'],
                      product['imagePath'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String title, double price, double oldPrice, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              title: title,
              price: price,
              oldPrice: oldPrice,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '\$$price',
                        style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '\$$oldPrice',
                        style: const TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

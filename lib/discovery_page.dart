import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class ApiService {
  static Future<List<Map<String, dynamic>>> fetchDiscoveryData(
      int page, int limit) async {
    final response = await http.get(Uri.parse(
        'https://api-stg.together.buzz/mocks/discovery?page=$page&limit=$limit'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(jsonData['data']);
    } else {
      throw Exception('Failed to load discovery data: ${response.statusCode}');
    }
  }
}

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _discoveryData = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _page = 1;
  int _limit = 10; // Initial limit

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _fetchData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchData();
    }
  }

  Future<void> _fetchData() async {
    if (!_isLoading && _hasMore) {
      setState(() {
        _isLoading = true;
      });

      try {
        final newData =
            await ApiService.fetchDiscoveryData(_page, _limit);
        if (newData.isEmpty) {
          setState(() {
            _hasMore = false;
          });
        } else {
          setState(() {
            _discoveryData.addAll(newData);
            _page++;
          });
        }
      } catch (e) {
        // Handle error
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to load data: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

 Color _generateRandomColor() {
  Random random = Random();
  
  // Generate random color components
  int red = random.nextInt(128) + 128; // Adjusted to generate brighter colors (128-255)
  int green = random.nextInt(128) + 128; // Adjusted to generate brighter colors (128-255)
  int blue = random.nextInt(128) + 128; // Adjusted to generate brighter colors (128-255)
  
  // Return the color
  return Color.fromARGB(255, red, green, blue);
}

Gradient _generateRandomGradient() {
  final random = Random();
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.pink,
    Colors.green,
    Colors.yellow,
    Color.fromARGB(255, 199, 45, 94), // Bright pink
    Color(0xFFF05151), // Bright red
    Color.fromARGB(192, 193, 70, 199), // Bright purple
    Color.fromARGB(255, 255, 98, 35), // Bright orange
    Color.fromARGB(255, 255, 181, 71), // Brighter orange
    Color.fromARGB(255, 67, 194, 116), // Bright green
    Color.fromARGB(255, 45, 137, 239), // Brighter blue
    Color.fromARGB(255, 158, 0, 0), // Deep red
    Color.fromARGB(255, 204, 51, 255), // Hot pink
    Color.fromARGB(255, 255, 102, 178), // Flamingo pink
    Color.fromARGB(255, 0, 204, 153), // Aquamarine
    Color.fromARGB(255, 255, 153, 51), // Tangerine
    Color.fromARGB(255, 0, 102, 204), // Sapphire blue
    Color.fromARGB(255, 255, 0, 102), // Magenta
    Color.fromARGB(255, 51, 102, 0), // Forest green
    Color.fromARGB(255, 255, 102, 0), // Sunburst orange
    Color.fromARGB(255, 102, 0, 153), // Plum purple
    Color.fromARGB(255, 255, 0, 255), // Electric purple
  ];
  final Color color = colors[random.nextInt(colors.length)];
  return LinearGradient(
    colors: [color.withOpacity(0.3), color.withOpacity(0.3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}



  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Discovery Page'),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1), // Set app bar color
    ),
    body: ListView.builder(
      controller: _scrollController,
      itemCount: _discoveryData.length + (_hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < _discoveryData.length) {
          final item = _discoveryData[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: _generateRandomGradient(),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                title: Text(item['title'] ?? ''),
                subtitle: Text(item['description'] ?? ''),
              ),
            ),
          );
        } else {
          return _isLoading
              ? Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                )
              : Container(); // Placeholder for the loading indicator
        }
      },
    ),
  );
}
}

void main() {
  runApp(MaterialApp(
    home: DiscoveryPage(),
  ));
}

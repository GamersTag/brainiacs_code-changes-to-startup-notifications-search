import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> _profiles = ['Profile 1', 'Profile 2', 'Profile 3'];
  final List<String> _allCategories = ['Programming', 'Technology', 'Science', 'AI', 'Space', 'Maths', 'UI/UX'];
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  String? _selectedCategory;
  bool _showAllCategories = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SEARCH',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search profiles...",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Icon(Icons.search, color: Colors.blue[900]),
                prefixIcon: Icon(Icons.search, color: Colors.blue[900]),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _profiles.length,
              itemBuilder: (context, index) {
                final profile = _profiles[index];
                if (profile.toLowerCase().contains(_searchQuery)) {
                  return ListTile(
                    title: Text(profile, style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold)),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryBox('Programming'),
                      _buildCategoryBox('Technology'),
                      _buildCategoryBox('Science'),
                      _buildCategoryBox('Artificial Intelligence'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showAllCategories =!_showAllCategories;
              });
            },
            child: Text("Show All Categories", style: TextStyle(color: Colors.blue[900])),
          ),
          if (_showAllCategories)
            Expanded(
              child: ListView.builder(
                itemCount: _allCategories.length,
                itemBuilder: (context, index) {
                  final category = _allCategories[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: ListTile(
                      leading: Icon(Icons.category, color: Colors.blue[900]),
                      title: Text(category, style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold)),
                      onTap: () {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryBox(String category) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        category,
        style: TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}

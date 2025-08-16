import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CitySelectorView extends StatefulWidget {
  const CitySelectorView({super.key});

  @override
  State<CitySelectorView> createState() => _CitySelectorViewState();
}

class _CitySelectorViewState extends State<CitySelectorView> {
  final TextEditingController searchController = TextEditingController();
  
  final List<Map<String, String>> cities = [
    {'name': 'Yaoundé', 'region': 'Centre'},
    {'name': 'Douala', 'region': 'Littoral'},
    {'name': 'Bafoussam', 'region': 'Ouest'},
    {'name': 'Bamenda', 'region': 'Nord-Ouest'},
    {'name': 'Garoua', 'region': 'Nord'},
    {'name': 'Maroua', 'region': 'Extrême-Nord'},
    {'name': 'Ngaoundéré', 'region': 'Adamaoua'},
    {'name': 'Bertoua', 'region': 'Est'},
    {'name': 'Ebolowa', 'region': 'Sud'},
    {'name': 'Foumban', 'region': 'Ouest'},
    {'name': 'Kribi', 'region': 'Sud'},
    {'name': 'Limbe', 'region': 'Sud-Ouest'},
    {'name': 'Buea', 'region': 'Sud-Ouest'},
    {'name': 'Edéa', 'region': 'Littoral'},
    {'name': 'Kumba', 'region': 'Sud-Ouest'},
  ];
  
  List<Map<String, String>> filteredCities = [];
  
  @override
  void initState() {
    super.initState();
    filteredCities = cities;
    searchController.addListener(_filterCities);
  }
  
  void _filterCities() {
    final query = searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredCities = cities;
      } else {
        filteredCities = cities.where((city) {
          return city['name']!.toLowerCase().contains(query) ||
                 city['region']!.toLowerCase().contains(query);
        }).toList();
      }
    });
  }
  
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CitySelectorView(),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Header avec barre de recherche
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(
              top: 12,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Column(
              children: [
                // Indicateur de glissement (drag handle)
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Barre de recherche
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: searchController,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Rechercher votre ville',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey[400],
                        size: 22,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Liste des villes
          Expanded(
            child: filteredCities.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_off_outlined,
                          size: 64,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Aucune ville trouvée',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Essayez avec un autre nom',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: filteredCities.length,
                    itemBuilder: (context, index) {
                      final city = filteredCities[index];
                      final isLast = index == filteredCities.length - 1;
                      
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Retourner la ville sélectionnée
                              Navigator.pop(context, city['name']);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              child: Row(
                                children: [
                                  // Icône de localisation
                                  Container(
                                    width: 36,
                                    height: 36,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF1A237E),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  
                                  // Nom de la ville
                                  Expanded(
                                    child: Text(
                                      city['name']!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ),
                                  
                                  // Flèche
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.grey[400],
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          
                          // Divider
                          if (!isLast)
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: Colors.grey[200],
                              indent: 72,
                            ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

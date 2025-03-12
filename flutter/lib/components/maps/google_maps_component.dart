import 'dart:async';
import 'dart:convert';
import 'package:components/common/common_data.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class GoogleMapsComponent extends StatefulWidget {
  const GoogleMapsComponent({super.key});

  @override
  State<GoogleMapsComponent> createState() => _GoogleMapsComponentState();
}

class _GoogleMapsComponentState extends State<GoogleMapsComponent> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  TextEditingController _searchController = TextEditingController();
  List<dynamic> _placeResults = [];
  LatLng? _selectedLocation;
  Marker? _marker;

  final String apiKey = "$key1-$key2"; // Replace with your API Key

  /// Fetch place predictions from Google Places API
  Future<void> fetchPlaceSuggestions(String input) async {
    if (input.isEmpty) return;

    final String url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _placeResults = data["predictions"];
      });
    } else {
      print("Failed to fetch places: ${response.body}");
    }
  }

  /// Fetch place details (latitude & longitude)
  Future<void> fetchPlaceDetails(String placeId) async {
    final String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      double lat = data["result"]["geometry"]["location"]["lat"];
      double lng = data["result"]["geometry"]["location"]["lng"];

      LatLng newLocation = LatLng(lat, lng);

      // Move camera & add marker
      GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLngZoom(newLocation, 14));

      setState(() {
        _selectedLocation = newLocation;
        _marker = Marker(
          markerId: const MarkerId("selected_location"),
          position: newLocation,
          infoWindow: const InfoWindow(title: "Selected Location"),
        );
        _placeResults.clear(); // Clear search results after selection
        _searchController.clear(); // Clear search input field
      });
    } else {
      print("Failed to fetch place details: ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Maps")),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: _kGooglePlex,
            markers: _marker != null ? {_marker!} : {},
          ),

          // Search Bar
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
                  ),
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: "Search Location",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: fetchPlaceSuggestions,
                  ),
                ),

                // Search Results List
                if (_placeResults.isNotEmpty)
                  Container(
                    height: 200,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
                    ),
                    child: ListView.builder(
                      itemCount: _placeResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_placeResults[index]["description"], 
                            style: TextStyle(color: Colors.black),
                          ),
                          onTap: () {
                            fetchPlaceDetails(_placeResults[index]["place_id"]);
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

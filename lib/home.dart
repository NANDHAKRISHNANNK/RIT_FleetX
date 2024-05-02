import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import 'map.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late List<Widget> tabs;
  int index = 0;

  @override
  void initState() {
    super.initState();
    tabs = [
      // Home screen
      SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 240,
                width: 360,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(6, 10),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 35,),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(
                          Icons.directions_bus, // Add your bus icon here
                          size: 30,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'R-1 : ENNORE',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Next Stop',
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 55,),
                        Text(
                          ' Time',
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Central',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 55,),
                        Text(
                          ' IN >> 30MIN ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Time: 5.50 AM',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),

        ),


      ),
      // Map screen
      //const Center(child: Text("Map")),
      Container(
        height: 800, // Set the height of the map
        width: 400, // Set the width of the map
        child: SfMaps(
          layers: [
            MapTileLayer(
              initialZoomLevel: 7, // Zoom level
              urlTemplate: 'https://a.tile.openstreetmap.org/{z}/{x}/{y}.png',
              initialFocalLatLng: MapLatLng(13.0421, 80.1436), // Tamil Nadu center coordinates
            ),
          ],
        ),
      ),





      // Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => MapPage()), // Navigate to the MapPage
      //       );
      //     },
      //     child: Text('Open Google Maps'),
      //   ),
      // ),





      // Attendance screen
      const Center(child: Text("Attendance")),





      // Buses table screen
      SingleChildScrollView(
        child: Column(
          children: [
            buildTable(['R-1 : ENNORE', 'TIME'], isHeader: true),
            buildTable([' Life_gate', '5.50AM']),
            buildTable([' Wimco Market', '5.55AM']),
            buildTable([' Periyar Nagar', '6.00AM']),
            buildTable([' Theradi', '6.10AM']),
            buildTable([' Royapuram Bridge', '6.30AM']),
            buildTable([' Central', '6.40AM']),
            buildTable([' Amjikarai Market', '6.54AM']),
            buildTable([' RIT Campus', '7.40AM']),
            const SizedBox(height: 35),
            buildTable([' R-2 : Triplicane', 'TIME'], isHeader: true),
            buildTable([' D1 Police Station ', '6.25AM']),
            buildTable([' Triplicane -High Way ', '6.29AM']),
            buildTable([' Choolaimedu Subway ', '6.43AM']),
            buildTable([' Anna Arch ', '6.50AM']),
            buildTable([' RIT Campus am', '7.40AM']),
            const SizedBox(height: 35),
            buildTable([' R-3 : CHOOLAI', 'TIME'], isHeader: true),
            buildTable([' Pulianthope ', '6.20 AM']),
            buildTable([' Water tank road signal ', '6.40AM']),
            buildTable([' Anna Nagar Roundtana ', '6.55AM']),
            buildTable([' VR Mall ', '7.00AM']),
            buildTable([' RIT Campus ', '7.40 AM']),
            const SizedBox(height: 35),
            buildTable(['R-11 Chengalpattu', 'TIME'], isHeader: true),
            buildTable([' Srinivasapuram  ', '6.00AM']),
            buildTable([' Urapakkam ', '6.10AM']),
            buildTable([' Perungalathur', ' 6.20AM']),
            buildTable([' T.B.Hospital ', '6.30AM']),
            buildTable([' RIT Campus ', '7.40AM']),
          ],
        ),
      ),
    ];
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Rit Transport")),
      ),
      body: tabs[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.zoom_in_map_sharp),
            label: "Map",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Person",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bus_alert),
            label: "Bus",
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (currentIndex) {
          setState(() {
            index = currentIndex;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'RIT STUDENT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('PROFILE'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text('BUS INFO'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed logic here
        },
        tooltip: 'Microphone',
        backgroundColor: Colors.red,        child: const Icon(Icons.bus_alert_sharp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget buildTable(List<String> cells, {bool isHeader = false}) {
    return Column(
      children: [
        Center(
          child: Table(
            border: TableBorder.all(),
            columnWidths: const {
              0: FractionColumnWidth(0.5),
              1: FractionColumnWidth(0.25),
            },
            children: [buildRow(cells, isHeader: isHeader)],
          ),
        ),
      ],
    );
  }

  TableRow buildRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Text(
              cell,
              style: TextStyle(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Homepage(),
  ));
}

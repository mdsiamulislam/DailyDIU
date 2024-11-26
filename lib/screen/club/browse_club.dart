import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrowseClub extends StatelessWidget {
  static final String id = 'browse_club';
  const BrowseClub({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for clubs and events
    final clubs = [
      {'name': 'Programming Club', 'description': 'Learn to code!', 'logo': Icons.code},
      {'name': 'Photography Club', 'description': 'Capture the moment.', 'logo': Icons.camera_alt},
      {'name': 'Music Club', 'description': 'Feel the rhythm.', 'logo': Icons.music_note},
    ];

    final joinedClubs = ['Programming Club', 'Music Club'];

    final events = [
      {'title': 'Hackathon 2024', 'date': 'Dec 5', 'image': 'https://via.placeholder.com/300x150'},
      {'title': 'Photography Contest', 'date': 'Dec 10', 'image': 'https://via.placeholder.com/300x150'},
      {'title': 'Music Jam', 'date': 'Dec 15', 'image': 'https://via.placeholder.com/300x150'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Clubs'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel for events
              const Text(
                'Running and Upcoming Events',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CarouselSlider(
                items: events.map((event) {
                  return Card(
                    elevation: 3,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Image.network(
                          event['image']!,
                          width: double.infinity,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: Colors.black54,
                          width: double.infinity,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${event['title']} - ${event['date']}',
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 160,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
              ),

              const SizedBox(height: 20),

              // Section: Joined Clubs
              const Text(
                'Your Clubs',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              if (joinedClubs.isNotEmpty)
                Column(
                  children: joinedClubs.map((clubName) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Text(clubName[0]),
                        ),
                        title: Text(clubName),
                        subtitle: const Text('You are a member of this club.'),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          // Navigate to the club's details
                        },
                      ),
                    );
                  }).toList(),
                )
              else
                const Text('You haven’t joined any clubs yet!'),

              const SizedBox(height: 20),

              // Section: All Clubs
              const Text(
                'All Clubs',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                children: clubs.map((club) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(club['logo'] as IconData),
                      ),
                      title: Text(club['name'] as String),
                      subtitle: Text(club['description'] as String),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        // Navigate to the club's details
                      },
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

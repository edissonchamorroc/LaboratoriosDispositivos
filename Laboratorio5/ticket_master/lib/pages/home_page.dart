import 'package:flutter/material.dart';
import 'package:ticket_master/pages/review_page.dart';
import 'package:ticket_master/respository/ticket_master_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TicketMasterApi _eventsInformation = TicketMasterApi();
  List<Map<String, dynamic>> sportEvents = [];
  List<Map<String, dynamic>> musicEvents = [];
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    fetchEvents('sports', sportEvents);
    fetchEvents('music', musicEvents);
  }

  Future<void> fetchEvents(
      String keyword, List<Map<String, dynamic>> events) async {
    try {
      final data = await _eventsInformation.searchEventsByKeyword(keyword);
      final seenTitles = <String>{};
      final filteredEvents = (data['_embedded']['events'] as List)
          .map((event) => {
                'id': event['id'],
                'title': event['name'] ?? 'Evento sin título',
                'images': event['images'] != null && event['images'].isNotEmpty
                    ? event['images']
                    : '',
              })
          .where((event) {
        final title = event['title'] as String;
        if (seenTitles.contains(title)) {
          return false;
        } else {
          seenTitles.add(title);
          return true;
        }
      }).toList();

      setState(() {
        events.clear();
        events.addAll(filteredEvents);
      });
    } catch (e) {
      print('Error fetching events: $e');
    }
  }

  String getImage(var images) {
    String ulrImage = '';
    for (var i = 0; i < images.length; i++) {
      if (images[i]['width'] == 305) ulrImage = images[i]['url'];
    }
    return ulrImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Deportes",
                  style: TextStyle(
                    fontSize: 23,
                  )),
            ),
            SizedBox(
              height: 300.0,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: sportEvents.length,
                itemBuilder: (context, index) {
                  final event = sportEvents[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ReviewPage(eventId: event['id']),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            getImage(event['images']),
                            fit: BoxFit.fitWidth,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            event['title'] ?? 'Evento sin título',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Musica",
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
            ),
            SizedBox(
              height: 300.0,
              child: PageView.builder(
                itemCount: musicEvents.length,
                itemBuilder: (context, index) {
                  final event = musicEvents[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ReviewPage(eventId: event['id']),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            getImage(event['images']),
                            fit: BoxFit.fitWidth,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            event['title'] ?? 'Evento sin título',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

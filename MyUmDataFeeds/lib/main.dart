import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'customcard.dart';
import 'eventcard.dart';
// external libraries
import 'package:http/http.dart' as http; // performs network requests
import 'package:xml/xml.dart'; // parses XML
// https://news.miami.edu/feeds/latest-25.xml

// make a network request
Future<String> fetchXML(String url) async {
  final output = await http.get(Uri.parse(url));
  return (output.body);
}

void main() {
  runApp(const MyUM());
}

class MyUM extends StatelessWidget {
  const MyUM({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyUmApp(),
    );
  }
}
class MyUmApp extends StatefulWidget {
  const MyUmApp({super.key});

  @override
  State<MyUmApp> createState() => _MyUmAppState();
}

class _MyUmAppState extends State<MyUmApp> {

  // "https://exposure.accelerator.net/production/photos/04i951mdm0f9byd3rbsdnid0h0997ve5oypl/original.jpg;resize(1400,_).jpg?auto=webp"
  //  "This is the title"
  //  "Established in 1925 during the region's famous real estate boom, the University now comprises 12 schools and colleges serving undergraduate and graduate students in nearly 350 majors and programs."


  int currentIndex = 0;

  // var resImgs = [
  //     "https://news.miami.edu/_assets/images-stories/2025/03/dust-ingestion-hero-790x527.jpg",
  //     "https://news.miami.edu/_assets/images-stories/2025/02/explosion-research-on-hearing-loss-hero-790x527.jpg",
  //     "https://news.miami.edu/_assets/images-stories/2025/02/guilio-palummieri-runner-hero-365.jpg",
  //     "https://news.miami.edu/_assets/images-stories/2025/02/xrday-2025-hero-365.jpg",
  //     "https://news.miami.edu/_assets/images-stories/2025/02/oceanlife-hero-790x5271.jpg",
  //     "https://news.miami.edu/_assets/images-stories/2025/01/big-cypress-forest-research-hero-790x527.jpg",
  //     "https://news.miami.edu/_assets/images-stories/2025/01/cormorant-anhingas-breeding-hero-940x529.jpg",
  // ];
  // var resTitles = [
  //   "Exposing the ‘DIRT’ on dust",
  //   "A striking impact on health",
  //   "‘Run a lot, sleep a lot, eat a lot’",
  //   "Sharing insights about the future of XR",
  //   "'A fertilizer for the sea'",
  //   "Mapping Big Cypress National Preserve",
  //   "New insights about Florida’s most common diving birds",
  // ];
  // var resSummaries = [
  //   "In one of the few studies of its kind, a University of Miami doctoral student and others have documented the particle size of household dust found on children’s hands after play activities.",
  //   "A team of researchers at the University of Miami is studying how blasts can damage the human body and exploring ways that scientists can prevent further hearing and balance difficulties.",
  //   "Giulio Palummieri, who finished fourth in the recent Miami Marathon, applies the same persistent, patient approach to his lab research at the Miller School of Medicine as he does to his long-distance training.",
  //   "The University’s first Miami XR conference attracted industry leaders and educators from across the nation who discussed integrating extended reality in our lives.", 
  //   "A University of Miami ocean sciences Ph.D. student and five others recently returned from an expedition to the North Atlantic where they investigated the impact of Saharan dust and volcanic ash on the ocean’s ecosystem.",
  //   "A team of graduate researchers, led by biology professor Ken Feeley in the University of Miami College of Arts and Sciences, is tracking the growth and decline of pine trees to understand how the preserve’s ecosystem is evolving.",
  //   "University of Miami biologists shed light on the physiology and behavior of cormorants and anhingas.",
  // ];

  // var univImgs = [
  //   "https://news.miami.edu/_assets/images-stories/2025/03/greenu-office-program-video-hero-790x527.jpg",
  //   "https://news.miami.edu/_assets/images-stories/2025/03/chief-rivero-retirement-hero-365.jpg",
  //   "https://news.miami.edu/_assets/images-stories/2025/02/leadership-insights-hero-365.jpg",
  //   "https://news.miami.edu/_assets/images-stories/2025/02/singing-valentines-hero-790x527.jpg",
  //   "https://news.miami.edu/_assets/images-stories/2025/02/scholarship-donor-celebration-2025-hero-790x527.jpg",
  //   "https://news.miami.edu/_assets/images-stories/2025/01/provost-search-hero-790x527.jpg",
  //   "https://news.miami.edu/_assets/images-stories/2025/01/centennial-new-york-event-hero-940x529.jpg",
  // ];
  // var univTitles = [
  //   "Championing sustainability",
  //   "UMPD transitions to new leadership",
  //   "Navigating the leadership journey",
  //   "The singing valentines",
  //   "Breaking barriers, building futures",
  //   "Provost Search Committee to host listening sessions",
  //   "Alumni Engagement kicks off new year in New York",
  // ];
  // var univSummaries = [
  //   "The GreenU Office Program champions a commitment to sustainability in the office—reducing waste, conserving energy, and adopting eco-friendly practices. Join the movement.",
  //   "After a 19-year career as the University of Miami’s chief of police, during which he implemented several measures that improved the department, David Rivero is stepping down, turning over the reins to veteran officer Trevor Shinn, with whom he shares a common bond.",
  //   "As part of a virtual seminar focused on leadership, University leaders highlighted the importance of authenticity, advancing the welfare of others, and honoring their own stories.",
  //   "Members of the Beta Tau Chapter of the Phi Mu Alpha Sinfonia spread a little love this Valentine’s Day, with a heartwarming serenade.",
  //   "Donors and scholarship recipients came together at the 2025 Scholarship Donor Celebration to share stories of impact, gratitude, and opportunity.",
  //   "Three listening sessions will take place via Zoom to gather direct input from the University community.",
  //   "More than 200 New York-based Canes celebrated the University’s Sprint to Our Centennial at The Pierre hotel in New York City.",
  // ];

  // var eventTitles = [
  //   "Global Sport Industry Conference",
  //   "NEW UM FREE CME - \"Screening for Hepatitis B & C\"",
  //   "Building a Fulfilling Retirement",
  //   "Sustainability 101 Webinar",
  //   "Fine-Tuning Large Language Models to Facilitate Precision Medicine",
  //   "Bee Keeping 101",
  // ];

  // var eventImgs = [
  //   "https://localist-images.azureedge.net/photos/48959051200433/card@2x/486d70704228cb45469282189da5cefa40fece48.jpg",
  //   "https://localist-images.azureedge.net/photos/45588525024850/card/88555d585c8493b7989bac6f3b2ab9d50f97f2b5.jpg",
  //   "https://localist-images.azureedge.net/photos/48799169941087/card@2x/69cd669d70a58db794558d1c93aae51b1ff4303a.jpg",
  //   "https://localist-images.azureedge.net/photos/37395424723741/card/4efd86eba6fe78147f15fee0c56589286b04a6b4.jpg",
  //   "https://localist-images.azureedge.net/photos/49209845043388/card/2608d368ae9ab2fbf59dabbd5f7f6401d4220128.jpg",
  //   "https://localist-images.azureedge.net/photos/46057603043157/card/6f0524a4daa3bfe124ab29fbf39f1905dd2321ee.jpg",
  // ];

  // var eventDates = [
  //   "March 27, 2025",
  //   "March 27, 2025",
  //   "March 27, 2025",
  //   "March 28, 2025",
  //   "March 28, 2025",
  //   "April 4, 2025",
  // ];

  // var eventLocations = [
  //   "Shalala Student Center",
  //   "Virtual Event",
  //   "Virtual Event",
  //   "Virtual Event",
  //   "Sylvester Support Services Building, Auditorium Room 110",
  //   "Richter Library, 1st floor - Flex Space B",
  // ];

  List<Widget> myNews = [];
  List<Widget> myNews2 = [];
  List<Widget> myNews3 = [];
  
  @override void initState() {
    // TODO: implement initState
    super.initState();
    fetchXML('https://news.miami.edu/feeds/latest-25.xml')
      .then((data) {
      //data was received
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');

      newsitems.forEach((newsitem){
        // we access newsitem
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img);
        var title = newsitem.getElement('title')?.innerText;
        print(title);
        var summary = newsitem.getElement('abstract')?.innerText;
        print(summary);

        // to add items to a list or collection, we use the .add method
        myNews.add(CustomCard(img!, title!, summary!));
      });
    }).catchError((error){
      print('error getting data: $error');
    });

    fetchXML('https://news.miami.edu/sonhs/feeds/student-stories-feed.xml')
      .then((data) {
      //data was received
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');

      newsitems.forEach((newsitem){
        // we access newsitem
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img);
        var title = newsitem.getElement('title')?.innerText;
        print(title);
        var summary = newsitem.getElement('abstract')?.innerText;
        print(summary);

        // to add items to a list or collection, we use the .add method
        myNews2.add(CustomCard(img!, title!, summary!));
      });
    }).catchError((error){
      print('error getting data: $error');
    });

    fetchXML('https://news.miami.edu/frost/feeds/all-news-15.xml')
      .then((data) {
      //data was received
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');

      newsitems.forEach((newsitem){
        // we access newsitem
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img);
        var title = newsitem.getElement('title')?.innerText;
        print(title);
        var summary = newsitem.getElement('abstract')?.innerText;
        print(summary);

        // to add items to a list or collection, we use the .add method
        myNews3.add(CustomCard(img!, title!, summary!));
      });
    }).catchError((error){
      print('error getting data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyUM", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.orange.shade50,
      body: Center(
        child: <Widget>[
          Dashboard(),
          ListView(children: myNews,),
          ListView(children: myNews2,),
          ListView(children: myNews3,),
        ][currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.orange.shade100,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        indicatorColor: Colors.green.shade900,
        selectedIndex: currentIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(Icons.dashboard, color: Colors.green.shade900),
            selectedIcon: Icon(Icons.dashboard, color: Colors.white),
            label: "Dashboard"),
          NavigationDestination(
            icon: Icon(Icons.people, color: Colors.green.shade900),
            selectedIcon: Icon(Icons.people, color: Colors.white),
            label: "University News"),
          NavigationDestination(
            icon: Icon(Icons.medical_services, color: Colors.green.shade900),
            selectedIcon: Icon(Icons.medical_services, color: Colors.white),
            label: "Nursing News"),
          NavigationDestination(
            icon: Icon(Icons.music_note, color: Colors.green.shade900),
            selectedIcon: Icon(Icons.music_note, color: Colors.white),
            label: "Frost News"),
        ] 
      )
    );
  }
}
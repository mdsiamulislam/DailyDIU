import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dailydiu/screen/auth/login_screen.dart';
import 'package:dailydiu/screen/club/browse_club.dart';

import '../component/widget/club_card.dart';
import '../component/widget/event_card.dart';
import '../component/widget/feature_icon.dart';
import '../component/widget/section_header.dart';
import '../constant/features.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String token = '';
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (!isLoggedIn) {
      Navigator.pushReplacementNamed(context, LoginScreen.id);
    } else {
      fetchToken();
    }
  }

  Future<void> fetchToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fetchedToken = prefs.getString('token') ?? '';
    setState(() {
      token = fetchedToken;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
            if (index == 1) {
              Navigator.pushNamed(context, BrowseClub.id);
            }else if (index == 2) {
              // Open Side Drower Menu
              _scaffoldKey.currentState?.openDrawer();

            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Clubs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header Section
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              // Making Image caraousel
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                ),
                items: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[100],
                    ),
                    child: Center(
                      child: Image(image: NetworkImage('https://scontent.fdac138-1.fna.fbcdn.net/v/t39.30808-6/468429938_1579762012835795_1147296313201999674_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeEuF_nh-4ZHeAcRjIYDG_AnqHGSHO-BM8mocZIc74EzyYwRPREl0doE3h9_aru8OjMmItEiXazKqLQCis4xsA9k&_nc_ohc=VN5l19Zp_OsQ7kNvgH2GVz1&_nc_zt=23&_nc_ht=scontent.fdac138-1.fna&_nc_gid=AvDFht5ehBeL0qHoPMM7hZG&oh=00_AYCBlEhDNEAUmRE0qsZQVUFMRTB2-mb9SXNcryp1_W2DVQ&oe=674CC5D5')),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[200],
                    ),
                    child: Center(
                      child: Image(image: NetworkImage('https://scontent.fdac138-2.fna.fbcdn.net/v/t39.30808-6/468353222_1578922429586420_4997878008843944343_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=aa7b47&_nc_eui2=AeEYn_FCjeqGNhM8zVpEDkR2dwMKvgigZlh3Awq-CKBmWCcsxoGOQdZLMa0-qGAdx5Lw_BvWtaORfr36i4e87aVo&_nc_ohc=NbGQ3ECYkGgQ7kNvgEWM2Z-&_nc_zt=23&_nc_ht=scontent.fdac138-2.fna&_nc_gid=AM2dVaiWxAkaXSlIKViJGIa&oh=00_AYBB7haEfN_P4yFsqlEOnD0Dvwd2T9t9_MKlweFSg_8dMg&oe=674CCA59')),

                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[300],
                    ),
                    child: Center(
                      child: Image(image: NetworkImage('https://scontent.fdac138-2.fna.fbcdn.net/v/t39.30808-6/467896506_1576423966502933_8684493160978334166_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeGqDW3sFhw8wV8x6hHlbKAmJ810gEjHiuUnzXSASMeK5fhFxT5qsmIX45Bgv-Igm4Ci995Ax3513pLA77haEeRl&_nc_ohc=7QzbiMk4ttUQ7kNvgFasbdi&_nc_zt=23&_nc_ht=scontent.fdac138-2.fna&_nc_gid=Au0pGyT_51OCXZsk-6DDQBj&oh=00_AYDM1w5sM81LMRvr6PZA2mPZgY-CBanyKXbrj1YuQdwFbQ&oe=674CC07F')),

                    ),
                  ),
                ],
              )
            ),
            const SizedBox(height: 20),

            // Features Section
            SectionHeader(title: "Features"),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: features.length,
              itemBuilder: (context, index) {
                return FeatureIcon(
                  icon: features[index]['icon'] as IconData,
                  label: features[index]['label'] as String,
                );
              },
            ),
            const SizedBox(height: 20),

            // Your Clubs Section
            SectionHeader(title: "Your Clubs"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  ClubCard(title: "DIU CPC"),
                  ClubCard(title: "DIU CDS"),
                  ClubCard(title: "DIU FF"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Upcoming Events Section
            SectionHeader(title: "Upcoming Events"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  EventCard(),
                  EventCard(),
                  EventCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      );
  }
}








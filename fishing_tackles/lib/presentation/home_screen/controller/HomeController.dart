import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  var selectedCategory = 0.obs; // To track the selected category
  var selectedBottomNavItem = 0.obs; // To track the selected bottom nav item
  var currentIndex = 0.obs; // To track the current carousel slider index

  // List of images for the carousel slider
  final carouselImages = [
    'https://coastalfishing.com.au/cdn/shop/files/Banner_1_e0f6827e-1bf1-4f8a-9b97-ab0289c88e30.png?v=1733455208&width=3000', // Correct image URL
    'https://i.ytimg.com/vi/t-1Y4WTToCQ/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBd0eiik2WGokCw523YU3_sgtk1pw',
    'https://www.anglingdirect.co.uk/media/blog/Black_Ticket_Event_Promo.jpg',
  ];
}
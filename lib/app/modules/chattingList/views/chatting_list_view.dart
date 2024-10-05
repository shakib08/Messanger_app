import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import flutter_screenutil
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/chatting_list_controller.dart';

class ChattingListView extends GetView<ChattingListController> {
  ChattingListView({super.key}); // Constructor
  final TextEditingController _searchController = TextEditingController();
String _getFirstTwoWords(String message) {
  List<String> words = message.split(' '); // Split message by spaces
  return words.length > 3 ? '${words[0]} ${words[1]}..' : message;
}
void _showPopupMenu(BuildContext context, Offset position) async {
  await showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(
      position.dx, // x position of the dropdown
      position.dy, // y position of the dropdown (below the icon)
      position.dx + 50, // Define the right boundary for the dropdown
      position.dy + 50, // Define the bottom boundary for the dropdown
    ),
    items: [
      PopupMenuItem<String>(
        value: 'Channel 1',
        child: Text('Channel 1'),
        
      ),
      PopupMenuItem<String>(
        value: 'Channel 2',
        child: Text('Channel 2'),
      ),
      PopupMenuItem<String>(
        value: 'Channel 3',
        child: Text('Channel 3'),
      ),
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isloading.value == false
          ? Scaffold(
              // Default AppBar
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: Padding(
                  padding: EdgeInsets.all(8.w), // Responsive padding
                  child: InkWell(
                    onTap: (){
                      Get.toNamed(Routes.CONTACT_DETAIL);
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/david.png'),
                      radius: 20.r, // Responsive avatar size using flutter_screenutil
                    ),
                  ),
                ),
             title: Row(
children: [
  Text(
    'All Channels',
    style: TextStyle(
      color: Colors.black, fontSize: 18.sp), // Responsive text size
  ),
  GestureDetector(
    onTapDown: (TapDownDetails details) {
      
      _showPopupMenu(context, details.globalPosition); // Call to open the custom menu
    },
    child: Icon(
      Icons.arrow_drop_down_outlined,
      color: Colors.black,
      size: 24.sp,
    ),
  ),
],



),

                actions: [
                  IconButton(
                    onPressed: () {
                      controller.toggleMultiSelect(); // Toggle state using controller
                    },
                    icon: Icon(Icons.select_all,
                        color: Colors.pink, size: 24.sp), // Responsive icon size
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  // Search Field Below AppBar
            

                  // Conditional Row to show when multi-select is enabled
                  if (controller.isMultiSelect.value) _buildMultiSelectRow(),
      Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Background color for the search field
                        borderRadius: BorderRadius.circular(20.r), // Rounded corners
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, size: 24.sp, color: Colors.grey), // Search icon
                          hintText: 'Search...', // Placeholder text
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        onChanged: (value) {
                          // Implement search logic here
                        },
                      ),
                    ),
                  ),
                  // Chatting List
                  Expanded(




                    child: ListView(
                      children: [



                        _buildChatItem(
                          context,
                          'assets/david.png',
                          'Robert Olivdigo',
                          'Yes sure! I can do',
                          '10:27 PM',
                          Colors.purpleAccent,
                          Icons.done_all,
                        ),




                                 _buildChatItem(
                          context,
                          'assets/1.png',
                          'Ilhan Omar',
                          'How can I help you br...',
                          '5:20 PM',
                          Colors.green,
                          Icons.message,
                        ),
                                 _buildChatItem(
                          context,
                          'assets/2.png',
                          'Micheal David',
                          'How can I help you br...',
                          '5:20 PM',
                          Colors.green,
                          Icons.message,
                        ),
                                 _buildChatItem(
                          context,
                          'assets/3.png',
                          'Micheal David',
                          'How can I help you br...',
                          '5:20 PM',
                          Colors.green,
                          Icons.message,
                        ),
                                 _buildChatItem(
                          context,
                          'assets/4.png',
                          'ZoBiden',
                          'How can I help you br...',
                          '5:20 PM',
                          Colors.green,
                          Icons.telegram_outlined,
                        ),
                                 _buildChatItem(
                          context,
                          'assets/5.png',
                          'Amla',
                          'How can I help you br...',
                          '5:20 PM',
                          Colors.green,
                          Icons.message,
                        ),
                                 _buildChatItem(
                          context,
                          'assets/6.png',
                          'Clinton hilary',
                          'How can I help you br...',
                          '5:20 PM',
                          Colors.green,
                          Icons.message,
                        ),
                                 _buildChatItem(
                          context,
                          'assets/7.png',
                          'Milar ',
                          'How can I help you br...',
                          '5:20 PM',
                          Colors.green,
                          Icons.message,
                        ),
                        _buildChatItem(
                          context,
                          'assets/david.png',
                          'Micheal David',
                          'How can I help you br...',
                          '5:20 PM',
                          Colors.green,
                          Icons.message,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: Colors.pinkAccent,
                unselectedItemColor: Colors.grey,
                currentIndex: 0, // Adjust this as needed
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble, size: 24.sp), // Responsive icon size
                    label: 'All(96)',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications, size: 24.sp),
                    label: 'All(21)',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person, size: 24.sp),
                    label: 'Mine(52)',
                  ),
                ],
              ),
            )
          : Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h), // Responsive height
                    // Logo or Icon
                    Image.asset(
                      'assets/top_logo.png', // Foreground logo
                      width: 100.w, // Responsive width for image
                      height: 100.h, // Responsive height for image
                    ),
                    SizedBox(height: 20.h),
                    // App Name Text
                    Text(
                      'MessageMind',
                      style: TextStyle(
                        fontSize: 24.sp, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // Progress bar with 80% width
                    Obx(() {
                      return Column(
                        children: [
                          SizedBox(
                            width: 0.8.sw, // 80% of screen width
                            child: LinearProgressIndicator(
                              value: controller.progress.value / 100, // Using controller's value
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(Colors.pink),
                              minHeight: 5.h, // Responsive height
                            ),
                          ),
                          SizedBox(height: 10.h),
                          // Progress percentage text
                          Text(
                            '${controller.progress.value.toStringAsFixed(0)}%',
                            style: TextStyle(
                              fontSize: 16.sp, // Responsive font size
                              color: Colors.black,
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 20.h),
                    // Loading Text
                    Text(
                      'Loading . . .',
                      style: TextStyle(
                        fontSize: 16.sp, // Responsive font size
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }







  

  Widget _buildMultiSelectRow() {
    return Container(
      padding: const EdgeInsets.all(4.0),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children:  [
              Icon(Icons.radio_button_checked, color: Colors.pink),
              SizedBox(width: 1.w),
              Text('(0)', style: TextStyle(color: Colors.black)), // Dynamic selection count
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  controller.toggleMultiSelect(); // Close the multi-select row
                },
                icon:  Icon(Icons.message, color: Colors.pink, size: 13.sp),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle "Assign to AI" action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800], // Dark button background
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child:  Text(
                    'Assign to AI',
                    style: TextStyle(color: Colors.white, fontSize: 6.sp),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle "Assign to Team" action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800], // Dark button background
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    children:  [
                      Text('Assign to Team', style: TextStyle(color: Colors.white, fontSize: 5.sp)),
                      Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.toggleMultiSelect(); // Close the multi-select row
                },
                icon:  Icon(Icons.close, color: Colors.pink, size: 13.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }









  Widget _buildChatItem(
  BuildContext context,
  String avatarPath,
  String name,
  String lastMessage,
  String time,
  Color statusColor,
  IconData statusIcon,
) {
  return GestureDetector(
    onTap: () {
      // Navigate to the chat screen when the user clicks the chat item
      Get.toNamed('/chating');
    },
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w), // Responsive padding
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            backgroundImage: AssetImage(avatarPath),
            radius: 25.r, // Responsive avatar size
          ),
          SizedBox(width: 12.w), // Responsive space between avatar and content

          // Name, last message, and badges
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row with Name and Status Badges
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp, // Responsive text
                      ),
                    ),
                    SizedBox(width: 5.w), // Space between name and badge
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h), // Badge padding
                      decoration: BoxDecoration(
                        color: Colors.orange[100], // Badge background color
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.circle, color: Colors.orange, size: 10.sp), // Badge icon
                          SizedBox(width: 2.w),
                          Text(
                            'Issac', // Dynamic badge content
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Last message text
                Row(
                  children: [
                    Icon(Icons.done_all),
                    SizedBox(width: 3),
                    Text(
                      _getFirstTwoWords(lastMessage),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600], // Grey color for last message
                      ),
                      maxLines: 1, // Limit message to 1 line
                      overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w), // Space between text and time/status icons
          // Time and Status Icons
          Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: Colors.green[100], // Background color for the status badge
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      '16h', // Dynamic status duration
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp), // Time text
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.call_received, color: statusColor, size: 17.sp),
                  Icon(statusIcon, color: statusColor, size: 17.sp),
                ],
              ),
            ],
          ),
          SizedBox(width: 12.w), // Space between time and action icon
        ],
      ),
    ),
  );
}

}

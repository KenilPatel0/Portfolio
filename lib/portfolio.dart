// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:portfolio/app_colors.dart';
//
// import 'Widgets/focus.dart';
//
// class SimpleScrollRevealDemo extends StatefulWidget {
//   @override
//   State<SimpleScrollRevealDemo> createState() => _SimpleScrollRevealDemoState();
// }
//
// class _SimpleScrollRevealDemoState extends State<SimpleScrollRevealDemo> with TickerProviderStateMixin {
//   final ScrollController _scrollController = ScrollController();
//   double _scrollOffset = 0.0;
//
//   // Number of project rows (each row has two cards)
//   final int _rows = 5;
//
//   late final List<AnimationController> _rowControllers;
//   late final List<Animation<double>> _rowAnimations;
//   late final List<bool> _hasTriggered;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create animation controller for each row
//     // Duration: controls how long the animation takes (800ms = 0.8 seconds)
//     // Increase for slower animation, decrease for faster
//     _rowControllers = List.generate(_rows, (i) {
//       return AnimationController(
//         vsync: this,
//         duration: const Duration(milliseconds: 1500), // CHANGE THIS to adjust animation speed
//       );
//     });
//
//     // Create curved animation for smooth easing
//     // Curves.easeOutCubic: starts fast and slows down at the end
//     // Other options: Curves.easeInOut, Curves.elasticOut, Curves.bounceOut
//     _rowAnimations = _rowControllers.map((ctr) => CurvedAnimation(parent: ctr, curve: Curves.easeOutCubic // CHANGE THIS to adjust animation style
//         )).toList();
//
//     // Track which rows have already been animated (prevents re-triggering)
//     _hasTriggered = List.generate(_rows, (_) => false);
//
//     // Listen to scroll events
//     _scrollController.addListener(() {
//       setState(() {
//         _scrollOffset = _scrollController.offset;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     for (final c in _rowControllers) c.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   // ANIMATION TRIGGER LOGIC
//   // This checks each row and triggers animation when it comes into viewport
//   void _maybeTriggerRows(double screenHeight) {
//     for (int i = 0; i < _rows; i++) {
//       if (_hasTriggered[i]) continue; // Skip if already animated
//
//       // Calculate the position of each row
//       // Top header section = 368px (50 + 268 + 50)
//       // Each row height = screenHeight - 200
//       final double rowTop = 368 + (i * (screenHeight - 180));
//
//       // Current scroll position
//       final double viewportTop = _scrollOffset;
//
//       // TRIGGER POINT: when row enters bottom 40% of screen
//       // Adjust 0.6 to control when animation starts:
//       // - 0.5 = triggers when row reaches middle of screen
//       // - 0.7 = triggers when row is 70% up the screen (earlier)
//       // - 0.3 = triggers when row is 30% up the screen (later)
//       final double triggerPoint = viewportTop + (screenHeight * 0.6); // CHANGE 0.6 to adjust trigger timing
//
//       if (rowTop <= triggerPoint && rowTop >= viewportTop - screenHeight) {
//         _hasTriggered[i] = true;
//         _rowControllers[i].forward(); // Start the animation
//       }
//     }
//   }
//
//   Widget _buildRow(int rowIndex, double screenHeight) {
//     final anim = _rowAnimations[rowIndex];
//
//     return Container(
//       height: screenHeight - 180,
//       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // CONTENT AREA - Row stays static, only cards animate
//           Expanded(
//             child: Row(
//               children: [
//                 // Pass animation to each card so they can animate independently
//                 Expanded(child: _ProjectCardSimple(index: rowIndex * 2 + 1, animation: anim)),
//                 const SizedBox(width: 24),
//                 Expanded(child: _ProjectCardSimple(index: rowIndex * 2 + 2, animation: anim)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//
//     // Check for animations after each frame is rendered
//     WidgetsBinding.instance.addPostFrameCallback((_) => _maybeTriggerRows(screenHeight));
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         controller: _scrollController,
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         physics: const ClampingScrollPhysics(),
//         child: Column(
//           children: [
//             SizedBox(height: 50),
//             Container(
//               height: 268,
//               width: 1360,
//               color: Colors.grey,
//             ),
//             SizedBox(height: 50),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   '2026',
//                   style: GoogleFonts.inter(color: AppColors.lightBlack, fontSize: 72),
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       'Portfolio',
//                       style: GoogleFonts.inter(color: AppColors.white, fontSize: 72),
//                     ),
//                     SizedBox(width: 5),
//                     Text(
//                       'Feed',
//                       style: GoogleFonts.inter(color: AppColors.white, fontSize: 20),
//                     ),
//                     SizedBox(width: 5),
//                     Container(
//                       height: 24,
//                       width: 24,
//                       color: AppColors.white,
//                     )
//                   ],
//                 ),
//               ],
//             ),
//             // Build each row with animation
//             for (int i = 0; i < _rows; i++) _buildRow(i, screenHeight),
//
//             // Footer spacing
//             SizedBox(height: 120),
//             FocusSection(),
//             SizedBox(height: 120),
//             Container(
//               // height: 1610,
//               width: 1380,
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         'Focus',
//                         style: GoogleFonts.inter(color: Color(0xffc4c4c4), fontSize: 20),
//                       ),
//                       SizedBox(width: 4),
//                       Container(
//                         height: 24,
//                         width: 24,
//                         color: Colors.grey.shade200,
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 24),
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: 673,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Container(
//                               height: 672,
//                               width: 673,
//                               color: Colors.grey.shade200,
//                             ),
//                             SizedBox(height: 12),
//                             Text(
//                               'Name of Article',
//                               style: GoogleFonts.inter(color: Color(0xffc4c4c4), fontSize: 20),
//                             ),
//                             SizedBox(
//                               height: 8,
//                             ),
//                             Text(
//                               'Shobhit kumar.com was featured on steelmanner, a long-standing showcase of expeptonal web and interactive design.',
//                               style: GoogleFonts.inter(color: Color(0xff5c5c5c), fontSize: 20),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(width: 34),
//                       SizedBox(
//                         width: 673,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Container(
//                               height: 672,
//                               width: 673,
//                               color: Colors.grey.shade200,
//                             ),
//                             SizedBox(height: 12),
//                             Text(
//                               'Name of Article',
//                               style: GoogleFonts.inter(color: Color(0xffc4c4c4), fontSize: 20),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Shobhit kumar.com was featured on steelmanner, a long-standing showcase of expeptonal web and interactive design.',
//                               style: GoogleFonts.inter(color: Color(0xff5c5c5c), fontSize: 20),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 34),
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: 672,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Container(
//                               height: 673,
//                               width: 672,
//                               color: Colors.grey.shade200,
//                             ),
//                             SizedBox(height: 12),
//                             Text(
//                               'Name of Article',
//                               style: GoogleFonts.inter(color: Color(0xffc4c4c4), fontSize: 20),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Shobhit kumar.com was featured on steelmanner, a long-standing showcase of expeptonal web and interactive design.',
//                               style: GoogleFonts.inter(color: Color(0xff5c5c5c), fontSize: 20),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(width: 34),
//                       SizedBox(
//                         width: 672,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Container(
//                               height: 673,
//                               width: 672,
//                               color: Colors.grey.shade200,
//                             ),
//                             SizedBox(height: 12),
//                             Text(
//                               'Name of Article',
//                               style: GoogleFonts.inter(color: Color(0xffc4c4c4), fontSize: 20),
//                             ),
//                             Text(
//                               'Shobhit kumar.com was featured on steelmanner, a long-standing showcase of expeptonal web and interactive design.',
//                               style: GoogleFonts.inter(color: Color(0xff5c5c5c), fontSize: 20),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 120),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _ProjectCardSimple extends StatelessWidget {
//   final int index;
//   final Animation<double> animation; // Animation passed from parent
//
//   const _ProjectCardSimple({required this.index, required this.animation});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 20),
//       height: 533,
//       width: 673,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // TEXT STAYS STATIC (NO ANIMATION)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 height: 16,
//                 width: 16,
//                 color: Colors.grey.shade200,
//               ),
//               SizedBox(width: 10),
//               Text('CATEGORY', style: GoogleFonts.inter(fontSize: 14, color: Color(0xffd6d6d6))),
//             ],
//           ),
//           Text(
//             'Name of Project',
//             style: GoogleFonts.inter(fontSize: 20, color: Color(0xffc4c4c4)),
//           ),
//           Text(
//             'Type of Project',
//             style: GoogleFonts.inter(fontSize: 20, color: Color(0xff5c5c5c)),
//           ),
//           Spacer(),
//
//           // ONLY THIS WHITE CONTAINER ANIMATES
//           AnimatedBuilder(
//             animation: animation,
//             builder: (context, child) {
//               // UPWARD MOVEMENT ANIMATION
//               // translateY: controls how far up the element moves
//               // Formula: (1 - animation.value) * distance
//               // - When animation.value = 0 (start): translateY = 50 (element is 50px down)
//               // - When animation.value = 1 (end): translateY = 0 (element at normal position)
//               // CHANGE 50 to adjust how far container starts from (higher = starts further down)
//               final double translateY = (1 - animation.value) * 50; // CHANGE 50 to adjust starting offset
//
//               // FADE-IN ANIMATION
//               // opacity: controls visibility (0 = invisible, 1 = fully visible)
//               // animation.value goes from 0 to 1 during animation
//               final double opacity = animation.value.clamp(0.0, 1.0);
//
//               return Opacity(
//                 opacity: opacity,
//                 child: Transform.translate(
//                   offset: Offset(0, translateY),
//                   child: child,
//                 ),
//               );
//             },
//             child: Container(
//               height: 392,
//               color: Colors.grey.shade100,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

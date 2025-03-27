class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Find Your Next Opportunity',
      image: 'Assets/images/IMG@1x (1) (1).png',
      discription: "Discover promising startups and connect with""innovative founders. Our smart matching""algorithm helps you find the perfect""opportunities. "
  ),
  UnbordingContent(
      title: 'Connect & Communicate',
      image: 'Assets/images/startup.png',
      discription: "Seamlessly collaborate with team members""through our integrated messaging platform.""Share ideas, files, and updates in real-time "
  ),
  UnbordingContent(
      title: 'Network & Grow',
      image: 'Assets/images/IMG@1x (4) 1.png',
      discription: "Join exclusive events and expand your network.""Connect with industry leaders and like-minded""professionals at our curated meetups."
      ),
];
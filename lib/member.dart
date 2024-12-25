class Member {
  final String name;
  final String id;
  final String status;
  final String? checkInTime;
  final String? checkOutTime;
  final double latitude;
  final double longitude;

  Member({
    required this.name,
    required this.id,
    required this.status,
    this.checkInTime,
    this.checkOutTime,
    required this.latitude,
    required this.longitude,
  });
}

List<Member> fakeMembers = [
  Member(
    name: 'Vishesh Tanwar',
    id: 'WSL0003',
    status: 'WORKING',
    checkInTime: '09:30 am',
    latitude: 28.6454444444, // Example coordinates
    longitude: 77.1243888889,
  ),
  Member(
    name: 'Himanshu Rawat',
    id: 'WSL0034',
    status: 'PRESENT',
    checkInTime: '09:30 am',
    checkOutTime: '06:40 pm',
    latitude: 28.6271944444, 
    longitude:77.1306944444,
  ),
  Member(
    name: 'Arun Williamson',
    id: 'WSL0054',
    status: 'NOT LOGGED-IN YET',
    latitude: 28.6423055556,
    longitude: 77.1259444444,
  ),
  Member(
    name: 'Ayush Gilberg',
    id: 'WSL0054',
    status: 'NOT LOGGED-IN YET',
    latitude: 28.6728611111,
    longitude: 77.1373611111,
  ),
  // Add more members...
];

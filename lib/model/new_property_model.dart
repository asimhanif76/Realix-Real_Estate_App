class PropertyModel {
  String streetAddress;
  String city;
  String state;
  String zipCode;
  DateTime? meetingDate;
  String? meetingTime;
  String timeToSell;
  String reasonForSelling;
  String description;
  String propertyType;
  double lotSize;
  int yearBuilt;
  int fullBaths;
  int bedrooms;
  double monthlyRent;
  double securityDeposit;
  String phoneNumber;
  String? additionalInfo;
  List<String> amenities;

  PropertyModel({
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
    this.meetingDate,
    this.meetingTime,
    required this.timeToSell,
    required this.reasonForSelling,
    required this.description,
    required this.propertyType,
    required this.lotSize,
    required this.yearBuilt,
    required this.fullBaths,
    required this.bedrooms,
    required this.monthlyRent,
    required this.securityDeposit,
    required this.phoneNumber,
    this.additionalInfo,
    required this.amenities,
  });
}

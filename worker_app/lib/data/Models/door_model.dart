class ReservationResponse {
  late bool status;
  late String message;
  late int reservationId;
  late bool? attendance;
  late int numberOfPlaces;
  late int? attendanceNumber;
  late int? sectionNumber;
  late String customerName;
  late int? customerId;
  late int? workerId;

  ReservationResponse({
    required this.status,
    required this.message,
     required this.reservationId,
    this.attendance,
    required this.numberOfPlaces,
    this.attendanceNumber,
    this.sectionNumber,
    required this.customerName,
    this.customerId,
    this.workerId,
  });

  factory ReservationResponse.fromJson(Map<String, dynamic> json,String type) {
    return ReservationResponse(
      status: json['status'],
      message: json['message'],
       reservationId: json[type]['reservation_id']??0,
      attendance: json[type]['attendance']??false,
      numberOfPlaces: json[type]['number_of_places']??0,
      attendanceNumber: json[type]['attendance_number']??0,
      sectionNumber: json[type]['section_number']??0,
      customerName: json[type]['customer_name']??'',
      customerId: json[type]['customer_id'],
      workerId: json[type]['worker_id'],
    );
  }
}

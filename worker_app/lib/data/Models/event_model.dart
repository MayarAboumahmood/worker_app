
import 'package:worker_app/data/Models/photo_model.dart';

import '../../constant/date.dart';
import '../../constant/dividing_date.dart';

class EventModel {
  String title;
  String description;
  int ticketPrice;
  int availablePlaces;
  String bandName;
  MyDate beginDate;
  int? adminId;
  List<PhotoModel> images; 
  int id;
  EventModel(
      {required this.title,
      required this.availablePlaces,
      required this.beginDate,
      required this.id,
      required this.description,
      required this.ticketPrice,
      required this.images,
      this.adminId,
      required this.bandName});
  factory EventModel.fromMap(Map<String, dynamic> map) {
    List<dynamic> photosList = map['photos'] ?? [];
    List<PhotoModel> photos = photosList
        .map((photoMap) => PhotoModel.fromMap(photoMap))
        .toList();
        DateTimeParser t=DateTimeParser(map['begin_date']);
        MyDate time=t.parseDateTime();
        
    return EventModel(
      title: map['title'] ?? '',
      availablePlaces: map['available_places'] ?? '',
      beginDate: time,
      description: map['description'] ?? '',
      ticketPrice: map['ticket_price'] ?? 0,
      bandName: map['band_name'] ?? '',
      images:photos,
      id:map['event_id']??0
    );
  }

  
}

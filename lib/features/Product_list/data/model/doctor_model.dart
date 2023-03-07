// // To parse this JSON data, do
// //
// //     final doctorModel = doctorModelFromJson(jsonString);
//
// import 'dart:convert';
//
// DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));
//
// String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());
//
// class DoctorModel {
//   DoctorModel({
//     required this.status,
//     required this.errNum,
//     this.msg,
//     required this.data,
//   });
//
//   bool status;
//   String errNum;
//   dynamic msg;
//   Data data;
//
//   factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
//     status: json["status"],
//     errNum: json["errNum"],
//     msg: json["msg"],
//     data: Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "errNum": errNum,
//     "msg": msg,
//     "data": data.toJson(),
//   };
// }
//
// class Data {
//   Data({
//     required this.currentPage,
//     required this.data,
//     required this.firstPageUrl,
//     required this.from,
//     required this.lastPage,
//     required this.lastPageUrl,
//     required this.links,
//     required this.nextPageUrl,
//     required this.path,
//     required this.perPage,
//     this.prevPageUrl,
//     required this.to,
//     required this.total,
//   });
//
//   int currentPage;
//   List<Datum> data;
//   String firstPageUrl;
//   int from;
//   int lastPage;
//   String lastPageUrl;
//   List<Link> links;
//   String nextPageUrl;
//   String path;
//   int perPage;
//   dynamic prevPageUrl;
//   int to;
//   int total;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     currentPage: json["current_page"],
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     firstPageUrl: json["first_page_url"],
//     from: json["from"],
//     lastPage: json["last_page"],
//     lastPageUrl: json["last_page_url"],
//     links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
//     nextPageUrl: json["next_page_url"],
//     path: json["path"],
//     perPage: json["per_page"],
//     prevPageUrl: json["prev_page_url"],
//     to: json["to"],
//     total: json["total"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "current_page": currentPage,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     "first_page_url": firstPageUrl,
//     "from": from,
//     "last_page": lastPage,
//     "last_page_url": lastPageUrl,
//     "links": List<dynamic>.from(links.map((x) => x.toJson())),
//     "next_page_url": nextPageUrl,
//     "path": path,
//     "per_page": perPage,
//     "prev_page_url": prevPageUrl,
//     "to": to,
//     "total": total,
//   };
// }
//
// class Datum {
//   Datum({
//     required this.id,
//     required this.gender,
//     required this.visitFees,
//     this.order,
//     required this.username,
//     required this.image,
//     required this.address,
//     required this.institutionDescription,
//     required this.countryName,
//     required this.languages,
//     required this.allSpecialities,
//     required this.certificates,
//     required this.consultants,
//     required this.reviews,
//     required this.links,
//     required this.license,
//   });
//
//   int id;
//   Gender gender;
//   String visitFees;
//   dynamic order;
//   String username;
//   String image;
//   String address;
//   String institutionDescription;
//   CountryName countryName;
//   List<LanguageElement> languages;
//   List<AllSpeciality> allSpecialities;
//   List<Certificate> certificates;
//   List<Consultant> consultants;
//   int reviews;
//   List<dynamic> links;
//   List<dynamic> license;
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     gender:  genderValues.map[json["gender"]],
//     visitFees: json["visit_fees"] == null ? null : json["visit_fees"],
//     order: json["order"],
//     username: json["username"],
//     image: json["image"] == null ? null : json["image"],
//     address: json["address"] == null ? null : json["address"],
//     institutionDescription: json["institution_description"],
//     countryName: countryNameValues.map[json["country_name"]],
//     languages: List<LanguageElement>.from(json["languages"].map((x) => LanguageElement.fromJson(x))),
//     allSpecialities: List<AllSpeciality>.from(json["all_specialities"].map((x) => AllSpeciality.fromJson(x))),
//     certificates: List<Certificate>.from(json["certificates"].map((x) => Certificate.fromJson(x))),
//     consultants: List<Consultant>.from(json["consultants"].map((x) => Consultant.fromJson(x))),
//     reviews: json["reviews"],
//     links: List<dynamic>.from(json["links"].map((x) => x)),
//     license: List<dynamic>.from(json["license"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "gender": gender == null ? null : genderValues.reverse[gender],
//     "visit_fees": visitFees == null ? null : visitFees,
//     "order": order,
//     "username": username,
//     "image": image == null ? null : image,
//     "address": address == null ? null : address,
//     "institution_description": institutionDescription,
//     "country_name": countryNameValues.reverse[countryName],
//     "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
//     "all_specialities": List<dynamic>.from(allSpecialities.map((x) => x.toJson())),
//     "certificates": List<dynamic>.from(certificates.map((x) => x.toJson())),
//     "consultants": List<dynamic>.from(consultants.map((x) => x.toJson())),
//     "reviews": reviews,
//     "links": List<dynamic>.from(links.map((x) => x)),
//     "license": List<dynamic>.from(license.map((x) => x)),
//   };
// }
//
// class AllSpeciality {
//   AllSpeciality({
//     required this.spacialty,
//   });
//
//   String spacialty;
//
//   factory AllSpeciality.fromJson(Map<String, dynamic> json) => AllSpeciality(
//     spacialty: json["spacialty"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "spacialty": spacialty,
//   };
// }
//
// class Certificate {
//   Certificate({
//     required this.name,
//   });
//
//   String name;
//
//   factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//   };
// }
//
// class Consultant {
//   Consultant({
//     required this.name,
//     required this.consultantFees,
//   });
//
//   String name;
//   String consultantFees;
//
//   factory Consultant.fromJson(Map<String, dynamic> json) => Consultant(
//     name: json["name"],
//     consultantFees: json["consultant_fees"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "consultant_fees": consultantFees,
//   };
// }
//
// enum CountryName { JORDAN, KUWAIT }
//
// final countryNameValues = EnumValues({
//   "Jordan": CountryName.JORDAN,
//   "Kuwait": CountryName.KUWAIT
// });
//
// enum Gender { MALE, FEMALE }
//
// final genderValues = EnumValues({
//   "Female": Gender.FEMALE,
//   "Male": Gender.MALE
// });
//
// class LanguageElement {
//   LanguageElement({
//     required this.language,
//   });
//
//   LanguageEnum language;
//
//   factory LanguageElement.fromJson(Map<String, dynamic> json) => LanguageElement(
//     language: languageEnumValues.map[json["language"]],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "language": languageEnumValues.reverse[language],
//   };
// }
//
// enum LanguageEnum { ENGLISH, ARABIC, FRENCH, RUSSIAN }
//
// final languageEnumValues = EnumValues({
//   "Arabic": LanguageEnum.ARABIC,
//   "English": LanguageEnum.ENGLISH,
//   "French": LanguageEnum.FRENCH,
//   "Russian": LanguageEnum.RUSSIAN
// });
//
// class Link {
//   Link({
//     required this.url,
//     required this.label,
//     required this.active,
//   });
//
//   String url;
//   String label;
//   bool active;
//
//   factory Link.fromJson(Map<String, dynamic> json) => Link(
//     url: json["url"] == null ? null : json["url"],
//     label: json["label"],
//     active: json["active"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "url": url == null ? null : url,
//     "label": label,
//     "active": active,
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues( this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }

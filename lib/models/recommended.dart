class Recommended {
  int? id;
  String? name;
  String? imgUrl;
  int? price;
  String? city;
  String? country;
  int? rating;
  String? address;
  String? phone;
  String? mapUrl;
  List? photos;
  int? numberOfKitchens;
  int? numberOfBedrooms;
  int? numberOfCupboards;

  Recommended({
    this.city,
    this.country,
    this.id,
    this.imgUrl,
    this.name,
    this.price,
    this.rating,
    this.address,
    this.mapUrl,
    this.numberOfBedrooms,
    this.numberOfCupboards,
    this.numberOfKitchens,
    this.phone,
    this.photos,
  });

  Recommended.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    imgUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
    numberOfKitchens = json['number_of_kitchens'];
  }

  factory Recommended.fromDocument(doc) {
    return Recommended(
      id: doc.data()['id'],
      name: doc.data()['name'],
      city: doc.data()['city'],
      country: doc.data()['country'],
      imgUrl: doc.data()['image_url'],
      price: doc.data()['price'],
      rating: doc.data()['rating'],
      address: doc.data()['address'],
      phone: doc.data()['phone'],
      mapUrl: doc.data()['map_url'],
      photos: doc.data()['photos'],
      numberOfBedrooms: doc.data()['number_of_bedrooms'],
      numberOfCupboards: doc.data()['number_of_cupboards'],
      numberOfKitchens: doc.data()['number_of_kitchens'],
    );
  }
}

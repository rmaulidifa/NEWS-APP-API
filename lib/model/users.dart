//class Users digunakan sebagai class model untuk mengambil data dari api

class Users {
  //inisialisasi variabel
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<DataUser>? data;
  Support? support;

  //membuat constructor
  Users({this.page,this.perPage,this.total,this.totalPages,this.data,this.support});

  //membuat method dariJson untuk mengubah data dari api menjadi model
  Users.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <DataUser>[];
      json['data'].forEach((v) {
        data!.add(DataUser.fromJson(v));
      });
    }
    support =
        json['support'] != null ? Support.fromJson(json['support']) : null;
  }

  //membuat method toJson untuk mengubah data dari model menjadi api
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    data['total'] = total;
    data['total_pages'] = totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (support != null) {
      data['support'] = support!.toJson();
    }
    return data;
  }
}

//class DataUser digunakan sebagai class model untuk mengambil data dari api
class DataUser {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

//membuat constructor
  DataUser({this.id, this.email, this.firstName, this.lastName, this.avatar});

//membuat method dariJson untuk mengubah data dari api menjadi model
  DataUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

//membuat method toJson untuk mengubah data dari model menjadi api
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}

//class Support digunakan sebagai class model untuk mengambil data dari api
class Support {
  String? url;
  String? text;

//membuat constructor
  Support({this.url, this.text});

//membuat method dariJson untuk mengubah data dari api menjadi model
  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

//membuat method toJson untuk mengubah data dari model menjadi api
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['text'] = text;
    return data;
  }
}
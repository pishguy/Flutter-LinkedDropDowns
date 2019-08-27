class ProvincesDataModel {
  String province;
  List<String> cities;

  ProvincesDataModel({this.province, this.cities});

  ProvincesDataModel.fromJson(Map<String, dynamic> json) {
    province = json['province'];
    cities = json['cities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['province'] = this.province;
    data['cities'] = this.cities;
    return data;
  }
}

import 'package:doctor_booking_app/model/speciality.dart';
import 'package:flutter/cupertino.dart';

List<SpecialityModel> getSpeciality() {
  List<SpecialityModel> specialities = [];
  SpecialityModel specialityModel = new SpecialityModel();

  //1
  specialityModel.noOfDoctors = 10;
  specialityModel.speciality = "Dangdut Indie";
  specialityModel.imgAssetPath = "assets/23.png";
  specialityModel.backgroundColor = Color(0xffFBB97C);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //2
  specialityModel.noOfDoctors = 17;
  specialityModel.speciality = "Dangdut Religi";
  specialityModel.imgAssetPath = "assets/45.png";
  specialityModel.backgroundColor = Color(0xffF69383);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //3
  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Dangdut Daerah";
  specialityModel.imgAssetPath = "assets/78.png";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  return specialities;
}

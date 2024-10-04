import 'package:doctor_booking_app/feature/home/home_screen.dart';
import 'package:doctor_booking_app/utils/colors_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormBooking extends StatefulWidget {
  @override
  _FormBookingState createState() => _FormBookingState();
}

class _FormBookingState extends State<FormBooking> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _nama = '';
  // ignore: unused_field
  DateTime _tanggalBooking = DateTime.now();
  TimeOfDay _jamBooking = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: ColorsCustom.googleBg, // Navigation bar
          statusBarColor: Colors.red, // Status bar
        ),
        iconTheme: IconThemeData(color: ColorsCustom.googleBg),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nama',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsCustom.googleBg,
                              width: 2.0), // Color when enabled but not focused
                          borderRadius: BorderRadius.circular(
                              10), // Customizable corner radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsCustom.googleBg,
                              width: 2.0), // Color when focused
                          borderRadius: BorderRadius.circular(
                              10), // Customizable corner radius
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0), // Color when there's an error
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.redAccent,
                              width:
                                  2.0), // Color when focused and error present
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                      onSaved: (value) => _nama = value!,
                      cursorColor: ColorsCustom.googleBg,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Alamat',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsCustom.googleBg,
                              width: 2.0), // Color when enabled but not focused
                          borderRadius: BorderRadius.circular(
                              10), // Customizable corner radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsCustom.googleBg,
                              width: 2.0), // Color when focused
                          borderRadius: BorderRadius.circular(
                              10), // Customizable corner radius
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0), // Color when there's an error
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.redAccent,
                              width:
                                  2.0), // Color when focused and error present
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Alamat tidak boleh kosong';
                        }
                        return null;
                      },
                      onSaved: (value) => _nama = value!,
                      cursorColor: ColorsCustom.googleBg,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Tanggal Booking',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${_tanggalBooking.year}-${_tanggalBooking.month}-${_tanggalBooking.day}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.calendar_today),
                          color: ColorsCustom.googleBg,
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: _tanggalBooking,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2025),
                            );
                            if (picked != null) {
                              setState(() {
                                _tanggalBooking = picked;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Jam Booking',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${_jamBooking.hour}:${_jamBooking.minute}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.access_time),
                          color: ColorsCustom.googleBg,
                          onPressed: () async {
                            final TimeOfDay? picked = await showTimePicker(
                              context: context,
                              initialTime: _jamBooking,
                            );
                            if (picked != null) {
                              setState(() {
                                _jamBooking = picked;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // Simpan data ke database atau API
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Wowww!!! Booking Anda Berhasil'),
                                  ),
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                );
                              }
                            },
                            child: Text('Simpan'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  ColorsCustom.googleBg, // Set background color
                              foregroundColor: Colors.white, // Set text color
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12), // Customize padding
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  ColorsCustom.white, // Set background color
                              foregroundColor:
                                  ColorsCustom.googleBg, // Set text color
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12), // Customize padding
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

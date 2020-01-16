import 'package:flutter/material.dart';
import 'package:veyg_2020/models/department.dart';

List<Department> dept_data = [
  Department(
    id: 0,
    name: "Computer\n & Information Technology",
    image: "assets/department_images/computer.jpg",
    linearGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF00172D),
        const Color(0xFF00264D),
      ],
    ),
  ),
  Department(
    id: 1,
    name: "Mechanical & Automobile",
    image: "assets/department_images/mechanical.jpg",
    linearGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFFC58E7F),
        const Color(0xFFDFA375),
      ],
    ),
  ),
  Department(
    id: 2,
    name: "Civil",
    image: "assets/department_images/civil.jpg",
    linearGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF29524A),
        const Color(0xFFB8C6DB),
      ],
    ),
  ),
  Department(
    id: 3,
    name: "Electrical & \nElectronics",
    image: "assets/department_images/electronics.jpg",
    linearGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF66B5F6),
        const Color(0xFFBFE299),
      ],
    ),
  ),
];

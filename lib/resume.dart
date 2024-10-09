import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show Uint8List, rootBundle;
import 'dart:html' as html;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VP Singh'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final resume = Resume();
            resume.generateResumePdfWeb();
          },
          child: const Text('Download My Resume PDF'),
        ),
      ),
    );
  }
}



class Resume {
  Future<void> generateResumePdfWeb() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [

              pw.Text('Vijendra Pal Singh Kanawat', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),


              pw.Row(
                children: [
                  pw.Text('9983707875 | '),
                  pw.UrlLink(child: pw.Text('Email', style: const pw.TextStyle(color: PdfColors.blue)), destination: 'mailto:kanawatvijendrasingh1@.com'),
                  pw.Text(' | '),
                  pw.UrlLink(child: pw.Text('LinkedIn', style: const pw.TextStyle(color: PdfColors.blue)), destination: 'https://www.linkedin.com/in/imvpsingh'),
                  pw.Text(' | '),
                  pw.UrlLink(child: pw.Text('GitHub', style: const pw.TextStyle(color: PdfColors.blue)), destination: 'https://github.com/imvpsingh'),
                  pw.Text(' | '),
                  pw.UrlLink(child: pw.Text('Twitter-X', style: const pw.TextStyle(color: PdfColors.blue)), destination: 'https://x.com/VpsinghRajput4'),
                ],
              ),
              pw.SizedBox(height: 16),


              pw.Text('SUMMARY:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Text('Front End Developer With Basic Expertise In Html-Css, Js, Flutter, React, ReactJs.'),
              pw.SizedBox(height: 16),


              pw.Text('WORK EXPERIENCE:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Text('FRESHER*'),
              pw.SizedBox(height: 16),


              pw.Text('TECHNICAL SKILLS:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Bullet(text: 'Frontend- HTML-CSS, JavaScript, ReactJs, Redux, Flutter'),
              pw.Bullet(text: 'Database- SQL, Firebase'),
              pw.SizedBox(height: 16),


              pw.Text('PROJECTS:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Bullet(text: ''),
              pw.UrlLink(
                child: pw.Text('Data Collector', style: const pw.TextStyle(color: PdfColors.blue)),
                destination: 'https://drive.google.com/file/d/1oFY-dqJp1kY5I9-Ug7-xjjXjyeIZEEBb/view?usp=drive_link',
              ),
              pw.Text('Tech Stack: Dart- Flutter Framework, Firebase Auth, Firebase Database'),
              pw.Bullet(text: 'Frontend development using flutter framework.'),
              pw.Bullet(text: 'Store data using Firebase database.'),
              pw.Bullet(text: 'Authentication using Firebase Auth.'),
              pw.Bullet(text: 'CrudOperation Using Firebase to store users data separately.'),

              pw.SizedBox(height: 8),

              pw.Bullet(text: ''),
              pw.UrlLink(
                child: pw.Text('Wallpaper Flux', style: const pw.TextStyle(color: PdfColors.blue)),
                destination: 'https://drive.google.com/file/d/1aBwgKNQXSSfp6TqbGJvy4umq2f0U96r3/view?usp=sharing',
              ),
              pw.Text('Tech Stack: Dart- Flutter Framework, Pexels API for wallpaper'),
              pw.Bullet(text: 'Frontend development using flutter framework & Download Feature.'),
              pw.Bullet(text: 'Wallpaper fetch using Pexels API, daily updates with online data.'),

              pw.SizedBox(height: 8),

              pw.Bullet(text: ''),
              pw.UrlLink(
                child: pw.Text('My Todo', style: const pw.TextStyle(color: PdfColors.blue)),
                destination: 'https://drive.google.com/file/d/1_WCGBlFeldw7oH2li9ZJwQbz-0EjORNV/view?usp=drive_link',
              ),
              pw.Text('Tech Stack: Dart- Flutter Framework, Flutter SharedPreferences'),
              pw.Bullet(text: 'Frontend development using flutter framework.'),
              pw.Bullet(text: 'Store data using Flutter SharedPreferences.'),
              pw.Bullet(text: 'CrudOperation on local storage and add our todos.'),

              pw.SizedBox(height: 8),

              pw.Bullet(text: ''),
              pw.UrlLink(
                child: pw.Text('ReactJs Exercise Project', style: const pw.TextStyle(color: PdfColors.blue)),
                destination: 'https://drive.google.com/file/d/1NF3PCqgFhtcG6K8F-K51cfUDQuhripKg/view?usp=drive_link',
              ),
              pw.Text('Tech Stack: Html-Css-BootStrap-Tailwind-Js, ReactJs'),
              pw.Bullet(text: 'FrontEnd development using ReactJs, for styling css, tailwind css.'),
              pw.Bullet(text: 'Use of axios, fetch, useState, useEffect, Route toast, and many more.'),

              pw.SizedBox(height: 16),


              pw.Text('EDUCATION:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Bullet(text: 'MDSU, Ajmer | Bachelor’s Degree in Arts | July 2020 to July 2023'),
              pw.Bullet(text: 'MP Board, Indore | D.el.ed | July 2020 to July 2022'),
              pw.Bullet(text: 'Parishkar College, Jaipur | BCA | July 2023 to July 2026 (running)'),

            ],
          );
        },
      ),
    );


    final Uint8List bytes = await pdf.save();


    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);


    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'vpsingh_resume.pdf')
      ..click();

    html.Url.revokeObjectUrl(url);
  }
}



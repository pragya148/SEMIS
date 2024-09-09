import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting the date

class AddWork extends StatefulWidget {
  const AddWork({super.key});

  @override
  _AddWorkState createState() => _AddWorkState();
}

class _AddWorkState extends State<AddWork> {
  String? selectedClass;
  String? selectedSection;
  String? selectedSubject;
  String? selectedChapter;
  String? selectedContentTitle;
  String? selectedgrade;

  DateTime? homeworkPublishDate;
  DateTime? submissionDate;

  final TextEditingController _descriptionController = TextEditingController();

  final List<String> classes = ['Class 1', 'Class 2', 'Class 3', 'Class 4'];
  final List<String> sections = ['A', 'B', 'C', 'D'];
  final List<String> subjects = ['Math', 'Science', 'English', 'History'];
  final List<String> chapters = ['Chapter 1', 'Chapter 2', 'Chapter 3'];
  final List<String> contentTitles = ['Title 1', 'Title 2', 'Title 3'];
  final List<String> grade = ['A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'E'];

  Future<void> _selectDate(
      BuildContext context, Function(DateTime) onDateSelected) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    const Color whiteColor = Colors.white;
    const Color greyColor = Colors.grey;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Work'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Select Class",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  //Padding(padding: EdgeInsets.all(8)),

                  Text(
                    "Select Section",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ],
              ),

              // Row for Class and Section Dropdowns
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Select',
                        border: OutlineInputBorder(),
                      ),
                      value: selectedClass,
                      items: classes
                          .map((classItem) => DropdownMenuItem(
                                value: classItem,
                                child: Text(classItem),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedClass = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Select ',
                        border: OutlineInputBorder(),
                      ),
                      value: selectedSection,
                      items: sections
                          .map((section) => DropdownMenuItem(
                                value: section,
                                child: Text(section),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedSection = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                "Select Subject",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              // Dropdown for Subject
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  // labelText: 'Select Subject',
                  border: OutlineInputBorder(),
                ),
                value: selectedSubject,
                items: subjects
                    .map((subject) => DropdownMenuItem(
                          value: subject,
                          child: Text(subject),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSubject = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              Text(
                "Select Chapter",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              // Dropdown for Chapter
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  //  labelText: 'Select Chapter',
                  border: OutlineInputBorder(),
                ),
                value: selectedChapter,
                items: chapters
                    .map((chapter) => DropdownMenuItem(
                          value: chapter,
                          child: Text(chapter),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedChapter = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              Text(
                "Content Title",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              // Dropdown for Content Title
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  // labelText: 'Content Title',
                  border: OutlineInputBorder(),
                ),
                value: selectedContentTitle,
                items: contentTitles
                    .map((title) => DropdownMenuItem(
                          value: title,
                          child: Text(title),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedContentTitle = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              Text(
                "Homework Publish Date",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              // Homework Publish Date Picker
              InkWell(
                onTap: () => _selectDate(context, (date) {
                  setState(() {
                    homeworkPublishDate = date;
                  });
                }),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    //  labelText: 'Homework Publish Date',
                    border: OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        homeworkPublishDate != null
                            ? DateFormat('yyyy-MM-dd')
                                .format(homeworkPublishDate!)
                            : 'Select Date',
                      ),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                "Submission Date",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              // Submission Date Picker
              InkWell(
                onTap: () => _selectDate(context, (date) {
                  setState(() {
                    submissionDate = date;
                  });
                }),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    // labelText: 'Submission Date',
                    border: OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        submissionDate != null
                            ? DateFormat('yyyy-MM-dd').format(submissionDate!)
                            : 'Select Date',
                      ),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                "Attachment",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              // Attachment Option with Custom Design
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: blueColor, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Upload Document',
                      style: TextStyle(color: blueColor),
                    ),
                    const SizedBox(width: 8.0),
                    Icon(Icons.upload_file, color: blueColor),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                "Description",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              // Description Box
              TextFormField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: const InputDecoration(
                  //  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),
              Text(
                "Grade/Marks",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                width: 70,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'A+',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedgrade,
                  items: grade
                      .map((grade) => DropdownMenuItem(
                            value: grade,
                            child: Text(grade),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedgrade = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  // Handle leave application submission
                },
                child: Center(child: Text('Apply')),
                style: ElevatedButton.styleFrom(
                  foregroundColor: whiteColor,
                  backgroundColor: blueColor,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 120),
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

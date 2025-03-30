import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'course_details_page.dart';

class CourseListPage extends StatefulWidget {
  const CourseListPage({Key? key}) : super(key: key);

  @override
  State<CourseListPage> createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  List<Map<String, dynamic>> _courses = [];
  bool _isLoading = true;
  final _supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    _fetchCourses();
  }

  Future<void> _fetchCourses() async {
    try {
      final response = await _supabase
          .from('course')
          .select()
          .then((value) => value.toList());

      setState(() {
        _courses = List<Map<String, dynamic>>.from(response);
        _isLoading = false;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetching courses: $e')),
        );
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Course List')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _courses.length,
              itemBuilder: (context, index) {
                final course = _courses[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(course['course_name'] ?? 'No Title'),
                    subtitle: Text(course['description'] ?? 'No Description'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseDetailsPage(
                            courseName: course['course_name'] ?? '',
                            pdf: course['pdf'] ?? '',
                            youtubeLink: course['youtube_link'] ?? '',
                            handNote: course['hand_note'] ?? '',
                            purpose: course['purpose'] ?? '',
                            description: course['description'] ?? '',
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

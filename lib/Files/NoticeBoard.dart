import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoticeBoard extends StatefulWidget {
  const NoticeBoard({super.key});

  @override
  _NoticeBoardState createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  final List<Map<String, dynamic>> notices = [
    {
      'title': 'Meeting at 4 PM',
      'subtitle': 'Discussion about project updates',
      'time': DateTime.now().subtract(const Duration(hours: 1)),
      'isRead': false,
    },
    {
      'title': 'Submit reports by EOD',
      'subtitle': 'Ensure all reports are submitted on time',
      'time': DateTime.now().subtract(const Duration(hours: 2)),
      'isRead': true,
    },
    {
      'title': 'New policy update',
      'subtitle': 'Review the latest policy changes',
      'time': DateTime.now().subtract(const Duration(days: 1, hours: 5)),
      'isRead': true,
    },
    {
      'title': 'Holiday on Friday',
      'subtitle': 'Company holiday due to festival',
      'time': DateTime(2024, 9, 1),
      'isRead': false,
    },
    {
      'title': 'Event reminder',
      'subtitle': 'Reminder for the team-building event',
      'time': DateTime(2024, 8, 30),
      'isRead': true,
    },
  ];

  String _formatNoticeTime(DateTime noticeTime) {
    final now = DateTime.now();
    final difference = now.difference(noticeTime);

    if (difference.inDays == 0) {
      return 'Today';
    } else if ((difference.inDays == 1)) {
      return 'Yesterday';
    } else {
      return DateFormat('MMM dd, yyyy').format(noticeTime);
    }
  }

  String _getTileTimeText(DateTime noticeTime) {
    final now = DateTime.now();
    final difference = now.difference(noticeTime);

    if (difference.inDays == 0 && difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inDays == 1) {
      return DateFormat('MMM dd, yyyy').format(noticeTime);
    } else {
      return DateFormat('MMM dd, yyyy').format(noticeTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    const Color whiteColor = Colors.white;
    Color greyColor = Color.fromARGB(255, 224, 219, 219);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notice Booard'),
        // backgroundColor: blueColor,
      ),
      body: ListView.builder(
        itemCount: notices.length,
        itemBuilder: (context, index) {
          final notice = notices[index];
          final noticeTime = notice['time'] as DateTime;
          final noticeTitle = notice['title'] as String;
          final noticeSubtitle = notice['subtitle'] as String;
          final formattedDate = _formatNoticeTime(noticeTime);
          final tileTimeText = _getTileTimeText(noticeTime);
          final isRead = notice['isRead'] as bool;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0 ||
                  _formatNoticeTime(notices[index - 1]['time']) !=
                      formattedDate)
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    index == 0 && formattedDate == 'Today'
                        ? 'Today'
                        : index == 1 && formattedDate == 'Yesterday'
                            ? 'Yesterday'
                            : formattedDate,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: isRead ? whiteColor : greyColor,
                    borderRadius: BorderRadius.circular(12), // Curved border
                    border: Border.all(
                      color: Colors.grey.shade300, // Border color
                      width: 1.0,
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(6.0),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Blue dot before the title
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 8.0, top: 4.0),
                          decoration: BoxDecoration(
                            color: blueColor, // Blue color for the dot
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            noticeTitle,
                            style: TextStyle(
                              color: isRead ? Colors.black : blueColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold, // Title font bold
                            ),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      noticeSubtitle,
                      style: TextStyle(
                        color: isRead ? Colors.black87 : blueColor,
                        fontSize: 14, // Smaller subtitle font
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          tileTimeText,
                          style: const TextStyle(
                            fontSize: 12, // Smaller font size for time
                            color: Colors.red, // Time text in red
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

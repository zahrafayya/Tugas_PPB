import '../services/notification_service.dart';
import '../widgets/notification_button.dart';
import '../widgets/top_bar.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Colors.grey[200]!,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TopBar(title: 'Awesome Notification'),
            NotificationButton(
                onPressed: () async {
                  await NotificationService.showNotification(
                      title: 'Title of the notification',
                      body: 'Body of the notification'
                  );
                }, 
                text: 'Normal Notification'
            ),
            NotificationButton(
                onPressed: () async {
                  await NotificationService.showNotification(
                    title: 'Title of the notification',
                    body: 'Body of the notification',
                    summary: 'Small summary',
                    notificationLayout: NotificationLayout.Inbox,
                  );
                },
                text: 'Notification with summary'
            ),
            NotificationButton(
                onPressed: () async {
                  await NotificationService.showNotification(
                    title: 'Title of the notification',
                    body: 'Body of the notification',
                    summary: 'Small summary',
                    notificationLayout: NotificationLayout.ProgressBar,
                  );
                },
                text: 'Progress Bar Notification'
            ),
            NotificationButton(
                onPressed: () async {
                  await NotificationService.showNotification(
                    title: 'Title of the notification',
                    body: 'Body of the notification',
                    summary: 'Small summary',
                    notificationLayout: NotificationLayout.Messaging,
                  );
                },
                text: 'Message Notification'
            ),
            NotificationButton(
                onPressed: () async {
                  await NotificationService.showNotification(
                    title: 'Title of the notification',
                    body: 'Body of the notification',
                    summary: 'Small summary',
                    notificationLayout: NotificationLayout.BigPicture,
                    bigPicture: 'https://hololive.hololivepro.com/wp-content/uploads/2023/10/Nanashi-Mumei_list_thumb.png',
                  );
                },
                text: 'Big Image Notification'
            ),
            NotificationButton(
                onPressed: () async {
                  await NotificationService.showNotification(
                    title: 'Title of the notification',
                    body: 'Body of the notification',
                    payload: {
                      "navigate": "true"
                    },
                    actionButtons: [
                      NotificationActionButton(
                          key: 'check',
                          label: 'Check it out',
                          actionType: ActionType.SilentAction,
                          color: Colors.green
                      )
                    ],
                  );
                },
                text: 'Action Buttons Notification'
            ),
            NotificationButton(
                onPressed: () async {
                  await NotificationService.showNotification(
                    title: 'Scheduled Notification',
                    body: 'Notification was fired after 5 seconds',
                    scheduled: true,
                    interval: 5,
                  );
                },
                text: 'Scheduled Notification'
            ),
          ],
        ),
      )
    );
  }
}
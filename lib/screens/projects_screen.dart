import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/project_card.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_app/services/data_service.dart';
import 'package:portfolio_app/models/project.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataService = Provider.of<DataService>(context);
    return FutureBuilder<List<Project>>(
      future: dataService.loadProjects(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final projects = snapshot.data!;
          return ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return ProjectCard(project: projects[index]);
            },
          );
        } else {
          return const Center(child: Text('No projects found.'));
        }
      },
    );
  }
}
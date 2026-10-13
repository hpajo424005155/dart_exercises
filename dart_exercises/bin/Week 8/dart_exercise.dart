// Function with parameter and return value
String checkGrade(double grade) {
  if (grade >= 90) {
    return 'Excellent';
  } else if (grade >= 75) {
    return 'Passed';
  } else {
    return 'Failed';
  }
}

void main() {
  print('=== Student Grade Checker ===\n');

  // List of student names and grades
  List<String> studentNames = ['Harvey', 'Cedric', 'Andrew', 'Jcep', 'Edward'];
  List<String> rawGrades = ['91.5', '81.0', 'abc', '73.0', '94.0'];

  int passedCount = 0;
  int failedCount = 0;

  // Loop through each student
  for (int i = 0; i < rawGrades.length; i++) {
    print('Checking student: ${studentNames[i]}');

    try {
      double grade = double.parse(rawGrades[i]);
      String result = checkGrade(grade);
      print('-> Grade: $grade | Result: $result\n');

      if (result == 'Failed') {
        failedCount++;
      } else {
        passedCount++;
      }
    } catch (e) {
      print(
        '-> [Error Handled]: "${rawGrades[i]}" is not a valid grade. Skipped.\n',
      );
    }
  }

  print('= Summary =');
  print('Passed: $passedCount');
  print('Failed: $failedCount');
  print('= Program Finished =');
}

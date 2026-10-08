void main() {
  String studentName = 'Harvey Pajo';
  int numberOfSubjects = 7;
  double gradePerSubject = 90.5;
  bool isEnrolled = true;

  double totalGrade = numberOfSubjects * gradePerSubject;

  bool isPassing = totalGrade > 300;

  print('Student: $studentName');
  print('Enrolled: $isEnrolled');
  print('Number of Subjects: $numberOfSubjects');
  print('Grade per Subject: $gradePerSubject');
  print('Total Grade: $totalGrade');
  print('Is the total grade above 500? $isPassing');
}

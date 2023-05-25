CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'
RPATH='.;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

find -name ListExamples.java

#if [[e- student-submission/ListExamples.java]]
if [[ ! $? =~ 0 ]]
then
    echo 'File Not Found. Check your file name.'
    exit
fi

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

cp -r student-submission/ListExamples.java TestListExamples.java lib grading-area/
cd grading-area

javac -cp $CPATH *.java
java -cp $RPATH org.junit.runner.JUnitCore TestListExamples > output.txt

#  grade_line="$(grep 'Tests run: ' output.txt | grep -o -E '[0-9]+')"
grade_line="$(grep '\d+. \b(\w+)\b' output.txt)"
echo $grade_line


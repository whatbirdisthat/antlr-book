#!/bin/sh
rm java/*.class
rm java/*.java

antlr4 -o java Hello.g4

cd java
javac *.java
cd -

######################################################################

gci -file -Recurse -Include "*.h","*.cpp" | foreach { clang-format -i --style=file:.clang-format $_.FullName }
gci -file -Recurse -Include "*.h","*.cpp" | foreach { clang-format -i --style=llvm $_.FullName }
gci -file -Recurse -Include "*.h","*.cpp" | foreach { clang-format -i --style=google $_.FullName }

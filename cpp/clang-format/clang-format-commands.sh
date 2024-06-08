######################################################################

find . -type f -name "*.h" -o -name "*.cpp" | xargs clang-format -i --style=file:.clang-format
find . -type f -name "*.h" -o -name "*.cpp" | xargs clang-format -i --style=llvm
find . -type f -name "*.h" -o -name "*.cpp" | xargs clang-format -i --style=google

find . -type f -name "*.java" | xargs clang-format -i --style=file:.clang-format

######################################################################

### dump-config
# Language:        Cpp
# Language:        CSharp
# Language:        Java
# Language:        JavaScript
# Language:        Json
# Language:        Proto

clang-format -style=llvm -dump-config > .clang-format
clang-format -style=google -dump-config > .clang-format
clang-format -style=microsoft -dump-config > .clang-format

clang-format -style=llvm -dump-config -assume-filename=File.cpp > .clang-format
clang-format -style=llvm -dump-config -assume-filename=File.java > .clang-format
clang-format -style=llvm -dump-config -assume-filename=File.js > .clang-format
clang-format -style=llvm -dump-config -assume-filename=File.json > .clang-format
clang-format -style=llvm -dump-config -assume-filename=File.proto > .clang-format
clang-format -style=llvm -dump-config -assume-filename=File.ts > .clang-format
clang-format -style=llvm -dump-config -assume-filename=File.cs > .clang-format

clang-format -style=google -dump-config -assume-filename=File.cpp > .clang-format
clang-format -style=google -dump-config -assume-filename=File.java > .clang-format
clang-format -style=google -dump-config -assume-filename=File.js > .clang-format
clang-format -style=google -dump-config -assume-filename=File.json > .clang-format
clang-format -style=google -dump-config -assume-filename=File.proto > .clang-format
clang-format -style=google -dump-config -assume-filename=File.ts > .clang-format
clang-format -style=google -dump-config -assume-filename=File.cs > .clang-format

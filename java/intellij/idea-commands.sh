######################################################################

"${HOME}/Applications/IntelliJ IDEA Ultimate.app/Contents/bin/format.sh" -s intellij-code-style.xml -charset UTF-8 "${FILE_PATH}"
"${HOME}/Applications/IntelliJ IDEA Ultimate.app/Contents/bin/format.sh" -s intellij-code-style.xml -charset UTF-8 -r src
"${HOME}/Applications/IntelliJ IDEA Ultimate.app/Contents/bin/format.sh" -charset UTF-8 -r src

######################################################################

### delete config, cache files
rm -rf ~/Library/Application\ Support/JetBrains/IntelliJIdea2024*
rm -rf ~/Library/Caches/JetBrains/IntelliJIdea2024*

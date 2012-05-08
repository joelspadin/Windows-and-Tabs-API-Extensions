
name="WindowsAndTabsExtensions"

rm -f ./$name.oex
zip -r ./$name.zip ./config.xml ./includes/* ./js/* ./img/* ./css/* ./*.html ./*.css ./*.js
mv ./$name.zip ./$name.oex

#!/bin/sh

if [ "$#" != "1" ];
then
   echo "usage: $0 /path/to/dir"
   exit 1
fi

if [ ! -d "$1" ];
then
   echo "error: '$1' does not appear to be a directory"
   exit 1
fi

cd "$1"
if [ "$?" != "0" ];
then
   echo "error: unable to cd into directory '$1'"
   exit 1
fi

# start building output
output="
<html>\n
<head>\n
   <title>$1</title>|n
</head>\n
<body>\n
"

if [ -f "HEADER.html" ];
then
   header=`cat HEADER.html`
   output="$output$header"
fi

output="$output\n<ul>\n"
for file in `ls -a`
do
   line="<li><a href="$file">$file</a></li>\n"
   output="$output$line"
done
output="$output\n</ul>\n"

if [ -f "FOOTER.html" ];
then
   footer=`cat FOOTER.html`
   output="$output$footer"
fi

output="$output</body></html>"

# output final result
echo $output

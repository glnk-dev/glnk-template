#!/bin/bash
glnk_html=build/index.html

# Create the build directory if it doesn't exist
mkdir -p build

# Create the HTML file using the JSON data
cat <<EOL >$glnk_html
<!DOCTYPE html>
<html>
<head>
    <title>Go Links</title>
    <style>
      table {
        border-collapse: collapse;
        width: 100%;
      }
      th,
      td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
      }
      th {
        background-color: #f2f2f2;
      }
    </style>
</head>
<body>
    <table>
        <tr>
            <th>Subpath</th>
            <th>Redirect Link</th>
        </tr>
EOL

# Loop through the JSON data and generate the table rows
# jq -r '. | to_entries[] | "<tr><td><a href=\"/go" + .key + "\">/go" + .key + "</a></td><td><a href=\"" + .value + "\">" + .value + "</a></td></tr>"' glnk.json >>$glnk_html
jq -r '. | to_entries[] | "<tr><td><a href=\"" + .key + "\">" + .key + "</a></td><td><a href=\"" + .value + "\">" + .value + "</a></td></tr>"' glnk.json >>$glnk_html

# Complete the HTML file
echo "</table></body></html>" >>$glnk_html
echo "Generated $glnk_html successfully!"

declare -A redirect_mapping

# Assuming glnk.json contains a valid JSON object with keys and values.
# For example:
# {
#   "subpath1": "redirect_link1",
#   "subpath2": "redirect_link2",
#   ...
# }

# Read the JSON file and populate the associative array
while read -r subpath redirect_link; do
    redirect_mapping["$subpath"]=$redirect_link
done < <(jq -r 'to_entries[] | "\(.key) \(.value)"' glnk.json)

# Iterate through the associative array to get the matching order
for subpath in "${!redirect_mapping[@]}"; do
    redirect_link="${redirect_mapping[$subpath]}"
    echo "Subpath: $subpath, Redirect Link: $redirect_link"

    # Create the content for the index.html file
    content="<!DOCTYPE html>
<meta charset=utf-8>
<title>Redirecting to $subpath</title>
<meta http-equiv=refresh content=\"0; URL=$redirect_link\">
<link rel=canonical href=\"$redirect_link\">
"

    # Create the directory for the subpath if it doesn't exist
    mkdir -p "build$subpath"

    # Write the content to the index.html file
    echo "$content" >"build$subpath/index.html"
done

echo "Created subdirectories with index.html files successfully!"

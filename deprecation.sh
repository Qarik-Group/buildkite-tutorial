#!/bin/bash

# Simulate a script with deprecation warnings
echo "This is a script with a DEPRECATION WARNING" >&2
echo "Performing some tasks..."
echo "Another DEPRECATION WARNING" >&2

# Simulate a successful build or test
echo "Build or test completed successfully."

# Save deprecation warnings to a log file
echo "Capturing deprecation warnings..."
echo "DEPRECATION WARNING 1" > output.log
echo "DEPRECATION WARNING 2" >> output.log

# Process the log file to find unique deprecations
grep 'DEPRECATION WARNING' output.log | sort | uniq > deprecations.log

# Check if there are deprecations and create an annotation if needed
if [ -s deprecations.log ]; then
    echo "Deprecations found! Creating annotation..."
    # For demonstration purposes, printing the content of deprecations.log
    cat deprecations.log
else
    echo "No deprecations found."
fi

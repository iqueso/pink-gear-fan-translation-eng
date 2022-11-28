path_to_projectorrays_executable = $1

# Check for original cast directory existing
if [ -d "../../cast_original" ]  
then
	# Check for original cast directory not being empty
	if [ "$(ls -A ../../cast_original)" ]; then
		echo "Directory exists and isn't empty.. grabbing cast files."

		# Get cast file names/directories
		castFiles='ls ../../cast_original/*.CXT'

		# Loop through cast files, use names as input files, output in cast_decomp directory.
		for inputFile in $castFiles
		do
			echo "Grabbing filename.. "
			fileName=$(basename "$inputFile" .CXT)
			fileNameWithExtension="${fileName}.CXT"
			outputFile="${fileName}.CST"

			# Run projectorrays to decomp original cast and place in cast_decomp directory
			echo $fileNameWithExtension 
			echo $outputFile
			(cd ../../cast_original && $($1 $fileNameWithExtension $outputFile))
		done
	fi
else
	echo "Original cast directory is empty or doesn't exist."
fi

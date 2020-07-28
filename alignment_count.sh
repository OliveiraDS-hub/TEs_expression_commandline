###Create index of the reference genes with hisat2
	
	"$HISAT2BUILD" -p 4 -f "$DIRREF"/"$REF".fasta "$DIRREF"/"$REF""_hisat2.index" 


###Align reads against the genes

	"$HISAT2" -p 4 -x "$DIRREF"/"$REF""_hisat2.index" -U "$DIRFASTQ"/"$file"".fastq" -S "$DIRALIGN"/"$file""_hisat2.sam"
	
	
###Convert sam to bam

	"$SAMTOOLS" view -bS "$DIRALIGN"/"$file""_hisat2.sam" -@ 4 "$DIRALIGN"/"$file""_hisat2.bam"
	

###Count processing

	"$EXPRESS" -o "$DIRCOUNTREADS"/"$file""_express" -O 1 --output-align-prob --calc-covar "$DIRREF"/"$REF".fasta "$DIRALIGN"/""$file""_hisat2.bam"

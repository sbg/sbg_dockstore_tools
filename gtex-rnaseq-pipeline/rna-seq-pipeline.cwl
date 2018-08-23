class: Workflow
cwlVersion: v1.0
id: veliborka_josipovic/gtex-rna-seq-pipeline/rna-seq-pipeline/23
label: RNA-seq pipeline
$namespaces:
  sbg: 'https://sevenbridges.com'
inputs:
  - id: GTF_file
    'sbg:fileTypes': GTF
    type: File?
    label: Gene Annotation File
    doc: File with annotated transcripts in the standard GTF format.
    'sbg:y': -397.40130615234375
    'sbg:x': -1223.70068359375
  - id: rsem_reference
    'sbg:fileTypes': 'TAR, FASTA'
    type: File
    label: RSEM Index Archive or reference FASTA
    doc: >-
      Reference FASTA file or TAR bundle containing already generated indices
      instead of a FASTA file in order to skip indexing for faster workflow
      execution.
    'sbg:y': -1273
    'sbg:x': -834.70068359375
  - id: reference_or_index
    'sbg:fileTypes': 'FASTA, TAR'
    type: File
    label: STAR Index Archive or reference FASTA
    doc: >-
      Reference sequence to which to align the reads, or a TAR bundle containing
      already generated indices.
    'sbg:y': -728.9530639648438
    'sbg:x': -1363.8526611328125
  - id: reference
    'sbg:fileTypes': FASTA
    type: File
    label: Reference FASTA
    'sbg:y': -442
    'sbg:x': -550.6548461914062
  - id: output_prefix
    type: string?
    label: Output Files Prefix
    doc: Prefix for output files - usually <sample_id>.
    'sbg:y': -1134.1019287109375
    'sbg:x': -1359.5328369140625
  - id: threads
    type: int?
    label: Threads
    doc: Number of threads.
    'sbg:y': -814.8922119140625
    'sbg:x': -1200.5443115234375
  - id: input_cram
    'sbg:fileTypes': CRAM
    type: File
    label: CRAM File
    'sbg:y': -877.1721801757812
    'sbg:x': -1538.13916015625
  - id: reference_1
    'sbg:fileTypes': FASTA
    type: File
    label: Reference FASTA
    doc: Reference FASTA file
    'sbg:y': -1025.827880859375
    'sbg:x': -1530.7947998046875
outputs:
  - id: metrics_file
    outputSource:
      - picard_markduplicates/metrics_file
    'sbg:fileTypes': TXT
    type: File?
    label: Picard Metrics File
    doc: File which contains duplication metrics.
    'sbg:y': -757.732666015625
    'sbg:x': -318.4455261230469
  - id: output_bam
    outputSource:
      - bamtools_index/output_bam
    'sbg:fileTypes': BAM
    type: File?
    label: Picard Duplicates Marked BAM
    doc: The output file which contains marked records.
    'sbg:y': -625.2550048828125
    'sbg:x': -39.055057525634766
  - id: tar_archive
    outputSource:
      - star_v2_5_3a/tar_archive
    'sbg:fileTypes': TAR
    type: File?
    label: STAR All Files Archive
    doc: TAR archive with all the output files.
    'sbg:y': -797.29931640625
    'sbg:x': -602.6052856445312
  - id: transcriptome_bam
    outputSource:
      - star_v2_5_3a/transcriptome_bam
    'sbg:fileTypes': BAM
    type: File?
    label: Transcriptome BAM
    doc: File containing alignments translated into transcript coordinates.
    'sbg:y': -976.4671020507812
    'sbg:x': -596.2631225585938
  - id: rsem_genes
    outputSource:
      - rsem/rsem_genes
    type: File?
    label: RSEM Genes
    doc: File containing gene level expression estimates.
    'sbg:y': -750.7257080078125
    'sbg:x': 140.56857299804688
  - id: rsem_isoforms
    outputSource:
      - rsem/rsem_isoforms
    type: File?
    label: RSEM Isoforms
    doc: File containing isoform level expression estimates.
    'sbg:y': -892.3411865234375
    'sbg:x': 133.8862762451172
  - id: rsem_statistics
    outputSource:
      - rsem/rsem_statistics
    type:
      - 'null'
      - File
      - type: array
        items: File
    label: RSEM Statistics
    doc: Model related statistics files.
    'sbg:y': -1033.88623046875
    'sbg:x': 134.22744750976562
  - id: all_files_archive
    outputSource:
      - rna_seqc/all_files_archive
    'sbg:fileTypes': TAR
    type: File?
    label: RNA-SeQC All Files Archive
    doc: TAR archive which contains all the output files.
    'sbg:y': -346.2942810058594
    'sbg:x': 146.70571899414062
steps:
  - id: sam_to_fastq
    in:
      - id: input_bam
        source: convert_cram_to_bam/output_file
      - id: output_prefix
        source: output_prefix
    out:
      - id: first_end_fastq
      - id: second_end_fastq
      - id: unpaired_fastq
    run: steps/sam-to-fastq.cwl
    label: SamToFastq
    'sbg:y': -944.2069702148438
    'sbg:x': -1074.224365234375
  - id: star_v2_5_3a
    in:
      - id: genome_index
        source: starindex/genome
      - id: first_end_fastq
        source: sam_to_fastq/first_end_fastq
      - id: second_end_fastq
        source: sam_to_fastq/second_end_fastq
      - id: threads
        source: threads
    out:
      - id: tar_archive
      - id: aligned_sorted_bam
      - id: sorted_bam_index
      - id: transcriptome_bam
    run: steps/star.cwl
    label: STAR
    'sbg:y': -781.4104614257812
    'sbg:x': -815.8278198242188
  - id: starindex
    in:
      - id: reference_or_index
        source: reference_or_index
      - id: runThreadN
        source: threads
      - id: GTF_file
        source: GTF_file
    out:
      - id: genome
    run: steps/star-index.cwl
    label: STAR Index
    'sbg:y': -664.0984497070312
    'sbg:x': -1081.1224365234375
  - id: picard_markduplicates
    in:
      - id: input_bam
        source: star_v2_5_3a/aligned_sorted_bam
    out:
      - id: marked_duplicates_bam
      - id: metrics_file
    run: steps/picard-mark-duplicates.cwl
    label: Picard MarkDuplicates
    'sbg:y': -630.2029418945312
    'sbg:x': -598.8841552734375
  - id: rna_seqc
    in:
      - id: input_bam
        source: bamtools_index/output_bam
      - id: GTF_file
        source: GTF_file
      - id: reference
        source: reference
    out:
      - id: all_files_archive
    run: steps/rna-seqc.cwl
    label: RNA-SeQC
    'sbg:y': -343.3262023925781
    'sbg:x': -70.25391387939453
  - id: rsem_prepare_reference
    in:
      - id: threads
        source: threads
      - id: rsem_reference
        source: rsem_reference
      - id: GTF_file
        source: GTF_file
    out:
      - id: rsem_prepare_reference_archive
    run: steps/rsem-prepare-reference.cwl
    label: RSEM Prepare Reference
    'sbg:y': -1144.5328369140625
    'sbg:x': -599.131591796875
  - id: rsem
    in:
      - id: rsem_reference
        source: rsem_prepare_reference/rsem_prepare_reference_archive
      - id: threads
        default: 0
        source: threads
      - id: transcriptome_bam
        source: star_v2_5_3a/transcriptome_bam
    out:
      - id: rsem_genes
      - id: rsem_isoforms
      - id: rsem_statistics
    run: steps/rsem.cwl
    label: RSEM
    'sbg:y': -956.006591796875
    'sbg:x': -203.06578063964844
  - id: bamtools_index
    in:
      - id: input_bam
        source: picard_markduplicates/marked_duplicates_bam
    out:
      - id: bam_index
      - id: output_bam
    run: steps/bam-index.cwl
    label: BamTools Index
    'sbg:y': -531
    'sbg:x': -327.53289794921875
  - id: convert_cram_to_bam
    in:
      - id: input_cram
        source: input_cram
      - id: reference
        source: reference_1
    out:
      - id: output_file
    run: steps/convert-cram-to-bam.cwl
    label: Convert CRAM to BAM
    'sbg:y': -932.5234985351562
    'sbg:x': -1334.0921630859375
requirements: []
'sbg:latestRevision': 23
'sbg:revisionNotes': Convert CRAM to BAM add
'sbg:modifiedBy': veliborka_josipovic
'sbg:appVersion':
  - v1.0
'sbg:project': veliborka_josipovic/gtex-rna-seq-pipeline
'sbg:sbgMaintained': false
'sbg:createdOn': 1526549170
'sbg:publisher': sbg
'sbg:createdBy': veliborka_josipovic
'sbg:id': veliborka_josipovic/gtex-rna-seq-pipeline/rna-seq-pipeline/23
'sbg:projectName': GTEX RNA-seq pipeline
'sbg:modifiedOn': 1530030300
'sbg:revisionsInfo':
  - 'sbg:modifiedOn': 1526549170
    'sbg:revisionNotes': null
    'sbg:revision': 0
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1526564289
    'sbg:revisionNotes': ''
    'sbg:revision': 1
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1526565096
    'sbg:revisionNotes': ''
    'sbg:revision': 2
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1526565291
    'sbg:revisionNotes': ''
    'sbg:revision': 3
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527175603
    'sbg:revisionNotes': ''
    'sbg:revision': 4
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527176272
    'sbg:revisionNotes': SamToFastq update
    'sbg:revision': 5
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527176321
    'sbg:revisionNotes': RSEM Reference Add
    'sbg:revision': 6
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527176450
    'sbg:revisionNotes': ''
    'sbg:revision': 7
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527177806
    'sbg:revisionNotes': SamToFastq correction
    'sbg:revision': 8
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527184891
    'sbg:revisionNotes': ''
    'sbg:revision': 9
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527184996
    'sbg:revisionNotes': ''
    'sbg:revision': 10
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527261547
    'sbg:revisionNotes': latest
    'sbg:revision': 11
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527262109
    'sbg:revisionNotes': Labels add
    'sbg:revision': 12
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527286206
    'sbg:revisionNotes': threads exposed
    'sbg:revision': 13
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527286471
    'sbg:revisionNotes': threads connect
    'sbg:revision': 14
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527286600
    'sbg:revisionNotes': back to revision 12
    'sbg:revision': 15
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527372036
    'sbg:revisionNotes': output prefix exposed
    'sbg:revision': 16
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527372205
    'sbg:revisionNotes': ''
    'sbg:revision': 17
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527372304
    'sbg:revisionNotes': threads default
    'sbg:revision': 18
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527372722
    'sbg:revisionNotes': Description add
    'sbg:revision': 19
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1527499452
    'sbg:revisionNotes': threads add
    'sbg:revision': 20
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1528884792
    'sbg:revisionNotes': Add batch for BAM
    'sbg:revision': 21
    'sbg:modifiedBy': igor_hut
  - 'sbg:modifiedOn': 1528884917
    'sbg:revisionNotes': ''
    'sbg:revision': 22
    'sbg:modifiedBy': igor_hut
  - 'sbg:modifiedOn': 1530030300
    'sbg:revisionNotes': Convert CRAM to BAM add
    'sbg:revision': 23
    'sbg:modifiedBy': veliborka_josipovic
'sbg:revision': 23
'abg:revisionNotes': Convert CRAM to BAM add
'sbg:validationErrors': []
'sbg:image_url': >-
  https://igor.sbgenomics.com/ns/brood/images/veliborka_josipovic/gtex-rna-seq-pipeline/rna-seq-pipeline/23.png
'sbg:contributors':
  - veliborka_josipovic
  - igor_hut

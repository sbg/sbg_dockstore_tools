class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://sevenbridges.com'
id: veliborka_josipovic/gtex-rna-seq-pipeline/rna_seqc/7
baseCommand: []
inputs:
  - 'sbg:category': Required
    id: input_bam
    type: File
    label: BAM File
    doc: >-
      An index BAM file. The BAM file must have a proper BAM header with
      read groups.  Each read group must contain the platform (PL) and
      sample (SM) tags.
    'sbg:fileTypes': BAM
    secondaryFiles:
      - .bai
  - 'sbg:category': Required
    id: GTF_file
    type: File
    inputBinding:
      position: 2
      prefix: '-t'
      shellQuote: false
    label: Gene annotation GTF File
    doc: >-
      A file containing a genome annotation in GTF format.  NOTE: The
      transcript_id and gene_id attributes are required in the GTF file.
    'sbg:fileTypes': GTF
  - 'sbg:category': Required
    id: reference
    type: File
    inputBinding:
      position: 3
      prefix: '-r'
      shellQuote: false
    label: Reference
    doc: >-
      The sequence for the reference genome in FASTA format. The reference
      sequence must have an index (.fai). Both files (FASTA and FAI) must
      be located in the same directory. NOTE: The contig names in the
      reference sequence should match the contig names in the BAM file.
    'sbg:fileTypes': FASTA
    secondaryFiles:
      - .fai
outputs:
  - id: all_files_archive
    doc: TAR archive which contains all the output files.
    label: All Files Archive
    type: File?
    outputBinding:
      glob: '*.tar'
    'sbg:fileTypes': TAR
label: RNA-SeQC
arguments:
  - position: 0
    prefix: '-n'
    shellQuote: false
    valueFrom: '1000'
  - position: 1
    prefix: '-s'
    shellQuote: false
    valueFrom: |-
      ${
          bam = inputs.input_bam
          prefix = bam.path.split('/').pop().split('.')[0]
          
          return prefix + "," + inputs.input_bam.path + "," + prefix
      }
  - position: 5
    prefix: ''
    shellQuote: false
    valueFrom: |-
      ${
          return "-noDoc -strictMode -gatkFlags --allow_potentially_misencoded_quality_scores"
      }
  - position: 4
    prefix: '-o'
    shellQuote: false
    valueFrom: |-
      ${
          bam = inputs.input_bam
          prefix = bam.path.split('/').pop().split('.')[0]
          
          return prefix + "_rna_seqc_out"
      }
  - position: 6
    prefix: ''
    shellQuote: false
    valueFrom: |-
      ${
          prefix = inputs.input_bam.path.split('/').pop().split('.')[0]
          return "&& tar -vcf " + prefix + "_rna_seqc_out" + ".tar " + "./" + prefix + "_rna_seqc_out"
      }
  - position: -1
    prefix: ''
    shellQuote: false
    valueFrom: |-
      ${
          return "update-java-alternatives --set java-1.7.0-openjdk-amd64 && java -jar /opt/RNA-SeQC_1.1.9/RNA-SeQC.jar "
      }
requirements:
  - class: ShellCommandRequirement
  - class: DockerRequirement
    dockerPull: 'images.sbgenomics.com/veliborka_josipovic/gtex_rnaseq:version2'
  - class: InlineJavascriptRequirement
'sbg:modifiedOn': 1527261418
'sbg:latestRevision': 7
'sbg:sbgMaintained': false
'sbg:appVersion':
  - v1.0
'sbg:id': veliborka_josipovic/gtex-rna-seq-pipeline/rna_seqc/7
'sbg:createdOn': 1526480257
'sbg:validationErrors': []
'sbg:image_url': >-
  https://igor.sbgenomics.com/ns/brood/images/veliborka_josipovic/gtex-rna-seq-pipeline/rna_seqc/7.png
'sbg:revisionsInfo':
  - 'sbg:revision': 0
    'sbg:modifiedOn': 1526480257
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': null
  - 'sbg:revision': 1
    'sbg:modifiedOn': 1526480753
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 2
    'sbg:modifiedOn': 1527170325
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': latest
  - 'sbg:revision': 3
    'sbg:modifiedOn': 1527170431
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': latest
  - 'sbg:revision': 4
    'sbg:modifiedOn': 1527170680
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': latest
  - 'sbg:revision': 5
    'sbg:modifiedOn': 1527172416
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': latest
  - 'sbg:revision': 6
    'sbg:modifiedOn': 1527248053
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': Change Java version to 1.7
  - 'sbg:revision': 7
    'sbg:modifiedOn': 1527261418
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': delete hint
'sbg:contributors':
  - veliborka_josipovic
'sbg:modifiedBy': veliborka_josipovic
'sbg:publisher': sbg
'sbg:projectName': GTEX RNA-seq pipeline
'sbg:revisionNotes': delete hint
'sbg:createdBy': veliborka_josipovic
'sbg:project': veliborka_josipovic/gtex-rna-seq-pipeline
'sbg:revision': 7
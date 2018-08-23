class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://sevenbridges.com'
id: veliborka_josipovic/gtex-rna-seq-pipeline/convert-cram-to-bam/20
baseCommand: []
inputs:
  - 'sbg:category': Required
    id: input_cram
    type: File
    label: CRAM file
    doc: Input CRAM file.
    'sbg:fileTypes': CRAM
    secondaryFiles:
      - .crai
  - 'sbg:category': Required
    id: reference
    type: File
    label: Refrence File
    doc: >-
      A FASTA format reference file, optionally compressed by bgzip and ideally
      indexed by SAMtools Faidx. If an index is not present, one will be
      generated for you. This file is used for compression/decompression of CRAM
      files. Please provide reference file when using CRAM input/output file.
    'sbg:fileTypes': FASTA
    secondaryFiles:
      - .fai
outputs:
  - id: output_file
    doc: Output BAM file.
    label: BAM File
    type: File?
    outputBinding:
      glob: '*.bam'
    'sbg:fileTypes': BAM
label: Convert CRAM to BAM
arguments:
  - position: 0
    prefix: ''
    shellQuote: false
    valueFrom: |-
      ${
          cram = inputs.input_cram
          reference = inputs.reference
          bam_file_name = cram.path.split('/').pop().split('.').slice(0,-1).join('.') + ".bam"
          return "samtools view -bT " + reference.path + ' ' + cram.path + " -o " + bam_file_name
          
      }
requirements:
  - class: ShellCommandRequirement
  - class: DockerRequirement
    dockerPull: 'images.sbgenomics.com/veliborka_josipovic/gtex_rnaseq:version2'
  - class: InlineJavascriptRequirement
'sbg:latestRevision': 20
'sbg:revisionNotes': add crai file
'sbg:modifiedBy': veliborka_josipovic
'sbg:project': veliborka_josipovic/gtex-rna-seq-pipeline
'sbg:sbgMaintained': false
'sbg:createdOn': 1530011918
'sbg:publisher': sbg
'sbg:createdBy': veliborka_josipovic
'sbg:id': veliborka_josipovic/gtex-rna-seq-pipeline/convert-cram-to-bam/20
'sbg:appVersion':
  - v1.0
'sbg:projectName': GTEX RNA-seq pipeline
'sbg:modifiedOn': 1530183542
'sbg:revisionsInfo':
  - 'sbg:modifiedOn': 1530011918
    'sbg:revisionNotes': null
    'sbg:revision': 0
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530012601
    'sbg:revisionNotes': ''
    'sbg:revision': 1
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530013315
    'sbg:revisionNotes': Remove shell quote
    'sbg:revision': 2
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530013784
    'sbg:revisionNotes': ''
    'sbg:revision': 3
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530014146
    'sbg:revisionNotes': ''
    'sbg:revision': 4
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530014196
    'sbg:revisionNotes': ''
    'sbg:revision': 5
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530014469
    'sbg:revisionNotes': ''
    'sbg:revision': 6
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530014717
    'sbg:revisionNotes': ''
    'sbg:revision': 7
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530014893
    'sbg:revisionNotes': ''
    'sbg:revision': 8
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530016646
    'sbg:revisionNotes': reference add
    'sbg:revision': 9
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530019509
    'sbg:revisionNotes': ''
    'sbg:revision': 10
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530019961
    'sbg:revisionNotes': ''
    'sbg:revision': 11
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530025981
    'sbg:revisionNotes': ''
    'sbg:revision': 12
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530026328
    'sbg:revisionNotes': ''
    'sbg:revision': 13
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530027868
    'sbg:revisionNotes': ''
    'sbg:revision': 14
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530028424
    'sbg:revisionNotes': ''
    'sbg:revision': 15
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530028465
    'sbg:revisionNotes': ''
    'sbg:revision': 16
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530029398
    'sbg:revisionNotes': ''
    'sbg:revision': 17
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530029545
    'sbg:revisionNotes': Reference index add
    'sbg:revision': 18
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530030120
    'sbg:revisionNotes': Add description
    'sbg:revision': 19
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:modifiedOn': 1530183542
    'sbg:revisionNotes': add crai file
    'sbg:revision': 20
    'sbg:modifiedBy': veliborka_josipovic
'sbg:revision': 20
'abg:revisionNotes': add crai file
'sbg:validationErrors': []
'sbg:image_url': >-
  https://igor.sbgenomics.com/ns/brood/images/veliborka_josipovic/gtex-rna-seq-pipeline/convert-cram-to-bam/20.png
'sbg:contributors':
  - veliborka_josipovic

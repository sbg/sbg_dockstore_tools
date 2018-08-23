class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://sevenbridges.com'
id: veliborka_josipovic/gtex-rna-seq-pipeline/bamtools-index/4
baseCommand:
  - /opt/bamtools/bin/bamtools
  - index
inputs:
  - 'sbg:category': Required
    id: input_bam
    type: File
    inputBinding:
      position: 0
      prefix: '-in'
      shellQuote: false
      valueFrom: |-
        ${
            return inputs.input_bam.path.split('/').pop()
        }
    label: BAM File
    doc: The input BAM file to be indexed.
    'sbg:fileTypes': BAM
outputs:
  - id: bam_index
    doc: BAM Indexed File (*.bai).
    label: BAM Index
    type: File?
    outputBinding:
      glob: '*.bai'
    'sbg:fileTypes': BAI
  - id: output_bam
    doc: Output input BAM file.
    label: BAM File
    type: File?
    outputBinding:
      glob: '*.bam'
    'sbg:fileTypes': BAM
label: BamTools Index
requirements:
  - class: ShellCommandRequirement
  - class: ResourceRequirement
    ramMin: 1000
  - class: DockerRequirement
    dockerPull: 'images.sbgenomics.com/veliborka_josipovic/bamtools:2.4.0'
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.input_bam)
  - class: InlineJavascriptRequirement
'sbg:modifiedOn': 1526564759
'sbg:latestRevision': 4
'sbg:sbgMaintained': false
'sbg:id': veliborka_josipovic/gtex-rna-seq-pipeline/bamtools-index/4
'sbg:createdOn': 1526561810
'sbg:validationErrors': []
'sbg:image_url': >-
  https://igor.sbgenomics.com/ns/brood/images/veliborka_josipovic/gtex-rna-seq-pipeline/bamtools-index/4.png
'sbg:revisionsInfo':
  - 'sbg:revision': 0
    'sbg:modifiedOn': 1526561810
    'sbg:revisionNotes': null
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:revision': 1
    'sbg:modifiedOn': 1526561826
    'sbg:revisionNotes': ''
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:revision': 2
    'sbg:modifiedOn': 1526561952
    'sbg:revisionNotes': ''
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:revision': 3
    'sbg:modifiedOn': 1526561959
    'sbg:revisionNotes': ''
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:revision': 4
    'sbg:modifiedOn': 1526564759
    'sbg:revisionNotes': ''
    'sbg:modifiedBy': veliborka_josipovic
'sbg:contributors':
  - veliborka_josipovic
'sbg:modifiedBy': veliborka_josipovic
'sbg:publisher': sbg
'sbg:projectName': GTEX RNA-seq pipeline
'sbg:revisionNotes': ''
'sbg:appVersion':
  - v1.0
'sbg:createdBy': veliborka_josipovic
'sbg:project': veliborka_josipovic/gtex-rna-seq-pipeline
'sbg:revision': 4
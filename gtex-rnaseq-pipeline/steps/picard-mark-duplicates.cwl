class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://sevenbridges.com'
id: veliborka_josipovic/gtex-rna-seq-pipeline/picard-markduplicates/4
baseCommand:
  - /src/run_MarkDuplicates.py
inputs:
  - 'sbg:category': Required
    id: input_bam
    type: File
    inputBinding:
      position: 0
      shellQuote: false
    label: BAM File
    doc: 'Aligned, coordinate soorted BAM file.'
    'sbg:fileTypes': BAM
outputs:
  - id: marked_duplicates_bam
    doc: The output file which contains marked records.
    label: Duplicates Marked BAM File
    type: File?
    outputBinding:
      glob: '*md.bam'
    'sbg:fileTypes': BAM
  - id: metrics_file
    doc: File which contains duplication metrics.
    label: Metrics File
    type: File?
    outputBinding:
      glob: '*.txt'
    'sbg:fileTypes': TXT
label: Picard MarkDuplicates
arguments:
  - position: 1
    prefix: ''
    shellQuote: false
    valueFrom: |-
      ${
          bam_file = inputs.input_bam
         
          output_prefix = bam_file.path.split('/').pop().split('.').slice(0,-1).join(".") + ".md"

          return output_prefix
      }
requirements:
  - class: ShellCommandRequirement
  - class: DockerRequirement
    dockerPull: 'images.sbgenomics.com/veliborka_josipovic/gtex_rnaseq:version2'
  - class: InlineJavascriptRequirement
'sbg:modifiedOn': 1527169689
'sbg:latestRevision': 4
'sbg:sbgMaintained': false
'sbg:id': veliborka_josipovic/gtex-rna-seq-pipeline/picard-markduplicates/4
'sbg:createdOn': 1526466688
'sbg:validationErrors': []
'sbg:image_url': >-
  https://igor.sbgenomics.com/ns/brood/images/veliborka_josipovic/gtex-rna-seq-pipeline/picard-markduplicates/4.png
'sbg:revisionsInfo':
  - 'sbg:revision': 0
    'sbg:modifiedOn': 1526466688
    'sbg:revisionNotes': null
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:revision': 1
    'sbg:modifiedOn': 1526466709
    'sbg:revisionNotes': ''
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:revision': 2
    'sbg:modifiedOn': 1526467176
    'sbg:revisionNotes': Tool name change
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:revision': 3
    'sbg:modifiedOn': 1526469565
    'sbg:revisionNotes': ''
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:revision': 4
    'sbg:modifiedOn': 1527169689
    'sbg:revisionNotes': latest
    'sbg:modifiedBy': veliborka_josipovic
'sbg:contributors':
  - veliborka_josipovic
'sbg:modifiedBy': veliborka_josipovic
'sbg:publisher': sbg
'sbg:projectName': GTEX RNA-seq pipeline
'sbg:revisionNotes': latest
'sbg:appVersion':
  - v1.0
'sbg:createdBy': veliborka_josipovic
'sbg:project': veliborka_josipovic/gtex-rna-seq-pipeline
'sbg:revision': 4
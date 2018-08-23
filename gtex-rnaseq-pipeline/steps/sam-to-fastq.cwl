class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://sevenbridges.com'
id: veliborka_josipovic/gtex-rna-seq-pipeline/sam-to-fastq/6
baseCommand:
  - /src/run_SamToFastq.py
inputs:
  - 'sbg:category': Required
    id: input_bam
    type: File
    inputBinding:
      position: 0
      shellQuote: false
    label: BAM File
    doc: Input BAM file to extract reads from.
    'sbg:fileTypes': BAM
  - 'sbg:category': Optional
    id: output_prefix
    type: string?
    label: Output Prefix
    doc: Prefix for output files - usually <sample_id>.
outputs:
  - id: first_end_fastq
    doc: First end of the pair FASTQ.
    label: First End FASTQ
    type: File?
    outputBinding:
      glob: '*1.fastq.gz'
    'sbg:fileTypes': FASTQ.GZ
  - id: second_end_fastq
    doc: Second end of the pair FASTQ.
    label: Second End FASTQ
    type: File?
    outputBinding:
      glob: '*2.fastq.gz'
    'sbg:fileTypes': FASTQ.GZ
  - id: unpaired_fastq
    doc: Output FASTQ file which contains unpaired reads.
    label: Unpaired FASTQ
    type: File?
    outputBinding:
      glob: '*unpaired.fastq.gz'
    'sbg:fileTypes': FASTQ.GZ
label: SamToFastq
arguments:
  - position: 1
    prefix: '-p'
    shellQuote: false
    valueFrom: |
      ${
          output_prefix = inputs.output_prefix
          if (!output_prefix)
          {
              output_prefix = inputs.input_bam.path.split('/').pop().split('.')[0]
              
          }
          return output_prefix
      }
requirements:
  - class: ShellCommandRequirement
  - class: ResourceRequirement
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'images.sbgenomics.com/veliborka_josipovic/gtex_rnaseq:version2'
  - class: InlineJavascriptRequirement
'sbg:modifiedOn': 1527177747
'sbg:latestRevision': 6
'sbg:sbgMaintained': false
'sbg:id': veliborka_josipovic/gtex-rna-seq-pipeline/sam-to-fastq/6
'sbg:createdOn': 1526393755
'sbg:validationErrors': []
'sbg:image_url': >-
  https://igor.sbgenomics.com/ns/brood/images/veliborka_josipovic/gtex-rna-seq-pipeline/sam-to-fastq/6.png
'sbg:revisionsInfo':
  - 'sbg:revision': 0
    'sbg:modifiedOn': 1526393755
    'sbg:revisionNotes': null
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:revision': 1
    'sbg:modifiedOn': 1526394694
    'sbg:revisionNotes': 'gtex_rnaseq:V8'
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:revision': 2
    'sbg:modifiedOn': 1526395573
    'sbg:revisionNotes': ''
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:revision': 3
    'sbg:modifiedOn': 1527079273
    'sbg:revisionNotes': ''
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:revision': 4
    'sbg:modifiedOn': 1527159915
    'sbg:revisionNotes': latest version
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:revision': 5
    'sbg:modifiedOn': 1527176058
    'sbg:revisionNotes': ''
    'sbg:modifiedBy': veliborka_josipovic
  - 'sbg:revision': 6
    'sbg:modifiedOn': 1527177747
    'sbg:revisionNotes': typo correction
    'sbg:modifiedBy': veliborka_josipovic
'sbg:contributors':
  - veliborka_josipovic
'sbg:modifiedBy': veliborka_josipovic
'sbg:publisher': sbg
'sbg:projectName': GTEX RNA-seq pipeline
'sbg:revisionNotes': typo correction
'sbg:appVersion':
  - v1.0
'sbg:createdBy': veliborka_josipovic
'sbg:project': veliborka_josipovic/gtex-rna-seq-pipeline
'sbg:revision': 6
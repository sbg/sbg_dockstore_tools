class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://sevenbridges.com'
id: veliborka_josipovic/gtex-rna-seq-pipeline/rsem/5
baseCommand: []
inputs:
  - 'sbg:category': Required
    id: rsem_reference
    type: File
    label: RSEM Reference
    doc: TAR bundle containing generated indices.
    'sbg:fileTypes': TAR
  - 'sbg:category': Optional
    id: threads
    type: int?
    label: Threads
    doc: Number og threads.
  - 'sbg:category': Required
    id: transcriptome_bam
    type: File?
    label: Transcriptome BAM
    doc: File containing alignments translated into transcript coordinates.
    'sbg:fileTypes': BAM
outputs:
  - id: rsem_genes
    doc: File containing gene level expression estimates.
    label: RSEM Genes
    type: File?
    outputBinding:
      glob: '*.rsem.genes.results'
  - id: rsem_isoforms
    doc: File containing isoform level expression estimates.
    label: RSEM Isoforms
    type: File?
    outputBinding:
      glob: '*.rsem.isoforms.results'
  - id: rsem_statistics
    doc: Model related statistics files.
    label: RSEM Model Statistics
    type:
      - 'null'
      - File
      - type: array
        items: File
    outputBinding:
      glob: |-
        ${
            transcriptome_bam = inputs.transcriptome_bam.path
            prefix = transcriptome_bam.split('/').pop().split('.')[0]
            return prefix + ".rsem.stat/*"
        }
label: RSEM
arguments:
  - position: 0
    prefix: ''
    shellQuote: false
    valueFrom: |-
      ${
          rsem_reference = inputs.rsem_reference.path
          transcriptome_bam = inputs.transcriptome_bam.path
          
          sample_id = transcriptome_bam.split('/').pop().split('.')[0]
          rsem_reference_folder = rsem_reference.split('/').pop().split('.').slice(0,-1).join()
          
          threads = inputs.threads ? inputs.threads : 4
          
          return "tar -xvf " + rsem_reference + " && /src/run_RSEM.py " + "./" + rsem_reference_folder + " " + transcriptome_bam + " " + sample_id + " --threads " + threads
      }
requirements:
  - class: ShellCommandRequirement
  - class: ResourceRequirement
    coresMin: |-
      ${
          return inputs.threads ? inputs.threads : 4
      }
  - class: DockerRequirement
    dockerPull: 'images.sbgenomics.com/veliborka_josipovic/gtex_rnaseq:version2'
  - class: InlineJavascriptRequirement
'sbg:modifiedOn': 1527252747
'sbg:latestRevision': 5
'sbg:sbgMaintained': false
'sbg:appVersion':
  - v1.0
'sbg:id': veliborka_josipovic/gtex-rna-seq-pipeline/rsem/5
'sbg:createdOn': 1526488212
'sbg:validationErrors': []
'sbg:image_url': >-
  https://igor.sbgenomics.com/ns/brood/images/veliborka_josipovic/gtex-rna-seq-pipeline/rsem/5.png
'sbg:revisionsInfo':
  - 'sbg:revision': 0
    'sbg:modifiedOn': 1526488212
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': null
  - 'sbg:revision': 1
    'sbg:modifiedOn': 1526488220
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 2
    'sbg:modifiedOn': 1526488302
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': Typo correction
  - 'sbg:revision': 3
    'sbg:modifiedOn': 1526490043
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 4
    'sbg:modifiedOn': 1527173513
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': latest
  - 'sbg:revision': 5
    'sbg:modifiedOn': 1527252747
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': threads change
'sbg:contributors':
  - veliborka_josipovic
'sbg:modifiedBy': veliborka_josipovic
'sbg:publisher': sbg
'sbg:projectName': GTEX RNA-seq pipeline
'sbg:revisionNotes': threads change
'sbg:createdBy': veliborka_josipovic
'sbg:project': veliborka_josipovic/gtex-rna-seq-pipeline
'sbg:revision': 5
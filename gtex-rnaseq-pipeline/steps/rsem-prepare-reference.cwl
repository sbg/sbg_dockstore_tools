class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://sevenbridges.com'
id: veliborka_josipovic/gtex-rna-seq-pipeline/rsem-prepare-reference/4
baseCommand: []
inputs:
  - 'sbg:category': Optional
    id: threads
    type: int?
    label: Threads
    doc: Number of threads.
  - 'sbg:category': Required
    id: rsem_reference
    type: File
    label: Rsem Reference
    doc: >-
      Reference FASTA file or TAR bundle containing already generated
      indices instead of a FASTA file in order to skip indexing for faster
      workflow execution.
    'sbg:fileTypes': 'TAR, FASTA'
  - 'sbg:category': Optional
    id: GTF_file
    type: File?
    label: Gene Annotation File
    doc: >-
      Optional GTF file to be suplied if a full genome sequence instead of
      a transcript sequence is used as reference FASTA input. RSEM will
      then extract transcript reference sequences using the gene
      annotations specified in this file.
    'sbg:fileTypes': GTF
outputs:
  - id: rsem_prepare_reference_archive
    doc: All files rsem reference archive.
    label: All Files Archive
    type: File?
    outputBinding:
      glob: '*.tar'
    'sbg:fileTypes': TAR
label: RSEM Prepare Reference
arguments:
  - position: 1
    prefix: ''
    shellQuote: false
    valueFrom: |-
      ${
          rsem_reference = inputs.rsem_reference
          gtf_file = inputs.GTF_file
          threads = inputs.threads ? inputs.threads : 4
          
          rsem_reference_ext = rsem_reference.path.split('/').pop().split('.').pop()
              
          if (rsem_reference_ext == "TAR" || rsem_reference_ext == "tar")
          {
              return "echo 'Tar bundle provided, skipping indexing.' "
          }
          else
          {
              if (gtf_file)
              {
                  rsem_output_folder = rsem_reference.path.split('/').pop().split('.').slice(0,-1).join('.') + "_rsem_reference"
              
                  return "rsem-prepare-reference " + rsem_reference.path + " " + rsem_output_folder + "/rsem_reference" + " --gtf " + gtf_file.path + " --num-threads " + threads + " && tar -vcf " + rsem_output_folder + ".tar " + "./" + rsem_output_folder
                      
              }
              else
              {
                  return "echo 'GTF file must be provided.' "
              }
          
          }
              
      }
  - position: 0
    prefix: ''
    shellQuote: false
    valueFrom: |-
      ${
          rsem_reference = inputs.rsem_reference
          rsem_output_folder = rsem_reference.path.split('/').pop().split('.').slice(0,-1).join('.') + "_rsem_reference"
          
          return "mkdir " + rsem_output_folder + " && "
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
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.rsem_reference)
  - class: InlineJavascriptRequirement
'sbg:modifiedOn': 1527252555
'sbg:latestRevision': 4
'sbg:sbgMaintained': false
'sbg:appVersion':
  - v1.0
'sbg:id': veliborka_josipovic/gtex-rna-seq-pipeline/rsem-prepare-reference/4
'sbg:createdOn': 1526484888
'sbg:validationErrors': []
'sbg:image_url': >-
  https://igor.sbgenomics.com/ns/brood/images/veliborka_josipovic/gtex-rna-seq-pipeline/rsem-prepare-reference/4.png
'sbg:revisionsInfo':
  - 'sbg:revision': 0
    'sbg:modifiedOn': 1526484888
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': null
  - 'sbg:revision': 1
    'sbg:modifiedOn': 1526484899
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 2
    'sbg:modifiedOn': 1526485577
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': Link rsem_reference
  - 'sbg:revision': 3
    'sbg:modifiedOn': 1527173408
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 4
    'sbg:modifiedOn': 1527252555
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
'sbg:revision': 4
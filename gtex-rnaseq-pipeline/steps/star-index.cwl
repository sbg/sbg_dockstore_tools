class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://sevenbridges.com'
id: veliborka_josipovic/gtex-rna-seq-pipeline/starindex/9
baseCommand: []
inputs:
  - 'sbg:category': Required
    id: reference_or_index
    type: File
    inputBinding:
      position: 0
      shellQuote: false
      valueFrom: |-
        ${
            reference = inputs.reference_or_index.path.split('/').pop()
            reference_ext = reference.split('.').pop()
            runThreadN = inputs.runThreadN ? inputs.runThreadN : 4
            if (reference_ext == 'fasta' || reference_ext == "FASTA" || reference_ext == "fa" || reference_ext == "FA") 
            {
                return "mkdir genomeDir && STAR --runMode genomeGenerate --genomeDir ./genomeDir " + "--genomeFastaFiles " + inputs.reference_or_index.path + " --sjdbGTFfile " + inputs.GTF_file.path +  " --sjdbOverhang 75 --runThreadN " + runThreadN + " && tar -vcf genomeDir.tar ./genomeDir"
            } 
            else if (reference_ext == 'tar' || reference_ext == 'TAR') 
            {
                return "echo 'Tar bundle provided, skipping indexing.' "
                
            }
        }
    label: Reference/Index Files
    doc: >-
      Reference sequence to which to align the reads, or a TAR bundle
      containing already generated indices.
    'sbg:fileTypes': 'FASTA, TAR'
  - 'sbg:category': Optional
    id: runThreadN
    type: int?
    label: Threads
    doc: The number of threads to be used for genome generation.
  - 'sbg:category': Required
    id: GTF_file
    type: File?
    label: GTF File
    doc: File with annotated transcripts in the standard GTF format.
    'sbg:fileTypes': GTF
outputs:
  - id: genome
    doc: >-
      Genome files comprise binary genome sequence, suffix arrays, text
      chromosome names/lengths, splice junctions coordinates, and
      transcripts/genes information.
    label: Genome FIles
    type: File?
    outputBinding:
      glob: '*.tar'
    'sbg:fileTypes': TAR
label: STAR Index
requirements:
  - class: ShellCommandRequirement
  - class: ResourceRequirement
    ramMin: 60000
    coresMin: |-
      ${
        return inputs.runThreadN ? inputs.runThreadN : 4
      }
  - class: DockerRequirement
    dockerPull: 'images.sbgenomics.com/veliborka_josipovic/gtex_rnaseq:version2'
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.reference_or_index)
  - class: InlineJavascriptRequirement
'sbg:modifiedOn': 1527261351
'sbg:latestRevision': 9
'sbg:sbgMaintained': false
'sbg:appVersion':
  - v1.0
'sbg:id': veliborka_josipovic/gtex-rna-seq-pipeline/starindex/9
'sbg:createdOn': 1526395714
'sbg:validationErrors': []
'sbg:contributors':
  - veliborka_josipovic
'sbg:revisionsInfo':
  - 'sbg:revision': 0
    'sbg:modifiedOn': 1526395714
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': null
  - 'sbg:revision': 1
    'sbg:modifiedOn': 1526395943
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 2
    'sbg:modifiedOn': 1526396008
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 3
    'sbg:modifiedOn': 1526397164
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': Description add
  - 'sbg:revision': 4
    'sbg:modifiedOn': 1526399938
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': GTF_file optional
  - 'sbg:revision': 5
    'sbg:modifiedOn': 1526401012
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 6
    'sbg:modifiedOn': 1526485864
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': link reference or index file
  - 'sbg:revision': 7
    'sbg:modifiedOn': 1527167675
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': latest version
  - 'sbg:revision': 8
    'sbg:modifiedOn': 1527252491
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': threads change
  - 'sbg:revision': 9
    'sbg:modifiedOn': 1527261351
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': memory 60gb
'sbg:modifiedBy': veliborka_josipovic
'sbg:image_url': >-
  https://igor.sbgenomics.com/ns/brood/images/veliborka_josipovic/gtex-rna-seq-pipeline/starindex/9.png
'sbg:publisher': sbg
'sbg:projectName': GTEX RNA-seq pipeline
'sbg:revisionNotes': memory 60gb
'sbg:createdBy': veliborka_josipovic
'sbg:project': veliborka_josipovic/gtex-rna-seq-pipeline
'sbg:revision': 9
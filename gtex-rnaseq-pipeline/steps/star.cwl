class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://sevenbridges.com'
id: veliborka_josipovic/gtex-rna-seq-pipeline/star-v2-5-3a/13
baseCommand: []
inputs:
  - 'sbg:category': Required
    id: genome_index
    type: File
    inputBinding:
      position: 0
      shellQuote: false
      valueFrom: |-
        ${
            genome_index = inputs.genome_index.path.split('/').pop()
            return "tar -xvf " + genome_index + " && /src/run_STAR.py " + "./" + genome_index.split('.').slice(0,-1).join()
        }
    label: Genome Index
    doc: Tar file which contains the genome indices.
    'sbg:fileTypes': TAR
  - 'sbg:category': Required
    id: first_end_fastq
    type: File
    inputBinding:
      position: 1
      prefix: ''
      shellQuote: false
    label: First End FASTQ
    doc: First end fastq file.
    'sbg:fileTypes': FASTQ.GZ
  - 'sbg:category': Required
    id: second_end_fastq
    type: File
    inputBinding:
      position: 2
      prefix: ''
      shellQuote: false
    label: Second End FASTQ
    doc: Second end fastq file.
    'sbg:fileTypes': FASTQ.GZ
  - 'sbg:category': Optional
    id: threads
    type: int?
    label: Threads
    doc: The number of threads to be used for a mapping.
outputs:
  - id: tar_archive
    doc: TAR archive with all the output files.
    label: All Files Archive
    type: File?
    outputBinding:
      glob: '*star_out.tar'
    'sbg:fileTypes': TAR
  - id: aligned_sorted_bam
    doc: 'Aligned, sorted by coordinate BAM file.'
    label: Aligned Sorted BAM File
    type: File?
    outputBinding:
      glob: |-
        ${
            prefix_1 = inputs.first_end_fastq.path.split('/').pop().split('.')[0]
            prefix = prefix_1.replace(/_1/, '')
            return prefix + "_star_out/*Aligned.sortedByCoord.out.bam"
        }
    'sbg:fileTypes': BAM
  - id: sorted_bam_index
    doc: 'Alignem, sorted by coordinate bam index file.'
    label: Aligned Sorted BAM Index
    type: File?
    outputBinding:
      glob: |-
        ${
            prefix_1 = inputs.first_end_fastq.path.split('/').pop().split('.')[0]
            prefix = prefix_1.replace(/_1/, '')
            return prefix + "_star_out/*Aligned.sortedByCoord.out.bam.bai"
        }
    'sbg:fileTypes': BAI
  - id: transcriptome_bam
    doc: File containing alignments translated into transcript coordinates.
    label: Transcriptome Aligned BAM File
    type: File?
    outputBinding:
      glob: |-
        ${
            prefix_1 = inputs.first_end_fastq.path.split('/').pop().split('.')[0]
            prefix = prefix_1.replace(/_1/, '')
            return prefix + "_star_out/*Aligned.toTranscriptome.out.bam"
        }
    'sbg:fileTypes': BAM
label: STAR
arguments:
  - position: 5
    prefix: '--output_dir'
    shellQuote: false
    valueFrom: |-
      ${
          prefix_1 = inputs.first_end_fastq.path.split('/').pop().split('.')[0]
          prefix = prefix_1.replace(/_1/, '')
          return prefix + "_star_out" 
      }
  - position: 3
    prefix: ''
    shellQuote: false
    valueFrom: |-
      ${
          
          prefix_1 = inputs.first_end_fastq.path.split('/').pop().split('.')[0]
          prefix = prefix_1.replace(/_1/, '')
          return prefix
      }
  - position: 6
    prefix: ''
    shellQuote: false
    valueFrom: |-
      ${
          prefix_1 = inputs.first_end_fastq.path.split('/').pop().split('.')[0]
          prefix = prefix_1.replace(/_1/, '')
          
          return "&& tar -vcf " + prefix + "_" + "star_out.tar ./" + prefix + "_star_out"
      }
  - position: 4
    prefix: '--threads'
    shellQuote: false
    valueFrom: |-
      ${
          return inputs.threads? inputs.threads : 4
      }
requirements:
  - class: ShellCommandRequirement
  - class: ResourceRequirement
    ramMin: 60000
    coresMin: |-
      ${
        return inputs.threads ? inputs.threads : 4
      }
  - class: DockerRequirement
    dockerPull: 'images.sbgenomics.com/veliborka_josipovic/gtex_rnaseq:version2'
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.genome_index)
  - class: InlineJavascriptRequirement
'sbg:modifiedOn': 1527256447
'sbg:latestRevision': 13
'sbg:sbgMaintained': false
'sbg:appVersion':
  - v1.0
'sbg:id': veliborka_josipovic/gtex-rna-seq-pipeline/star-v2-5-3a/13
'sbg:createdOn': 1526397445
'sbg:validationErrors': []
'sbg:image_url': >-
  https://igor.sbgenomics.com/ns/brood/images/veliborka_josipovic/gtex-rna-seq-pipeline/star-v2-5-3a/13.png
'sbg:revisionsInfo':
  - 'sbg:revision': 0
    'sbg:modifiedOn': 1526397445
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': null
  - 'sbg:revision': 1
    'sbg:modifiedOn': 1526397616
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 2
    'sbg:modifiedOn': 1526402170
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 3
    'sbg:modifiedOn': 1526402414
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 4
    'sbg:modifiedOn': 1526402967
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 5
    'sbg:modifiedOn': 1526403534
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 6
    'sbg:modifiedOn': 1526414130
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 7
    'sbg:modifiedOn': 1526463579
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': Description add
  - 'sbg:revision': 8
    'sbg:modifiedOn': 1526466605
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': ''
  - 'sbg:revision': 9
    'sbg:modifiedOn': 1527169062
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': latest
  - 'sbg:revision': 10
    'sbg:modifiedOn': 1527172722
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': changed sample_id to prefix
  - 'sbg:revision': 11
    'sbg:modifiedOn': 1527252362
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': threads change
  - 'sbg:revision': 12
    'sbg:modifiedOn': 1527255447
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': Increase memory to 40gb
  - 'sbg:revision': 13
    'sbg:modifiedOn': 1527256447
    'sbg:modifiedBy': veliborka_josipovic
    'sbg:revisionNotes': increase memory to 60gb
'sbg:contributors':
  - veliborka_josipovic
'sbg:modifiedBy': veliborka_josipovic
'sbg:publisher': sbg
'sbg:projectName': GTEX RNA-seq pipeline
'sbg:revisionNotes': increase memory to 60gb
'sbg:createdBy': veliborka_josipovic
'sbg:project': veliborka_josipovic/gtex-rna-seq-pipeline
'sbg:revision': 13
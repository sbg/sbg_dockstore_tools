#!/usr/bin/env cwl-runner

class: CommandLineTool
cwlVersion: v1.0
id: pcawg_bwa_sbg_modified
dct:creator:
  foaf:name: SevenBridgesGenomics
  foaf:mbox: "mailto:support@sbgenomics.com"
doc: >-
  The BWA-Mem workflow from the ICGC PanCancer Analysis of Whole Genomes (PCAWG)
  project.

  For more information see the PCAWG project [page](https://dcc.icgc.org/pcawg)
  and the GitHub

  [page](https://github.com/ICGC-TCGA-PanCancer) for the code including the
  source for

  [this workflow](https://github.com/ICGC-TCGA-PanCancer/Seqware-BWA-Workflow).


  ### Common Use Cases

  This tool is used to to realign the reads in BAM format to the provided
  reference, in order to harmonize data with the ICGC PCAWG dataset. To do this,
  set:

  - Reads in BAM format, provided via **Input BAM** port.

  - Reference file **pcawg.icgc.genome.fa.gz** via **Reference file** port. This
  file is available in **Public Reference Files**, along with the required index
  files: 
    - pcawg.icgc.genome.fa.gz.64.ann
    - pcawg.icgc.genome.fa.gz.64.amb
    - pcawg.icgc.genome.fa.gz.64.bwt
    - pcawg.icgc.genome.fa.gz.64.sa
    - pcawg.icgc.genome.fa.gz.64.pac
    - pcawg.icgc.genome.fa.gz.fai
  - For running the tool you need to copy the reference and the index files to
  your project. Only the file **pcawg.icgc.genome.fa.gz** needs to be provided
  via **Reference file** port, index files will be added automatically.


  ### Changes Introduced by Seven Bridges


  The original CWL version of this workflow is optimal for execution with
  cwltool. For this reason, the Docker image had to be modified to create
  folders in docker, adjust environment variables and permissions. These
  changes include:  

  - Editing **start.sh** bash script to make some directories and set env
  variables.

  - Editing **run_seqware_workflow.py** python script to add reference files to
  the working directory (instead of adding them to a root directory).

  - Changing permissions of some files and folders on the Image itself.  


  Tool was additionally modified to optimize for cloud execution and make the
  usage easier. Additional modifications of the tool include:  

  - Adding stdout redirection to a file that is saved with other logs
  (stdout.txt).

  - Added expression for inheriting SBG metadata from input BAM files.

  - Setting an optimal EC2 instance for the tool (c4.2xlarge).

  - Removed all the reference index file inputs and defined them as
  secondaryFile in **reference_gz** input.

  - Removed  **Download reference** and **Output directory** inputs as they
  don’t matter for CGC execution.

  - Input **output_file_basename** set as non-required. Added expressions to
  derive output name from input BAM names by default.

  - Description updated to include additional information and common issues.


  NOTE: Tool modifications do not affect final result. All the reads are aligned
  in the same way as with the original execution.


  ### Common Issues and Important Notes


  - Please use the reference **pcawg.icgc.genome.fa.gz** with corresponding
  index files, available in **Public Reference Files**.

  - Tool will fail if input BAM header does not contain one of the RG fields:
  sample, platform, platform_unit, library - SM PL PU LB.

  - Tool will fail if RGID field in input BAM header is a number.


  ### Performance Benchmarking


  The following table shows examples of run time and cost.  

  *Cost can be reduced with **spot instance** usage. Visit [knowledge
  center](https://docs.sevenbridges.com/docs/about-spot-instances) for more
  details.*  

  | Input BAM size | Cost  | Duration | Instance Type (AWS) |

  |----------------|-------|----------|----------|

  | 5.2GB          | 0.4$ | 51m      | c4.2xlarge      |

  | 95.2GB         | 9.2$ | 22h 52m  | c4.2xlarge       |

  | 143.4GB        | 12.8$ | 31h 5m   | c4.2xlarge     |
$namespaces:
  sbg: 'https://sevenbridges.com'
baseCommand:
  - /start.sh
  - python
  - /home/seqware/Seqware-BWA-Workflow/run_seqware_workflow.py
inputs:
  - id: output_file_basename
    type: string?
    label: "Output File Basename"
    doc: >-
      The basename to use for output files. If not defined, input BAM names will
      be used to set output name.
  - id: reads
    type: 'File[]'
    inputBinding:
      position: 1
      prefix: '--files'
    label: Input BAM
    doc: Input reads in BAM format.
  - id: reference_gz
    type: File
    inputBinding:
      position: 2
      prefix: '--reference-gz'
    label: Reference file
    doc: The reference *.fa.gz file.
    secondaryFiles:
      - .64.amb
      - .64.ann
      - .64.bwt
      - .64.pac
      - .64.sa
      - .fai
outputs:
  - id: merged_output_bam
    doc: Merged Output BAM containing mapped reads.
    label: Merged Output BAM
    type: File
    outputBinding:
      glob: $('datastore/' + output_basename() + '.bam')
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.reads))[0]}
    secondaryFiles:
      - .bai
  - id: merged_output_metrics
    doc: Metrics for output BAM with mapped reads.
    label: Merged Output Metrics
    type: File
    outputBinding:
      glob: $('datastore/' + output_basename() + '.bam.metrics')
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.reads))[0]}
  - id: merged_output_unmapped_bam
    doc: Merged Output BAM containing unmapped reads.
    label: Merged Output Unmapped BAM
    type: File
    outputBinding:
      glob: $('datastore/' + output_basename() + '.unmapped.bam')
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.reads))[0]}
    secondaryFiles:
      - .bai
  - id: merged_output_unmapped_metrics
    doc: Metrics for output BAM with unmapped reads.
    label: Merged Output Unmapped Metrics
    type: File
    outputBinding:
      glob: $('datastore/' + output_basename() + '.unmapped.bam.metrics')
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.reads))[0]}
label: ICGC-PCAWG-Seqware-BWA-Workflow
arguments:
  - position: 14
    shellQuote: false
    valueFrom: |-
      ${
          var ref = inputs.reference_gz.path;
          var files = ' --reference-gz-amb ' + ref + '.64.amb';
          files += ' --reference-gz-ann ' + ref + '.64.ann';
          files += ' --reference-gz-bwt ' + ref + '.64.bwt';
          files += ' --reference-gz-pac ' + ref + '.64.pac';
          files += ' --reference-gz-sa ' + ref + '.64.sa';
          files += ' --reference-gz-fai ' + ref + '.fai';
          files += ' --output-dir datastore';
          files += ' --download-reference-files false';
          files += ' --output-file-basename ' + output_basename();
          
          return files
      }
requirements:
  - class: ShellCommandRequirement
  - class: DockerRequirement
    dockerPull: 'bogdang/pcawg_bwa_sbg_modified:1.0'
  - class: InlineJavascriptRequirement
    expressionLib:
      - '        function common_substring(a,b) { var i = 0; while(a[i] === b[i] && i < a.length) { i = i + 1; } return a.slice(0, i) }; var output_basename = function() { if (inputs.output_file_basename) { return inputs.output_file_basename } else{ arr = [].concat(inputs.reads); base = arr[0].path.replace(/^.*[/]/, '''').split(''.'').slice(0, -1).join(''.''); for(i=0;i<arr.length;i++){ base = common_substring(base, arr[i].path.replace(/^.*[/]/, '''').split(''.'').slice(0, -1).join(''.'')); if (base.length == 0) base = ''PCAWG_Aligned'' } return ''PCAWG.'' + base } }; var updateMetadata = function(file, key, value) { file[''metadata''][key] = value; return file; }; var setMetadata = function(file, metadata) { if (!(''metadata'' in file)) file[''metadata''] = metadata; else { for (var key in metadata) { file[''metadata''][key] = metadata[key]; } } return file }; var inheritMetadata = function(o1, o2) { var commonMetadata = {}; if (!Array.isArray(o2)) { o2 = [o2] } for (var i = 0; i < o2.length; i++) { var example = o2[i][''metadata'']; for (var key in example) { if (i == 0) commonMetadata[key] = example[key]; else { if (!(commonMetadata[key] == example[key])) { delete commonMetadata[key] } } } } if (!Array.isArray(o1)) { o1 = setMetadata(o1, commonMetadata) } else { for (var i = 0; i < o1.length; i++) { o1[i] = setMetadata(o1[i], commonMetadata) } } return o1; };'
hints:
  - class: 'sbg:SaveLogs'
    value: stdout.txt
  - class: 'sbg:SaveLogs'
    value: '*.log'
stdout: stdout.txt


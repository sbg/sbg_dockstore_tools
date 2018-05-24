class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://sevenbridges.com'
id: pcawg-icgc-seqware-sanger-somatic-sbg
baseCommand:
  - /start.sh
  - python
  - /home/seqware/CGP-Somatic-Docker/scripts/run_seqware_workflow.py
inputs:
  - 'sbg:suggestedValue':
      class: File
      name: GRCh37d5_battenberg.tar.gz
      path: 5a71afdf4f0cfede55aef892
    id: bbFrom
    type: File
    inputBinding:
      position: 4
      prefix: '--bbFrom'
    label: BB From
    doc: Reference bundle for battenberg tools.
    'sbg:fileTypes': TAR.GZ
  - id: bam_inputs
    type: 'File[]'
    label: Input BAM Files
    doc: Tumor/Normal pair of input BAM files.
    'sbg:fileTypes': BAM
    secondaryFiles:
      - .bai
  - 'sbg:suggestedValue':
      class: File
      name: PCAWG_GRCh37d5_CGP_refBundle.tar.gz
      path: 5af05fb6301007bb320fb54d
    id: refFrom
    type: File
    inputBinding:
      position: 3
      prefix: '--refFrom'
    label: Ref From
    doc: Reference dependency bundle.
    'sbg:fileTypes': TAR.GZ
outputs:
  - id: somatic_cnv_tar_gz
    doc: Somatic CNV Tarball.
    label: Somatic CNV TAR
    type: File
    outputBinding:
      glob: '*.somatic.cnv.tar.gz'
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.bam_inputs))[0]}
    'sbg:fileTypes': TAR.GZ
  - id: somatic_genotype_tar_gz
    doc: Somatic Genotype outputs tarball.
    label: Somatic Genotype TAR
    type: File
    outputBinding:
      glob: '*.somatic.genotype.tar.gz'
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.bam_inputs))[0]}
    'sbg:fileTypes': TAR.GZ
  - id: somatic_imputeCounts_tar_gz
    doc: Somatic imputeCounts outputs tarball.
    label: Somatic ImputeCounts TAR
    type: File
    outputBinding:
      glob: '*.somatic.imputeCounts.tar.gz'
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.bam_inputs))[0]}
    'sbg:fileTypes': TAR.GZ
  - id: somatic_indel_tar_gz
    doc: Somatic INDEL tarball.
    label: Somatic INDEL TAR
    type: File
    outputBinding:
      glob: '*.somatic.indel.tar.gz'
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.bam_inputs))[0]}
    'sbg:fileTypes': TAR.GZ
  - id: somatic_snv_mnv_tar_gz
    doc: Somatic SNV tarball.
    label: Somatic SNV TAR
    type: File
    outputBinding:
      glob: '*.somatic.snv_mnv.tar.gz'
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.bam_inputs))[0]}
    'sbg:fileTypes': TAR.GZ
  - id: somatic_sv_tar_gz
    doc: Somatic SV tarball.
    label: Somatic SV TAR
    type: File
    outputBinding:
      glob: '*.somatic.sv.tar.gz'
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.bam_inputs))[0]}
    'sbg:fileTypes': TAR.GZ
  - id: somatic_verifyBamId_tar_gz
    doc: Somatic veryfyBamId outputs tarball.
    label: Somatic veryfyBamId TAR
    type: File
    outputBinding:
      glob: '*.somatic.verifyBamId.tar.gz'
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.bam_inputs))[0]}
    'sbg:fileTypes': TAR.GZ
  - id: somatic_cnv_vcf_gz
    doc: Somatic CNV VCF file.
    label: Somatic CNV VCF
    type: File?
    outputBinding:
      glob: '*.somatic.cnv.vcf.gz'
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.bam_inputs))[0]}
    secondaryFiles:
      - .tbi
    'sbg:fileTypes': VCF.GZ
  - id: somatic_indel_vcf_gz
    doc: Somatic INDEL VCF file.
    label: Somatic INDEL VCF
    type: File
    outputBinding:
      glob: '*.somatic.indel.vcf.gz'
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.bam_inputs))[0]}
    secondaryFiles:
      - .tbi
    'sbg:fileTypes': VCF.GZ
  - id: somatic_snv_mnv_vcf_gz
    doc: Somatic SNV/MNV VCF file.
    label: Somatic SNV VCF
    type: File
    outputBinding:
      glob: '*.somatic.snv_mnv.vcf.gz'
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.bam_inputs))[0]}
    secondaryFiles:
      - .tbi
    'sbg:fileTypes': VCF.GZ
  - id: somatic_sv_vcf_gz
    doc: Somatic SV VCF file.
    label: Somatic SV VCF
    type: File
    outputBinding:
      glob: '*.somatic.sv.vcf.gz'
      outputEval: >-
        ${return [].concat(inheritMetadata([].concat(self)[0],
        inputs.bam_inputs))[0]}
    secondaryFiles:
      - .tbi
    'sbg:fileTypes': VCF.GZ
doc: >-
  The Sanger's Cancer Genome Project core somatic calling workflow from the ICGC
  PanCancer Analysis of Whole Genomes (PCAWG) project.  

  ![pcawg
  logo](https://raw.githubusercontent.com/ICGC-TCGA-PanCancer/pcawg_delly_workflow/2.0.0/img/PCAWG-final-small.png
  "pcawg logo")


  PCAWG Sanger variant calling workflow is developed by Wellcome Trust Sanger
  Institute (http://www.sanger.ac.uk/). It consists of software components
  calling somatic substitutions, indels and structural variants using uniformly
  aligned tumour / normal WGS sequences. The workflow has been dockerized and
  packaged using CWL workflow language.


  For more information see the PCAWG project [page](https://dcc.icgc.org/pcawg)
  and the GitHub [page](https://github.com/ICGC-TCGA-PanCancer) for the code
  including the source for [this
  workflow](https://github.com/ICGC-TCGA-PanCancer/CGP-Somatic-Docker).  


  *A list of **all inputs and parameters** with corresponding descriptions can
  be found at the bottom of the page.*


  ### Common Use Cases

  This tool is used to call variants from Tumor/Normal pair of BAM files,
  previously generated by using the **ICGC-PCAWG-Seqware-BWA-Workflow** tool
  available in **Public Apps**, in the same manner as the VCF files in the ICGC
  PCAWG dataset. To do this, set:

  - Tumor/Normal pair in BAM format, provided via **Input BAM Files** port.

  - Reference file **GRCh37d5_battenberg.tar.gz** via **BB From** port. This
  file is available in **Public Reference Files**.

  - Reference file **PCAWG_GRCh37d5_CGP_refBundle.tar.gz** via **Ref From**
  port. This file is available in **Public Reference Files**.

  - For running the tool you need to copy the reference files to your project.


  ### Changes Introduced by Seven Bridges


  The original CWL version of this workflow is optimal for execution with
  cwltool. For this reason, the Docker image had to be modified to create
  folders in docker, adjust environment variables and permissions . These
  changes include:  

  - Editing start.sh bash script to make some directories and set env variables.

  - Changing permissions of some files and folders on the Image itself.


  Tool was additionally modified to optimize for cloud execution and make the
  usage easier. Additional modifications of the tool include:

  - Adding stdout redirection to a file that is saved with other logs
  (stdout.log).

  - Inheriting SBG metadata from input BAM files.

  - Setting an optimal instance for the tool (c4.8xlarge).

  - Added a command to move the output files to the working directory, in line
  with the CWL spec.

  - Tumor and Normal inputs merged into a single input to enable batching by
  **Case ID**. Normal and tumor are distinguished in JS expression by using
  metadata field **Sample Type**. 

  - Description updated to include additional information and common issues.

  - Added output ports for VCF.GZ output files.  
    
  NOTE: Tool modifications do not affect the final result.


  ### Common Issues and Important Notes

  - Please use the reference files **GRCh37d5_CGP_refBundle.tar.gz** and
  **GRCh37d5_battenberg.tar.gz** - available in **Public Reference Files**.

  - Make sure that the reads are aligned to the **pcawg.icgc.genome.fa.gz**
  reference, using the public app **ICGC-PCAWG-Seqware-BWA-Workflow**.

  - Metadata fields **Sample Type** and **Case ID** are required for execution.

  - Metadata field **Case ID** must be the same in both Tumor and Normal BAM
  files.

  - Platform field (PL) in BAM header must be the same in both Tumor and Normal
  BAM files.

  - **Sample type** metadata field for Normal sample BAM **must** contain the
  word **"Normal"** and the same field in Tumor sample BAM metadata must not
  contain the word **"Normal"**.


  ### Performance Benchmarking


  The following table shows examples of run time and cost.  

  *Cost can be reduced with **spot instance** usage. Visit [knowledge
  center](https://docs.sevenbridges.com/docs/about-spot-instances) for more
  details.*  

  | Input BAM sizes (Tumor+Normal) | Cost  | Duration | Instance Type (AWS) |

  |------------------|-------|----------|------------|

  | 120+40GB         | 160$ | 100h 4m    | c4.8xlarge |

  | 5+4GB            | 3.4$ | 2h 26m  | c4.8xlarge |
label: ICGC PCAWG Seqware Sanger Somatic Workflow
arguments:
  - position: 50
    shellQuote: false
    valueFrom: '> stdout.log && mv /var/spool/cwl/* .'
  - position: 0
    shellQuote: false
    valueFrom: "${\n \tfor (i=0;i<inputs.bam_inputs.length;i++) {\n \t    if (!inputs.bam_inputs[i].metadata['sample_type']) throw('Please set sample_type metadata')\n   \t\tif (inputs.bam_inputs[i].metadata['sample_type'].toLowerCase().search('normal') !== -1)\n    \t\treturn '--normal ' + inputs.bam_inputs[i].path\n \t}\n}"
  - position: 0
    shellQuote: false
    valueFrom: "${\n \tfor (i=0;i<inputs.bam_inputs.length;i++) {\n \t     if (!inputs.bam_inputs[i].metadata['sample_type']) throw('Please set sample_type metadata')\n   \t\tif (inputs.bam_inputs[i].metadata['sample_type'].toLowerCase().search('normal') == -1)\n    \t\treturn '--tumor ' + inputs.bam_inputs[i].path\n \t}\n}"
requirements:
  - class: ShellCommandRequirement
  - class: DockerRequirement
    dockerPull: 'images.sbgenomics.com/bogdang/pcawg-sanger:1.0'
  - class: InlineJavascriptRequirement
    expressionLib:
      - '        function common_substring(a,b) { var i = 0; while(a[i] === b[i] && i < a.length) { i = i + 1; } return a.slice(0, i) }; var output_basename = function() { if (inputs.output_file_basename) { return inputs.output_file_basename } else{ arr = [].concat(inputs.reads); base = arr[0].path.replace(/^.*[/]/, '''').split(''.'').slice(0, -1).join(''.''); for(i=0;i<arr.length;i++){ base = common_substring(base, arr[i].path.replace(/^.*[/]/, '''').split(''.'').slice(0, -1).join(''.'')); if (base.length == 0) base = ''PCAWG_Aligned'' } return ''PCAWG.'' + base } }; var updateMetadata = function(file, key, value) { file[''metadata''][key] = value; return file; }; var setMetadata = function(file, metadata) { if (!(''metadata'' in file)) file[''metadata''] = metadata; else { for (var key in metadata) { file[''metadata''][key] = metadata[key]; } } return file }; var inheritMetadata = function(o1, o2) { var commonMetadata = {}; if (!Array.isArray(o2)) { o2 = [o2] } for (var i = 0; i < o2.length; i++) { var example = o2[i][''metadata'']; for (var key in example) { if (i == 0) commonMetadata[key] = example[key]; else { if (!(commonMetadata[key] == example[key])) { delete commonMetadata[key] } } } } if (!Array.isArray(o1)) { o1 = setMetadata(o1, commonMetadata) } else { for (var i = 0; i < o1.length; i++) { o1[i] = setMetadata(o1[i], commonMetadata) } } return o1; };'
hints:
  - class: 'sbg:AWSInstanceType'
    value: c4.8xlarge;ebs-gp2;700
dct:creator:
  foaf:name: Seven Bridges
  foaf:mbox: "mailto:support@sbgenomics.com"
'sbg:categories':
  - CWL1.0
  - Variant Calling
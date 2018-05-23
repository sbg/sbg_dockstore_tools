class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: test_stage
baseCommand:
  - echo
inputs:
  - id: array
    type: 'File[]'
    inputBinding:
      position: 1
  - id: file
    type: File
outputs:
  - id: output
    type: File?
label: test_stage
requirements:
  - class: DockerRequirement
    dockerPull: 'ubuntu:16.04'
  - class: InitialWorkDirRequirement
    listing:
      - entry: $(inputs.file)
        writable: true
  - class: InlineJavascriptRequirement

class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: tpp_refreshparser_5_0_0
baseCommand: []
inputs:
  - 'sbg:category': Input Files
    id: database
    type: File
    inputBinding:
      position: 2
      shellQuote: false
      valueFrom: |-
        ${
            return inputs.database.path.split('/')[inputs.database.path.split('/').length - 1]
        }
    label: Database
    doc: Database.
    'sbg:fileTypes': 'FASTA, FA'
  - 'sbg:category': Input Files
    id: input_file
    type: File
    inputBinding:
      position: 1
      shellQuote: false
      valueFrom: |-
        ${
            return inputs.input_file.path.split('/')[inputs.input_file.path.split('/').length - 1]
        }
    label: Input file
    doc: Input file.
    'sbg:fileTypes': PEP.XML
outputs:
  - id: output_file
    doc: Output file.
    label: Output file
    type: File?
    outputBinding:
      glob: |-
        ${
            var name = inputs.input_file.path.split('/')[inputs.input_file.path.split('/').length - 1]

            var prefix = name.substring(0, name.indexOf('.pep'))
            var suf = name.substring(name.indexOf('.pep'), name.length)

            return prefix + '.rp' + suf
        }
      outputEval: |-
        ${
            return inheritMetadata(self, inputs.input_file)

        }
    'sbg:fileTypes': 'XML, PEP.XML'
doc: >-
  **RefreshParser** is a tool that refreshes all peptide-protein associations
  against a user-supplied protein database. It is an optional component of the
  Trans-Proteomic Pipeline developed by the Seattle Proteome Center.


  ###Required Inputs

  1. input_file: file in pepXML format that contains peptide-protein
  associations

  2. database: file in FASTA or FA format that contains a protein sequence
  database
   
  ###Outputs

  1. output\_file: file in pepXML format that contains the resulting
  peptide-protein associations



  ###Common Issues and Important Notes


  There are no known common issues.
label: TPP RefreshParser
arguments:
  - position: 0
    shellQuote: false
    valueFrom: |-
        ${
            return 'cp ' + inputs.input_file.path + ' . ; /local/tpp/bin/RefreshParser'
        }
  - position: 1001
    prefix: ;
    shellQuote: false
    valueFrom: |-
      ${
          var res = ' cp '
          var name = inputs.input_file.path.split('/')[inputs.input_file.path.split('/').length - 1]

          res = res + name + ' '

          var prefix = name.substring(0, name.indexOf('.pep'))
          var suf = name.substring(name.indexOf('.pep'), name.length)
          res = res + prefix + '.rp' + suf
          return res
      }
requirements:
  - class: ShellCommandRequirement
  - class: ResourceRequirement
    ramMin: 1000
    coresMin: 1
  - class: DockerRequirement
    dockerPull: 'images.sbgenomics.com/vladimir_obucina/tpp:5.0.0'
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.database)
  - class: InlineJavascriptRequirement
    expressionLib:
      - |-
        var updateMetadata = function(file, key, value) {
            file['metadata'][key] = value;
            return file;
        };


        var setMetadata = function(file, metadata) {
            if (!('metadata' in file))
                file['metadata'] = metadata;
            else {
                for (var key in metadata) {
                    file['metadata'][key] = metadata[key];
                }
            }
            return file
        };

        var inheritMetadata = function(o1, o2) {
            var commonMetadata = {};
            if (!Array.isArray(o2)) {
                o2 = [o2]
            }
            for (var i = 0; i < o2.length; i++) {
                var example = o2[i]['metadata'];
                for (var key in example) {
                    if (i == 0)
                        commonMetadata[key] = example[key];
                    else {
                        if (!(commonMetadata[key] == example[key])) {
                            delete commonMetadata[key]
                        }
                    }
                }
            }
            if (!Array.isArray(o1)) {
                o1 = setMetadata(o1, commonMetadata)
            } else {
                for (var i = 0; i < o1.length; i++) {
                    o1[i] = setMetadata(o1[i], commonMetadata)
                }
            }
            return o1;
        };

        var toArray = function(file) {
            return [].concat(file);
        };

        var groupBy = function(files, key) {
            var groupedFiles = [];
            var tempDict = {};
            for (var i = 0; i < files.length; i++) {
                var value = files[i]['metadata'][key];
                if (value in tempDict)
                    tempDict[value].push(files[i]);
                else tempDict[value] = [files[i]];
            }
            for (var key in tempDict) {
                groupedFiles.push(tempDict[key]);
            }
            return groupedFiles;
        };

        var orderBy = function(files, key, order) {
            var compareFunction = function(a, b) {
                if (a['metadata'][key].constructor === Number) {
                    return a['metadata'][key] - b['metadata'][key];
                } else {
                    var nameA = a['metadata'][key].toUpperCase();
                    var nameB = b['metadata'][key].toUpperCase();
                    if (nameA < nameB) {
                        return -1;
                    }
                    if (nameA > nameB) {
                        return 1;
                    }
                    return 0;
                }
            };

            files = files.sort(compareFunction);
            if (order == undefined || order == "asc")
                return files;
            else
                return files.reverse();
        };

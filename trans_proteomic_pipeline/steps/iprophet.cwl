class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: tpp_iprophet_5_0_0
baseCommand: []
inputs:
  - id: input_files
    type: 'File[]'
    label: Input Files
    doc: Input pepXML files
    'sbg:fileTypes': PEP.XML
outputs:
  - id: output_file
    doc: Output pepXML file
    label: Output File
    type: File?
    outputBinding:
      glob: |-
        ${
            var input = ''
            if (inputs.input_files instanceof Array)
                input = inputs.input_files[0].path
            else
                input = inputs.input_files.path
            input = input.split('/')[input.split('/').length - 1]
            var prefix = ''
            var suf = ''
            if (input.indexOf('xtan') != -1) {
                prefix = input.substring(0, input.indexOf('.xtan'))
                suf = input.substring(input.indexOf('.xtan'), input.length)
            } else {
                prefix = input.substring(0, input.indexOf('.pep'))
                suf = input.substring(input.indexOf('.pep'), input.length)
            }
            return prefix + '.ipro' + suf
        }
      outputEval: |-
        ${
            return inheritMetadata(self, inputs.input_files)

        }
    'sbg:fileTypes': PEP.XML
doc: >-
  **iProphet** is a tool that combines the evidence from multiple
  identifications of the same peptide sequence across different spectra,
  experiments, precursor ion charge states, and modified states. It also allows
  accurate and effective integration of the results from multiple database
  search engines applied to the same data. 


  iProphet is an integral part of the Trans-Proteomic Pipeline (TPP) developed
  by the Seattle Proteome Center. The use of iProphet in the TPP increases the
  number of correctly identified peptides at a constant false discovery rate
  (FDR) as compared to both PeptideProphet and a representative state-of-the-art
  tool Percolator. As the main outcome, iProphet permits the calculation of
  accurate posterior probabilities and FDR estimates at the level of unique
  peptide sequences, which in turn leads to more accurate probability estimates
  at the protein level. Fully integrated with the TPP, it supports all commonly
  used MS instruments, search engines, and computer platforms.


  ###Required Inputs


  1. input_files: output file in pepXML format from several peptide search
  engines


  ###Outputs


  1. output_file: file in pepXML format that contains improved peptide
  probability estimates


  ###Common Issues and Important Notes


  There are no known common issues.
label: TPP IProphet
arguments:
  - position: 0
    shellQuote: false
    valueFrom: |-
      ${
          var cmd = ''
          var cmd2 = ''
          for (var i = 0; i < inputs.input_files.length; i++) {
            cmd += ' ln -s ' + inputs.input_files[i].path + ' . ; ';
            cmd2 += ' ' + inputs.input_files[i].basename
          }
          cmd += '/local/tpp/bin/InterProphetParser '
          return cmd + cmd2
       }
  - position: 101
    shellQuote: false
    valueFrom: |-
      ${
          var input = ''
          if (inputs.input_files instanceof Array)
              input = inputs.input_files[0].path
          else
              input = inputs.input_files.path
          input = input.split('/')[input.split('/').length - 1]
          var prefix = ''
          var suf = ''
          if (input.indexOf('xtan') != -1) {
              prefix = input.substring(0, input.indexOf('.xtan'))
              suf = input.substring(input.indexOf('.xtan'), input.length)
          } else {
              prefix = input.substring(0, input.indexOf('.pep'))
              suf = input.substring(input.indexOf('.pep'), input.length)
          }
          return prefix + '.ipro' + suf
      }
requirements:
  - class: ShellCommandRequirement
  - class: ResourceRequirement
    ramMin: 2000
    coresMin: 2
  - class: DockerRequirement
    dockerPull: 'images.sbgenomics.com/vladimir_obucina/tpp:5.0.0'
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

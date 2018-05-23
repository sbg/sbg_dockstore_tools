class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: tpp_asapratioproteinratioparser_5_0_0
baseCommand: []
inputs:
  - 'sbg:category': Input Files
    id: input_file
    type: File
    inputBinding:
      position: 1
      shellQuote: false
      valueFrom: $(self.basename)
    label: Input file
    doc: Input file.
    'sbg:fileTypes': XML
outputs:
  - id: output_file
    doc: Output file.
    label: Output file
    type: File?
    outputBinding:
      glob: |-
        ${
            var prefix = inputs.input_file.path.split('/')
            prefix = prefix[prefix.length - 1]

            var suf = prefix.substring(prefix.indexOf('.pep'), prefix.length)
            prefix = prefix.substring(0, prefix.indexOf('.pep'))

            return prefix + '.asprot' + suf
        }
      outputEval: |-
        ${
            return inheritMetadata(self, inputs.input_file)

        }
    'sbg:fileTypes': XML
doc: >-
  **ASAPRatioProteinRatioParser**  is a tool for measuring relative expression
  levels of proteins from isotopically-labeled samples (e.g. ICAT, SILAC). It is
  an integral part of the Trans-Proteomic Pipeline developed by the Seattle
  Proteome Center.


  ###Required Inputs


  1. input_file: file in protXML format that contains a list of all proteins
  corresponding to the peptide-spectrum matches (PSMs) along with protein
  probabilities and global false discovery rates (FDRs) at different thresholds


  ###Outputs


  1. output_file: file in XML format that contains the relative abundances of
  proteins and the corresponding confidence intervals



  ###Common Issues and Important Notes


  There are no known common issues.
label: TPP ASAPRatioProteinRatioParser
arguments:
  - position: 0
    shellQuote: false
    valueFrom: /local/tpp/bin/ASAPRatioProteinRatioParser
  - position: 1001
    shellQuote: false
    valueFrom: |-
      ${
          var prefix = inputs.input_file.path.split('/')
          prefix = prefix[prefix.length - 1]

          var res = ' ; cp '
          res = res + prefix + ' '
          var suf = prefix.substring(prefix.indexOf('.pep'), prefix.length)
          prefix = prefix.substring(0, prefix.indexOf('.pep'))

          res = res + prefix + '.asprot' + suf

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
      - $(inputs.input_file)
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

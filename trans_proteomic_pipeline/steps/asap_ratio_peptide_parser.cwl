class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: tpp_asapratiopeptideparser_5_0_0
baseCommand: []
inputs:
  - 'sbg:category': Input configuration
    id: areaFlag
    type: float?
    inputBinding:
      position: 5
      prefix: '-f'
      shellQuote: false
    label: areaFlag
    doc: AreaFlag set to num (ratio display option).
  - 'sbg:category': Input configuration
    id: fixed_scan_range
    type: boolean?
    inputBinding:
      position: 8
      prefix: '-F'
      shellQuote: false
    label: Fixed scan range
    doc: Use fixed scan range for light and heavy.
  - 'sbg:category': Input configuration
    id: heavy_labeled_peptide
    type: boolean?
    inputBinding:
      position: 4
      prefix: '-b'
      shellQuote: false
    label: Heavy labeled peptide
    doc: Heavy labeled peptide elutes before light labeled partner.
  - 'sbg:category': Input Files
    id: input_file
    type: File
    inputBinding:
      position: 2
      shellQuote: false
      valueFrom: |-
        ${
            var name = inputs.input_file.path.split('/')[inputs.input_file.path.split('/').length - 1]

            if (inputs.input_mzxml_files != undefined) {
                var pre = name.substring(0, name.indexOf('.pep.xml'))

                return pre + '.ch.pep.xml'
            }
            return inputs.input_file.path.split('/')[inputs.input_file.path.split('/').length - 1]
        }
    label: Input file
    doc: Input file.
    'sbg:fileTypes': PEP.XML
  - 'sbg:category': Input Files
    id: input_mzxml_files
    type: 'File[]?'
    label: MZXML files
    doc: MZXML files.
    'sbg:fileTypes': MZXML
  - 'sbg:category': Input configuration
    id: label_masses
    type: string?
    inputBinding:
      position: 14
      prefix: '-m'
      shellQuote: false
    label: Label masses
    doc: >-
      Specified label masses (e.g. M74.325Y125.864), only relevant for static
      modification quantification.
  - 'sbg:toolDefaultValue': C
    id: labeled_residues
    type: string?
    inputBinding:
      position: 3
      prefix: '-l'
      shellQuote: false
    label: Labeled residues
    doc: Change labeled residues.
  - 'sbg:category': Input configuration
    'sbg:toolDefaultValue': '0'
    id: min_iprophet_prob
    type: float?
    inputBinding:
      position: 13
      prefix: '-i'
      shellQuote: false
    label: Minimum iProphet probability
    doc: Minimum iProphet probability to process.
  - 'sbg:category': Input configuration
    'sbg:toolDefaultValue': '0'
    id: min_pep_prophet_prob
    type: float?
    inputBinding:
      position: 12
      prefix: '-p'
      shellQuote: false
    label: Min PeptideProphet probability
    doc: Minimum PeptideProphet probability to process.
  - 'sbg:category': Input configuration
    id: quantitate_only_where_cid_was_made
    type: boolean?
    inputBinding:
      position: 9
      prefix: '-C'
      shellQuote: false
    label: Quantitate only where cid was made
    doc: Quantitate only the charge state where the CID was made.
  - 'sbg:category': Input configuration
    'sbg:toolDefaultValue': '0.5'
    id: range
    type: float?
    inputBinding:
      position: 6
      prefix: '-r'
      shellQuote: false
    label: Range
    doc: Range around precusor m/z to search for peak.
  - 'sbg:category': Input configuration
    id: return_a_ratio
    type: boolean?
    inputBinding:
      position: 10
      prefix: '-B'
      shellQuote: false
    label: Return a ratio
    doc: Return a ratio even if the background is high.
  - 'sbg:category': Input configuration
    id: set_all_background_to_zero
    type: boolean?
    inputBinding:
      position: 11
      prefix: '-Z'
      shellQuote: false
    label: Set all background to zero
    doc: Set all background to zero.
  - 'sbg:category': Input configuration
    id: static_modification_quantification
    type: boolean?
    inputBinding:
      position: 7
      prefix: '-S'
      shellQuote: false
    label: Static modification quantification
    doc: >-
      Static modification quantification (i.e. each run is either all light or
      all heavy).
  - 'sbg:category': Input configuration
    id: wavelet_smoothing
    type: boolean?
    inputBinding:
      position: 15
      prefix: '-w'
      shellQuote: false
    label: Wavelet smoothing
    doc: 'EXPERIMENTAL: use wavelet smoothing from WaveletQuant implmentation.'
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

            if (inputs.input_mzxml_files != undefined) {
                var pre = prefix.substring(0, prefix.indexOf('.pep.xml'))
                prefix = pre + '.ch.pep.xml'
            }


            prefix = prefix.substring(0, prefix.indexOf('.pep.xml'))

            return prefix + '.aspeppar.pep.xml'
        }
      outputEval: |-
        ${
            return inheritMetadata(self, inputs.input_file)

        }
    'sbg:fileTypes': 'XML, PEP.XML'
doc: >-
  **ASAPRatioPeptideParser** is a tool for measuring relative expression levels
  of peptides from isotopically-labeled samples (e.g. ICAT, SILAC). It is an
  integral part of the Trans-Proteomic Pipeline developed by the Seattle
  Proteome Center.


  ###Required Inputs


  1. input_file: IProphet results file in pepXML format


  ###Outputs


  1. output_file: file in XML format that contains the relative expression
  levels of peptides from isotopically-labeled samples (e.g. ICAT, SILAC)



  ###Common Issues and Important Notes


  When **ASAPRatioPeptideParser** is run as part of the TPP, it expects specific
  folder structure in order to access MZXML files (although they are not
  originally specified as an input of the tool). Since the tool wrapped here is
  run on the platform, which has different folder structure, additional input
  **MZXML files** is created inside the wrapper. File PEP.XML from the **Input
  file** port is modified here so that it reflects paths to the MZXML files on
  the platform.
label: TPP ASAPRatioPeptideParser
arguments:
  - position: 0
    shellQuote: false
    valueFrom: |-
      ${
          var res = ''
          var ln = ''
          if (inputs.input_mzxml_files != undefined) {
              res = res + 'python ./parse_pep_xml.py --list '
              var list = ''
              for (var i = 0; i < inputs.input_mzxml_files.length; i++) {
                  list = list + ' ' + inputs.input_mzxml_files[i].basename;
                  ln += ' ln -s ' + inputs.input_mzxml_files[i].path + ' ; '
              }

              res = res + list

              res = res + ' --input '
              var name = inputs.input_file.path.split('/')[inputs.input_file.path.split('/').length - 1]
              res = res + name

              var pre = name.substring(0, name.indexOf('.pep.xml'))

              res = res + ' --output '
              res = res + pre + '.ch.pep.xml  ;  '
          }

          res = res + ' /local/tpp/bin/ASAPRatioPeptideParser'


          return ln + res
      }
  - position: 1001
    shellQuote: false
    valueFrom: |-
      ${
          var prefix = inputs.input_file.path.split('/')
          prefix = prefix[prefix.length - 1]

          if (inputs.input_mzxml_files != undefined) {
              var pre = prefix.substring(0, prefix.indexOf('.pep.xml'))
              prefix = pre + '.ch.pep.xml'
          }



          var res = ' ; mv '
          res = res + prefix + ' '

          prefix = prefix.substring(0, prefix.indexOf('.pep.xml'))

          res = res + prefix + '.aspeppar.pep.xml'

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
      - entryname: parse_pep_xml.py
        entry: "import xml.etree.ElementTree as ET\nimport argparse\n\ndef read_args():\n\tglobal file_list, inputs, outputs\n\n\tparser = argparse.ArgumentParser(description='Parse xml input.')\n\t\n\tparser.add_argument('--list', nargs='+', required=True)\n\tparser.add_argument('--input', required=True)\n\tparser.add_argument('--output', required=True)\n\t\n\targs = parser.parse_args()\n\tfile_list = args.list\n\tinputs = args.input\n\toutputs = args.output\n\nread_args()\n\ntree = ET.parse(inputs)\nET.register_namespace('', \"http://regis-web.systemsbiology.net/pepXML\")\nroot = tree.getroot()\n\nfor rank in root.iter('{http://regis-web.systemsbiology.net/pepXML}msms_run_summary'):#('msms_run_summary'):\n\tb_name = rank.get('base_name')\n\tb_name = b_name.split('/')[-1]\n\tfor n_name in file_list:\n\t\tif(b_name in n_name):\n\t\t\trank.set('base_name', n_name[:-6])\n\ntree.write(outputs)\nexit(0)"
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

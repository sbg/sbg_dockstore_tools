class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: tpp_interactparser_5_0_0
baseCommand: []
inputs:
  - 'sbg:category': Input Options
    'sbg:toolDefaultValue': 'False'
    id: allow
    type: boolean?
    inputBinding:
      position: 11
      shellQuote: false
      valueFrom: |-
        ${
            if (inputs.allow != undefined && inputs.allow == true)
                return '-A'
            return ''
        }
    label: 'Allow, don''t reject X containing peptides'
    doc: 'Allow, don''t reject X containing peptides.'
  - 'sbg:category': Input Options
    'sbg:toolDefaultValue': 'False'
    id: correct_charge_states
    type: string?
    inputBinding:
      position: 21
      shellQuote: false
      valueFrom: |-
        ${
            if (inputs.correct_charge_states != undefined &&
                inputs.correct_charge_states == true)
                return '-C'
            return ''
        }
    label: Correct charge states
    doc: Correct charge states (OMSSA).
  - 'sbg:category': Input Options
    'sbg:toolDefaultValue': 'False'
    id: correct_protein_names
    type: boolean?
    inputBinding:
      position: 20
      shellQuote: false
      valueFrom: |-
        ${
            if (inputs.correct_protein_names != undefined &&
                inputs.correct_protein_names == true)
                return '-P'
            return ''
        }
    label: Correct protein names
    doc: Correct protein names (OMSSA).
  - 'sbg:category': Input Options
    'sbg:toolDefaultValue': 'False'
    id: correct_pyro_glu_and_ammonia
    type: boolean?
    inputBinding:
      position: 22
      shellQuote: false
      valueFrom: |-
        ${
            if (inputs.correct_pyro_glu_and_ammonia != undefined &&
                inputs.correct_pyro_glu_and_ammonia == true)
                return '-M'
            return ''
        }
    label: Correct Pyro-Glu and Ammonia
    doc: 'Correct Pyro-Glu and Ammonia Loss Modifications E[111], Q[111] (OMSSA).'
  - 'sbg:category': Input
    id: database
    type: File?
    inputBinding:
      position: 101
      prefix: '-D'
      shellQuote: false
      valueFrom: |-
        ${
            if (inputs.database != undefined)
                return inputs.database.path.split('/')[inputs.database.path.split('/').length - 1]
            return ''
        }
    label: Database file
    doc: Database file.
    'sbg:fileTypes': 'FASTA, FA'
  - 'sbg:category': Input Options
    id: database_type
    type: string?
    inputBinding:
      position: 102
      prefix: '-T'
      shellQuote: false
    label: Database type
    doc: Database type.
  - 'sbg:category': Input Options
    'sbg:toolDefaultValue': 'False'
    id: dont_write_the_input_file_reference
    type: boolean?
    inputBinding:
      position: 24
      shellQuote: false
      valueFrom: |-
        ${
            if (inputs.dont_write_the_input_file_reference != undefined &&
                inputs.dont_write_the_input_file_reference == true)
                return '-N'
            return ''
        }
    label: Don't write the input file reference
    doc: >-
      Don't write the input file reference to the output pepXML file (Use only
      when 1 input file is given).
  - 'sbg:category': Input Options
    id: enzyme
    type: string?
    inputBinding:
      position: 26
      prefix: '-E'
      shellQuote: false
    label: Enzyme
    doc: >-
      Enzyme used in sample, one of : trypsin : cut(KR) nocuts(P) sense(C)
      stricttrypsin : cut(KR) sense(C) argc : cut(R) nocuts(P) sense(C) aspn :
      cut(D) sense(N) chymotrypsin : cut(FLMWY) nocuts(P) sense(C) clostripain :
      cut(R) nocuts(-) sense(C) cnbr : cut(M) sense(C) elastase : cut(AGILV)
      nocuts(P) sense(C) formicacid : cut(D) nocuts(P) sense(C) gluc : cut(DE)
      nocuts(P) sense(C) gluc_bicarb : cut(E) nocuts(P) sense(C) iodosobenzoate
      : cut(W) nocuts(-) sense(C) lysc : cut(K) nocuts(P) sense(C) lysc-p :
      cut(K) sense(C) lysn : cut(K) sense(N) lysn_promisc : cut(KR) sense(N)
      ralphtrypsin : cut(KRST) nocuts(P) sense(C) nonspecific : cut() sense(C)
      pepsina : cut(FL) nocuts(-) sense(C) proline_endopeptidase : cut(P)
      nocuts(-) sense(C) trypsin/chymotrypsin : cut(YWFMLKR) nocuts(P) sense(C)
      staph_protease : cut(E) nocuts(-) sense(C) tca : cut(KR) nocuts(P)
      sense(C) : cut(YWFM) nocuts(P) sense(C) : cut(D) sense(N) trypsin/cnbr :
      cut(KR) nocuts(P) sense(C) : cut(M) nocuts(P) sense(C) trypsin_gluc :
      cut(DEKR) nocuts(P) sense(C) trypsin_k : cut(K) nocuts(P) sense(C)
      trypsin_r : cut(R) nocuts(P) sense(C) thermolysin : cut(ALIVFM) nocuts(DE)
      sense(N).
  - 'sbg:category': Input Options
    id: experiment_label
    type: string?
    inputBinding:
      position: 12
      prefix: '-X'
      shellQuote: false
    label: Experiment label
    doc: Assign experiment_label to each spectrum_query.
  - 'sbg:category': Input files
    id: input_file
    type: File
    inputBinding:
      position: 1
      shellQuote: false
      valueFrom: |-
        ${
            var name = inputs.input_file.path.split('/')[inputs.input_file.path.split('/').length - 1]
            var pre = name.substring(0, name.indexOf('.pep.xml'))
            if (inputs.input_mzxml_files != undefined)
                return pre + '.ch.pep.xml'
            else
                return pre + '.pep.xml'
        }
    label: Input File
    doc: Input File.
    'sbg:fileTypes': PEP.XML
  - 'sbg:category': Input Files
    id: input_mzxml_files
    type: 'File[]?'
    label: Input mzxml files
    doc: Input mzxml files.
    'sbg:fileTypes': MZXML
  - 'sbg:category': Input Options
    'sbg:toolDefaultValue': '1'
    id: max_rank
    type: int?
    inputBinding:
      position: 14
      prefix: '-R'
      shellQuote: false
    label: Maximum peptide rank in output
    doc: Maximum peptide rank in output.
  - 'sbg:category': Input Options
    'sbg:toolDefaultValue': '7'
    id: min_peptide_len
    type: int?
    inputBinding:
      position: 13
      prefix: '-L'
      shellQuote: false
    label: Minimum peptide length not rejected
    doc: Minimum peptide length not rejected.
  - 'sbg:category': Input Options
    'sbg:toolDefaultValue': 'False'
    id: only_warn_dont_skip_file
    type: boolean?
    inputBinding:
      position: 25
      shellQuote: false
      valueFrom: |-
        ${
            if (inputs.only_warn_dont_skip_file != undefined &&
                inputs.only_warn_dont_skip_file == true)
                return '-W'
            return ''
        }
    label: Only warn don't skip file
    doc: Only warn don't skip files containing PeptideProphet results.
  - 'sbg:category': Input Options
    'sbg:toolDefaultValue': 'False'
    id: record_collision_energy
    type: boolean?
    inputBinding:
      position: 18
      shellQuote: false
      valueFrom: |-
        ${
            if (inputs.record_collision_energy != undefined && inputs.record_collision_energy == true)
                return '-G'
            return ''
        }
    label: Record collision energy
    doc: Record collision energy in pepXML.
  - 'sbg:category': Input Options
    'sbg:toolDefaultValue': 'False'
    id: record_compensation_voltage
    type: boolean?
    inputBinding:
      position: 19
      shellQuote: false
      valueFrom: |-
        ${
            if (inputs.record_compensation_voltage != undefined &&
                inputs.record_compensation_voltage == true)
                return '-V'
            return ''
        }
    label: Record compensation voltage
    doc: Record compensation voltage in pepXML.
  - 'sbg:category': Input Options
    'sbg:toolDefaultValue': 'False'
    id: record_ion_injection_time
    type: boolean?
    inputBinding:
      position: 16
      shellQuote: false
      valueFrom: |-
        ${
            if (inputs.record_ion_injection_time != undefined &&
                inputs.record_ion_injection_time == true)
                return '-i'
            return ''
        }
    label: Record ion_injection_time
    doc: Record ion_injection_time in pepXML.
  - 'sbg:category': Input Options
    'sbg:toolDefaultValue': 'False'
    id: record_precursor_intensity
    type: boolean?
    inputBinding:
      position: 17
      shellQuote: false
      valueFrom: |-
        ${
            if (inputs.record_precursor_intensity != undefined &&
                inputs.record_precursor_intensity == true)
                return '-I'
            return ''
        }
    label: Record precursor intensity
    doc: Record precursor intensity in pepXML.
  - 'sbg:category': Input Options
    'sbg:toolDefaultValue': 'False'
    id: record_retention_time_sec
    type: boolean?
    inputBinding:
      position: 15
      shellQuote: false
      valueFrom: |-
        ${
            if (inputs.record_retention_time_sec != undefined &&
                inputs.record_retention_time_sec == true)
                return '-S'
            return ''
        }
    label: Record retention_time_sec
    doc: Record retention_time_sec in pepXML.
outputs:
  - id: output_file
    doc: Output file.
    label: Output file
    type: File?
    outputBinding:
      glob: |-
        ${
            var name = inputs.input_file.path.split('/')[inputs.input_file.path.split('/').length - 1]

            return name.substring(0, name.length - 8) + '.intpar.pep.xml'
        }
      outputEval: |-
        ${
            return inheritMetadata(self, inputs.input_file)

        }
    'sbg:fileTypes': PEP.XML
doc: >-
  **InteractParser** is tool that corrects some of the common formatting issues
  found in pepXML files written by various search engines. It is an optional
  component of the Trans-Proteomic Pipeline developed by the Seattle Proteome
  Center.


  ###Required Inputs

  1. input_file: input file in pepXML format
   
  ###Outputs

  1. output\_file: resulting file in pepXML format



  ###Common Issues and Important Notes


  When **InteractParser** is run as part of the TPP, it expects specific folder
  structure in order to access MZXML files (although they are not originally
  specified as an input of the tool). Since the tool wrapped here is run on the
  platform, which has different folder structure, additional input **Input mzxml
  files** is created inside the wrapper. File PEP.XML from the **Input File**
  port is modified here so that it reflects paths to the MZXML files on the
  platform.
label: TPP InteractParser
arguments:
  - position: 0
    shellQuote: false
    valueFrom: |-
      ${
          var res = ''
          if (inputs.input_mzxml_files != undefined) {
              res = res + 'python ./parse_xml.py --inputprev '

              var pep_xml = ''
              if (inputs.input_file instanceof Array)
                  pep_xml = inputs.input_file[0].path.split('/')[inputs.input_file[0].path.split('/').length - 1]
              else
                  pep_xml = inputs.input_file.path.split('/')[inputs.input_file.path.split('/').length - 1]

              var mzxml = ''
              if (inputs.input_mzxml_files instanceof Array) {
                  for (var i = 0; i < inputs.input_mzxml_files.length; i++) {
                      var n = inputs.input_mzxml_files[i].path.split('/')[inputs.input_mzxml_files[i].path.split('/').length - 1]
                      var pret = ''
                      if (n.indexOf('mzML') != -1)
                          pret = n.substring(0, n.length - 6)
                      else
                          pret = n.substring(0, n.length - 7)
                      if (pep_xml.indexOf(pret) != -1)
                          mzxml = n
                  }
              }

              res = res + mzxml
              res = res + ' --input '
              res = res + pep_xml
              res = res + ' --output '
              var name = pep_xml
              var pre = name.substring(0, name.indexOf('.pep.xml'))
              res = res + pre + '.ch.pep.xml '

              res = res + ' ; '
          }

          res = res + '/local/tpp/bin/InteractParser '

          var name = inputs.input_file.path.split('/')[inputs.input_file.path.split('/').length - 1]

          res = res + name.substring(0, name.length - 8) + '.intpar.pep.xml'

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
      - entryname: parse_xml.py
        entry: "import xml.etree.ElementTree as ET\nimport argparse\n\ndef read_args():\n\tglobal inputprev, inputs, outputs\n\n\tparser = argparse.ArgumentParser(description='Parse xml input.')\n\t\n\tparser.add_argument('--inputprev', required=True)\n\tparser.add_argument('--input', required=True)\n\tparser.add_argument('--output', required=True)\n\t\n\targs = parser.parse_args()\n\tinputprev = args.inputprev\n\tinputs = args.input\n\toutputs = args.output\n\nread_args()\n\ntree = ET.parse(inputs)\nET.register_namespace('', \"http://regis-web.systemsbiology.net/pepXML\")\nroot = tree.getroot()\n\nfor rank in root.iter('{http://regis-web.systemsbiology.net/pepXML}msms_run_summary'):\n        print(rank.get('base_name'))\n        if('mzML' in inputprev):\n            rank.set('base_name', inputprev[:-5])\n            print(inputprev[:-5])\n        else:\n            rank.set('base_name', inputprev[:-6])\n            print(inputprev[:-6])\n\ntree.write(outputs)\nexit(0)"
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

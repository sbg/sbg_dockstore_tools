class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: tpp_proteinprophet_5_0_0
baseCommand: []
inputs:
  - 'sbg:category': Input configuration
    id: accuracy
    type: boolean?
    inputBinding:
      position: 18
      prefix: ACCURACY
      shellQuote: false
    label: Accuracy
    doc: Equivalent to MINPROB0.
  - 'sbg:category': Input configuration
    id: allpeps
    type: boolean?
    inputBinding:
      position: 27
      prefix: ALLPEPS
      shellQuote: false
    label: Allpeps
    doc: Consider all possible peptides in the database in the confidence model.
  - 'sbg:category': Input configuration
    id: asap_prophet
    type: boolean?
    inputBinding:
      position: 6
      prefix: ASAP_PROPHET
      shellQuote: false
    label: ASAP PROPHET
    doc: >-
      Compute ASAP ratios for protein entries (ASAPRatio must have been run
      previously on all input datasets).
  - 'sbg:category': Input configuration
    id: confem
    type: boolean?
    inputBinding:
      position: 25
      prefix: CONFEM
      shellQuote: false
    label: Confem
    doc: Use the EM to compute probability given the confidence.
  - 'sbg:category': Input configuration
    id: delude
    type: boolean?
    inputBinding:
      position: 22
      prefix: DELUDE
      shellQuote: false
    label: Delude
    doc: Do NOT use peptide degeneracy information when assessing proteins.
  - 'sbg:category': Input configuration
    id: do_not_use_nsp_model
    type: boolean?
    inputBinding:
      position: 15
      prefix: NONSP
      shellQuote: false
    label: Do not use NSP model
    doc: Do not use NSP model.
  - 'sbg:category': Input configuration
    id: excel
    type: float?
    inputBinding:
      position: 31
      prefix: EXCEL
      shellQuote: false
    label: Excel
    doc: >-
      Write output tab delim xls file including all protein (group)s with
      minimum probability xx, where xx is a number between 0 and 1.
  - 'sbg:category': Input configuration
    id: excelpeps
    type: boolean?
    inputBinding:
      position: 30
      prefix: EXCELPEPS
      shellQuote: false
    label: Excelpeps
    doc: Write output tab delim xls file including all peptides.
  - 'sbg:category': Input configuration
    id: exclude_zero
    type: boolean?
    inputBinding:
      position: 8
      prefix: EXCLUDE_ZEROS
      shellQuote: false
    label: Exclude zeros
    doc: Exclude zero prob entries.
  - 'sbg:category': Input configuration
    id: generate_plot_png_file
    type: boolean?
    inputBinding:
      position: 13
      prefix: PLOTPNG
      shellQuote: false
    label: Generate plot png file
    doc: Generate plot png file.
  - 'sbg:category': Input configuration
    id: highlight_pept_cysteines
    type: boolean?
    inputBinding:
      position: 11
      prefix: ICAT
      shellQuote: false
    label: Highlight peptide cysteines
    doc: Highlight peptide cysteines.
  - 'sbg:category': Input configuration
    id: highlight_pept_n_glycosylation_motif
    type: boolean?
    inputBinding:
      position: 12
      prefix: GLYC
      shellQuote: false
    label: Highlight peptide N-glycosylation motif
    doc: Highlight peptide N-glycosylation motif.
  - 'sbg:category': Input Files
    id: input_files
    type: 'File[]'
    label: Input files
    doc: Input files.
    'sbg:fileTypes': PEP.XML
  - 'sbg:category': Input configuration
    id: instances
    type: int?
    inputBinding:
      position: 21
      prefix: INSTANCES
      shellQuote: false
    label: Instances
    doc: >-
      Use Expected Number of Ion Instances to adjust the peptide probabilities
      prior to NSP adjustment.
  - 'sbg:category': Input configuration
    id: iprophet
    type: boolean?
    inputBinding:
      position: 4
      prefix: IPROPHET
      shellQuote: false
    label: IPROPHET
    doc: Input is from iProphet.
  - 'sbg:category': Input Files
    id: libra_ratios
    type: File?
    inputBinding:
      position: 7
      prefix: LIBRA
      shellQuote: false
    label: Libra ratios
    doc: >-
      Compute Libra ratios for protein entries, using condition parameters in
      <file> (Libra must have been run previously on all input datasets).
  - 'sbg:category': Input configuration
    id: logprobs
    type: boolean?
    inputBinding:
      position: 26
      prefix: LOGPROBS
      shellQuote: false
    label: Logprobs
    doc: Use the log of the probabilities in the Confidence calculations.
  - 'sbg:category': Input configuration
    'sbg:toolDefaultValue': '0'
    id: minindep
    type: float?
    inputBinding:
      position: 16
      prefix: MININDEP
      shellQuote: false
    doc: Minimum percentage of independent peptides required for a protein.
  - 'sbg:category': Input configuration
    'sbg:toolDefaultValue': '0.05'
    id: minprob
    type: float?
    inputBinding:
      position: 17
      prefix: MINPROB
      shellQuote: false
    label: PeptideProphet probabilty threshold
    doc: PeptideProphet probabilty threshold.
  - 'sbg:category': Input configuration
    id: model_protein_fpkm_values
    type: boolean?
    inputBinding:
      position: 14
      prefix: FPKM
      shellQuote: false
    label: Model protein FPKM values
    doc: Model protein FPKM values.
  - 'sbg:category': Input configuration
    'sbg:toolDefaultValue': '1'
    id: mufactor
    type: float?
    inputBinding:
      position: 28
      prefix: MUFACTOR
      shellQuote: false
    label: Mufactor
    doc: Fudge factor to scale MU calculation.
  - 'sbg:category': Input configuration
    id: nogroupwts
    type: boolean?
    inputBinding:
      position: 20
      prefix: NOGROUPWTS
      shellQuote: false
    label: Check peptide's Protein weight against the threshold
    doc: >-
      Check peptide's Protein weight against the threshold (default: check
      peptide's Protein Group weight against threshold).
  - 'sbg:category': Input configuration
    id: nooccam
    type: boolean?
    inputBinding:
      position: 23
      prefix: NOOCCAM
      shellQuote: false
    label: Nooccam
    doc: Non-conservative maximum protein list.
  - 'sbg:category': Input configuration
    id: noprotlen
    type: boolean?
    inputBinding:
      position: 9
      prefix: NOPROTLEN
      shellQuote: false
    label: Do not report protein length
    doc: Do not report protein length.
  - 'sbg:category': Input configuration
    id: normprotlen
    type: boolean?
    inputBinding:
      position: 19
      prefix: NORMPROTLEN
      shellQuote: false
    label: Normalize NSP using Protein Length
    doc: Normalize NSP using Protein Length.
  - 'sbg:category': Input configuration
    id: protein_mol_weights
    type: boolean?
    inputBinding:
      position: 10
      prefix: PROTMW
      shellQuote: false
    label: Get protein mol weights
    doc: Get protein mol weights.
  - 'sbg:category': Input configuration
    id: softoccam
    type: boolean?
    inputBinding:
      position: 24
      prefix: SOFTOCCAM
      shellQuote: false
    label: Softoccam
    doc: >-
      Peptide weights are apportioned equally among proteins within each Protein
      Group (less conservative protein count estimate).
  - 'sbg:category': Input configuration
    id: unmapped
    type: boolean?
    inputBinding:
      position: 29
      prefix: UNMAPPED
      shellQuote: false
    label: Unmapped
    doc: Report results for UNMAPPED proteins.
  - 'sbg:category': Input configuration
    id: xpress
    type: boolean?
    inputBinding:
      position: 5
      prefix: XPRESS
      shellQuote: false
    label: XPRESS
    doc: >-
      Compute XPRESS ratios for protein entries (XPRESS must have been run
      previously on all input datasets).
outputs:
  - id: html_file
    doc: Html file.
    label: Html file
    type: File?
    outputBinding:
      glob: |-
        ${
            if (inputs.generate_plot_png_file != undefined && inputs.generate_plot_png_file == true)
                return '*.html'
            return ''
        }
    'sbg:fileTypes': HTML
  - id: output_prot_xml_file
    doc: Output xml file.
    label: Output xml file
    type: File?
    outputBinding:
      glob: |-
        ${
            if (inputs.input_files instanceof Array) {
                var name = inputs.input_files[0].path.split('/')[inputs.input_files[0].path.split('/').length - 1]
                return name.substring(0, name.length - 3) + 'prot.xml'
            }
            var name = inputs.input_files.path.split('/')[inputs.input_files.path.split('/').length - 1]
            return name.substring(0, name.length - 3) + 'prot.xml'
        }
    'sbg:fileTypes': XML
  - id: png_file
    doc: Png file.
    label: Png file
    type: File?
    outputBinding:
      glob: '*.png'
    'sbg:fileTypes': PNG
doc: >-
  **ProteinProphet** is a tool for generating probabilities for protein
  identifications based on MS/MS data from the validation results for peptide
  sequence identifications generated by PeptideProphet. It is an integral part
  of the Trans-Proteomic Pipeline developed by the Seattle Proteome Center.


  ###Required Inputs


  1. input_files: file in pepXML format that contains validation results for
  peptide sequence identifications


  ###Outputs


  1. output\_prot\_xml\_file: file in protXML format that contains a list of all
  proteins corresponding to the peptide-spectrum matches (PSMs) along with
  protein probabilities and global false discovery rates (FDRs) at different
  thresholds

  2. png_file: results visualisation file in PNG format

  3. html_file: results visualisation file in HTML format



  ###Common Issues and Important Notes


  There are no known common issues.
label: TPP ProteinProphet
arguments:
  - position: 0
    shellQuote: false
    valueFrom: |-
      ${
          var cmd = '';
          var cmd2 = '';
          for (var i = 0; i < inputs.input_files.length; i++) {
            cmd += ' ln -s ' + inputs.input_files[i].path + ' . ; ';
            cmd2 += inputs.input_files[i].basename + ' ';
          }
          cmd += '/local/tpp/bin/ProteinProphet ';
          return cmd + cmd2
       }
  - position: 3
    shellQuote: false
    valueFrom: |-
      ${
          if (inputs.input_files instanceof Array) {
              var name = inputs.input_files[0].path.split('/')[inputs.input_files[0].path.split('/').length - 1]
              return name
          }
          var name = inputs.input_files.path.split('/')[inputs.input_files.path.split('/').length - 1]
          return name
      }
  - position: 2001
    shellQuote: false
    valueFrom: |-
      ${
          if (inputs.generate_plot_png_file)
              return '; python gen_html.py'
          else return ''
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
      - entryname: gen_html.py
        entry: |-
          ${
            var res = 'import base64\n\n'
            var name = ''
            if(inputs.input_files instanceof Array)
              name = inputs.input_files[0].basename
            else
              name = inputs.input_files.basename
              
            var part = name.substring(0, name.length-3)
            name = part + 'prot.png'
            var html = part + 'prot.html'
            
            res = res + 'f = open(\'' + html + '\', \'w\')\n'
            
            res = res + 'pngFile = open(\'' + name + '\', \'rb\')\n'
            
            res = res + 'encoded = base64.b64encode(pngFile.read()).decode(\'ascii\')\n\n'
            
            res = res + 'f.write(\'<!DOCTYPE HTML>\\n<html lang = \\"en\\">\\n<head>\\n\\t<title>'
            res = res + html
            res = res + '</title>\\n\\t<meta charset = \"UTF-8\" />\\n</head>\\n<body>\\n\\t<p>\\n\\t\\t<img src = \\"data:image/png;base64,\' + encoded + \'\\"/>\\n\\t</p>\\n</body>\\n<\html>\')' 
            res = res + '\nf.close()\n'
            return res

            
          }
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

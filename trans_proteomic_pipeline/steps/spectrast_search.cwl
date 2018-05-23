class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: tpp_spectrast_search_5_0_0
baseCommand: []
inputs:
  - 'sbg:category': Input Files
    id: database
    type: File?
    inputBinding:
      position: 3
      prefix: '-sD'
      shellQuote: false
    label: Database
    doc: >-
      Database must be in .fasta format. This will not affect the search in any
      way, but this information will be included in the output for any
      downstream data processing.
    'sbg:fileTypes': FASTA
  - 'sbg:category': Input Files
    id: library
    type: File
    inputBinding:
      position: 2
      prefix: '-sL'
      shellQuote: false
      valueFrom: |-
        ${
            return inputs.library.path.split('/')[inputs.library.path.split('/').length - 1]
        }
    label: Library
    doc: >-
      Library must have .splib extension. The existence of the corresponding
      .spidx and .pepidx files of the same name is assumed.
    'sbg:fileTypes': SPLIB
    secondaryFiles:
      - ^.spidx
      - ^.pepidx
  - 'sbg:category': Output configuration
    id: output_format
    type:
      - 'null'
      - type: enum
        symbols:
          - txt
          - xls
          - pep.xml
          - html
        name: output_format
    inputBinding:
      position: 11
      prefix: '-sE'
      shellQuote: false
    label: Output format
    doc: >-
      The search result will be written to a file with the same base name as the
      search file, with extension <output_format>.
  - 'sbg:category': CANDIDATE SELECTION AND SCORING OPTIONS
    id: precursor_m_z_tolerance
    type: string?
    inputBinding:
      position: 8
      prefix: '-sM'
      shellQuote: false
    label: Precursor m/z tolerance
    doc: >-
      Specify precursor m/z tolerance. It is the m/z tolerance within which
      candidate entries are compared to the query.
  - 'sbg:category': Input Files
    id: spectra_files
    type: 'File[]'
    label: Spectra files
    doc: Files containing unknown spectra to be searched.
    'sbg:fileTypes': 'MZXML, MZDATA, DTA, MSP'
  - 'sbg:category': Input Files
    id: subset_spectra
    type: File?
    inputBinding:
      position: 7
      prefix: '-sS'
      shellQuote: false
    label: Subset spectra
    doc: >-
      Only search a subset of the query spectra in the search file. Only query
      spectra with names matching a line of <file> will be searched.
  - 'sbg:category': Input configuration
    'sbg:toolDefaultValue': does not use multi-threding
    id: threads
    type: int?
    inputBinding:
      position: 6
      shellQuote: false
      valueFrom: |-
        ${
            if (inputs.threads != undefined & inputs.threads > 0)
                return '-sP ' + inputs.threads
            if (inputs.threads == undefined)
                return ''
            return '-sP!'
        }
    label: Number of threads
    doc: >-
      Cache all entries in RAM. Requires a lot of memory (the library will
      usually be loaded almost in its entirety), but speeds up search for
      unsorted queries.
outputs:
  - id: output_file
    doc: Output file.
    label: Output file
    type: 'File[]?'
    outputBinding:
      glob: |-
        ${
            if (inputs.output_format == 'txt')
                return '*.spec.txt'
            else if (inputs.output_format == 'xls')
                return '*.spec.xls'
            else if (inputs.output_format == 'pep.xml')
                return '*.spec.pep.xml'
            else if (inputs.output_format == 'html')
                return '*.spec.html'
            return '*.spec.pep.xml'
        }
    'sbg:fileTypes': 'TXT, XLS, PEP.XML, HTML'
doc: >-
  **SpectraST** (also known as "Spectra Search Tool", which rhymes with
  "contrast") is a spectral library building and searching tool designed
  primarily for shotgun proteomics applications. It is an integral part of the
  Trans-Proteomic Pipeline developed by the Seattle Proteome Center.


  Traditionally, the inference of peptide sequence from its characteristic
  tandem mass spectra is done by sequence (database) searching. In sequence
  searching, a target protein (or translated DNA) database is used as a
  reference to generate all possible putative peptide sequences by in silico
  digestion.

  Spectral searching is an alternative approach that promises to address some of
  the shortcomings of sequence searching. In spectral searching, a spectral
  library is meticulously compiled from a large collection of previously
  observed and identified peptide MS/MS spectra. An unknown spectrum then can by
  identified by comparing it to all the candidates in the spectral library for
  the best match. This approach has been employed for mass spectrometric
  analysis of small molecules with great success but has only become possible
  for proteomics very recently. The main difficulty of generating enough
  high-quality experimental spectra for compilation into spectral libraries has
  been overcome by the recent explosion of proteomics data and the availability
  of public data repositories. Several attempts at creating and searching
  spectral libraries in the context of proteomics demonstrate the tremendous
  improvement in search speed and the great potential of this method in
  complementing, if not replacing, sequence searching in many proteomics
  applications.


  SpectraST Search can perform spectral searching using data in the following
  formats: mzML, mzXML (all versions), mzData , MGF (Mascot Generic), DTA
  (SEQUEST), and MSP (a simple peak list preceded by precursor information
  developed by the National Institute of Standards and Technology). 

  The spectral library must be in SpectraST’s SPLIB format, which can be created
  in SpectraST Create Mode. 

  The results can be output to the following file formats: pepXML, TXT, XLS, and
  HTML.


  ###Required Inputs

  1. spectra\_files: file in mzML, mzData, DTA, or MSP format that contains
  input mass spectrometry data

  2. library: spectral library file in SPLIB format and secondary SPIDX and
  PEPIDX files


  ###Outputs

  1. output_file: file in pepXML, TXT, XLS, or HTML format that contains the
  resulting peptide-spectrum matches



  ###Common Issues and Important Notes


  There are no known common issues.
label: TPP SpectraST Search
arguments:
  - position: 0
    shellQuote: false
    valueFrom: |-
      ${
                var res = ''
                for (var i = 0; i < inputs.spectra_files.length; i++) {
                    res = res + ' ln -s ' + inputs.spectra_files[i].path + ' . ; '


                }
                res += '/local/tpp/bin/spectrast'
                return res
            }
  - position: 1001
    shellQuote: false
    valueFrom: |-
      ${
          var res = ''
          for (var i = 0; i < inputs.spectra_files.length; i++) {
              res = res + ' ; '

              var prefix = inputs.spectra_files[i].path.split('/')
              prefix = prefix[prefix.length - 1]
              var part = prefix.split('.')[prefix.split('.').length - 1]
              prefix = prefix.substring(0, prefix.indexOf(part) - 1)

              res = res + 'mv '

              if (inputs.output_format == undefined || !(inputs.output_format))
                  var suf = '.pep.xml'
              else
                  var suf = '.' + inputs.output_format

              res = res + prefix + suf + ' ' + prefix + '.spec' + suf

          }
          return res
      }
  - position: 101
    shellQuote: false
    valueFrom: |-
      ${
                  var res = ''
                  for (var i = 0; i < inputs.spectra_files.length; i++) {
                          var name = inputs.spectra_files[i].basename
                          res = res + ' ' + name
                      }
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
      - $(inputs.library)
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

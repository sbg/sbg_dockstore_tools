class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: readw4mascot2_1
baseCommand:
  - wine
inputs:
  - id: Raw_Input
    type: File
    inputBinding:
      position: 101
      shellQuote: false
    label: Raw_Input
    doc: Raw input file
    'sbg:fileTypes': RAW
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: XmlOrbiMs1Profile
    type: boolean?
    inputBinding:
      position: 13
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.XmlOrbiMs1Profile != undefined && inputs.XmlOrbiMs1Profile == true)
                return ' -XmlOrbiMs1Profile '
            return res
        }
    label: XmlOrbiMs1Profile
    doc: >-
      ( -XmlOrbiMs1Profile ) : Save Profile FTMS ms1 spectra into mzXml
      (override -c)
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: auto_orbi
    type: boolean?
    inputBinding:
      position: 44
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.auto_orbi != undefined && inputs.auto_orbi == true)
                return ' -AutoOrbi '
            return res
        }
    label: Options based on instrument
    doc: '( -AutoOrbi ) : automatically pick the right options based on instrument.'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: centroid_data
    type: boolean?
    inputBinding:
      position: 11
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.centroid_data != undefined && inputs.centroid_data == true)
                return ' -c '
            return res
        }
    label: Centroid the data
    doc: '( -c ) : Centroid the data (meaningfull only if RAW data is a profile)'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: charge_mgf_orbi
    type: boolean?
    inputBinding:
      position: 25
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.charge_mgf_orbi != undefined && inputs.charge_mgf_orbi == true)
                return ' -ChargeMgfOrbi '
            return res
        }
    label: Include CHARGE in MGF output
    doc: >-
      ( -ChargeMgfOrbi ) : Include CHARGE in MGF output for LTQ Orbitrap
      instruments
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: compression
    type: boolean?
    inputBinding:
      position: 14
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.compression != undefined && inputs.compression == true)
                return ' -Compression '
            return res
        }
    label: Compression of peaks
    doc: '( -Compression ) : Use zlib for comrpessing peaks in mzXML'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: fix_pepmass
    type: boolean?
    inputBinding:
      position: 28
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.fix_pepmass != undefined && inputs.fix_pepmass == true)
                return ' -FixPepmass '
            return res
        }
    label: Replace PEPMASS and CHARGE
    doc: >-
      ( -FixPepmass ) : Replace PEPMASS and CHARGE with better ones if found
      (Orbitrap and FT only)
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: ftpeakinfoms1
    type: boolean?
    inputBinding:
      position: 20
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.ftpeakinfoms1 != undefined && inputs.ftpeakinfoms1 == true)
                return ' -ftPeakInfoMs1 '
            return res
        }
    label: FT-specific peak information MS1
    doc: >-
      ( -ftPeakInfoMs1 ) : Output FT-specific peak information (Resolution,
      Baseline, Noise, Charge) as peak annotations in ms1 spectra.
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: ftpeakinfomsms
    type: boolean?
    inputBinding:
      position: 21
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.ftpeakinfomsms != undefined && inputs.ftpeakinfomsms == true)
                return ' -ftPeakInfoMsMs '
            return res
        }
    label: FT peak information MS/MS
    doc: >-
      ( -ftPeakInfoMsMs ) : Output FT-specific peak information (Resolution,
      Baseline, Noise, Charge) as peak annotations in ms/ms spectra.
  - 'sbg:category': Input options
    'sbg:toolDefaultValue': 'False'
    id: itraq_4
    type: boolean?
    inputBinding:
      position: 32
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.itraq_4 != undefined && inputs.itraq_4 == true)
                return ' -iTRAQ '
            return res
        }
    label: iTRAQ 4-plex
    doc: '( -iTRAQ ) : RAW file contains iTRAQ 4-plex'
  - 'sbg:category': Input options
    'sbg:toolDefaultValue': 'False'
    id: itraq_8
    type: boolean?
    inputBinding:
      position: 33
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.itraq_8 != undefined && inputs.itraq_8 == true)
                return ' -iTRAQ8 '
            return res
        }
    label: iTRAQ8-plex
    doc: '( iTRAQ-8 ) : RAW file contains iTRAQ 8-plex'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': '1.0'
    id: max_iso_seqm
    type: float?
    inputBinding:
      position: 36
      prefix: '-maxIsoSeqM'
      shellQuote: false
    label: Max number iso sequences
    doc: >-
      ( -maxIsoSeqM ) : Max number iso sequences per precursor and charge,
      Millions (default=1.0)
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: max_pi
    type: boolean?
    inputBinding:
      position: 29
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.max_pi != undefined && inputs.max_pi == true)
                return ' -MaxPI '
            return res
        }
    label: Max precursor intensity
    doc: '( -MaxPI ) : Include max precursor intensity'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: metadata
    type: boolean?
    inputBinding:
      position: 22
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.metadata != undefined && inputs.metadata == true)
                return ' -metadata '
            return res
        }
    label: Metadata
    doc: '( -metadata ) : Output Instrument Method, Tune Data, and scan Trailer info'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: monoiso_mgf
    type: boolean?
    inputBinding:
      position: 27
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.monoiso_mgf != undefined && inputs.monoiso_mgf == true)
                return ' -MonoisoMgf '
            return res
        }
    label: 'In MGF, PEPMASS=Monoisotopic m/z'
    doc: '( -MonoisoMgf: ) In MGF, PEPMASS=Monoisotopic m/z if available'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: monoiso_mgf_orbi
    type: boolean?
    inputBinding:
      position: 26
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.monoiso_mgf_orbi != undefined && inputs.monoiso_mgf_orbi == true)
                return ' -MonoisoMgfOrbi '
            return res
        }
    label: 'In MGF, PEPMASS=Monoisotopic m/z'
    doc: >-
      ( -MonoisoMgfOrbi ) : In MGF, PEPMASS=Monoisotopic m/z for LTQ Orbitrap
      instruments
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: ms1
    type: boolean?
    inputBinding:
      position: 16
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.ms1 != undefined && inputs.ms1 == true)
                return ' -ms1 '
            return res
        }
    label: Mass Spectrum1
    doc: '( -ms1 ) : Also output MS1 spectra and precursor scan no. for MS2'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: msfr
    type: boolean?
    inputBinding:
      position: 43
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.msfr != undefined && inputs.msfr == true)
                return ' -msfr '
            return res
        }
    label: Thermo MSFileReader OCX
    doc: '( -msfr ) : unconditionally use Thermo MSFileReader OCX'
  - 'sbg:toolDefaultValue': '4'
    id: mz_digits
    type: int?
    inputBinding:
      position: 37
      prefix: '-mzDigits'
      shellQuote: false
    label: Decimal places in m/z
    doc: '( -mzDigits ) : Number of decimal places in output m/z (default=4)'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: no_peaks
    type: boolean?
    inputBinding:
      position: 34
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.no_peaks != undefined && inputs.no_peaks == true)
                return ' -NoPeaks '
            return res
        }
    label: No mass spectral peaks
    doc: '( -NoPeaks ) : Do not output mass spectral peaks'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: no_peaks_1
    type: boolean?
    inputBinding:
      position: 35
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.no_peaks_1 != undefined && inputs.no_peaks_1 == true)
                return ' -NoPeaks1 '
            return res
        }
    label: No mass spectral peaks ms1
    doc: '( -NoPeaks1 ) : Output ms1 spectra without mass spectral peaks'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: nomgf
    type: boolean?
    inputBinding:
      position: 23
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.nomgf != undefined && inputs.nomgf == true)
                return ' -NoMgf '
            return res
        }
    label: No MGF output
    doc: '( --NoMgf ) : Do not produce MGF output'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: nomzxml
    type: boolean?
    inputBinding:
      position: 24
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.nomzxml != undefined && inputs.nomzxml == true)
                return ' -NoMzXml '
            return res
        }
    label: No MzXML output
    doc: '( -NoMzXml ) : Do not produce MzXml output'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: output_profile
    type: boolean?
    inputBinding:
      position: 12
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.output_profile != undefined && inputs.output_profile == true)
                return ' -p '
            return res
        }
    label: Output profile
    doc: '( -p ) : Output profile if possible'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: pi_vs_rt
    type: boolean?
    inputBinding:
      position: 30
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.pi_vs_rt != undefined && inputs.pi_vs_rt == true)
                return ' -PIvsRT '
            return res
        }
    label: Precursor intensity vs RT
    doc: '( -PIvsRT ) : Include precursor intensity vs RT lines'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: rulers
    type: boolean?
    inputBinding:
      position: 15
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.rulers != undefined && inputs.rulers == true)
                return ' -Rulers '
            return res
        }
    label: Rulers
    doc: '( -Rulers ) : Attempt compression using m/z ruler'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: sample_info
    type: boolean?
    inputBinding:
      position: 31
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.sample_info != undefined && inputs.sample_info == true)
                return ' -SampleInfo '
            return res
        }
    label: Sample info
    doc: '( -SampleInfo ) : Output Sample Info into MGF'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: sep
    type: boolean?
    inputBinding:
      position: 18
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.sep != undefined && inputs.sep == true)
                return ' -sep '
            return res
        }
    label: Separate MGF file
    doc: >-
      ( -sep ) : Output MS/MS spectra in separate outfile.RAW.yy.xxx.MGF, yy=IT,
      FT, TQ, SQ, TOF, SECT, UnknMS; xxx=cid, hcd, etd,... In case of -ms1 or
      -NoPeaks1 assumes -sep1
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: sep1
    type: boolean?
    inputBinding:
      position: 17
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.sep1 != undefined && inputs.sep1 == true)
                return ' -sep1 '
            return res
        }
    label: Separate MS1
    doc: '( -sep1 ) : Output MS1 spectra in a separate outfile.RAW.MS1'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: sepzc
    type: boolean?
    inputBinding:
      position: 19
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.sepzc != undefined && inputs.sepzc == true)
                return ' -sepZC '
            return res
        }
    label: Separate ZC file
    doc: >-
      ( -sepZC ) : Output MS/MS spectra depending on presence of precursor
      charge in separate outfile.RAW.yy.xxx.cz.MGF; c0=no charge, ch has charge.
      Use instead of -sep option
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: small_mol
    type: boolean?
    inputBinding:
      position: 41
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.small_mol != undefined && inputs.small_mol == true)
                return ' -SmallMol '
            return res
        }
    label: Small molecules
    doc: '( -SmallMol ) : Treat ions with precursor m/z < 260 as small molecules'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': '0'
    id: tol_ppm
    type: int?
    inputBinding:
      position: 40
      prefix: '-TolPPM'
      shellQuote: false
    label: Max tollerance in matching
    doc: >-
      ( -TolPPM ) : max. tolerance in matching ms1 to FT ms2 peaks in isolation
      range, ppm (0=default, use only resolution reported by the instrument)
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': 'False'
    id: xcal
    type: boolean?
    inputBinding:
      position: 42
      shellQuote: false
      valueFrom: |-
        ${
            var res = ''
            if (inputs.xcal != undefined && inputs.xcal == true)
                return ' -xcal '
            return res
        }
    label: Xcalibur OCX
    doc: '( -xcal ) : unconditionally use Xcalibur OCX'
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': '0'
    id: xpm
    type: int?
    inputBinding:
      position: 39
      prefix: '-xpm'
      shellQuote: false
    label: XIC points per minute
    doc: >-
      ( -xpm ) : points = min. number of ms1 XIC points per minute >19 for
      condensing the data, e.g. 32 means 104 points per 3.25 min. default=no
      condensing
  - 'sbg:category': Output options
    'sbg:toolDefaultValue': '0.0'
    id: xpw
    type: float?
    inputBinding:
      position: 38
      prefix: '-xpw'
      shellQuote: false
    label: XIC peak width
    doc: >-
      ( -xpw ) : width = Min precursor XIC Peak Width (seconds); default=0.0;
      (max. moving average window for preliminary ms1 XIC peak detection) = 0.5
      * (width)
outputs:
  - id: Output_MGF_file
    label: Output_MGF_file
    type: File?
    outputBinding:
      glob: '*.MGF'
      outputEval: |-
        ${
            return inheritMetadata(self, inputs.Raw_Input)

        }
    'sbg:fileTypes': MGF
  - id: Output_MS1_spectra
    doc: Output file if sep1 option is selected
    label: Output_MS1_spectra
    type: File?
    outputBinding:
      glob: '*.MS1'
      outputEval: |-
        ${
            return inheritMetadata(self, inputs.Raw_Input)

        }
    'sbg:fileTypes': RAW.MS1
  - id: Output_Metadata
    doc: 'Outputs the instrument metho, tune data, and scan Trailer info'
    label: Output_Metadata
    type: File?
    outputBinding:
      glob: '*.metadata'
      outputEval: |-
        ${
            return inheritMetadata(self, inputs.Raw_Input)

        }
    'sbg:fileTypes': METADATA
  - id: Output_mzXML_file
    label: Output_mzXML_file
    type: File?
    outputBinding:
      glob: '*.mzXML'
      outputEval: |-
        ${
            return inheritMetadata(self, inputs.Raw_Input)

        }
    'sbg:fileTypes': mzXML
doc: >-
  **ReAdw4Mascot2** is a tool for converting between various mass spectrometry
  file formats.


  ###Required Inputs


  1. Raw_Input: mass spectrometry data file in raw format


  ###Outputs


  1. Output\_MGF\_file: mass spectrometry data file in MGF format

  2. Output\_mzXML\_file: mass spectrometry data file in mzXML format

  3. Output\_MS1\_spectra: MS1 spectra data file

  4. Output\_Metadata: metadata file containing instrument method, tune data,
  and scan trailer information


  ###Common Issues and Important Notes


  There are no known common issues.
label: ReAdw4Mascot2
arguments:
  - position: 0
    shellQuote: false
    valueFrom: /root/.wine/drive_c/windows/system32/ReAdw4Mascot/ReAdw4Mascot2.exe
requirements:
  - class: ShellCommandRequirement
  - class: EnvVarRequirement
    envDef:
      - envName: HOME
        envValue: /root
  - class: ResourceRequirement
    ramMin: 2000
    coresMin: 2
  - class: DockerRequirement
    dockerPull: 'images.sbgenomics.com/vladimir_obucina/readw4mascot:2.0'
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.Raw_Input)
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
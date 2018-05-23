#!/usr/bin/env cwl-runner

class: Workflow
cwlVersion: v1.0
id: the_trans_proteomic_pipeline_5_0_0
dct:creator:
  foaf:name: SevenBridgesGenomics
  foaf:mbox: "mailto:support@sbgenomics.com"
doc: >-
  The Trans-Proteomic Pipeline (TPP) is a suite of software tools used for the
  analysis of a variety of types of mass spectrometry data. It supports mass
  spectrometer output file conversion, peptide identification with a sequence or
  spectral library search engine, protein-level inference, and peptide- and
  protein-level validation and quantification.


  Each of the tools that is included in the TPP is described in the online [TPP
  Tutorial](http://tools.proteomecenter.org/wiki/index.php?title=TPP_Tutorial). 


  To demonstrate the use of the TPP, we created the current workflow, which
  incorporates a subset of the available tools: ReAdw4Mascot2 for raw file
  conversion, SpectraST and X!Tandem and SpectraST for peptide-identification,
  Tandem2XML for Tandem output file conversion, PeptideProphet for validation of
  peptide-spectrum assignments, iProphet for additional peptide-level
  validation, ProteinProphet for protein-level validation, and ASAP for peptide
  quantification. In The Clinical Proteomic Tumor Analysis Consortium (CPTAC)
  public project on the CGC, we use this workflow to analyze a sample dataset
  from SILAC-labeled yeast (_Saccharomyces cerevisiae_) whole cell lysates
  digested with trypsin and run (in two runs) on a Thermo Scientific LTQ
  Orbitrap mass spectrometer (as described in Deutsch et al, 2010).


  ###Required inputs

  1. library: library of pre-identified spectra to which peptide sequences have
  been assigned in splib file format; secondary files used with library file in
  spidx and pepidx format

  2. database: protein sequence database in FASTA or FA format

  3. raw_input: mass spectrometry data in RAW data format

  4. list_path_default_parameters: default parameters used by X!Tandem
   
  ###Outputs

  1. readw4mascot2\_output\_file: mass-spectrometry data in the common, open
  data format mzXML

  2. spectrast\_output\_file: SpectraST peptide-spectrum matches in pepXML
  format

  3. xtandem\_output\_XML\_file: X!Tandem peptide-spectrum matches in xml format

  4. tandem2xml\_output\_file: X!Tandem peptide-spectrum matches in pepXML
  format

  5. interact\_parser\_output\_file: X!Tandem corrected peptide-spectrum matches
  in pepXML format

  6. peptide\_prophet\_x\_output\_file: X!Tandem peptide-spectrum assignment
  validation results in pepXML format

  7. peptide\_prophet\_s\_output\_file: SpectraST peptide-spectrum assignment
  validation results in pepXML format

  8. iprophet\_output\_file: X!Tandem and SpectraST results validated by
  PeptideProphet that have been merged and further validated on the peptide
  level in pepXML format

  9. asap\_peptide\_output\_file, asap\_protein\_output\_file,
  asap\_pvalue\_output\_file: measured relative expression levels of peptides
  and proteins from isotopically-labeled samples in pepXML format

  10. protein\_prophet\_output\_file: validated protein identifications in
  pepXML format
  
  ###Running notes
  
  If running with cwltool, please run using non-strict and no-match-user options.  
    
  ```
  cwltool --non-strict --no-match-user tpp.cwl tpp.job.json
  ```

label: The Trans-Proteomic Pipeline
$namespaces:
  sbg: 'https://sevenbridges.com'
inputs:
  - id: raw_input
    'sbg:fileTypes': RAW
    type: 'File[]'
    label: raw_input
    'sbg:includeInPorts': true
    'sbg:x': 68.53847007779716
    'sbg:y': 346.92312409609906
  - id: library
    'sbg:fileTypes': SPLIB
    type: File
    label: library
    'sbg:x': 270.307735519298
    'sbg:y': 80.30770385335931
    secondaryFiles:
      - ^.spidx
      - ^.pepidx
  - id: database
    'sbg:fileTypes': 'FASTA, FA, FASTA.PRO'
    type: File?
    label: database
    'sbg:x': 269.23081925635006
    'sbg:y': 231.30772371828326
  - id: list_path_default_parameters
    'sbg:fileTypes': XML
    type: File
    label: list_path_default_parameters
    'sbg:x': 314.461545944214
    'sbg:y': 525.1538747090563
outputs:
  - id: readw4mascot2_output_file
    outputSource: ReAdw4Mascot2/Output_mzXML_file
    'sbg:fileTypes': mzXML
    type: 'File[]?'
    label: readw4mascot2_output_file
    'sbg:includeInPorts': true
    'sbg:x': 499.6923347619866
    'sbg:y': 650.3077329122107
  - id: spectrast_output_file
    outputSource: TPP_SpectraST_Search/output_file
    'sbg:fileTypes': 'TXT, XLS, PEP.XML, HTML'
    type: 'File[]?'
    label: spectrast_output_file
    'sbg:includeInPorts': true
    'sbg:x': 605.1539453486758
    'sbg:y': -6.461541277417041
  - id: xtandem_output_XML_file
    outputSource: X_Tandem/output_XML_file
    'sbg:fileTypes': XML
    type: 'File[]?'
    label: xtandem_output_XML_file
    'sbg:includeInPorts': true
    'sbg:x': 664.1538856579709
    'sbg:y': 626.4615829174338
  - id: peptide_prophet_s_output_file
    outputSource: TPP_PeptideProphet/output_file
    'sbg:fileTypes': PEP.XML
    type: File?
    label: peptide_prophet_s_output_file
    'sbg:includeInPorts': true
    'sbg:x': 1146
    'sbg:y': -27
  - id: interact_parser_output_file
    outputSource: TPP_InteractParser/output_file
    'sbg:fileTypes': PEP.XML
    type: 'File[]?'
    label: interact_parser_output_file
    'sbg:includeInPorts': true
    'sbg:x': 972.1539026040301
    'sbg:y': 494.53850186788145
  - id: peptide_prophet_x_output_file
    outputSource: TPP_PeptideProphet_1/output_file
    'sbg:fileTypes': PEP.XML
    type: File?
    label: peptide_prophet_x_output_file
    'sbg:includeInPorts': true
    'sbg:x': 1125.3077568457684
    'sbg:y': 426.3846512024221
  - id: iprophet_output_file
    outputSource: TPP_IProphet/output_file
    'sbg:fileTypes': PEP.XML
    type: File?
    label: iprophet_output_file
    'sbg:includeInPorts': true
    'sbg:x': 1489.6154707211722
    'sbg:y': 509.07695311766423
  - id: asap_pvalue_output_file
    outputSource: TPP_ASAPRatioPvalueParser/output_file
    'sbg:fileTypes': XML
    type: File?
    label: asap_pvalue_output_file
    'sbg:includeInPorts': true
    'sbg:x': 2345.307836074097
    'sbg:y': 184.15385264616754
  - id: asap_protein_output_file
    outputSource: TPP_ASAPRatioProteinRatioParser/output_file
    'sbg:fileTypes': XML
    type: File?
    label: asap_protein_output_file
    'sbg:includeInPorts': true
    'sbg:x': 2175.923208915271
    'sbg:y': 476.2307960253498
  - id: refresh_parser_output_file
    outputSource: TPP_RefreshParser/output_file
    'sbg:fileTypes': 'XML, PEP.XML'
    type: File?
    label: refresh_parser_output_file
    'sbg:includeInPorts': true
    'sbg:x': 1860.6924184469085
    'sbg:y': 518.923105643346
  - id: asap_peptide_output_file
    outputSource: TPP_ASAPRatioPeptideParser/output_file
    'sbg:fileTypes': 'XML, PEP.XML'
    type: File?
    label: asap_peptide_output_file
    'sbg:includeInPorts': true
    'sbg:x': 1684.3077898025522
    'sbg:y': 201.23077759375948
  - id: protein_prophet_output_file
    outputSource: TPP_ProteinProphet/output_prot_xml_file
    'sbg:fileTypes': XML
    type: File?
    label: protein_prophet_output_file
    'sbg:includeInPorts': true
    'sbg:x': 2041.538530050648
    'sbg:y': 201.53844122350463
  - id: tandem2xml_output_file
    outputSource: TPP_Tandem2XML/output_file
    'sbg:fileTypes': PEP.XML
    type: 'File[]?'
    label: tandem2xml_output_file
    'sbg:includeInPorts': true
    'sbg:x': 825.307739239473
    'sbg:y': 566.3846545036024
steps:
  - id: ReAdw4Mascot2
    in:
      - id: Raw_Input
        source: raw_input
    out:
      - id: Output_MGF_file
      - id: Output_MS1_spectra
      - id: Output_Metadata
      - id: Output_mzXML_file
    run: steps/readw4mascot2.cwl
    label: ReAdw4Mascot2
    scatter: Raw_Input
    'sbg:x': 263.07693678387585
    'sbg:y': 367.692334705557
  - id: TPP_SpectraST_Search
    in:
      - id: database
        source: database
      - id: library
        source: library
      - id: spectra_files
        source: ReAdw4Mascot2/Output_mzXML_file
    out:
      - id: output_file
    run: steps/spectrast_search.cwl
    label: TPP SpectraST Search
    'sbg:x': 473.4460144042969
    'sbg:y': 126.7698745727539
  - id: X_Tandem
    in:
      - id: input_spectra
        source: ReAdw4Mascot2/Output_mzXML_file
      - id: list_path_default_parameters
        source: list_path_default_parameters
      - id: maximum_missed_cleavage_sites
        default: 2
      - id: modification_mass
        default: 57.021464@C
      - id: parent_monoisotopic_mass_error_minus
        default: 2.1
      - id: parent_monoisotopic_mass_error_plus
        default: 4.1
      - id: parent_monoisotopic_mass_error_units
        default: Daltons
      - id: parent_monoisotopic_mass_isotope_error
        default: 'no'
      - id: potential_modification_mass
        default: '15.994915@M,8.014199@K,10.008269@R'
      - id: prot_cleavage_semi
        default: 'no'
      - id: prot_taxon
        default: yeast
      - id: protein_fasta
        source: database
      - id: ref_cleavage_semi
        default: 'yes'
      - id: ref_max_valid_exp_value
        default: 0.1
      - id: ref_point_mutations
        default: 'no'
      - id: ref_pot_modif_mass
        default: 'no'
      - id: ref_pot_modif_motif
        default: '15.994915@M,8.014199@K,10.008269@R'
      - id: ref_unanticipated_cleavage
        default: 'no'
      - id: ref_use_pot_modif_for_full_ref
        default: 'no'
      - id: refine
        default: 'no'
      - id: sp_threads
        default: 2
    out:
      - id: output_XML_file
    run: steps/xtandem.cwl
    label: X!Tandem
    scatter:
      - input_spectra
    'sbg:x': 499.0771148614017
    'sbg:y': 485.6924798756744
  - id: TPP_Tandem2XML
    in:
      - id: input_file
        source: X_Tandem/output_XML_file
    out:
      - id: output_file
    run: steps/tandem2xml.cwl
    label: TPP Tandem2XML
    scatter:
      - input_file
    'sbg:x': 669.3846524678747
    'sbg:y': 456.4615669617288
  - id: TPP_InteractParser
    in:
      - id: input_file
        source: TPP_Tandem2XML/output_file
    out:
      - id: output_file
    run: steps/interactparser.cwl
    label: TPP InteractParser
    scatter:
      - input_file
    'sbg:x': 819.5385076449471
    'sbg:y': 414.6154104746307
  - id: TPP_PeptideProphet_1
    in:
      - id: accmass
        default: true
      - id: input_file
        source: TPP_InteractParser/output_file
    out:
      - id: output_file
    run: steps/peptide_prophet.cwl
    label: TPP PeptideProphet
    'sbg:x': 994.9231928678697
    'sbg:y': 333.6923657507607
  - id: TPP_PeptideProphet
    in:
      - id: accmass
        default: true
      - id: input_file
        source: TPP_SpectraST_Search/output_file
    out:
      - id: output_file
    run: steps/peptide_prophet.cwl
    label: TPP PeptideProphet
    'sbg:x': 991.9232723487281
    'sbg:y': 211.8461971085471
  - id: TPP_IProphet
    in:
      - id: input_files
        linkMerge: merge_flattened
        source:
          - TPP_PeptideProphet/output_file
          - TPP_PeptideProphet_1/output_file
    out:
      - id: output_file
    run: steps/iprophet.cwl
    label: TPP IProphet
    'sbg:x': 1254.9205322265625
    'sbg:y': 317.8594055175781
  - id: TPP_ASAPRatioPeptideParser
    in:
      - id: input_file
        source: TPP_IProphet/output_file
      - id: input_mzxml_files
        source: ReAdw4Mascot2/Output_mzXML_file
      - id: label_masses
        default: 'M147.035,K136.10916,R166.10941'
      - id: labeled_residues
        default: 'K,R'
      - id: range
        default: 0.05
    out:
      - id: output_file
    run: steps/asap_ratio_peptide_parser.cwl
    label: TPP ASAPRatioPeptideParser
    'sbg:x': 1467.6298828125
    'sbg:y': 243.85821533203125
  - id: TPP_RefreshParser
    in:
      - id: database
        source: database
      - id: input_file
        source: TPP_ASAPRatioPeptideParser/output_file
    out:
      - id: output_file
    run: steps/refresh_parser.cwl
    label: TPP RefreshParser
    'sbg:x': 1690.3078322579909
    'sbg:y': 370.00002966265777
  - id: TPP_ProteinProphet
    in:
      - id: input_files
        source: TPP_RefreshParser/output_file
        valueFrom: $([].concat(self))
    out:
      - id: html_file
      - id: output_prot_xml_file
      - id: png_file
    run: steps/protein_prophet.cwl
    label: TPP ProteinProphet
    'sbg:x': 1859.2309372552093
    'sbg:y': 302.0769607400061
  - id: TPP_ASAPRatioProteinRatioParser
    in:
      - id: input_file
        source: TPP_ProteinProphet/output_prot_xml_file
    out:
      - id: output_file
    run: steps/asap_ratio_protein_ratio_parser.cwl
    label: TPP ASAPRatioProteinRatioParser
    'sbg:x': 2023.5385826917804
    'sbg:y': 369.6154046975651
  - id: TPP_ASAPRatioPvalueParser
    in:
      - id: input_file
        source: TPP_ASAPRatioProteinRatioParser/output_file
    out:
      - id: output_file
    run: steps/asap_ratio_p_value_parser.cwl
    label: TPP ASAPRatioPvalueParser
    'sbg:x': 2198.461670508753
    'sbg:y': 294.00001617578374
requirements:
  - class: ScatterFeatureRequirement
  - class: StepInputExpressionRequirement
  - class: InlineJavascriptRequirement
  - class: MultipleInputFeatureRequirement
'sbg:license': GNU Lesser General Public License v2.1
'sbg:links':
  - id: 'http://tools.proteomecenter.org/wiki/index.php?title=TPP_Tutorial'
    label: Homepage
  - id: >-
      https://sourceforge.net/projects/sashimi/files/Trans-Proteomic%20Pipeline%20%28TPP%29/
    label: Source Code
  - id: 'http://tools.proteomecenter.org/wiki/index.php?title=TPP_Tutorial'
    label: Wiki
  - id: >-
      https://sourceforge.net/projects/sashimi/files/Trans-Proteomic%20Pipeline%20%28TPP%29/
    label: Download
  - id: 'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3017125/'
    label: Publication
'sbg:toolAuthor': >-
  ISB,  Insilicos LLC, the University of Washington, Hong Kong University of
  Science and Technology, and Fred Hutch Cancer Research Center
'sbg:toolkit': The Trans-Proteomic Pipeline
'sbg:toolkitVersion': 5.0.0

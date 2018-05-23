class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: x_tandem_2013_06_15_1_7
baseCommand: []
inputs:
  - id: input_spectra
    type: File
    label: Test spectra
    doc: Input spectra file
    'sbg:fileTypes': 'DTA, PKL, MGF, mzML, mzXML'
  - 'sbg:category': Input files
    id: list_path_default_parameters
    type: File
    label: 'List path, default parameters'
    doc: 'List path, default parameters.'
    'sbg:fileTypes': XML
  - 'sbg:category': Scoring
    id: maximum_missed_cleavage_sites
    type: int?
    label: Maximum missed cleavage sites
    doc: Maximum missed cleavage sites.
  - 'sbg:category': Residue
    id: modification_mass
    type: string?
    label: Modification mass
    doc: Modification mass.
  - 'sbg:category': Output
    'sbg:toolDefaultValue': 'no'
    id: out_histo
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: out_histo
    label: Output histograms
    doc: >-
      When this value is set to yes, the histograms containing the statistical
      information about an spectrum-to-sequence assignment are written to the
      output file. If it is set to no, then these histograms are not recorded.
  - 'sbg:category': Output
    id: out_histo_col_width
    type: int?
    label: Output histogram column width
    doc: >-
      This parameter sets the number of values in a GAML-type histogram that are
      listed on a single line of output. It can be used to limit the length of
      lines in the output file, although it has no effect on true XML parsers.
  - 'sbg:category': Output
    'sbg:toolDefaultValue': '0.01'
    id: out_max_valid_expect_value
    type: float?
    label: 'Output, maximum valid expectation value'
    doc: Highest value for recorded peptides.
  - 'sbg:category': Output
    'sbg:toolDefaultValue': 'no'
    id: out_one_seq_copy
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: out_one_seq_copy
    label: Output one sequence copy
    doc: >-
      Protein sequences are normally stored in the X! Tandem output file format,
      represented in BIOML. If multiple peptides from a single protein sequence
      are found, then that protein sequence is by default reported for each
      peptide. If this parameter is set to yes, then the full protein sequence
      is only recorded for the first peptide in a file corresponding to that
      protein. Subsequent peptides only have the protein's unique identifier
      (UID) recorded. This UID is assigned by X! Tandem, based on the ordinal
      position of the protein in a sequence file. For example, if a protein was
      the 123rd protein read from a file during a search, then that protein's
      UID would be "123".
  - 'sbg:category': Output
    'sbg:toolDefaultValue': 'no'
    id: out_proteins
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: out_proteins
    label: Output proteins
    doc: >-
      When this value is set to yes, the BIOML <protein> information associated
      with a peptide-to-spectrum match are recorded in the XML output file. If
      it is set to no, then the <protein> nodes are not recorded.
  - 'sbg:category': Output
    id: out_results
    type:
      - 'null'
      - type: enum
        symbols:
          - all
          - valid
          - stochastic
        name: out_results
    label: Output result
    doc: >-
      The value for this parameter determines which results are written to the
      output file at the end of a modelling session. The three possible values
      cover the most interesting use cases for X! TANDEM, from a bioinformatics
      perspective. The exact form of the reported results will depend on the
      values chosen for other output parameters.      all - When this value is
      set, results are reported for all of the spectra that were used in the
      modelling session. This value is not recommended for normal use, as most
      spectra in a large data set will not return useful results. Storing the
      large volume of purely stochastic matches that can results is a waste of
      resources, for most users.     valid - When this value is set, results
      that have an expectation value less than output, maximum valid expectation
      value are reported. This setting is of the most general use.    
      stochastic - When this value is set, results that have an expectation
      value greater than output, maximum valid expectation value are all
      reported. This is the compliment to the valid set, and it can be useful
      for debugging and bioinformatics purposes.
  - 'sbg:category': Output
    'sbg:toolDefaultValue': 'no'
    id: out_seq
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: out_seq
    label: Output sequences
    doc: >-
      When this value is set to yes, the protein sequences associated with a
      peptide-to-spectrum match are recorded in the XML output file. If it is
      set to no, then these sequences are not recorded.
  - 'sbg:category': Output
    'sbg:toolDefaultValue': protein
    id: out_sort_results_by
    type:
      - 'null'
      - type: enum
        symbols:
          - protein
          - spectrum
        name: out_sort_results_by
    label: Output sort results by
    doc: Controls how spectrum results are sorted.
  - 'sbg:category': Output
    'sbg:toolDefaultValue': 'no'
    id: out_spectra
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: out_spectra
    label: Output spectra
    doc: >-
      When this value is set to yes, the spectra used in the modelling session,
      are recorded in GAML format in the output XML file. If it is set to no,
      then these spectra are not recorded.
  - 'sbg:category': Spectrum
    id: parent_monoisotopic_mass_error_minus
    type: float?
    label: Parent monoisotopic mass error minus
    doc: Parent ion M+H mass tolerance lower window.
  - 'sbg:category': Spectrum
    id: parent_monoisotopic_mass_error_plus
    type: float?
    label: Parent monoisotopic mass error plus
    doc: Parent ion M+H mass tolerance upper window.
  - 'sbg:category': Spectrum
    id: parent_monoisotopic_mass_error_units
    type:
      - 'null'
      - type: enum
        symbols:
          - Daltons
          - ppm
        name: parent_monoisotopic_mass_error_units
    label: Parent monoisotopic mass error units
    doc: Parent ion M+H mass tolerance window units.
  - 'sbg:category': Spectrum
    id: parent_monoisotopic_mass_isotope_error
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: parent_monoisotopic_mass_isotope_error
    label: Parent monoisotopic mass isotope error
    doc: Anticipate carbon isotope parent ion assignment errors.
  - 'sbg:category': Residue
    id: potential_modification_mass
    type: string?
    label: Potential modification mass
    doc: Potential modification mass.
  - 'sbg:category': Protein
    'sbg:toolDefaultValue': '0.0'
    id: prot_c_term_res_modif_mass
    type: float?
    label: Protein C-terminal residue modification mass
    doc: >-
      This value represents any additional fixed modification mass added only to
      the C-terminal residue in an intact protein, in Daltons.
  - 'sbg:category': Protein
    'sbg:toolDefaultValue': '17.00305'
    id: prot_cleavage_c_term_mass_ch
    type: float?
    label: Protein cleavage C-terminal mass change
    doc: >-
      This value represents the mass added to the C-terminus of a peptide after
      undergoing peptide bond cleavage by a chemical or enzymatic reagent, in
      Daltons. The default value is the mass change associated with hydrolytic
      cleavage in normal water.
  - 'sbg:category': Protein
    'sbg:toolDefaultValue': '1.00794'
    id: prot_cleavage_n_term_mass_ch
    type: float?
    label: 'Protein, cleavage N-terminal mass change'
    doc: >-
      This value represents the mass added to the N-terminus of a peptide after
      undergoing peptide bond cleavage by a chemical or enzymatic reagent, in
      Daltons. The default value is the mass change associated with hydrolytic
      cleavage in normal water.
  - 'sbg:category': Protein
    'sbg:toolDefaultValue': 'no'
    id: prot_cleavage_semi
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: prot_cleavage_semi
    label: Protein cleavage semi
    doc: >-
      The value of this parameter is only used in the first round of
      identification: to apply this semi cleavage to refinement rounds, use the
      refine, cleavage semi parameter.
  - 'sbg:category': Protein
    id: prot_cleavage_site
    type: string?
    label: Protein cleavage site
    doc: >-
      Short peptides are generated from longer protein sequences by the use of
      either chemical or enzymatic cleavage. Both types of cleavage tend to have
      preferred sites of cleavage, based on the residues on either side of the
      peptide bond to be cleaved. Proteomics experiments frequently use enzymes
      with very strong sequence specificity, to limit the number of peptides
      generated and the assure that there are a reasonable number of peptides in
      the length range most useful for protein identification. This parameter is
      a formatted text string with three fields. The first and third fields are
      square - [] - or french - {} - brace pairs, containing single amino acid
      residue symbols. These two fields are separated by a vertical line, e.g.,
      [KR]|{P}.
  - 'sbg:category': Protein
    id: prot_modif_res_mass_file
    type: string?
    label: Protein modified residue mass file
    doc: >-
      X! Tandem uses default values for the mass of each peptide residue. These
      masses correspond to the monoisotopic mass of the corresponding amino
      acid, less the mass of water (maa - 18.01056470). In some cases, samples
      may be created inwhich one or more of the amino acids has been
      deliberately substituted with an amino acid with an isotopic label. If
      only a small number of residues have been substituted, the residue,
      modification mass command may be used to inform X! Tandem. However, if
      most (or all) of the residues have been modified, it is simpler to create
      a file containing this information and use the protein, modified residue
      mass file command.
  - 'sbg:category': Protein
    'sbg:toolDefaultValue': '0.0'
    id: prot_n_term_res_modif_mass
    type: float?
    label: Protein N-terminal residue modification mass
    doc: >-
      This value represents any additional fixed modification mass added only to
      the N-terminal residue in an intact protein, in Daltons.
  - 'sbg:category': Protein
    'sbg:toolDefaultValue': 'yes'
    id: prot_quick_acetyl
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: prot_quick_acetyl
    label: Protein quick acetyl
    doc: >-
      Most intracellular proteins in eukaryotes (and all prokaryote proteins)
      have the N-terminal methionine residue removed immediately following
      translation. In prokaryotes, the new N-terminal residue is left
      unmodified. In eukaryotes, the new N-terminal residue is often acetylated
      (H2C2O, +42 Da). If the N-terminal methionine is not removed in
      eukaryotes, the methionine itself can be acetylated.  When this parameter
      is yes, these common modifications are checked for the peptides generated
      from the protein's N-terminus, at all stages of analysis.
  - 'sbg:category': Protein
    'sbg:toolDefaultValue': 'yes'
    id: prot_quick_pyrolidone
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: prot_quick_pyrolidone
    label: Protein quick pyrolidone
    doc: >-
      Peptides that have N-terminal glutamine (Q) residues in solution will
      spontaneous form the cyclic pyrolidone derivative by the loss of NH3 (-17
      Da). A similar solution phase reaction can occur with peptides with
      N-terminal glutamic acid residues through the loss of H2O (-18 Da) or for
      N-terminal cysteine residues that have been chemically blocked using
      iodoacetimide, through the loss of NH3 (-17 Da). When this parameter is
      yes, these derivatives are checked, as well as the underivatized forms of
      the residues. Using this parameter is a much more efficient calculation
      than using the potential modifications "-17@[" or "-18@[".
  - 'sbg:category': Protein
    'sbg:toolDefaultValue': 'yes'
    id: prot_saps
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: prot_saps
    label: Protein saps
    doc: >-
      When this parameter is set to yes, a list of known potential single amino
      acid polymorphisms is checked for each peptide residue considered in the
      first round of modelling. The default lists are based on known coding
      non-synonymous single nucleotide polymorphisms derived from the SNP
      annotations in ENSEMBL: the amino acid consequence of a nsSNP is commonly
      referred to as a snAPs. The annotation file format is the same as the file
      format used to annotate mutations in GPM BIOML files.
  - 'sbg:category': Protein
    'sbg:toolDefaultValue': 'yes'
    id: prot_stp_bias
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: prot_stp_bias
    label: Protein stP bias
    doc: >-
      When this parameter is set to yes, models containing phosphorylated serine
      or threonine that have a pronounced peak (relative intensity > 20)
      corresponding to the neutral loss of phosphoric acid (H3PO4, -98 Da) are
      given additional scoring weight. The additional weight is significantly
      less than would be added for a sequence-specific ion, but it may be
      sufficient to distinguish between two solutions of the type shown above.
  - 'sbg:category': Protein
    id: prot_taxon
    type: string
    label: Protein taxon
    doc: >-
      The file pointed to by list path, taxonomy information contains a list of
      FASTA or FASTA.pro formatted sequence listing files associated with a key
      word (or words). The value entered for this parameter must be at least one
      of the key words documented in that file. The key words are case
      sensitive. Multiple keywords can be used, separated by commas.
  - id: protein_fasta
    type: File
    label: Protein Fasta Database
    doc: Example FASTA protein sequence list file
    'sbg:fileTypes': 'FASTA, FA, FASTA.PRO'
  - 'sbg:category': Refine
    'sbg:toolDefaultValue': 'no'
    id: ref_cleavage_semi
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: ref_cleavage_semi
    label: Refine cleavage semi
    doc: >-
      The value of this parameter is only used in the refinement rounds of
      identification: to apply this semi cleavage to first round, use the
      'Protein cleavage semi' parameter.
  - 'sbg:category': Refine
    'sbg:toolDefaultValue': '0.01'
    id: ref_max_valid_exp_value
    type: float?
    label: Refine maximum valid expectation value
    doc: >-
      When the refinement process begins, the expectation values for all of the
      peptides found in the first pass search are calculated. Any protein that
      contains at least one peptide with an expectation value lower than the
      value for this parameter is then included in the list of proteins that
      will be used during the refinement process.
  - 'sbg:category': Refine
    id: ref_modif_mass
    type: string?
    label: Refine modification mass
    doc: >-
      The value of this parameter is an ASCII string, of the format
      M1@X1,M2@X2,..., Mn@Xn  where Mi is a floating point number (modification
      mass in Daltons) and Xi is a single letter abbreviation for a type of
      amino acid residue.
  - 'sbg:category': Refine
    'sbg:toolDefaultValue': 'no'
    id: ref_point_mutations
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: ref_point_mutations
    label: Refine point mutations
    doc: >-
      The last step in the refinement process is to test the selected sequences
      for the possibility of a point mutation in each one of the peptides
      generated with the initial cleavage chemistry. When this parameter is set
      to yes, point mutations are checked. Otherwise, this step is skipped.
  - 'sbg:category': Refine
    id: ref_pot_modif_mass
    type: string?
    label: Refine potential modification mass
    doc: >-
      The value of this parameter is an ASCII string, of the format
      M1@X1,M2@X2,..., Mn@Xn  where Mi is a floating point number (potential
      modification mass in Daltons) and Xi is a single letter abbreviation for a
      type of amino acid residue.
  - 'sbg:category': Refine
    id: ref_pot_modif_motif
    type: string?
    label: Refine potential modification motif
    doc: >-
      This parameter is used to modify residues selected by the residues
      surrounding the site of modification. Many biologically relavent
      modifications are performed by enzymes, which are normally affected by the
      sequence surrounding a residue being modified. Finding sequence motifs is
      fairly time consuming, so it is best done in the refinement process. The
      value is a comma-separated list of sequence motifs, composed using a
      modified PROSITE notation format specified online.
  - 'sbg:category': Refine
    id: ref_pot_n_terminus_modif
    type: string?
    label: Refine potential N-terminus modifications
    doc: >-
      The format of this parameter is the same as the residue, potential
      modification mass parameter. When a valid string is present for this
      parameter, a search with cleavage at every residue is performed, and the
      listed potential N-terminal modifications are tested. This test is done on
      only the first 50 residues for each protein in the refinement list. If a
      more general N-terminal modification is desirable, then add a modification
      string with "[" as the residue to modify into the potential modification
      list. The value of this parameter is an ASCII string, of the format
      M1@[,M2@[,..., Mn@[  where Mi is a floating point number (potential
      modification mass in Daltons).
  - 'sbg:category': Refine
    'sbg:toolDefaultValue': 'yes'
    id: ref_saps
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: ref_saps
    label: Refine saps
    doc: >-
      When this parameter is set to yes, a list of known potential single amino
      acid polymorphisms is checked for each peptide residue considered in the
      first round of modelling. The default lists are based on known coding
      non-synonymous single nucleotide polymorphisms derived from the SNP
      annotations in ENSEMBL: the amino acid consequence of a nsSNP is commonly
      referred to as a snAPs. The annotation file format is the same as the file
      format used to annotate mutations in GPM BIOML files.
  - 'sbg:category': Refine
    'sbg:toolDefaultValue': not used
    id: ref_seq_path
    type: string?
    label: Refine sequence path
    doc: >-
      Just prior to executing the refinement steps of a search, a list of
      protein sequences to use for the refinement steps is created. When this
      parameter is a valid input file path, that list of proteins is altered by
      adding the sequences present in the input file. Repeated sequences are not
      included. The input file can either be an X! Tandem BIOML ouput file or a
      file generated by the use of the output, sequence path parameter.
  - 'sbg:category': Refine
    'sbg:toolDefaultValue': 'no'
    id: ref_spectrum_synth
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: ref_spectrum_synth
    label: Refine spectrum synthesis
    doc: >-
      When X! TANDEM scores a model peptide sequence with a spectrum, it can
      take into account the probablity that a particular bond will break
      preferentially, relative to other bonds.
  - 'sbg:category': Refine
    'sbg:toolDefaultValue': '20.0'
    id: ref_tic_percent
    type: float?
    label: Refine tic percent
    doc: >-
      When X! Tandem is executing a refinement job, the number of protein
      sequences to be tested is known. During the job, X! Tandem sends a dot "."
      character to the console (and log file, if desired) when the fraction of
      the job corresponding to the value of this parameter has been finished.
      For exmaple, if this parameter is set to 10, and 1000 protein sequences
      are being tested, then a character is sent to the console every time 1000
      x 10/100 = 100 sequences have been processed. The total number of
      characters (tics) would be 10.
  - 'sbg:category': Refine
    'sbg:toolDefaultValue': 'no'
    id: ref_unanticipated_cleavage
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: ref_unanticipated_cleavage
    label: Refine unanticipated cleavage
    doc: >-
      As the second step in the refinement process, the sequences selected for
      refinement are modelled using the cleavage conditions [X]|[X], with the
      number of missed cleavages set to 50. When the value of the parameter is
      yes, then this step is performed. Otherwise, this step is not carried out.
  - 'sbg:category': Refine
    'sbg:toolDefaultValue': 'yes'
    id: ref_use_annot
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: ref_use_annot
    label: Refine use annotations
    doc: >-
      It is known that different proteins have different post-translational
      modifications. In some cases, proteins may be highly modified by unusual
      modifications, such as the highly variable modification of histones or
      collagens. When the parameter is set to yes, an annotation file that
      contains the modifications known to be present in each protein will be
      added to the search, on a protein by protein basis. Any other
      modifications that you have specified will over-ride these annotations, if
      there is a conflict between the annotation and your specified
      modification.
  - 'sbg:category': Refine
    'sbg:toolDefaultValue': 'no'
    id: ref_use_pot_modif_for_full_ref
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: ref_use_pot_modif_for_full_ref
    label: Refine use potential modifications for full refinement
    doc: >-
      The first step in the refinement process is to model the selected
      sequences with the scoring, maximum missed cleavage parameter set to 5,
      the a list of list of potential modficiations defined by the refine,
      potential modification mass value. If this parameter is set to yes, then
      the new list of potential modifications are used in the subsequent steps
      of the refinement. If it is set to no, then the residue, potential
      modification mass value is used for the subsequent steps.
  - 'sbg:category': Refine
    'sbg:toolDefaultValue': 'no'
    id: refine
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: refine
    label: Refine
    doc: >-
      X! TANDEM uses a process called "refinement" to improve the speed and
      accuracy of peptide modelling. When the parameter value is yes, then the
      refinement process is used, otherwise X! TANDEM functions like other
      sequence modelling engines.
  - 'sbg:category': Residue
    id: res_potent_modif_motif
    type: string?
    label: 'Residue, potential modification motif'
    doc: >-
      This parameter is used to modify residues selected by the residues
      surrounding the site of modification. Many biologically relavent
      modifications are performed by enzymes, which are normally affected by the
      sequence surrounding a residue being modified. Finding sequence motifs is
      fairly time consuming, so it is best done in the refinement process. The
      value is a comma-separated list of sequence motifs, composed using a
      modified PROSITE notation format.
  - 'sbg:category': Scoring
    'sbg:toolDefaultValue': 'no'
    id: sc_a_ions
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: sc_a_ions
    label: Scoring a ions
    doc: >-
      If the value is yes, then peptide sequence a ions are used in the spectrum
      scoring algorithm.
  - 'sbg:category': Scoring
    'sbg:toolDefaultValue': 'no'
    id: sc_b_ions
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: sc_b_ions
    label: Scoring b ions
    doc: Allows the use of b-ions in scoring.
  - 'sbg:category': Scoring
    'sbg:toolDefaultValue': 'no'
    id: sc_c_ions
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: sc_c_ions
    label: Scoring c ions
    doc: Allows the use of c-ions in scoring.
  - 'sbg:category': Scoring
    'sbg:toolDefaultValue': 'no'
    id: sc_cyclic_perm
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: sc_cyclic_perm
    label: Scoring cyclic permutation
    doc: Compensate for very small sequence list files.
  - 'sbg:category': Scoring
    'sbg:toolDefaultValue': 'no'
    id: sc_include_reverse
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
          - only
        name: sc_include_reverse
    label: Scoring include reverse
    doc: Automatically perform "reversed database" search.
  - 'sbg:category': Scoring
    'sbg:toolDefaultValue': '4'
    id: sc_min_ion_count
    type: int?
    label: Scoring minimum ion count
    doc: >-
      Practically, there is some minimum number of assignable sequence-specific
      ions in a spectrum that is necessary to consider the spectrum as a match
      to a peptide sequence. The value of this parameter sets the minumum number
      of total ions that must be assigned for a score to be calculated and
      stored in the scoring histogram structure used by TANDEM to track the
      statistical nature of the stochastic distribution.
  - 'sbg:category': Scoring
    'sbg:toolDefaultValue': 'no'
    id: sc_x_ions
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: sc_x_ions
    label: Scoring x ions
    doc: >-
      If the value is yes, then peptide sequence x ions are used in the spectrum
      scoring algorithm.
  - 'sbg:category': Scoring
    'sbg:toolDefaultValue': 'yes'
    id: sc_y_ions
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: sc_y_ions
    label: Scoring y ions
    doc: >-
      If the value is yes, then peptide sequence y ions are used in the spectrum
      scoring algorithm.
  - 'sbg:category': Scoring
    'sbg:toolDefaultValue': 'no'
    id: sc_z_ions
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: sc_z_ions
    label: Scoring z ions
    doc: >-
      If the value is yes, then peptide sequence z ions are used in the spectrum
      scoring algorithm.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': '0'
    id: sp_contrast_angle
    type: float?
    label: Spectrum contrast angle
    doc: >-
      When spectrum, use contrast angle is set to yes, this parameter is used to
      set the stringency of filtering used to remove redundant peptide spectra
      from a list of spectra.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': '100.0'
    id: sp_dyn_range
    type: float?
    label: Spectrum dynamic range
    doc: >-
      This parameter is used to normalize the intensity values of fragment ions,
      from spectrum to spectrum. For example, if Drange = 100.0, then the
      intensity of the most intense peak in a spectrum is set to 100, and all of
      the other intensities are linearly scaled to that intensity. Any peak with
      a scaled intensity of less than 1 is rejected as being outside of the
      dynamic range. Therefore, in addition to normalizing the spectra, it sets
      an effective relative threshold for peaks.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': '0.0'
    id: sp_frag_mass_error
    type: float?
    label: Spectrum fragment mass error
    doc: >-
      The measurement of fragment ion mass values may result in either
      monoisotopic masses, or chemical average masses. When spectrum, fragment
      mass type is set to average, this value is used, otherwise the value
      supplied for spectrum, fragment monoisotopic mass error is used.
  - 'sbg:category': Spectrum
    id: sp_frag_mass_error_units
    type:
      - 'null'
      - type: enum
        symbols:
          - Daltons
          - ppm
        name: sp_frag_mass_error_units
    label: Spectrum fragment mass error units
    doc: >-
      The value for this parameter alters the interpretation of the value for
      the parameter named spectrum, fragment mass error.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': monoisotopic
    id: sp_frag_mass_type
    type:
      - 'null'
      - type: enum
        symbols:
          - average
          - monoisotopic
        name: sp_frag_mass_type
    label: Spectrum fragment mass type
    doc: Use chemical average or monoisotopic mass for fragment ions.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': '0.0'
    id: sp_frag_monois_mass_error
    type: float?
    label: Spectrum fragment monoisotopic mass error
    doc: Fragment ion mass tolerance (monoisotopic mass).
  - 'sbg:category': Spectrum
    id: sp_frag_monois_mass_error_units
    type:
      - 'null'
      - type: enum
        symbols:
          - Daltons
          - ppm
        name: sp_frag_monois_mass_error_units
    label: Spectrum fragment monoisotopic mass error units
    doc: Units for fragment ion mass tolerance (monoisotopic mass).
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': '4'
    id: sp_max_parent_ch
    type: int?
    label: Spectrum maximum parent charge
    doc: >-
      This value is used to limit the highest charge state allowed for a parent
      ion. If a parent ion charge is greater than this value, the associated
      spectrum is discarded without further processing.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': '200'
    id: sp_min_frag_mz
    type: float?
    label: Spectrum minimum fragment mz
    doc: Sets minimum fragment m/z to be considered.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': '850'
    id: sp_min_parent_m_h
    type: float?
    label: Spectrum minimum parent m+h
    doc: >-
      This parameter is used to supress the analysis of spectra that were
      generated by low mass parent ions. Depending on the instrumentation and
      excitation energy used to generate fragment ions, there will be some low
      mass cutoff value, below which there is very little chance of generating
      an interpretable MS/MS spectrum. In many experimental conditions, there
      will also be noise peaks in the parent ion spectrum, generated by the ion
      source and chemical noise. The value selected for Mmin is used to reject
      these spectra.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': '5'
    id: sp_min_peaks
    type: int?
    label: Spectrum minimum peaks
    doc: >-
      The MS/MS spectra used in peptide sequence searches are composed of a
      limited number of mass-to-charge ratio:intensity pairs. Many common types
      of mass spectrometer data systems will generate a mass spectrum during a
      chromatographic run, even if the parent ion does not fragment. The value
      of this parameter is used to screen out spectra that contain too few
      fragment ions to be usefully interpreted.
  - 'sbg:category': Spectrum
    id: sp_neutral_loss_mass
    type: float?
    label: Spectrum neutral loss mass
    doc: Sets the centre of the window for ignoring neutral molecule losses.
  - 'sbg:category': Spectrum
    id: sp_neutral_loss_windows
    type: float?
    label: Spectrum neutral loss window
    doc: Sets the width of the window for ignoring neutral molecule losses.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': '1000'
    id: sp_seq_batch_size
    type: int?
    label: Spectrum sequence batch size
    doc: Alter how protein sequences are retrieved from a FASTA file.
  - 'sbg:category': Spectrum
    id: sp_threads
    type: int?
    label: Spectrum threads
    doc: Worker threads to be used for calculation.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': '50'
    id: sp_total_peaks
    type: int?
    label: Spectrum total peaks
    doc: Maximum number of peaks to be used from a spectrum.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': 'no'
    id: sp_use_contrast_angle
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: sp_use_contrast_angle
    label: Spectrum use contrast angle
    doc: >-
      When this value is set to yes, contrast angle filtering is used to remove
      similar mass spectra from a spectrum list.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': 'no'
    id: sp_use_dyn_parent_ion_selection
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: sp_use_dyn_parent_ion_selection
    label: Spectrum use dynamic parent ion selection
    doc: >-
      When this value is set to yes, the parent ion mass tolerance is reset
      automatically.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': '0.01'
    id: sp_use_dyn_parent_ion_selection_ratio
    type: float?
    label: Spectrum dynamic parent ion selection ratio
    doc: >-
      When spectrum, use dynamic parent ion selection is set to yes, this
      parameter is used to set the acceptable background level used in
      deterimining the parent ion mass tolerance.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': 'no'
    id: sp_use_neutral_loss_window
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: sp_use_neutral_loss_window
    label: Spectrum use neutral loss window
    doc: >-
      Some types of post-translational or chemical modifications can produce
      intense peaks in a spectrum because of a favoured fragmentation mechanism
      produced by the loss of a stable neutral molecule. These "neutral loss"
      peaks can be removed from a spectrum by setting appropriate values for the
      spectrum, neutral loss window and spectrum, neutral loss mass parameters.
  - 'sbg:category': Spectrum
    'sbg:toolDefaultValue': 'no'
    id: sp_use_noise_supress
    type:
      - 'null'
      - type: enum
        symbols:
          - 'yes'
          - 'no'
        name: sp_use_noise_supress
    label: Spectrum use noise suppression
    doc: Controls the use of noise suppression routines.
outputs:
  - id: output_XML_file
    doc: Output XML file
    label: Output XML File
    type: File?
    outputBinding:
      loadContents: true
      glob: '*.xtan.xml'
      outputEval: |-
        ${
            return inheritMetadata(self, inputs.input_spectra)

        }
    'sbg:fileTypes': XML
doc: >-
  **X!Tandem** is a tool that can match tandem mass spectra with peptide
  sequences.


  Unlike some older search engines, the X! series search engines calculate
  statistical confidence (expectation values) for all of the individual
  spectrum-to-sequence assignments. They also reassemble all of the peptide
  assignments in a data-set onto the known protein sequences and assign the
  statistical confidence that this assembly and alignment are non-random. As a
  result, separate assembly and statistical analysis software tools, e.g.
  PeptideProphet and ProteinProphet, do not need to be used.


  ###Required Inputs


  1. input_spectra: mass spectrometry data file in DTA, PKL, MGF, or MZML format

  2. protein_fasta: example FASTA protein sequence file 

  3. list\_path\_default\_parameters: file that contains a list of default
  parameters


  ###Outputs


  1. output\_XML\_file: file in tandem format that contains matched
  spectra-sequence pairs


  ###Common Issues and Important Notes


  There are no known common issues.
label: X!Tandem
arguments:
  - position: 0
    shellQuote: false
    valueFrom: /root/tandem
  - position: 1
    shellQuote: false
    valueFrom: input.xml
requirements:
  - class: ShellCommandRequirement
  - class: ResourceRequirement
    ramMin: 2000
    coresMin: 2
  - class: DockerRequirement
    dockerPull: 'images.sbgenomics.com/vladimir_obucina/tpp:5.0.0'
  - class: InitialWorkDirRequirement
    listing:
      - entryname: default_input.xml
        entry: "<?xml version=\"1.0\"?>\n<?xml-stylesheet type=\"text/xsl\" href=\"tandem-input-style.xsl\"?>\n<bioml>\n<note>list path parameters</note>\n\t<note type=\"input\" label=\"list path, default parameters\">default_input.xml</note>\n\t\t<note>This value is ignored when it is present in the default parameter\n\t\tlist path.</note>\n\t<note type=\"input\" label=\"list path, taxonomy information\">taxonomy.xml</note>\n\n<note>spectrum parameters</note>\n\t<note type=\"input\" label=\"spectrum, fragment monoisotopic mass error\">0.4</note>\n\t<note type=\"input\" label=\"spectrum, parent monoisotopic mass error plus\">100</note>\n\t<note type=\"input\" label=\"spectrum, parent monoisotopic mass error minus\">100</note>\n\t<note type=\"input\" label=\"spectrum, parent monoisotopic mass isotope error\">yes</note>\n\t<note type=\"input\" label=\"spectrum, fragment monoisotopic mass error units\">Daltons</note>\n\t<note>The value for this parameter may be 'Daltons' or 'ppm': all other values are ignored</note>\n\t<note type=\"input\" label=\"spectrum, parent monoisotopic mass error units\">ppm</note>\n\t\t<note>The value for this parameter may be 'Daltons' or 'ppm': all other values are ignored</note>\n\t<note type=\"input\" label=\"spectrum, fragment mass type\">monoisotopic</note>\n\t\t<note>values are monoisotopic|average </note>\n\n<note>spectrum conditioning parameters</note>\n\t<note type=\"input\" label=\"spectrum, dynamic range\">100.0</note>\n\t\t<note>The peaks read in are normalized so that the most intense peak\n\t\tis set to the dynamic range value. All peaks with values of less that\n\t\t1, using this normalization, are not used. This normalization has the\n\t\toverall effect of setting a threshold value for peak intensities.</note>\n\t<note type=\"input\" label=\"spectrum, total peaks\">50</note> \n\t\t<note>If this value is 0, it is ignored. If it is greater than zero (lets say 50),\n\t\tthen the number of peaks in the spectrum with be limited to the 50 most intense\n\t\tpeaks in the spectrum. X! tandem does not do any peak finding: it only\n\t\tlimits the peaks used by this parameter, and the dynamic range parameter.</note>\n\t<note type=\"input\" label=\"spectrum, maximum parent charge\">4</note>\n\t<note type=\"input\" label=\"spectrum, use noise suppression\">yes</note>\n\t<note type=\"input\" label=\"spectrum, minimum parent m+h\">500.0</note>\n\t<note type=\"input\" label=\"spectrum, minimum fragment mz\">150.0</note>\n\t<note type=\"input\" label=\"spectrum, minimum peaks\">15</note> \n\t<note type=\"input\" label=\"spectrum, threads\">1</note>\n\t<note type=\"input\" label=\"spectrum, sequence batch size\">1000</note>\n\t\n<note>residue modification parameters</note>\n\t<note type=\"input\" label=\"residue, modification mass\">57.022@C</note>\n\t\t<note>The format of this parameter is m@X, where m is the modfication\n\t\tmass in Daltons and X is the appropriate residue to modify. Lists of\n\t\tmodifications are separated by commas. For example, to modify M and C\n\t\twith the addition of 16.0 Daltons, the parameter line would be\n\t\t+16.0@M,+16.0@C\n\t\tPositive and negative values are allowed.\n\t\t</note>\n\t<note type=\"input\" label=\"residue, potential modification mass\"></note>\n\t\t<note>The format of this parameter is the same as the format\n\t\tfor residue, modification mass (see above).</note>\n\t<note type=\"input\" label=\"residue, potential modification motif\"></note>\n\t\t<note>The format of this parameter is similar to residue, modification mass,\n\t\twith the addition of a modified PROSITE notation sequence motif specification.\n\t\tFor example, a value of 80@[ST!]PX[KR] indicates a modification\n\t\tof either S or T when followed by P, and residue and the a K or an R.\n\t\tA value of 204@N!{P}[ST]{P} indicates a modification of N by 204, if it\n\t\tis NOT followed by a P, then either an S or a T, NOT followed by a P.\n\t\tPositive and negative values are allowed.\n\t\t</note>\n\n<note>protein parameters</note>\n\t<note type=\"input\" label=\"protein, taxon\">other mammals</note>\n\t\t<note>This value is interpreted using the information in taxonomy.xml.</note>\n\t<note type=\"input\" label=\"protein, cleavage site\">[RK]|{P}</note>\n\t\t<note>this setting corresponds to the enzyme trypsin. The first characters\n\t\tin brackets represent residues N-terminal to the bond - the '|' pipe -\n\t\tand the second set of characters represent residues C-terminal to the\n\t\tbond. The characters must be in square brackets (denoting that only\n\t\tthese residues are allowed for a cleavage) or french brackets (denoting\n\t\tthat these residues cannot be in that position). Use UPPERCASE characters.\n\t\tTo denote cleavage at any residue, use [X]|[X] and reset the \n\t\tscoring, maximum missed cleavage site parameter (see below) to something like 50.\n\t\t</note>\n\t<note type=\"input\" label=\"protein, modified residue mass file\"></note>\n\t<note type=\"input\" label=\"protein, cleavage C-terminal mass change\">+17.002735</note>\n\t<note type=\"input\" label=\"protein, cleavage N-terminal mass change\">+1.007825</note>\n\t<note type=\"input\" label=\"protein, N-terminal residue modification mass\">0.0</note>\n\t<note type=\"input\" label=\"protein, C-terminal residue modification mass\">0.0</note>\n\t<note type=\"input\" label=\"protein, homolog management\">no</note>\n\t\t<note>if yes, an upper limit is set on the number of homologues kept for a particular spectrum</note>\n\n<note>model refinement parameters</note>\n\t<note type=\"input\" label=\"refine\">yes</note>\n\t<note type=\"input\" label=\"refine, modification mass\"></note>\n\t<note type=\"input\" label=\"refine, sequence path\"></note>\n\t<note type=\"input\" label=\"refine, tic percent\">20</note>\n\t<note type=\"input\" label=\"refine, spectrum synthesis\">yes</note>\n\t<note type=\"input\" label=\"refine, maximum valid expectation value\">0.1</note>\n\t<note type=\"input\" label=\"refine, potential N-terminus modifications\">+42.010565@[</note>\n\t<note type=\"input\" label=\"refine, potential C-terminus modifications\"></note>\n\t<note type=\"input\" label=\"refine, unanticipated cleavage\">yes</note>\n\t<note type=\"input\" label=\"refine, potential modification mass\"></note>\n\t<note type=\"input\" label=\"refine, point mutations\">no</note>\n\t<note type=\"input\" label=\"refine, use potential modifications for full refinement\">no</note>\n\t<note type=\"input\" label=\"refine, point mutations\">no</note>\n\t<note type=\"input\" label=\"refine, potential modification motif\"></note>\n\t<note>The format of this parameter is similar to residue, modification mass,\n\t\twith the addition of a modified PROSITE notation sequence motif specification.\n\t\tFor example, a value of 80@[ST!]PX[KR] indicates a modification\n\t\tof either S or T when followed by P, and residue and the a K or an R.\n\t\tA value of 204@N!{P}[ST]{P} indicates a modification of N by 204, if it\n\t\tis NOT followed by a P, then either an S or a T, NOT followed by a P.\n\t\tPositive and negative values are allowed.\n\t\t</note>\n\n<note>scoring parameters</note>\n\t<note type=\"input\" label=\"scoring, minimum ion count\">4</note>\n\t<note type=\"input\" label=\"scoring, maximum missed cleavage sites\">1</note>\n\t<note type=\"input\" label=\"scoring, x ions\">no</note>\n\t<note type=\"input\" label=\"scoring, y ions\">yes</note>\n\t<note type=\"input\" label=\"scoring, z ions\">no</note>\n\t<note type=\"input\" label=\"scoring, a ions\">no</note>\n\t<note type=\"input\" label=\"scoring, b ions\">yes</note>\n\t<note type=\"input\" label=\"scoring, c ions\">no</note>\n\t<note type=\"input\" label=\"scoring, cyclic permutation\">no</note>\n\t\t<note>if yes, cyclic peptide sequence permutation is used to pad the scoring histograms</note>\n\t<note type=\"input\" label=\"scoring, include reverse\">no</note>\n\t\t<note>if yes, then reversed sequences are searched at the same time as forward sequences</note>\n\t<note type=\"input\" label=\"scoring, cyclic permutation\">no</note>\n\t<note type=\"input\" label=\"scoring, include reverse\">no</note>\n\n<note>output parameters</note>\n\t<note type=\"input\" label=\"output, log path\"></note>\n\t<note type=\"input\" label=\"output, message\">testing 1 2 3</note>\n\t<note type=\"input\" label=\"output, one sequence copy\">no</note>\n\t<note type=\"input\" label=\"output, sequence path\"></note>\n\t<note type=\"input\" label=\"output, path\">output.xml</note>\n\t<note type=\"input\" label=\"output, sort results by\">protein</note>\n\t\t<note>values = protein|spectrum (spectrum is the default)</note>\n\t<note type=\"input\" label=\"output, path hashing\">yes</note>\n\t\t<note>values = yes|no</note>\n\t<note type=\"input\" label=\"output, xsl path\">tandem-style.xsl</note>\n\t<note type=\"input\" label=\"output, parameters\">yes</note>\n\t\t<note>values = yes|no</note>\n\t<note type=\"input\" label=\"output, performance\">yes</note>\n\t\t<note>values = yes|no</note>\n\t<note type=\"input\" label=\"output, spectra\">yes</note>\n\t\t<note>values = yes|no</note>\n\t<note type=\"input\" label=\"output, histograms\">yes</note>\n\t\t<note>values = yes|no</note>\n\t<note type=\"input\" label=\"output, proteins\">yes</note>\n\t\t<note>values = yes|no</note>\n\t<note type=\"input\" label=\"output, sequences\">yes</note>\n\t\t<note>values = yes|no</note>\n\t<note type=\"input\" label=\"output, one sequence copy\">no</note>\n\t\t<note>values = yes|no, set to yes to produce only one copy of each protein sequence in the output xml</note>\n\t<note type=\"input\" label=\"output, results\">valid</note>\n\t\t<note>values = all|valid|stochastic</note>\n\t<note type=\"input\" label=\"output, maximum valid expectation value\">0.1</note>\n\t\t<note>value is used in the valid|stochastic setting of output, results</note>\n\t<note type=\"input\" label=\"output, histogram column width\">30</note>\n\t\t<note>values any integer greater than 0. Setting this to '1' makes cutting and pasting histograms\n\t\tinto spread sheet programs easier.</note>\n<note type=\"description\">ADDITIONAL EXPLANATIONS</note>\n\t<note type=\"description\">Each one of the parameters for X! tandem is entered as a labeled note\n\t\t\tnode. In the current version of X!, keep those note nodes\n\t\t\ton a single line.\n\t</note>\n\t<note type=\"description\">The presence of the type 'input' is necessary if a note is to be considered\n\t\t\tan input parameter.\n\t</note>\n\t<note type=\"description\">Any of the parameters that are paths to files may require alteration for a \n\t\t\tparticular installation. Full path names usually cause the least trouble,\n\t\t\tbut there is no reason not to use relative path names, if that is the\n\t\t\tmost convenient.\n\t</note>\n\t<note type=\"description\">Any parameter values set in the 'list path, default parameters' file are\n\t\t\treset by entries in the normal input file, if they are present. Otherwise,\n\t\t\tthe default set is used.\n\t</note>\n\t<note type=\"description\">The 'list path, taxonomy information' file must exist.\n\t\t</note>\n\t<note type=\"description\">The directory containing the 'output, path' file must exist: it will not be created.\n\t\t</note>\n\t<note type=\"description\">The 'output, xsl path' is optional: it is only of use if a good XSLT style sheet exists.\n\t\t</note>\n\n</bioml>"
      - entryname: tandem-input-style.xsl
        entry: "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n<xsl:stylesheet version=\"1.0\"\n                xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" \n                xmlns:GAML=\"http://www.bioml.com/gaml/\" >\n<!--\nX! tandem default style sheet\nCopyright (C) 2003 Ronald C. Beavis\nAll Rights Reserved\n     This source code is distributed under the terms of the\n     Artistic License. \n-->\n\n<xsl:template match=\"/\">\n  <html>\n    <head>\n      <title><xsl:value-of select=\"/bioml/@label\" /></title>\n      <link rel=\"stylesheet\" href=\"http://v.thegpm.org/tandem/tandem-style.css\" />\n    </head>\n\n    <body bgcolor=\"#FFFFFF\">\n\t<TABLE CELLSPACING=\"3\" CELLPADDING=\"3\">\n\t<TR>\n\t<TD WIDTH=\"500\" VALIGN=\"TOP\" ALIGN=\"LEFT\" class=\"top_note\">X! tandem <xsl:value-of select=\"/bioml/@label\" /> method</TD>\n\t</TR>\n\t</TABLE>\n<table border=\"0\" cellspacing=\"2\" cellpadding=\"2\">\n\t\t<xsl:apply-templates select=\"/bioml/note\" />\n</table>\n    </body>\n  </html>\n</xsl:template>\n\n<xsl:template match=\"note\">\n\t<xsl:if test=\"contains(@type,'input')\">\n\t<xsl:variable name=\"str_label\" select=\"@label\" />\n\t<xsl:variable name=\"str_value\" select=\"text()\" />\n\t<TR>\n\t\t<TD WIDTH=\"200\" VALIGN=\"TOP\" ALIGN=\"RIGHT\"><I><xsl:value-of select=\"@label\" /></I></TD>\n\t\t<TD WIDTH=\"350\" VALIGN=\"TOP\" ALIGN=\"LEFT\"><B><xsl:value-of select=\"text()\" /></B></TD>\n\t</TR>\n\t</xsl:if>\n\t<xsl:if test=\"contains(@type,'description') \">\n\t<TR>\n\t\t<TD WIDTH=\"550\" VALIGN=\"TOP\" COLSPAN=\"2\" ALIGN=\"LEFT\"><xsl:value-of select=\"text()\" /></TD>\n\t</TR>\n\t</xsl:if>\n\t<xsl:if test=\"contains(@type,'heading') \">\n\t<TR>\n\t<TR>\n\t\t<TD WIDTH=\"200\" VALIGN=\"TOP\" ALIGN=\"CENTER\"><B><xsl:value-of select=\"text()\" /></B></TD>\n\t\t<TD WIDTH=\"350\" VALIGN=\"TOP\" ALIGN=\"LEFT\"></TD>\n\t</TR>\n\t</TR>\n\t</xsl:if>\n</xsl:template>\n\n\n\n</xsl:stylesheet>"
      - entryname: tandem-style.css
        entry: ".c {\n\tcursor:pointer\n} \n\n.b {\n\tcolor:red;\n\tfont-family: Verdana,Arial,Helvetica,sans-serif; \n\tfont-weight:bold;\n\tFont-size: 8pt;\n\ttext-decoration:none\n} \n\n.e{\n\tmargin-left:1em;\n\ttext-indent:-1em;\n\tmargin-right:1em;\n\tmargin-bottom:3pt\n} \n\n.k{\n\tmargin-left:+3em;\n\ttext-indent:0em;\n\tmargin-right:1em;\n} \n\n.fm{\n\tfont-family:Courier New,Courier,monospace;\n\tfont-size:11pt;\n\tfont-style:normal;\n\tcolor:white;\n\tfont-variant:normal;\n\ttext-decoration:underline;\n\tfont-weight:bold;\n\tcursor:pointer;\n\tbackground-color:red;\n}\n\n.f{\n\tfont-family:Courier New,Courier,monospace;\n\tfont-size:11pt;\n\tfont-style:normal;\n\tcolor:red;\n\tfont-variant:normal;\n\ttext-decoration:none;\n\tfont-weight:bold;\n\tcursor:pointer;\n\tbackground-color:white;\n}\n\n.f1{\n\tfont-family:Courier New,Courier,monospace;\n\tfont-size:11pt;\n\tfont-style:normal;\n\tcolor:red;\n}\n\n.f2{\n\tfont-family:Courier New,Courier,monospace;\n\tfont-size:11pt;\n\tfont-style:normal;\n\tcolor:black;\n}\n\n.db{\n\ttext-indent:0px;\n\tmargin-left:1em;\n\tmargin-top:0px;\n\tmargin-bottom:0px;\n\tpadding-left:.3em;\n\tborder-left:1px solid #CCCCCC;\n\tfont-family:Courier New,Courier,monospace;\n} \n\n.di{\n\tfont-family:Courier New,Courier,monospace;\n} \n\n.cb{\n\ttext-indent:0px;\n\tmargin-left:1em;\n\tmargin-top:0px;\n\tmargin-bottom:0px;\n\tpadding-left:.3em;\n\tfont-family:Courier New,Courier,monospace;\n\tcolor:#888888\n} \n\n.ci{\n\tfont-family:Courier New,Courier,monospace;\n\tcolor:#888888\n} \n\nPRE {\n\tmargin:0px;\n\tdisplay:inline\n}\n\n.aa_h {\n\tcolor:black;\n\tfont-weight: normal;\n\tfont-family: Courier New,Courier,monospace;\n\tfont-size: 10pt;\n\tbackground-color:#99AAFF;\n}\n\n.aa_s {\n\tcolor:black;\n\tfont-weight: normal;\n\tfont-family: Courier New,Courier,monospace;\n\tfont-size: 8pt;\n}\n\n.residues {\n\tcolor: black; \n\ttext-decoration: none;\n\tfont-family: Courier New,Courier,monospace;\n\tfont-size: 10pt;\n}\n\n.top_note {\n\tcolor: black; \n\ttext-decoration: none;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 10pt;\n}\n\n.top_highlight {\n\tcolor: black; \n\tfont-weight: bold;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 10pt;}\n\n.greek {\n\tcolor: black; \n\ttext-decoration: none;\n\tfont-family: Symbol,sans-serif;\n\tfont-size: 10pt;\n}\n\n.greek_b {\n\tcolor: red; \n\tfont-weight: bold;\n\ttext-decoration: none;\n\tfont-family: Symbol,sans-serif;\n\tfont-size: 12pt;\n}\n\n.top_label {\n\tcolor: blue; \n\tfont-weight: normal;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 10pt;\n}\n\n.peptide_label {\n\tcolor: black; \n\tfont-weight: normal;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 10pt;\n}\ntd {\n\tcolor: black; \n\tfont-weight: normal;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\np {\n\tcolor: black; \n\tfont-weight: normal;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\nth {\n\tcolor: black; \n\tfont-weight: bold;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\nbig {\n\tcolor: black; \n\tfont-weight: bold;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\nh3 {\n\tcolor: black; \n\tfont-weight: bold;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 10pt;\n}\n\n.mod {\n\tcolor: white;\n\tbackground-color: blue; \n\tfont-weight: normal;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\n.mut {\n\tcolor: white;\n\tbackground-color: red; \n\tfont-weight: normal;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\n.y0 {\t\n\tcolor: red; \n\tfont-weight: bold;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\n.y17 {\n\tcolor: #FF9933; \n\tfont-weight: bold;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\n.b0 {\n\tcolor: blue; \n\tfont-weight: bold;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\n.b17 {\n\tcolor: green; \n\tfont-weight: bold;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\n.small_label {\n\tcolor: black; \n\tfont-weight: normal;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\n.small_link {\n\tcolor: blue; \n\tcursor: pointer;\n\tfont-weight: normal;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\n.small_value {\n\tcolor: blue; \n\tfont-weight: normal;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\n.go_button {\n\tcolor: white; \n\tcursor: pointer;\n\tfont-weight: normal;\n\tfont-style: normal;\n\tfont-family: Trebuchet MS, Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 12pt;\n\twidth: 120px;\n\tbackground-color:#ff9933;\n\tborder-color: #ffaa44;\n\tborder-width: 2px;\n\tborder-style: ridge;\n\theight: 30px;\n}\n\na {\n\tcolor: blue; \n\tcursor: pointer;\n\tfont-weight: normal;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\ttext-decoration: none;\n\tfont-size: 8pt;\n}\n\na:hover {\n\tcolor: blue; \n\tcursor: pointer;\n\tfont-weight: normal;\n\tfont-style: normal;\n\ttext-decoration: underline;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\na:visited {\n\tcolor: blue; \n\tcursor: pointer;\n\tfont-weight: normal;\n\tfont-style: italic;\n\tfont-variant: small-caps;\n\ttext-decoration: underline;\n\tfont-family: Verdana, Arial, Helvetica,sans-serif;\n\tfont-size: 8pt;\n}\n\n.button {\n\tcursor: pointer;\n\tborder: #FFFFFF thin solid; \n\tborder-width: 1px;  \n\tfont-weight: bold; \n\tfont-size: 10px; \n\tcolor: white; \n\tline-height: 16px; \n\tpadding-top: 2px; \n\tpadding-right: 2px; \n\tpadding-left: 2px; \n\tpadding-bottom: 2px;  \n\tfont-family: Verdana,Arial,Helvetica,sans-serif; \n\ttext-decoration: none;\n\tbackground-color: black;\n}\n\n.button:hover {\n\tcursor: pointer;\n\tborder: black thin solid; \n\tborder-width: 1px;  \n\tfont-weight: bold; \n\tfont-size: 10px; \n\tcolor: Blue; \n\tline-height: 16px; \n\tpadding-top: 2px; \n\tpadding-right: 2px; \n\tpadding-left: 2px; \n\tpadding-bottom: 2px;  \n\tfont-family: Verdana,Arial,Helvetica,sans-serif; \n\ttext-decoration: none;\n\tbackground-color: silver;\n}\n\n.ensembl {\n\tcolor:#5A85D6;\n\tfont-weight: bold;\n\ttext-decoration:none;\n\tfont-family: Verdana,Arial,Helvetica,sans-serif;\n\tfont-size: 10pt;\n\tbackground-color:#ffdf27;\n}"
      - entryname: tandem-style.xsl
        entry: "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n<xsl:stylesheet version=\"1.0\"\n                xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" \n                xmlns:GAML=\"http://www.bioml.com/gaml/\" >\n<!--\nX! tandem default style sheet\nCopyright (C) 2003-2004 Ronald C. Beavis\nVersion 2004.03.01\nAll Rights Reserved\n     This source code is distributed under the terms of the\n     Artistic License. \n-->\n<xsl:template match=\"/\">\n  <html>\n    <head>\n      <title>thegpm site 000 <xsl:value-of select=\"/bioml/@label\" /></title>\n      <link rel=\"stylesheet\" href=\"/tandem/tandem-style.css\" />\n <SCRIPT lanuage=\"JavaScript\">\n \nfunction changeState(id)\n{\n\tvar block = document.getElementById(id);\n\tif(block.style.display == 'none')\t{\n\t\tblock.style.display = 'block';\n\t}\n\telse\t{\n\t\tblock.style.display = 'none';\n\t}\n}\n  </SCRIPT>\n    </head>\n\n    <body bgcolor=\"#FFFFFF\">\n\t<TABLE bgcolor=\"#d0d0d0\" CELLSPACING=\"2\" CELLPADDING=\"2\">\n\t<TR>\n\t<TD WIDTH=\"700\" VALIGN=\"TOP\" ALIGN=\"LEFT\" class=\"top_note\">X! tandem results</TD>\n\t</TR>\n\t<TR>\n\t<TD WIDTH=\"700\" VALIGN=\"TOP\" ALIGN=\"LEFT\" class=\"top_note\"><B><xsl:value-of select=\"/bioml/@label\" /></B></TD>\n\t</TR>\n\t</TABLE>\n\t<BR></BR>\n\t<table border=\"1\" bgcolor=\"#d0ffd0\" cellpadding=\"2\" cellspacing=\"2\">\n\t\t<xsl:apply-templates select=\"/bioml/group\" />\n\t</table>\n     <xsl:if test=\"not(/bioml/group)\">\n \t<TABLE CELLSPACING=\"2\" CELLPADDING=\"2\">\n\t<TR>\n\t<TD WIDTH=\"700\" VALIGN=\"TOP\" ALIGN=\"LEFT\">No models were provided.</TD>\n\t</TR>\n\t</TABLE>\n   \n     </xsl:if>\n    </body>\n  </html>\n</xsl:template>\n\n<xsl:template match=\"group\">\n\t<xsl:if test=\"not(contains(@label,'parameters'))\">\n\t\t<tr><td>\n\t\t<DIV onClick=\"changeState('{generate-id()}');\" class=\"e\" title=\"click to see/hide sequences and evidence\">\n\t\t\t\t\t<SPAN CLASS=\"top_label\">\n\t\t\t#<xsl:value-of select=\"@id\" />, \n\t\t\te = <xsl:value-of select=\"@expect\" />,\n\t\t\tM+H = <sup><xsl:value-of select=\"@z\" /></sup><xsl:value-of select=\"@mh\" />\n\t\t\t<sup><xsl:value-of select=\"./protein/peptide/domain/@delta\" /></sup>,\n\t\t\t<SPAN class=\"aa_s\"><xsl:value-of select=\"./protein/peptide/domain/@pre\" /></SPAN>\n\t\t\t<SUP><xsl:value-of select=\"./protein/peptide/domain/@start\" /></SUP>\n\t\t\t<SPAN class=\"aa_h\"><xsl:value-of select=\"./protein/peptide/domain/@seq\" /></SPAN>\n\t\t\t<SUP><xsl:value-of select=\"./protein/peptide/domain/@end\" /></SUP>\n\t\t\t<SPAN class=\"aa_s\"><xsl:value-of select=\"./protein/peptide/domain/@post\" /></SPAN>,\n\t\t\t<xsl:for-each select=\"./protein[1]/peptide[1]/domain[1]/aa\">\n\t\t\t\t\n\t\t\t\t<SUP><xsl:value-of select=\"@at\" /></SUP><xsl:value-of select=\"@type\" />(<xsl:value-of select=\"@modified\" />),\n\t\t\t\t\n\t\t\t</xsl:for-each>\n\t\t\t</SPAN><BR></BR>\n\t\t\t<SPAN CLASS=\"top_note\"> \n\t\t\t<span class=\"b\"> log(E) = <xsl:value-of select=\"./protein/@expect\" /></span>,\n\t\t\t<xsl:value-of select=\"@label\" />\n\t\t\t</SPAN>\n\t\t\t</DIV>\n\n\t\t\t<DIV id=\"{generate-id()}\" STYLE=\"display:none\" class=\"k\">\n\t\t\t<TABLE border=\"1\" bgcolor=\"#ffd0ff\" CELLPADDING=\"1\" CELLSPACING=\"1\">\n\t\t\t\t<xsl:apply-templates select=\"protein\" mode=\"sequence\"/>\n\t\t\t</TABLE>\n\t\t\t\t<xsl:apply-templates select=\"group\" mode=\"support\"/>\n\t\t\t</DIV>\n\t\t</td></tr>\n\t</xsl:if>\n\t\n\t<xsl:if test=\"contains(@label,'parameters')\">\n\t\t<DIV onClick=\"changeState('{generate-id()}');\" title=\"click to see/hide values\" class=\"e\">\n\t\t<SPAN CLASS=\"top_label\">+ <xsl:value-of select=\"@label\" />\n\t\t</SPAN>\n\t\t</DIV>\n\t\t<DIV id=\"{generate-id()}\" class=\"k\" STYLE=\"display:none\">\n\t\t<BR></BR>\n\t\t<TABLE border=\"0\" bgcolor=\"#ffd0d0\" CELLPADDING=\"1\" CELLSPACING=\"1\">\n\t\t<SPAN CLASS=\"top_note\"><xsl:apply-templates select=\"note\" />\n\t\t</SPAN>\n\t\t</TABLE>\n\t\t<HR></HR>\n\t\t</DIV>\n\t</xsl:if>\n</xsl:template>\n\n<xsl:template match=\"protein\" mode=\"description\">\n\t\t<BR></BR><SPAN CLASS=\"top_note\"><B><xsl:value-of select=\"@id\" /></B> : </SPAN><PRE><xsl:apply-templates select=\"note\" /></PRE>\n</xsl:template>\n\n<xsl:template match=\"protein\" mode=\"sequence\">\n\t\t<tr><td>\n\t\t<DIV onClick=\"changeState('{generate-id()}');\" title=\"click to see/hide details\">\n\t\t<SPAN CLASS=\"top_label\"><xsl:value-of select=\"@id\" />: <xsl:value-of select=\"@label\" />\n\t\t<xsl:apply-templates select=\"file\" /></SPAN>\n\t\t</DIV>\n\t\t<DIV id=\"{generate-id()}\" class=\"k\" STYLE=\"display:none\">\n\t\t<xsl:apply-templates select=\"peptide\" />\n\t\t</DIV>\n\t\t</td></tr>\n</xsl:template>\n\n<xsl:template match=\"file\">\n\t\t<SPAN class=\"top_label\">(<xsl:value-of select=\"@URL\" />)</SPAN>\n</xsl:template>\n\n<xsl:template match=\"aa\">\n\t\t<SPAN class=\"top_note\"><SUP><xsl:value-of select=\"@at\" /></SUP><xsl:value-of select=\"@type\" />(<xsl:value-of select=\"@modified\" />),</SPAN>\n</xsl:template>\n\n<xsl:template match=\"GAML:attribute\">\n\t\t<SPAN class=\"small_label\"><xsl:value-of select=\"@type\" /> = <xsl:value-of select=\"text()\" />, </SPAN>\n</xsl:template>\n\n<xsl:template match=\"GAML:trace\">\n\n\t\t\t\t<SPAN class=\"small_label\">\n\t\t\t\t<B>\n\t\t\t\t\t<xsl:value-of select=\"@type\" />\n\t\t\t\t</B>\n\t\t\t\t</SPAN>\n\t\t\t<TABLE BORDER=\"0\" bgcolor=\"#ffffd0\" CELLPADDING=\"1\" CELLSPACING=\"1\">\n\t\t\t<xsl:if test=\"GAML:attribute\">\n\t\t\t\t<TR>\n\t\t\t\t<TD WIDTH=\"500\" VALIGN=\"TOP\" ALIGN=\"LEFT\">\n\t\t\t\tparameters: <xsl:apply-templates select=\"GAML:attribute\" />\n\t\t\t\t</TD>\n\t\t\t\t</TR>\n\t\t\t</xsl:if>\n\t\t\t<TR>\n\t\t\t<TD WIDTH=\"500\" VALIGN=\"TOP\" ALIGN=\"LEFT\">\n\t\t\t\tx-values\n\t\t\t</TD>\n\t\t\t</TR>\n\t\t\t<TR>\n\t\t\t<TD WIDTH=\"500\" VALIGN=\"TOP\" ALIGN=\"LEFT\">\n\t\t\t\t<xsl:value-of select=\"./GAML:Xdata/GAML:values/text()\" />\n\t\t\t</TD>\n\t\t\t</TR>\n\t\t\t<TR>\n\t\t\t<TD WIDTH=\"500\" VALIGN=\"TOP\" ALIGN=\"LEFT\">\n\t\t\t\ty-values\n\t\t\t</TD>\n\t\t\t</TR>\n\t\t\t<TR>\n\t\t\t<TD WIDTH=\"500\" VALIGN=\"TOP\" ALIGN=\"LEFT\">\n\t\t\t\t<xsl:value-of select=\"./GAML:Ydata/GAML:values/text()\" />\n\t\t\t</TD>\n\t\t\t</TR>\n\t\t\t</TABLE>\n</xsl:template>\n\n<xsl:template match=\"group\" mode=\"support\">\n<xsl:if test=\"@type='support'\">\n\t<DIV onClick=\"changeState('{generate-id()}');\" class=\"e\" title=\"click to see/hide evidence\">\n\t<SPAN CLASS=\"top_label\">\n\t\t\t<xsl:value-of select=\"@label\" />\n\t</SPAN></DIV>\n\t<DIV id=\"{generate-id()}\" STYLE=\"display:none\" class=\"k\">\n\t\t<xsl:apply-templates select=\"GAML:trace\" />\n\t</DIV>\n\t</xsl:if>\n</xsl:template>\n\n\n\n<xsl:template match=\"peptide\">\n\t\t<xsl:apply-templates select=\"domain\" />\n\t<DIV onClick=\"changeState('{generate-id()}');\" class=\"e\" title=\"click to see/hide sequence\">\n\t\t\t\t<SPAN class=\"top_label\">\n\t\t\t\t\tlog(e) = <xsl:value-of select=\"./../@expect\" />,\n\t\t\t\t\t<xsl:value-of select=\"./../@label\" />\n\t\t\t\t</SPAN>\n\t</DIV>\n\t<DIV id=\"{generate-id()}\" STYLE=\"display:none\">\n\t\t<TABLE BORDER=\"0\" gbcolor=\"#d0d0ff\">\n\t\t\t<TR>\n\t\t\t\t<TD WIDTH=\"500\" ALIGN=\"LEFT\" VALIGN=\"TOP\" CLASS=\"residues\"><xsl:value-of select=\"text()\" />\n\t\t\t\t</TD>\n\t\t\t</TR>\n\t\t</TABLE>\n\t</DIV>\n</xsl:template>\n\n<xsl:template match=\"domain\">\n\t\t<SPAN CLASS=\"top_note\">\n\t\t<B><xsl:value-of select=\"@id\" /></B>: \n\t\te = <xsl:value-of select=\"@expect\" />,\n\t\t<SUP><xsl:value-of select=\"@start\" /></SUP><SPAN class=\"aa_h\"><xsl:value-of select=\"@seq\" /></SPAN><SUP><xsl:value-of select=\"@end\" /></SUP>,\n\t\t<xsl:apply-templates select=\"aa\"/><BR></BR>\n\t\tM+H = <xsl:value-of select=\"@mh\" /> Da,\n\t\t<SPAN CLASS=\"greek\">d</SPAN> = <xsl:value-of select=\"@delta\" />,\n\t\t!score = <xsl:value-of select=\"@hyperscore\" />,\n\t\ty/b: scores = <xsl:value-of select=\"@y_score\" />/<xsl:value-of select=\"@b_score\" />,\n\t\tions = <xsl:value-of select=\"@y_ions\" />/<xsl:value-of select=\"@b_ions\" />\n\t\t</SPAN>\n\t\t<BR></BR>\n</xsl:template>\n\n<xsl:template match=\"note\">\n\t<xsl:if test=\"not(contains(@label,'description'))\">\n\t<TR>\n\t\t<TD WIDTH=\"350\" ALIGN=\"RIGHT\"><xsl:value-of select=\"@label\" /> = </TD>\n\t\t<TD WIDTH=\"350\" ALIGN=\"LEFT\"><xsl:value-of select=\"text()\" /></TD>\n\t</TR>\n\t</xsl:if>\n\t<xsl:if test=\"contains(@label,'description')\">\n\t\t<SPAN CLASS=\"top_note\">\n\t\t<xsl:choose>\n\t\t\t<xsl:when test=\"contains(self::note,'ENSMUSP')\">\n\t\t\t\t<a target=\"_BLANK\">\n\t\t\t\t<xsl:attribute name=\"href\">http://www.ensembl.org/Mus_musculus/protview?peptide=<xsl:value-of select=\"text()\"/></xsl:attribute>\n\t\t\t\t<xsl:attribute name=\"title\">View Ensembl Protein Report</xsl:attribute>\n\t\t\t\t<span class=\"ensembl\"><xsl:value-of select=\"text()\" /></span>\n\t\t\t\t</a>\n\t\t\t</xsl:when>\n\t\t\t<xsl:when test=\"contains(self::note,'ENSRNOP')\">\n\t\t\t\t<a target=\"_BLANK\">\n\t\t\t\t<xsl:attribute name=\"href\">http://www.ensembl.org/Rattus_norvegicus/protview?peptide=<xsl:value-of select=\"text()\"/></xsl:attribute>\n\t\t\t\t<xsl:attribute name=\"title\">View Ensembl Protein Report</xsl:attribute>\n\t\t\t\t<span class=\"ensembl\"><xsl:value-of select=\"text()\" /></span>\n\t\t\t\t</a>\n\t\t\t</xsl:when>\n\t\t\t<xsl:when test=\"contains(self::note,'ENSP')\">\n\t\t\t\t<a target=\"_BLANK\">\n\t\t\t\t<xsl:attribute name=\"href\">http://www.ensembl.org/Homo_sapiens/protview?peptide=<xsl:value-of select=\"text()\"/></xsl:attribute>\n\t\t\t\t<xsl:attribute name=\"title\">View Ensembl Protein Report</xsl:attribute>\n\t\t\t\t<span class=\"ensembl\"><xsl:value-of select=\"text()\" /></span>\n\t\t\t\t</a>\n\t\t\t</xsl:when>\n\t\t\t<xsl:otherwise>\n\t\t\t\t<xsl:value-of select=\"text()\" />\n\t\t\t</xsl:otherwise>\n\t\t</xsl:choose>\n\t\t</SPAN>\n\t</xsl:if>\n</xsl:template>\n\n\n\n</xsl:stylesheet>"
      - entryname: taxonomy.xml
        entry: "${\n  var protein_fasta = inputs.protein_fasta.basename\n  var data = \"<?xml version=\\\"1.0\\\"?> \\n\" +\n    \"<bioml label=\\\"x! taxon-to-file matching list\\\"> \\n\" + \n    \"\t<taxon label=\\\"\" + inputs.prot_taxon + \"\\\">\" + \"\\n\" +\n      \"\t\t<file format=\\\"peptide\\\" URL=\\\"\" + protein_fasta + \"\\\"/>\" + \"\\n\" +\n    \"\t</taxon> \\n\" +\n    \"</bioml> \"\n  \n  return data\n}"
      - entryname: input.xml
        entry: |-
          ${
            var input_spectra = inputs.input_spectra.basename
            var input_spectra_ext = input_spectra.split('.')[input_spectra.split('.').length-1]
            var input_spectra_name = input_spectra.substring(0, input_spectra.indexOf(input_spectra_ext)-1)
            var list_path = inputs.list_path_default_parameters.basename
            var data = "<?xml version=\"1.0\"?> \n" +
              "<bioml> \n" + 
              " <note type=\"input\" label=\"list path, default parameters\">" + list_path + "</note>" + "\n" +
              " <note type=\"input\" label=\"list path, taxonomy information\">taxonomy.xml</note>" + "\n" +
              " <note type=\"input\" label=\"protein, taxon\">" + 
              inputs.prot_taxon + "</note> \n" +
              " <note type=\"input\" label=\"spectrum, path\">"+ input_spectra + "</note> \n" +
              " <note type=\"input\" label=\"output, path\">" + input_spectra_name + '.xtan' + ".xml</note> \n"
            if(inputs.parent_monoisotopic_mass_error_minus != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, parent monoisotopic mass error minus\">"
                + inputs.parent_monoisotopic_mass_error_minus + "</note> \n"
            if(inputs.parent_monoisotopic_mass_error_plus != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, parent monoisotopic mass error plus\">"
                + inputs.parent_monoisotopic_mass_error_plus + "</note> \n"
            if(inputs.parent_monoisotopic_mass_error_units != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, parent monoisotopic mass error units\">"
                + inputs.parent_monoisotopic_mass_error_units + "</note> \n"
            if(inputs.parent_monoisotopic_mass_isotope_error != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, parent monoisotopic mass isotope error\">"
                + inputs.parent_monoisotopic_mass_isotope_error + "</note> \n"
            if(inputs.modification_mass != undefined)
              data = data + 
                    " <note type=\"input\" label=\"residue, modification mass\">"
                + inputs.modification_mass + "</note> \n"
            if(inputs.potential_modification_mass != undefined)
              data = data + 
                    " <note type=\"input\" label=\"residue, potential modification mass\">"
                + inputs.potential_modification_mass + "</note> \n"
            if(inputs.prot_cleavage_semi != undefined)
              data = data + 
                    " <note type=\"input\" label=\"protein, cleavage semi\">"
                + inputs.prot_cleavage_semi + "</note> \n"
            if(inputs.maximum_missed_cleavage_sites != undefined)
              data = data + 
                    " <note type=\"input\" label=\"scoring, maximum missed cleavage sites\">"
                + inputs.maximum_missed_cleavage_sites + "</note> \n"
            
              
            //data = data + ' <note type=\"input\" label=\"residue, potential modification motif\"></note>\n'
            //data = data + ' <note type=\"input\" label=\"protein, N-terminal residue modification mass\"></note>\n'
            //data = data + '   <note type=\"input\" label=\"protein, C-terminal residue modification mass\"></note>\n'
            
            //data = data + ' <note type="input" label="refine">no</note>\n'
            //data = data + ' <note type="input" label="refine, maximum valid expectation value">0.1</note>\n'
            //data = data + ' <note type="input" label="refine, potential modification mass">15.994915@M,8.014199@K,10.008269@R</note>\n'
            //data = data + ' <note type="input" label="refine, potential modification motif"></note>\n'
            //data = data + '   <note type="input" label="refine, cleavage semi">yes</note>\n'
            //data = data + ' <note type="input" label="refine, unanticipated cleavage">no</note>\n'
            //data = data + ' <note type="input" label="refine, potential N-terminus modifications"></note>\n'
            //data = data + ' <note type="input" label="refine, potential C-terminus modifications"></note>\n'
            //data = data + ' <note type="input" label="refine, point mutations">no</note>\n'
            //data = data + ' <note type="input" label="refine, use potential modifications for full refinement">no</note>\n'
            
            
            if(inputs.ref_cleavage_semi != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, cleavage semi\">"
                + inputs.ref_cleavage_semi + "</note> \n" 
            if(inputs.ref_max_valid_exp_value != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, maximum valid expectation value\">"
                + inputs.ref_max_valid_exp_value + "</note> \n" 
            if(inputs.ref_modif_mass != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, modification mass\">"
                + inputs.ref_modif_mass + "</note> \n"
            if(inputs.ref_point_mutations != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, point mutations\">"
                + inputs.ref_point_mutations + "</note> \n"
            if(inputs.ref_pot_modif_mass != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, potential modification mass\">"
                + inputs.ref_pot_modif_mass + "</note> \n"
            if(inputs.ref_pot_modif_motif != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, potential modification motif\">"
                + inputs.ref_pot_modif_motif + "</note> \n"
            if(inputs.ref_pot_n_terminus_modif != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, potential N-terminus modifications\">"
                + inputs.ref_pot_n_terminus_modif + "</note> \n"
            if(inputs.refine != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, refine\">"
                + inputs.refine + "</note> \n"
            if(inputs.ref_saps != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, saps\">"
                + inputs.ref_saps + "</note> \n"
            if(inputs.ref_seq_path != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, sequence path\">"
                + inputs.ref_seq_path + "</note> \n"
            if(inputs.ref_spectrum_synth != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, spectrum synthesis\">"
                + inputs.ref_spectrum_synth + "</note> \n"
            if(inputs.ref_tic_percent != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, tic percent\">"
                + inputs.ref_tic_percent + "</note> \n"
            if(inputs.ref_unanticipated_cleavage != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, unanticipated cleavage\">"
                + inputs.ref_unanticipated_cleavage + "</note> \n"
            if(inputs.ref_use_annot != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, use annotations\">"
                + inputs.ref_use_annot + "</note> \n"
            if(inputs.ref_use_pot_modif_for_full_ref != undefined)
              data = data + 
                    " <note type=\"input\" label=\"refine, use potential modifications for full refinement\">"
                + inputs.ref_use_pot_modif_for_full_ref + "</note> \n"
              
            if(inputs.prot_cleavage_c_term_mass_ch != undefined)
              data = data + 
                    " <note type=\"input\" label=\"protein, cleavage C-terminal mass change\">"
                + inputs.prot_cleavage_c_term_mass_ch + "</note> \n"
            if(inputs.prot_cleavage_n_term_mass_ch != undefined)
              data = data + 
                    " <note type=\"input\" label=\"protein, cleavage N-terminal mass change\">"
                + inputs.prot_cleavage_n_term_mass_ch + "</note> \n"
            if(inputs.prot_cleavage_site != undefined)
              data = data + 
                    " <note type=\"input\" label=\"protein, cleavage site\">"
                + inputs.prot_cleavage_site + "</note> \n"
            if(inputs.prot_c_term_res_modif_mass != undefined)
              data = data + 
                    " <note type=\"input\" label=\"protein, C-terminal residue modification mass\">"
                + inputs.prot_c_term_res_modif_mass + "</note> \n"
            if(inputs.prot_n_term_res_modif_mass != undefined)
              data = data + 
                    " <note type=\"input\" label=\"protein, N-terminal residue modification mass\">"
                + inputs.prot_n_term_res_modif_mass + "</note> \n"
            if(inputs.prot_modif_res_mass_file != undefined)
              data = data + 
                    " <note type=\"input\" label=\"protein, modified residue mass file\">"
                + inputs.prot_modif_res_mass_file + "</note> \n"
            if(inputs.prot_quick_acetyl != undefined)
              data = data + 
                    " <note type=\"input\" label=\"protein, quick acetyl\">"
                + inputs.prot_quick_acetyl + "</note> \n"
            if(inputs.prot_quick_pyrolidone != undefined)
              data = data + 
                    " <note type=\"input\" label=\"protein, quick pyrolidone\">"
                + inputs.prot_quick_pyrolidone + "</note> \n"
            if(inputs.prot_stp_bias != undefined)
              data = data + 
                    " <note type=\"input\" label=\"protein, stP bias\">"
                + inputs.prot_stp_bias + "</note> \n"
            if(inputs.prot_saps != undefined)
              data = data + 
                    " <note type=\"input\" label=\"protein, saps\">"
                + inputs.prot_saps + "</note> \n"
            if(inputs.sp_contrast_angle != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, contrast angle\">"
                + inputs.sp_contrast_angle + "</note> \n"
            if(inputs.sp_dyn_range != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, dynamic range\">"
                + inputs.sp_dyn_range + "</note> \n"
            if(inputs.sp_frag_mass_error != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, fragment mass error\">"
                + inputs.sp_frag_mass_error + "</note> \n"
            if(inputs.sp_frag_mass_error_units != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, fragment mass error units\">"
                + inputs.sp_frag_mass_error_units + "</note> \n"
            if(inputs.sp_frag_mass_type != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, fragment mass type\">"
                + inputs.sp_frag_mass_type + "</note> \n"
            if(inputs.sp_frag_monois_mass_error != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, fragment monoisotopic mass error\">"
                + inputs.sp_frag_monois_mass_error + "</note> \n"
            if(inputs.sp_frag_monois_mass_error_units != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, fragment monoisotopic mass error units\">"
                + inputs.sp_frag_monois_mass_error_units + "</note> \n"
            if(inputs.sp_max_parent_ch != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, maximum parent ion charge\">"
                + inputs.sp_max_parent_ch + "</note> \n"
            if(inputs.sp_min_frag_mz != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, minimum fragment mz\">"
                + inputs.sp_min_frag_mz + "</note> \n"
            if(inputs.sp_min_peaks != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, minimum peaks\">"
                + inputs.sp_min_peaks + "</note> \n"
            if(inputs.sp_min_parent_m_h != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, minimum parent m+h\">"
                + inputs.sp_min_parent_m_h + "</note> \n"
            if(inputs.sp_neutral_loss_mass != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, neutral loss mass\">"
                + inputs.sp_neutral_loss_mass + "</note> \n"
            if(inputs.sp_neutral_loss_window != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, neutral loss window\">"
                + inputs.sp_neutral_loss_window + "</note> \n"
            if(inputs.sp_seq_batch_size != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, sequence batch size\">"
                + inputs.sp_seq_batch_size + "</note> \n"
            if(inputs.sp_threads != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, threads\">"
                + inputs.sp_threads + "</note> \n"
            if(inputs.sp_total_peaks != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, total peaks\">"
                + inputs.sp_total_peaks + "</note> \n"
            if(inputs.sp_use_neutral_loss_window != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, use neutral loss window\">"
                + inputs.sp_use_neutral_loss_window + "</note> \n"
            if(inputs.sp_use_noise_supress != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, use noise suppression\">"
                + inputs.sp_use_noise_supress + "</note> \n"
            if(inputs.sp_use_contrast_angle != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, use contrast angle\">"
                + inputs.sp_use_contrast_angle + "</note> \n"
            if(inputs.sp_use_dyn_parent_ion_selection != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, spectrum, use dynamic parent ion selection\">"
                + inputs.sp_use_dyn_parent_ion_selection + "</note> \n"
            if(inputs.sp_use_dyn_parent_ion_selection_ratio != undefined)
              data = data + 
                    " <note type=\"input\" label=\"spectrum, spectrum, use dynamic parent ion selection ratio\">"
                + inputs.sp_use_dyn_parent_ion_selection_ratio + "</note> \n"
            
            if(inputs.sc_a_ions != undefined)
              data = data + 
                    " <note type=\"input\" label=\"scoring, a ions\">"
                + inputs.sc_a_ions + "</note> \n"
            if(inputs.sc_b_ions != undefined)
              data = data + 
                    " <note type=\"input\" label=\"scoring, b ions\">"
                + inputs.sc_b_ions + "</note> \n"
            if(inputs.sc_c_ions != undefined)
              data = data + 
                    " <note type=\"input\" label=\"scoring, c ions\">"
                + inputs.sc_c_ions + "</note> \n"
            if(inputs.sc_x_ions != undefined)
              data = data + 
                    " <note type=\"input\" label=\"scoring, x ions\">"
                + inputs.sc_x_ions + "</note> \n"
            if(inputs.sc_y_ions != undefined)
              data = data + 
                    " <note type=\"input\" label=\"scoring, y ions\">"
                + inputs.sc_y_ions + "</note> \n"
            if(inputs.sc_z_ions != undefined)
              data = data + 
                    " <note type=\"input\" label=\"scoring, z ions\">"
                + inputs.sc_z_ions + "</note> \n"
            if(inputs.sc_cyclic_perm != undefined)
              data = data + 
                    " <note type=\"input\" label=\"scoring, cyclic permutation\">"
                + inputs.sc_cyclic_perm + "</note> \n"
            if(inputs.sc_include_reverse != undefined)
              data = data + 
                    " <note type=\"input\" label=\"scoring, include reverse\">"
                + inputs.sc_include_reverse + "</note> \n"
            if(inputs.sc_min_ion_count != undefined)
              data = data + 
                    " <note type=\"input\" label=\"scoring, minimum ion count\">"
                + inputs.sc_min_ion_count + "</note> \n"
            if(inputs.res_potent_modif_motif != undefined)
              data = data + 
                    " <note type=\"input\" label=\"residue, potential modification motif\">"
                + inputs.res_potent_modif_motif + "</note> \n"
            if(inputs.out_histo_col_width != undefined)
              data = data + 
                    " <note type=\"input\" label=\"output, histogram column width\">"
                + inputs.out_histo_col_width + "</note> \n"
            if(inputs.out_histo != undefined)
              data = data + 
                    " <note type=\"input\" label=\"output, histograms\">"
                + inputs.out_histo + "</note> \n"
            if(inputs.out_max_valid_expect_value != undefined)
              data = data + 
                    " <note type=\"input\" label=\"output, maximum valid expectation value\">"
                + inputs.out_max_valid_expect_value + "</note> \n"
            if(inputs.out_one_seq_copy != undefined)
              data = data + 
                    " <note type=\"input\" label=\"output, one sequence copy\">"
                + inputs.out_one_seq_copy + "</note> \n"
            if(inputs.out_proteins != undefined)
              data = data + 
                    " <note type=\"input\" label=\"output, proteins\">"
                + inputs.out_proteins + "</note> \n"
            if(inputs.out_results != undefined)
              data = data + 
                    " <note type=\"input\" label=\"output, results\">"
                + inputs.out_results + "</note> \n"
            if(inputs.out_sort_results_by != undefined)
              data = data + 
                    " <note type=\"input\" label=\"output, sort results by\">"
                + inputs.out_sort_results_by + "</note> \n"
            if(inputs.out_seq != undefined)
              data = data + 
                    " <note type=\"input\" label=\"output, sequences\">"
                + inputs.out_seq + "</note> \n"  
            if(inputs.out_spectra != undefined)
              data = data + 
                    " <note type=\"input\" label=\"output, spectra\">"
                + inputs.out_spectra + "</note> \n"  
              
            data = data + "</bioml> " 
            
            return data
          }
      - $(inputs.input_spectra)
      - $(inputs.protein_fasta)
      - $(inputs.list_path_default_parameters)
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

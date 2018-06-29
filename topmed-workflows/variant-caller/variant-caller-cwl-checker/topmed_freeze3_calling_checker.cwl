class: Workflow
cwlVersion: v1.0
id: vladimir_obucina/topmed-freeze-3a-variant-calling-pipeline/checker-workflow/12
label: Checker Workflow
inputs:
  - id: reference_file
    'sbg:fileTypes': TGZ
    type: File
    'sbg:x': -484.54437255859375
    'sbg:y': -419.2278137207031
  - id: reference
    'sbg:fileTypes': FA
    type: File
    'sbg:x': -480.9602966308594
    'sbg:y': -298.2476806640625
  - id: pedigree_file
    'sbg:fileTypes': PED
    type: File
    'sbg:x': -481.3563232421875
    'sbg:y': -179.4556121826172
  - id: bam_cram_file
    'sbg:fileTypes': 'BAM, CRAM'
    type: 'File[]'
    'sbg:x': -476.4285583496094
    'sbg:y': 428.8571472167969
  - id: bai_crai_file
    'sbg:fileTypes': 'BAI, CRAI'
    type: 'File[]'
    'sbg:x': -475.4285888671875
    'sbg:y': 545.4285888671875
  - id: num_of_jobs
    type: int?
    'sbg:x': -471.79205322265625
    'sbg:y': -61.45560836791992
  - id: genotype_unit
    type: int
    'sbg:x': -473.28570556640625
    'sbg:y': 60.85714340209961
  - id: discover_unit
    type: int
    'sbg:x': -474
    'sbg:y': 186.1717987060547
  - id: reference_genome_1
    type:
      type: enum
      symbols:
        - hg38
        - GRCh37
      name: reference_genome
    'sbg:x': -471.3960266113281
    'sbg:y': -547.1881103515625
  - id: chromosomes
    type: 'string[]'
    'sbg:x': -474.9367980957031
    'sbg:y': 303.5867004394531
  - id: inputTruthVCFFile
    'sbg:fileTypes': TAR.GZ
    type: File
    'sbg:x': 86.9299087524414
    'sbg:y': -197.2978973388672
outputs:
  - id: genotypes
    outputSource:
      - topmed_variant_calling_pipeline_cwl1/genotypes
    type: File
    'sbg:x': 364
    'sbg:y': 101.92414093017578
steps:
  - id: topmed_variant_calling_pipeline_cwl1
    in:
      - id: reference
        source:
          - reference
      - id: bam_cram_file
        source:
          - bam_cram_file
      - id: bai_crai_file
        source:
          - bai_crai_file
      - id: reference_file
        source:
          - reference_file
      - id: pedigree_file
        source:
          - pedigree_file
      - id: num_of_jobs
        source:
          - num_of_jobs
      - id: genotype_unit
        source:
          - genotype_unit
      - id: discover_unit
        source:
          - discover_unit
      - id: chromosomes
        source:
          - chromosomes
      - id: reference_genome_1
        source:
          - reference_genome_1
    out:
      - id: called_variant_sites
      - id: genotypes
      - id: makefile_log
      - id: vcf_output
      - id: vcf_index_output
    run:
      class: Workflow
      cwlVersion: v1.0
      id: >-
        vladimir_obucina/topmed-freeze-3a-variant-calling-pipeline/topmed-variant-calling-pipeline-cwl1/13
      label: TOPMed Variant Calling Pipeline CWL1
      inputs:
        - id: reference
          'sbg:fileTypes': FA
          type: File
          'sbg:x': -460
          'sbg:y': -266.8571472167969
        - id: bam_cram_file
          'sbg:fileTypes': 'BAM, CRAM'
          type: 'File[]'
          'sbg:x': -457.8571472167969
          'sbg:y': -143.42857360839844
        - id: bai_crai_file
          'sbg:fileTypes': 'BAI, CRAI'
          type: 'File[]'
          'sbg:x': -456.4285888671875
          'sbg:y': -17.285715103149414
        - id: reference_file
          'sbg:fileTypes': TGZ
          type: File
          'sbg:x': -119
          'sbg:y': -629.1428833007812
        - id: pedigree_file
          'sbg:fileTypes': PED
          type: File
          'sbg:x': -119.71428680419922
          'sbg:y': -515.8571166992188
        - id: num_of_jobs
          type: int?
          'sbg:x': -121.57142639160156
          'sbg:y': -401.71429443359375
        - id: genotype_unit
          type: int
          'sbg:x': -127
          'sbg:y': -50.85714340209961
        - id: discover_unit
          type: int
          'sbg:x': -133
          'sbg:y': 73
        - id: chromosomes
          type: 'string[]'
          'sbg:x': -128.14285278320312
          'sbg:y': 198.2857208251953
        - id: reference_genome_1
          type:
            type: enum
            symbols:
              - hg38
              - GRCh37
            name: reference_genome
          'sbg:x': -459.2857360839844
          'sbg:y': -385.71429443359375
      outputs:
        - id: called_variant_sites
          outputSource:
            - topmed_freeze3_calling/called_variant_sites
          type: File
          'sbg:x': 418.68548583984375
          'sbg:y': -43.3526725769043
        - id: genotypes
          outputSource:
            - topmed_freeze3_calling/genotypes
          type: File
          'sbg:x': 418.1114501953125
          'sbg:y': -197.72366333007812
        - id: makefile_log
          outputSource:
            - topmed_freeze3_calling/makefile_log
          type: File?
          'sbg:x': 423.53741455078125
          'sbg:y': -332.6839599609375
        - id: vcf_output
          outputSource:
            - topmed_freeze3_calling/vcf_output
          'sbg:fileTypes': GZ
          type: 'File[]?'
          'sbg:y': -622.8525390625
          'sbg:x': 421.19287109375
        - id: vcf_index_output
          outputSource:
            - topmed_freeze3_calling/vcf_index_output
          'sbg:fileTypes': TBI
          type: 'File[]?'
          'sbg:y': -474.9278869628906
          'sbg:x': 424.314697265625
      steps:
        - id: verifybamid_cwl1
          in:
            - id: bai_crai_file
              source:
                - bai_crai_file
            - id: bam_cram_file
              source:
                - bam_cram_file
            - id: reference
              source:
                - reference
            - id: reference_genome
              source:
                - reference_genome_1
          out:
            - id: output_index_file
          run:
            class: CommandLineTool
            cwlVersion: v1.0
            id: >-
              vladimir_obucina/topmed-freeze-3a-variant-calling-pipeline/verifybamid_cwl1/7
            baseCommand: []
            inputs:
              - 'sbg:category': Input Files
                format: 'BAI,CRAI'
                id: bai_crai_file
                type: 'File[]'
                label: BAI/CRAI File
                doc: Index file for BAM/CRAM
                'sbg:fileTypes': 'BAI, CRAI'
              - 'sbg:category': Input Files
                format: 'BAM,CRAM'
                id: bam_cram_file
                type: File
                label: BAM/CRAM File
                doc: Bam or Cram file for the sample
                'sbg:fileTypes': 'BAM, CRAM'
              - format: FA
                'sbg:category': Input Files
                id: reference
                type: File
                inputBinding:
                  position: 1
                  shellQuote: false
                  valueFrom: |-
                    ${

                        return ""

                    }
                label: Reference
                doc: Reference file
                'sbg:fileTypes': FA
                secondaryFiles:
                  - .fai
              - 'sbg:category': Input file
                id: reference_genome
                type:
                  type: enum
                  symbols:
                    - hg38
                    - GRCh37
                  name: reference_genome
                label: Reference genome
            outputs:
              - id: output_index_file
                doc: Output for topmed freeze3 pipeline
                label: Output Index File
                type: File?
                outputBinding:
                  glob: |-
                    ${
                        return inputs.bam_cram_file.path.split("/").pop().split(".").shift() + ".index"

                    }
                format: INDEX
            label: VerifyBamID_CWL1
            arguments:
              - position: 0
                prefix: ''
                separate: false
                shellQuote: false
                valueFrom: |-
                  ${
                      if (inputs.reference_genome == 'GRCh37') {
                          var UDPath = "/VerifyBamID/resource/1000g.phase3.100k.b37.vcf.gz.dat.UD"
                          var BedPath = "/VerifyBamID/resource/1000g.phase3.100k.b37.vcf.gz.dat.bed"
                          var MeanPath = "/VerifyBamID/resource/1000g.phase3.100k.b37.vcf.gz.dat.mu"
                      } else if (inputs.reference_genome == 'hg38') {
                          var UDPath = "/VerifyBamID/resource/1000g.phase3.100k.b38.vcf.gz.dat.UD"
                          var BedPath = "/VerifyBamID/resource/1000g.phase3.100k.b38.vcf.gz.dat.bed"
                          var MeanPath = "/VerifyBamID/resource/1000g.phase3.100k.b38.vcf.gz.dat.mu"
                      }

                      var comm = "export PATH=$PATH:/VerifyBamID/bin/ && VerifyBamID \
                   --UDPath " + UDPath + " \
                   --BedPath " + BedPath + " \
                   --MeanPath " + MeanPath + " \
                   --Reference " + inputs.reference.path + " --BamFile " + inputs.bam_cram_file.path
                      comm += " && python make_index.py --file "
                      comm += inputs.bam_cram_file.path.split("/").pop().split(".").shift()
                      comm += " --path " + inputs.bam_cram_file.path + " --result result.out"

                      return comm
                  }
            requirements:
              - class: ShellCommandRequirement
              - class: ResourceRequirement
                ramMin: 1000
                coresMin: 1
              - class: DockerRequirement
                dockerPull: 'images.sbgenomics.com/vladimir_obucina/topmed:VerifyBamID'
              - class: InitialWorkDirRequirement
                listing:
                  - entryname: make_index.py
                    entry: >-
                      import sys

                      import glob, os

                      import argparse


                      parser = argparse.ArgumentParser()



                      parser.add_argument("--file", help="File name.", type=str)

                      parser.add_argument("--path", help="Path to file.",
                      type=str)

                      parser.add_argument("--result", help="Result from ",
                      type=str)


                      args = parser.parse_args()


                      with open(args.result, 'rt') as in_file:
                          contents = in_file.read()
                          broj = contents.split("Alpha:",4)
                          contamination = broj[1].rstrip()



                      output_file = args.file + ".index"

                      f = open (output_file, "w+")


                      f.write(args.file + '\t' + args.path + '\t' +
                      contamination + '\n')


                      f.close()
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
            'sbg:publisher': sbg
            'sbg:revisionNotes': 'UPDATE: GRCh37 instead of hg19'
            'sbg:image_url': >-
              https://igor.sbgenomics.com/ns/brood/images/vladimir_obucina/topmed-freeze-3a-variant-calling-pipeline/verifybamid_cwl1/7.png
            'sbg:cmdPreview': >-
              export PATH=$PATH:/VerifyBamID/bin/ && VerifyBamID  --UDPath
              /VerifyBamID/resource/1000g.phase3.100k.b37.vcf.gz.dat.UD 
              --BedPath
              /VerifyBamID/resource/1000g.phase3.100k.b37.vcf.gz.dat.bed 
              --MeanPath
              /VerifyBamID/resource/1000g.phase3.100k.b37.vcf.gz.dat.mu 
              --Reference /path/to/reference.ext --BamFile /path/to/bam_file.ext
              && python make_index.py --file bam_file --path
              /root/topmed_freeze3_calling/bam_file.ext --result result.out
            $namespaces:
              sbg: 'https://sevenbridges.com'
            'sbg:appVersion':
              - v1.0
            'sbg:sbgMaintained': false
            'sbg:contributors':
              - vladimir_obucina
            'sbg:revision': 7
            'sbg:revisionsInfo':
              - 'sbg:revision': 0
                'sbg:modifiedBy': vladimir_obucina
                'sbg:modifiedOn': 1526995337
                'sbg:revisionNotes': null
              - 'sbg:revision': 1
                'sbg:modifiedBy': vladimir_obucina
                'sbg:modifiedOn': 1526995452
                'sbg:revisionNotes': First version
              - 'sbg:revision': 2
                'sbg:modifiedBy': vladimir_obucina
                'sbg:modifiedOn': 1526995574
                'sbg:revisionNotes': >-
                  After conversion there weren't fyle types in the input ports.
                  Added it
              - 'sbg:revision': 3
                'sbg:modifiedBy': vladimir_obucina
                'sbg:modifiedOn': 1526996077
                'sbg:revisionNotes': ''
              - 'sbg:revision': 4
                'sbg:modifiedBy': vladimir_obucina
                'sbg:modifiedOn': 1527013794
                'sbg:revisionNotes': Removed /topmed_freeze3/   from path in middle column
              - 'sbg:revision': 5
                'sbg:modifiedBy': vladimir_obucina
                'sbg:modifiedOn': 1527069678
                'sbg:revisionNotes': ''
              - 'sbg:revision': 6
                'sbg:modifiedBy': vladimir_obucina
                'sbg:modifiedOn': 1527071592
                'sbg:revisionNotes': >-
                  UPDATE: changed generating index file, \n was missing at the
                  end of file.
              - 'sbg:revision': 7
                'sbg:modifiedBy': vladimir_obucina
                'sbg:modifiedOn': 1527500604
                'sbg:revisionNotes': 'UPDATE: GRCh37 instead of hg19'
            'sbg:latestRevision': 7
            'sbg:createdOn': 1526995337
            'sbg:projectName': TOPMed Freeze 3a Variant Calling Pipeline
            'sbg:project': vladimir_obucina/topmed-freeze-3a-variant-calling-pipeline
            'sbg:modifiedBy': vladimir_obucina
            'sbg:validationErrors': []
            'sbg:modifiedOn': 1527500604
            'sbg:createdBy': vladimir_obucina
            'sbg:id': >-
              vladimir_obucina/topmed-freeze-3a-variant-calling-pipeline/verifybamid_cwl1/7
          label: VerifyBamID_CWL1
          scatter:
            - bam_cram_file
          'sbg:y': -197.14285278320312
          'sbg:x': -233.57144165039062
        - id: topmed_freeze3_calling
          in:
            - id: bai_crai_files
              source:
                - bai_crai_file
            - id: bam_cram_files
              source:
                - bam_cram_file
            - id: chromosomes
              default: []
              source:
                - chromosomes
            - id: discover_unit
              source:
                - discover_unit
            - id: genotype_unit
              source:
                - genotype_unit
            - id: index_files
              source:
                - verifybamid_cwl1/output_index_file
            - id: num_of_jobs
              source:
                - num_of_jobs
            - id: pedigree_file
              source:
                - pedigree_file
            - id: reference_file
              source:
                - reference_file
            - id: reference_genome
              source:
                - reference_genome_1
          out:
            - id: called_variant_sites
            - id: genotypes
            - id: makefile_log
            - id: vcf_output
            - id: vcf_index_output
          run: ../topmed_variant_calling_pipeline.cwl
          label: Topmed_freeze3_CWL1
          'sbg:y': -198
          'sbg:x': 157.14285278320312
      requirements:
        - class: ScatterFeatureRequirement
      'sbg:publisher': sbg
      'sbg:modifiedOn': 1529918908
      'sbg:image_url': >-
        https://igor.sbgenomics.com/ns/brood/images/vladimir_obucina/topmed-freeze-3a-variant-calling-pipeline/topmed-variant-calling-pipeline-cwl1/13.png
      'sbg:contributors':
        - vladimir_obucina
      'sbg:appVersion':
        - v1.0
      'sbg:sbgMaintained': false
      $namespaces:
        sbg: 'https://sevenbridges.com'
      'sbg:revision': 13
      'sbg:revisionsInfo':
        - 'sbg:revision': 0
          'sbg:modifiedOn': 1526996458
          'sbg:modifiedBy': vladimir_obucina
          'sbg:revisionNotes': null
        - 'sbg:revision': 1
          'sbg:modifiedOn': 1526996882
          'sbg:modifiedBy': vladimir_obucina
          'sbg:revisionNotes': >-
            Firste Version with CWL1 tools, scatter on VerifyBAMId is of type
            none
        - 'sbg:revision': 2
          'sbg:modifiedOn': 1526997137
          'sbg:modifiedBy': vladimir_obucina
          'sbg:revisionNotes': Exposed ports
        - 'sbg:revision': 3
          'sbg:modifiedOn': 1526997206
          'sbg:modifiedBy': vladimir_obucina
          'sbg:revisionNotes': ''
        - 'sbg:revision': 4
          'sbg:modifiedOn': 1526997265
          'sbg:modifiedBy': vladimir_obucina
          'sbg:revisionNotes': ''
        - 'sbg:revision': 5
          'sbg:modifiedOn': 1527001305
          'sbg:modifiedBy': vladimir_obucina
          'sbg:revisionNotes': Separated bam and bai inputs for VerifyBAMId and Topmed_freeze3
        - 'sbg:revision': 6
          'sbg:modifiedOn': 1527007399
          'sbg:modifiedBy': vladimir_obucina
          'sbg:revisionNotes': Added output to VerifyBamID
        - 'sbg:revision': 7
          'sbg:modifiedOn': 1527060490
          'sbg:modifiedBy': vladimir_obucina
          'sbg:revisionNotes': 'UPDATE: Removed symlinks'
        - 'sbg:revision': 8
          'sbg:modifiedOn': 1527060551
          'sbg:modifiedBy': vladimir_obucina
          'sbg:revisionNotes': ''
        - 'sbg:revision': 9
          'sbg:modifiedOn': 1527071783
          'sbg:modifiedBy': vladimir_obucina
          'sbg:revisionNotes': >-
            UPDATE: changed VerifyBamID, error was lack od \n sign at the end of
            each output index file.
        - 'sbg:revision': 10
          'sbg:modifiedOn': 1527085565
          'sbg:modifiedBy': vladimir_obucina
          'sbg:revisionNotes': Removed index file from output
        - 'sbg:revision': 11
          'sbg:modifiedOn': 1527500740
          'sbg:modifiedBy': vladimir_obucina
          'sbg:revisionNotes': 'UPDATE: GRCh37 insted of hg19'
        - 'sbg:revision': 12
          'sbg:modifiedOn': 1527503995
          'sbg:modifiedBy': vladimir_obucina
          'sbg:revisionNotes': 'UPDATE: changed append_gcconfig.py script to recognize GRCh37'
        - 'sbg:revision': 13
          'sbg:modifiedOn': 1529918908
          'sbg:modifiedBy': vladimir_obucina
          'sbg:revisionNotes': 'UPDATE: Added vcf and vcf_index outputs'
      'sbg:latestRevision': 13
      'sbg:createdOn': 1526996458
      'sbg:projectName': TOPMed Freeze 3a Variant Calling Pipeline
      'sbg:createdBy': vladimir_obucina
      'sbg:modifiedBy': vladimir_obucina
      'sbg:validationErrors': []
      'sbg:revisionNotes': 'UPDATE: Added vcf and vcf_index outputs'
      'sbg:project': vladimir_obucina/topmed-freeze-3a-variant-calling-pipeline
      'sbg:id': >-
        vladimir_obucina/topmed-freeze-3a-variant-calling-pipeline/topmed-variant-calling-pipeline-cwl1/13
    label: TOPMed Variant Calling Pipeline CWL1
    'sbg:y': 66.25931549072266
    'sbg:x': -53.936790466308594
  - id: topmed_variantcaller_checker
    in:
      - id: inputTruthVCFFile
        source:
          - inputTruthVCFFile
      - id: inputTestVCFFile
        source:
          - topmed_variant_calling_pipeline_cwl1/genotypes
    out: []
    run: topmed-variantcaller-checker.cwl
    label: topmed-variantcaller-checker
    'sbg:y': -103.00116729736328
    'sbg:x': 361.55609130859375
requirements:
  - class: SubworkflowFeatureRequirement
'sbg:publisher': sbg
'sbg:modifiedOn': 1530282177
'sbg:image_url': >-
  https://igor.sbgenomics.com/ns/brood/images/vladimir_obucina/topmed-freeze-3a-variant-calling-pipeline/checker-workflow/12.png
'sbg:sbgMaintained': false
'sbg:contributors':
  - vladimir_obucina
'sbg:appVersion':
  - v1.0
$namespaces:
  sbg: 'https://sevenbridges.com'
'sbg:revision': 12
'sbg:revisionsInfo':
  - 'sbg:revision': 0
    'sbg:modifiedOn': 1527589051
    'sbg:modifiedBy': vladimir_obucina
    'sbg:revisionNotes': null
  - 'sbg:revision': 1
    'sbg:modifiedOn': 1527589334
    'sbg:modifiedBy': vladimir_obucina
    'sbg:revisionNotes': 'UPDATE: First Version'
  - 'sbg:revision': 2
    'sbg:modifiedOn': 1527589457
    'sbg:modifiedBy': vladimir_obucina
    'sbg:revisionNotes': ''
  - 'sbg:revision': 3
    'sbg:modifiedOn': 1527589527
    'sbg:modifiedBy': vladimir_obucina
    'sbg:revisionNotes': ''
  - 'sbg:revision': 4
    'sbg:modifiedOn': 1527672587
    'sbg:modifiedBy': vladimir_obucina
    'sbg:revisionNotes': Changed validation tool to use python script for checkinf file size
  - 'sbg:revision': 5
    'sbg:modifiedOn': 1527690481
    'sbg:modifiedBy': vladimir_obucina
    'sbg:revisionNotes': >-
      UPDATE: Making log.stderr and log.stdout files, with exit message in case
      of failure.
  - 'sbg:revision': 6
    'sbg:modifiedOn': 1527691926
    'sbg:modifiedBy': vladimir_obucina
    'sbg:revisionNotes': ''
  - 'sbg:revision': 7
    'sbg:modifiedOn': 1529919626
    'sbg:modifiedBy': vladimir_obucina
    'sbg:revisionNotes': >-
      UPDATE: Changed Checker tool, and update CWL1 which now has different
      output format
  - 'sbg:revision': 8
    'sbg:modifiedOn': 1529919769
    'sbg:modifiedBy': vladimir_obucina
    'sbg:revisionNotes': ''
  - 'sbg:revision': 9
    'sbg:modifiedOn': 1530277807
    'sbg:modifiedBy': vladimir_obucina
    'sbg:revisionNotes': 'UPDATE!!!: changed checker tool'
  - 'sbg:revision': 10
    'sbg:modifiedOn': 1530279332
    'sbg:modifiedBy': vladimir_obucina
    'sbg:revisionNotes': >-
      UPDATE: added output to check if everything works well. Last revision (13)
      was working!!!
  - 'sbg:revision': 11
    'sbg:modifiedOn': 1530279360
    'sbg:modifiedBy': vladimir_obucina
    'sbg:revisionNotes': ''
  - 'sbg:revision': 12
    'sbg:modifiedOn': 1530282177
    'sbg:modifiedBy': vladimir_obucina
    'sbg:revisionNotes': 'UPDATE: Checker back to revision 13'
'sbg:latestRevision': 12
'sbg:createdOn': 1527589051
'sbg:projectName': TOPMed Freeze 3a Variant Calling Pipeline
'sbg:createdBy': vladimir_obucina
'sbg:modifiedBy': vladimir_obucina
'sbg:validationErrors': []
'sbg:revisionNotes': 'UPDATE: Checker back to revision 13'
'sbg:id': vladimir_obucina/topmed-freeze-3a-variant-calling-pipeline/checker-workflow/12
'sbg:project': vladimir_obucina/topmed-freeze-3a-variant-calling-pipeline

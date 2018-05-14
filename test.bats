#!/usr/bin/env bats

@test "Run VirFinder on test data" {
  run_virfinder.Rscript /usr/local/virfinder/LiverCirrhosis_2657Contigs.fasta /usr/local/virfinder/LiverCirrhosis_2657Contigs.tsv
  [[ -s /usr/local/virfinder/LiverCirrhosis_2657Contigs.tsv ]]
}

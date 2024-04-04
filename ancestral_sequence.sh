# To construct a phylogenetic tree incorporating the reference sequence and the ba.5.2.48 sequence.
cat 0.rawdata/ref.fasta raw_ba.5.fasta > ba5.fasta

# align to reference---MN908947.3
nohup augur align -s ba5.fasta --reference-sequence ~/data/sars-cov-2/reference.fasta --remove-reference --nthreads 48 -o ba5.aligned.fasta &

# Constructing a phylogenetic tree
nohup augur tree -a ba5.aligned.fasta --nthreads 48 --method fasttree -o ba5.tree &

# get metadata
cat 1.nextclade/BA5_meta.tsv ref_metadata.tsv > ba5.metadata.tsv

# refine
nohup augur refine --tree ba5.tree --alignment ba5.aligned.fasta --metadata ba5.metadata.tsv --output-tree ba5.reroot.tree --output-node-data ba5.branch_lengths.json --root "hCoV-19/Wuhan/Hu-1/2019" --divergence-unit mutations &

# timeline reconstruct
nohup treetime ancestral --aln ba5.aligned.fasta --tree ba5.reroot.tree --aa --marginal --outdir ba5 &

# for nomenclature
add_cus_dep("nlo", "nls", 0, "nlo2nls");
sub nlo2nls {
    system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg");
}

$pdf_mode = 1;
$bibtex_use = 2;
$pdflatex = "pdflatex --shell-escape %O %S";

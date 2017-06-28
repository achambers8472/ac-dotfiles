$pdf_previewer = "start evince";
$pdf_update_method = 0;
$pdflatex = "pdflatex --shell-escape  %O  %S";
$cleanup_includes_cusdep_generated = 1;

add_cus_dep('svg', 'pdf', 0, 'svg2pdf');
sub svg2pdf {
    system( "inkscape --export-area-drawing --without-gui --file=\"$_[0].svg\" --export-pdf=\"$_[0].pdf\"" );
}

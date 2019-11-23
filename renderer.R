bookdown::render_book( "index.Rmd", "bookdown::pdf_book" )
bookdown::render_book( "index.Rmd", "bookdown::gitbook" )
bookdown::render_book( "index.Rmd", "bookdown::epub_book" )
bookdown::render_book( "index.Rmd", "beamer_presentation", output_option = list(
  pandoc_args = c( "--lua-filter", "handoutconverter.lua", "--include-in-header", "preamble_handout.tex" ) ) )
file.rename( "FerenciTamas_ValszamEsStatAlapvonalai.pdf", "./docs/FerenciTamas_ValszamEsStatAlapvonalai_handout.pdf" )
bookdown::render_book( "index.Rmd", "beamer_presentation", output_option = list(
  pandoc_args = c( "--lua-filter",  "handoutconverter_slides.lua", "--incremental",
                   "--include-in-header", "preamble_slides.tex" ) ) )
file.rename( "FerenciTamas_ValszamEsStatAlapvonalai.pdf", "./docs/FerenciTamas_ValszamEsStatAlapvonalai_slides.pdf" )
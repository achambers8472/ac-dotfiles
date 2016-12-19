;;; package --- Summary

;;; Commentary:

;;; Code:

(require 'reftex)
(setq reftex-use-external-file-finders t)
(setq reftex-external-file-finders
      '(("tex" . "kpsewhich -format=.tex %f")
        ("bib" . "kpsewhich -format=.bib %f")))

(provide 'ac-reftex)
;;; ac-reftex ends here

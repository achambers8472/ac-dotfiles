;;; ac-packages --- Packages to download and install

;;; Commentary:

;;; Code:

(require 'package)

(add-to-list 'package-archives
	'("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents)
)

(dolist (package '(
                   color-theme
                   fill-column-indicator
                   ido
                   ido-vertical-mode
                   ido-ubiquitous
                   org
                   ;; org-agenda-property
                   smex
                   evil
                   key-chord
                   evil-surround
                   magit
                   reftex
                   auctex
                   ;; python-mode
                   ;; anaconda-mode
                   haskell-mode
                   lua-mode
                   flycheck
                   ;; company
                   ;; company-jedi
                   ;; aggressive-indent
                   indent-guide
                   go-mode
                   slime
                   bbdb
                   json-mode
                   ))
    (message (concat "Setting up package " (symbol-name package) "..."))
    (unless (package-installed-p package)
      (package-install package))
    (let ((package-config-file (concat "~/.emacs.d/ac-" (symbol-name package) ".el")))
      (message (concat "Looking for config file " package-config-file "..."))
      (if (file-exists-p package-config-file)
          (load package-config-file))))

(provide 'ac-packages)
;;; ac-packages.el ends here

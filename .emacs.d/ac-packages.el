(setq package-list
  '(
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
    auctex
    python-mode
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
    ;; monokai-theme
    ;; zenburn-theme
    color-theme-solarized
    ;; solarized-theme
    bbdb
    )
  )

(require 'package)
(add-to-list 'package-archives
	'("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents)
)

(dolist (p package-list)
  (message (concat "Setting up package " (symbol-name p) "..."))
  (unless (package-installed-p p)
    (package-install p))
  (let ((package-config-file (concat "~/.emacs.d/ac-" (symbol-name p) ".el")))
    (message (concat "Looking for config file " package-config-file "..."))
    (if (file-exists-p package-config-file)
	(load package-config-file))))

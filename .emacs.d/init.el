(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(require 'use-package)

(use-package evil
  :ensure t
  :config
  (evil-mode t)
  (define-key evil-insert-state-map (kbd "<return>") 'evil-ret-and-indent)
  (defun insert-line-below ()
    (interactive)
    (save-excursion
      (evil-open-below 1)
      (evil-normal-state)
      )
    )
  (define-key evil-normal-state-map (kbd "<return>") 'insert-line-below)
  (define-key evil-motion-state-map "H" 'evil-beginning-of-line)
  (define-key evil-motion-state-map "L" 'evil-end-of-line)
  )

(use-package key-chord
  :ensure t
  :config
  (setq key-chord-two-keys-delay 0.2)
  (key-chord-mode t)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-define evil-replace-state-map "jk" 'evil-normal-state)
  (key-chord-define evil-visual-state-map ",c" 'comment-dwim)
  )

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode t)
  )

(use-package ido
  :ensure t
  :config
  (ido-mode t)
  (ido-everywhere t)
  )

(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-vertical-mode t)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
)

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode t)
  )

(use-package smex
  :ensure t
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
  )

(use-package magit
  :ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  )

(use-package fill-column-indicator
  :ensure t)

(use-package color-theme
  :ensure t
  )

(load-file "~/.opt/ac-essentials/submodules/solarized/emacs-colors-solarized/color-theme-solarized.el")
(color-theme-solarized-light)

(use-package tex
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-newline-function 'newline-and-indent)
  (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'reftex-mode)
  (setq-default TeX-master nil)
  )

(use-package reftex
  :config
  (setq reftex-use-external-file-finders t)
  (setq reftex-external-file-finders
        '(("tex" . "kpsewhich -format=.tex %f")
          ("bib" . "kpsewhich -format=.bib %f")))
  )

(use-package json)


(tool-bar-mode nil)

(setq custom-file "~/.emacs.d/ac-custom.el")
(if (file-exists-p custom-file) (load custom-file))

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 20
      kept-old-version 5)
(setq tramp-auto-save-directory "~/.emacs.d/tramp-autosave")
(setq column-number-mode t)

(add-to-list 'default-frame-alist '(font . "Inconsolata-18" ))
(if (display-graphic-p) (set-face-attribute 'default t :font "Inconsolata-18" ))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(define-key global-map (kbd "RET") 'newline-and-indent)

(scroll-bar-mode -1)
(show-paren-mode t)
(whitespace-mode 1)
(setq-default indent-tabs-mode nil)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-sensibly)

(global-hi-lock-mode t)

(defun python-highlights ()
  (highlight-phrase "randint")
  (highlight-phrase "numpy.std")
  (highlight-phrase "numpy.mean")
  )

(add-hook 'python-mode-hook 'python-highlights)

(setq tramp-use-ssh-controlmaster-options nil)

(global-linum-mode t) ;; Line numbers

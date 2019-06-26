;;; package --- Summary

;;; Commentary:

;;; Code:

(package-initialize)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package evil
  :ensure t
  :config
  (evil-mode t)
  )

(use-package evil-commentary
  :ensure t
  :after evil
  :config
  (evil-commentary-mode)
  )

;; (use-package key-chord
;;   :ensure t
;;   :after evil
;;   :config
;;   (setq key-chord-two-keys-delay 0.2)
;;   (key-chord-mode t)
;;   (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
;;   (key-chord-define evil-replace-state-map "jk" 'evil-normal-state)
;;   )

(use-package evil-surround
  :ensure t
  :after evil
  :config
  (global-evil-surround-mode t))

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl")
  (setq slime-contribs '(slime-fancy))
  )

(use-package ido
  :ensure t
  :config
  (ido-mode t)
  (ido-everywhere t)
  )

(use-package ido-vertical-mode
  :ensure t
  :after ido
  :config
  (ido-vertical-mode t)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
)

(use-package ido-completing-read+
  :ensure t
  :after ido
  :config
  (ido-ubiquitous-mode 1)
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
  :ensure t
  )

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  )

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  )

;; (use-package company-jedi
;;   :ensure t
;;   :after company
;;   :config
;;   (add-to-list 'company-backends 'company-jedi))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )

(use-package markdown-mode
  :ensure t)

(use-package vimrc-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.vim\\(rc\\)?\\'" . vimrc-mode)))

(use-package rust-mode
  :ensure t)

(use-package haskell-mode
  :ensure t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(electric-pair-mode t)
(show-paren-mode t)
(setq show-paren-delay 0)

; (use-package fill-column-indicator
;   :ensure t)

; (use-package color-theme
;   :ensure t
;   )

; (load-file "~/.opt/ac-essentials/submodules/solarized/emacs-colors-solarized/color-theme-solarized.el")
; (color-theme-solarized-light)

; (use-package tex
;   :ensure auctex
;   :config
;   (setq TeX-auto-save t)
;   (setq TeX-parse-self t)
;   (setq TeX-newline-function 'newline-and-indent)
;   (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
;   (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;   (add-hook 'LaTeX-mode-hook 'reftex-mode)
;   (setq-default TeX-master nil)
;   )

; (use-package reftex
;   :config
;   (setq reftex-use-external-file-finders t)
;   (setq reftex-external-file-finders
;         '(("tex" . "kpsewhich -format=.tex %f")
;           ("bib" . "kpsewhich -format=.bib %f")))
;   )

; (use-package json)


; (tool-bar-mode nil)

; (setq custom-file "~/.emacs.d/ac-custom.el")
; (if (file-exists-p custom-file) (load custom-file))

; (setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
;       backup-by-copying t
;       version-control t
;       delete-old-versions t
;       kept-new-versions 20
;       kept-old-version 5)
; (setq tramp-auto-save-directory "~/.emacs.d/tramp-autosave")
; (setq column-number-mode t)

; (add-to-list 'default-frame-alist '(font . "Inconsolata-16" ))
; (if (display-graphic-p) (set-face-attribute 'default t :font "Inconsolata-16" ))


; (define-key global-map (kbd "RET") 'newline-and-indent)

; (scroll-bar-mode -1)
; (show-paren-mode t)
; (whitespace-mode 1)
; (setq-default indent-tabs-mode nil)
; (setq ediff-window-setup-function 'ediff-setup-windows-plain)
; (setq ediff-split-window-function 'split-window-sensibly)

; (global-hi-lock-mode t)

; (defun python-highlights ()
;   (highlight-phrase "randint")
;   (highlight-phrase "numpy.std")
;   (highlight-phrase "numpy.mean")
;   )

; (add-hook 'python-mode-hook 'python-highlights)

; (setq tramp-use-ssh-controlmaster-options nil)

; (global-linum-mode t) ;; Line numbers

(provide '.emacs)
;;; .emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (haskell-mode rust-mode vimrc-mode markdown-mode company-jedi smex evil-unimpaired rainbow-delimiters company company-mode use-package slime magit key-chord ido-vertical-mode ido-completing-read+ flycheck evil-surround evil-nerd-commenter evil-commentary))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

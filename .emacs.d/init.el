(when (or (string= system-name "kraft")
	  (string= system-name "frost"))
  (load "~/.emacs.d/ac-packages.el"))

(tool-bar-mode nil)

(setq custom-file "~/.emacs.d/ac-custom.el")
(load custom-file)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 20
      kept-old-version 5)
(setq tramp-auto-save-directory "~/.emacs.d/tramp-autosave")

(add-to-list 'default-frame-alist '(font . "Inconsolata-14" ))
(set-face-attribute 'default t :font "Inconsolata-14" )

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(define-key global-map (kbd "RET") 'newline-and-indent)

(show-paren-mode t)
(whitespace-mode 1)
(setq-default indent-tabs-mode nil)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-sensibly)

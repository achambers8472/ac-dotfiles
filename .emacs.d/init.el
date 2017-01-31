(when (or (string= system-name "kraft")
	  (string= system-name "frost")
          (string= system-name "qai"))
  (load "~/.emacs.d/ac-packages.el"))

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

;;; ac-solarized-theme --- Configuration options for solarized theme

;;; Commentary:

;;; Code:
(load-theme 'solarized-dark t)

;; (add-hook 'after-make-frame-functions
;;           (lambda (frame)
;;             (message "Doing this")
;;             (set-frame-parameter frame 'background-mode 'dark)
;;             (set-terminal-parameter frame 'background-mode 'dark)
;;             (enable-theme 'solarized)))

(provide 'ac-solarized-theme)
;;; ac-solarized-theme.el ends here

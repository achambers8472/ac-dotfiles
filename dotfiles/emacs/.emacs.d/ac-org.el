(require 'org)

;;; Code:

(setq org-directory "~/.emacs.d/org")
(setq org-default-notes-file (concat org-directory "/refile.org"))
(setq org-agenda-diary-file (concat org-directory "/diary.org"))
(setq org-agenda-files (list org-directory))
(setq org-use-fast-todo-selection t)

(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-todo-keywords
      '(
        (sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
        (sequence "WAITING(w@)" "|" "CANCELLED(c@)")
        ))

(setq org-todo-keyword-faces
      `(
	("TODO" :foreground "red" :weight bold)
	("NEXT" :foreground "blue" :weight bold)
	("DONE" :foreground "forest green" :weight bold)
	("WAITING" :foreground "orange" :weight bold)
	("CANCELLED" :foreground "forest green" :weight bold)
	))

(setq org-capture-templates
      '(
	("t" "Task" entry (file)
         "* TODO %?\n")
        ("d" "Deadline" entry (file)
         "* TODO %?\nDEADLINE: %^{Date}t\n")
	("s" "Scheduled Task" entry (file)
	 "* TODO %?\nSCHEDULED: %^{Date}t\n")
        ("c" "Code" entry (file)
         "* TODO %?\n%a\n")
        ("e" "Event" entry (file+datetree+prompt org-agenda-diary-file)
         "* %?\n")
        ("w" "Wishlist" entry (file (concat org-directory "/wishlist.org"))
         "* %?\n")
        ("g" "Gift Idea" entry (file (concat org-directory "/gift_ideas.org"))
         "* %?\n")
        ))

(setq org-agenda-prefix-format
      '(
	(agenda . " %i %-12:c%?-12t% s")
	(timeline . "  % s")
	(todo . " %i %-12:c %l")
	(tags . " %i %-12:c")
	(search . " %i %-12:c")
	))

(setq org-refile-targets (quote ((nil :maxlevel . 9)
				 (org-agenda-files :maxlevel . 9))))

(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes (quote confirm))

(setq org-completion-use-ido t)
;; (setq ido-default-file-method 'selected-window)
;; (setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

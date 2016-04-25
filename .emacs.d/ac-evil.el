(require 'evil)
(evil-mode 1)

(require 'key-chord)
(setq key-chord-two-keys-delay 0.2)
(key-chord-mode 1)

(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-replace-state-map "jk" 'evil-normal-state)

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

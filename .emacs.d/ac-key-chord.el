;;; ac-key-chord --- Settings for key-chord package

;;; Commentary:

;;; Code:

(require 'key-chord)
(setq key-chord-two-keys-delay 0.2)
(key-chord-mode 1)

(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-replace-state-map "jk" 'evil-normal-state)
(key-chord-define evil-visual-state-map ",c" 'comment-dwim)

(provide 'ac-key-chord)
;;; ac-key-chord.el ends here

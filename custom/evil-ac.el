(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-word-mode)
(define-key ac-completing-map [tab] 'ac-next)
(define-key ac-completing-map [S-tab] 'ac-previous)
(define-key ac-completing-map "\M-/" 'ac-stop) ; use M-/ to stop completion
(evil-make-intercept-map ac-completing-map) 

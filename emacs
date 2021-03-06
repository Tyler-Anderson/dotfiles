(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get/recipes")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))
(setq
 el-get-sources
 '(el-get))				; el-get is self-hosting
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)
(menu-bar-mode t)
(global-linum-mode 1)
(global-evil-leader-mode 1)
(set-face-attribute 'default nil :font "inconsolata-12")
(add-to-list 'load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/custom/")
(let ((default-directory "~/.emacs.d/elpa/"))
  (setq load-path
        (append
         (let ((load-path (copy-sequence load-path))) ;; Shadow
           (append 
            (copy-sequence (normal-top-level-add-to-load-path '(".")))
            (normal-top-level-add-subdirs-to-load-path)))
         load-path)))

(require 'evil-nerd-commenter)
(require 'pallet)
(require 'color-theme)
(require 'desert-theme)
(require 'evil-leader)
(require 'evil)

(evil-mode 1)

(eval-after-load 'speedbar
  '(progn
     (evil-make-overriding-map speedbar-key-map)
     (evil-make-overriding-map speedbar-file-key-map)
     (evil-make-overriding-map speedbar-buffers-key-map)
     (evil-define-key 'motion speedbar-key-map "h" 'backward-char)
     (evil-define-key 'motion speedbar-key-map "j" 'speedbar-next)
     (evil-define-key 'motion speedbar-key-map "k" 'speedbar-prev)
     (evil-define-key 'motion speedbar-key-map "l" 'forward-char)
     (evil-define-key 'motion speedbar-key-map "i" 'speedbar-item-info)
     (evil-define-key 'motion speedbar-key-map "r" 'speedbar-refresh)
     (evil-define-key 'motion speedbar-key-map "u" 'speedbar-up-directory)
     (evil-define-key 'motion
       speedbar-key-map "o" 'speedbar-toggle-line-expansion)
     (evil-define-key
       'motion speedbar-key-map (kbd "RET") 'speedbar-edit-line)))
(evil-leader/set-leader ",")
(evil-leader/set-key
  "c" 'evilnc-comment-or-uncomment-lines
  "f" 'find-file-in-project
  "b" 'switch-to-buffer
  "z" 'toggle-maximize-buffer
  "nn" 'sr-speedbar-toggle
  "nr" 'nrepl-jack-in
  "ns" 'nrepl-set-ns
  "," 'nrepl-eval-expression-at-point
  "sf" 'nrepl-load-current-buffer
  "rn" 'nrepl-ritz-jack-in
  "N" 'nrepl-switch-to-repl-buffer
  "S"  'paredit-splice-sexp
  "W" 'paredit-wrap-sexp
  "w(" 'paredit-wrap-sexp
  "w[" 'paredit-wrap-square
  "w{" 'paredit-wrap-curly
  ">"  'paredit-forward-slurp-sexp
  "<"  'paredit-backward-barf-sexp
  "J"  'paredit-join-sexps
  "pf" 'projectile-find-file
  "pg" 'projectile-grep
  "pb" 'projectile-switch-to-buffer
  "po" 'projectile-multi-occur
  "pr" 'projectile-replace
  "pi" 'projectile-invalidate-cache
  "pt" 'projectile-regenerate-tags)

;; Scroll around windows 
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)

;(define-globalized-minor-mode real-global-auto-complete-mode
;  auto-complete-mode (lambda ()
;                       (if (not (minibufferp (current-buffer)))
;                           (auto-complete-mode 1))))
;(real-global-auto-complete-mode t)

(require 'auto-complete-config)
(require 'clojure-mode)
(require 'nrepl)
(require 'ac-nrepl)
(add-hook 'clojure-mode-hook
          '(lambda ()
             (font-lock-add-keywords
              nil
              '(("(\\(defwidget\\)\\s-+\\(\\w+\\)"
                 (1 font-lock-keyword-face)
                 (2 font-lock-function-name-face))))))

(defun nrepl-popup-tip-symbol-at-point ()
  (interactive)
  (popup-tip (ac-nrepl-documentation (symbol-at-point))
             :point (ac-nrepl-symbol-start-pos)
             :around t
             :scroll-bar t
             :margin t))
;;(require 'nrepl-inspect)
;; Configure nrepl.el
(setq nrepl-hide-special-buffers t)
(setq nrepl-popup-stacktraces nil)
(setq nrepl-history-file "~/.emacs.d/nrepl-history")

(setenv "PATH" (concat "~/bin:" (getenv "PATH")))
(global-rainbow-delimiters-mode)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-word-mode)
(define-key ac-completing-map [tab] 'ac-next)
(define-key ac-completing-map [S-tab] 'ac-previous)
(define-key ac-completing-map "\M-/" 'ac-stop) ; use M-/ to stop completion
(evil-make-intercept-map ac-completing-map) 


(auto-complete-mode)
;; Repl mode hook
;; Auto completion for NREPL
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(add-hook 'clojure-mode-hook
          (lambda()
          (hl-line-mode -1)
          (auto-complete-mode t)))

;(setq nrepl-tab-command 'indent-for-tab-command)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
(nrepl-enable-on-existing-clojure-buffers)
(add-hook 'nrepl-connected-hook 'nrepl-enable-on-existing-clojure-buffers)
(require 'projectile)
(projectile-global-mode)
(require 'evil-paredit)

(add-hook 'emacs-lisp-mode-hook
          (lambda() 
            (hl-line-mode -1)
            (auto-complete-mode)))


(define-key global-map (kbd "RET") 'newline-and-indent)

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)



(setq evil-normal-state-cursor '("red" box))
(setq evil-insert-state-cursor '("white" hbar))
(set-face-background 'ac-completion-face "darkgray")
(set-face-foreground 'ac-completion-face "white")
(set-face-background 'ac-candidate-face "gray14")
(set-face-foreground 'ac-candidate-face "red")
(require 'eyedropper)
(require 'hexrgb)
(require 'facemenu+)


(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-nrepl-selection-face ((t (:background "dark red" :foreground "gray91"))))
 '(ac-selection-face ((t (:background "dark red" :foreground "gray91"))))
 '(font-lock-builtin-face ((t (:foreground "firebrick1"))))
 '(font-lock-comment-face ((t (:background "gray70" :foreground "Black"))))
 '(font-lock-constant-face ((t (:foreground "navajo white"))))
 '(font-lock-function-name-face ((t (:foreground "LightSkyBlue1" :weight bold))))
 '(highlight ((t (:background "dark red" :foreground "gray96"))))
 '(isearch ((t (:background "gray87" :foreground "dark slate gray"))))
 '(popup-tip-face ((t (:background "gray0" :foreground "gray100"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red2"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "cornsilk1"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "plum1"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "tan1"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "light green"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "yellow1"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "white"))))
 '(region ((t (:background "dark blue" :foreground "gray100")))))
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(exec-path-from-shell-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

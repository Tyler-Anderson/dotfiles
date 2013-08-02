(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/")
    '("melpa" .
        "http://melpa.milkbox.net/packages/"))

(global-linum-mode 1)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(set-face-attribute 'default nil :font "inconsolata-16")
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


(require 'color-theme)
(require 'desert-theme)
(require 'evil-leader)
(require 'evil)
(global-evil-leader-mode)
(evil-mode 1)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "c" 'evilnc-comment-or-uncomment-lines
  "f" 'find-file-in-project
  "b" 'switch-to-buffer
  "z" 'toggle-maximize-buffer
  "nn" 'sr-speedbar-toggle
  )

;; make nrepl act like vimclojure
(evil-leader/set-key
  "ns" 'nrepl-set-ns
  "et" 'nrepl-eval-expression-at-point
  "sf" 'nrepl-load-current-buffer
  "S"  'paredit-splice-sexp)

;; make nrepl act like vimclojure
(evil-leader/set-key
  "ns" 'nrepl-set-ns
  "et" 'nrepl-eval-expression-at-point
  "sf" 'nrepl-load-current-buffer
  "S"  'paredit-splice-sexp)
;;
;; vimclojure paredit controls
(evil-leader/set-key
  "W" 'paredit-wrap-sexp
  "w(" 'paredit-wrap-sexp
  "w[" 'paredit-wrap-square
  "w{" 'paredit-wrap-curly
  ">"  'paredit-forward-slurp-sexp
  "<"  'paredit-backward-barf-sexp
  "S"  'paredit-splice-sexp
  "J"  'paredit-join-sexps)

;; Scroll around windows 
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)

(require 'clojure-mode)
(require 'nrepl)
(require 'ac-nrepl)
;; Configure nrepl.el
(setq nrepl-hide-special-buffers t)
(setq nrepl-popup-stacktraces-in-repl t)
(setq nrepl-history-file "~/.emacs.d/nrepl-history")

(setenv "PATH" (concat "~/bin:" (getenv "PATH")))
(global-rainbow-delimiters-mode)
(require 'auto-complete-config)
(ac-config-default)


(define-key ac-completing-map (kbd "TAB") 'ac-next)
(define-key ac-completing-map (kbd "S-TAB") 'ac-previous)
(define-key ac-completing-map "\M-/" 'ac-stop) ; use M-/ to stop completion
 
;; Repl mode hook
;; Auto completion for NREPL
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
;(setq nrepl-tab-command 'indent-for-tab-command)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
(nrepl-enable-on-existing-clojure-buffers)
;(setq nrepl-popup-stacktraces nil)
(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)
(require 'evil-paredit)
(add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)
(setq evil-normal-state-cursor 'hollow)
(setq evil-insert-state-cursor '("white" hbar))
(set-face-background 'ac-completion-face "darkgray")
(set-face-foreground 'ac-completion-face "white")
(set-face-background 'ac-candidate-face "gray14")
(set-face-foreground 'ac-candidate-face "red")
(require 'po-elscreen)
(require 'evil-elscreen)
(hl-line-mode f)

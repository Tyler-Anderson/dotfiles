;(if (not (package-installed-p '(pallet)))
;  (package-install pallet)) 

;(pallet-update)
 (mapc
  (lambda (package)
    (or (package-installed-p package)
        (if (y-or-n-p (format "Package %s is missing. Install it? " package)) 
 
          (package-install package))))
	'(pallet))
(require 'pallet)
(pallet-init)
;; (mapc
;;  (lambda (package)
;;    (or (package-installed-p package)
;;        (if (y-or-n-p (format "Package %s is missing. Install it? " package)) 
 
;;          (package-install package))))
;; '(ac-helm ac-nrepl ace-jump-mode
;;  auto-complete auto-install carton clojure-project-mode
;;   clojurescript-mode cmuclojure coffee-mode color-file-completion 
;;   color-theme color-theme-twilight elein elixir-mix elixir-mode elscreen erlang 
;;   evil-leader evil-nerd-commenter evil-paredit evil exec-path-from-shell flycheck
;;    flymake flymake-coffee flymake-css flymake-elixir flymake-python-pyflakes 
;;    flymake-ruby flymake-sass flymake-easy fuzzy groovy-mode helm magithub 
;;    midje-mode minimap monokai-theme nodejs-repl nrepl-ritz fringe-helper nrepl 
;;    clojure-mode nurumacs pallet cask paredit-menu parenface parenface-plus po-elscreen 
;;    popup powerline project-mode levenshtein projectile dash python-mode rainbow-delimiters 
;;    s sass-mode haml-mode scala-mode scss-mode slime soothe-theme starter-kit magit ido-ubiquitous smex 
;;    find-file-in-project idle-highlight-mode paredit undo-tree))

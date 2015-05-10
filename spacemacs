;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Configuration Layers
;; --------------------

(setq-default
 ;; List of additional paths where to look for configuration layers.
 ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
 dotspacemacs-configuration-layer-path '()
 ;; List of configuration layers to load.
 dotspacemacs-configuration-layers '()
 ;; A list of packages and/or extensions that will not be install and loaded.
 dotspacemacs-excluded-packages '()
)

;; Settings
;; --------

(setq-default
 ;; Specify the startup banner. If the value is an integer then the
 ;; banner with the corresponding index is used, if the value is `random'
 ;; then the banner is chosen randomly among the available banners, if
 ;; the value is nil then no banner is displayed.
 dotspacemacs-startup-banner 'random
 ;; List of themes, the first of the list is loaded when spacemacs starts.
 ;; Press <SPC> T n to cycle to the next theme in the list (works great
 ;; with 2 themes variants, one dark and one light)
 dotspacemacs-themes '(solarized-light
                       solarized-dark
                       leuven
                       monokai
                       zenburn)
 ;; Default font. The powerline-offset allows to quickly tweak the mode-line
 ;; size to make separators look not too crappy.
 dotspacemacs-default-font '("Source Code Pro"
                             :size 12
                             :weight normal
                             :width normal
                             :powerline-scale 1.1)
 ;; The leader key
 dotspacemacs-leader-key "SPC"
 ;; Major mode leader key is a shortcut key which is the equivalent of
 ;; pressing `<leader> m`
 dotspacemacs-major-mode-leader-key ","
 ;; The command key used for Evil commands (ex-commands) and
 ;; Emacs commands (M-x).
 ;; By default the command key is `:' so ex-commands are executed like in Vim
 ;; with `:' and Emacs commands are executed with `<leader> :'.
 dotspacemacs-command-key ":"
 ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
 ;; the commands bound to the current keystrokes.
 dotspacemacs-guide-key-delay 0.4
 ;; If non nil the frame is fullscreen when Emacs starts up (Emacs 24.4+ only).
 dotspacemacs-fullscreen-at-startup nil
 ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
 ;; Use to disable fullscreen animations in OSX."
 dotspacemacs-fullscreen-use-non-native nil
 ;; If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only).
 ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
 dotspacemacs-maximized-at-startup nil
 ;; A value from the range (0..100), in increasing opacity, which describes the
 ;; transparency level of a frame when it's active or selected. Transparency can
 ;; be toggled through `toggle-transparency'.
 dotspacemacs-active-transparency 90
 ;; A value from the range (0..100), in increasing opacity, which describes the
 ;; transparency level of a frame when it's inactive or deselected. Transparency
 ;; can be toggled through `toggle-transparency'.
 dotspacemacs-inactive-transparency 90
 ;; If non nil unicode symbols are displayed in the mode line (e.g. for lighters)
 dotspacemacs-mode-line-unicode-symbols t
 ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth scrolling
 ;; overrides the default behavior of Emacs which recenters the point when
 ;; it reaches the top or bottom of the screen
 dotspacemacs-smooth-scrolling t
 ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
 dotspacemacs-smartparens-strict-mode nil
 ;; If non nil advises quit functions to keep server open when quitting.
 dotspacemacs-persistent-server nil
 ;; The default package repository used if no explicit repository has been
 ;; specified with an installed package.
 ;; Not used for now.
 dotspacemacs-default-package-repository nil
 )

;; Initialization Hooks
;; --------------------

(defun dotspacemacs/init ()
  "User initialization for Spacemacs. This function is called at the very
 startup."
  )

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."
(setq paradox-github-token "aad0bc1e98fa63513f5c2b0d062ed8bb70228b8c")
(global-linum-mode 1)
(add-to-list 'load-path "~/.tuareg/")
(add-to-list 'load-path "~/.merlin/")
(load "tuareg-site-file")
(autoload 'fsharp-mode "fsharp-mode"  "Major mode for editing F# code." t)
;(add-to-list 'auto-mode-alist '("\\.fs[iylx]?$" . fsharp-mode))
;(push " ~/.emacs.d/venice/merlin/emacs" load-path) ; directory containing merlin.el

(setq merlin-command "~/.merlin/ocamlmerlin")  ; needed only if ocamlmerlin not already in your PATH
(autoload 'merlin-mode "merlin" "Merlin mode" t)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(push "~/venice" load-path)
(push "~/venice/themes" load-path)
 (require 'desert-theme)

 (setenv "PATH" (concat "~/bin:" (getenv "PATH")))
 (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
 (setq exec-path (append exec-path '("/usr/local/bin")))
 (add-hook 'after-init-hook 'ycmd-setup)
; (add-hook 'after-init-hook '(company-ycmd-setup))
 (set-variable 'ycmd-server-command '("python" "~/dev/misc/ycmd"))
;(menu-bar-mode)

(add-hook 'clojure-mode 'cider-mode)
;(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'javascript-mode 'js2-mode)
(add-hook 'js2-mode 'ac-js2)

;; Do not write anything in this section. This is where Emacs will
;; auto-generate custom variable definitions.


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-requires 4)
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-selection-face ((t (:background "black" :foreground "dodger blue"))))
 '(ac-yasnippet-candidate-face ((t (:background "black" :foreground "#b58900"))))
 '(cursor ((t (:background "SkyBlue2" :foreground "gray30"))))
 '(font-lock-builtin-face ((t (:foreground "firebrick1"))))
 '(font-lock-comment-face ((t (:background "gray80" :foreground "Black"))))
 '(font-lock-constant-face ((t (:foreground "navajo white"))))
 '(font-lock-function-name-face ((t (:foreground "LightSkyBlue1" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "burlywood" :weight bold))))
 '(font-lock-type-face ((t (:foreground "firebrick3" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "LightSkyBlue1" :slant italic :weight semi-light))))
 '(highlight ((t (:background "dark red" :foreground "gray96"))))
 '(hl-line ((t (:background "dark red" :foreground "gray100"))))
 '(isearch ((t (:background "gray87" :foreground "dark slate gray"))))
 '(linum ((t (:background "gray20" :foreground "gray81"))))
 '(mode-line-buffer-id ((t (:foreground "LightBlue3" :weight bold))))
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
 '(region ((t (:background "dark blue" :foreground "gray100"))))
 '(secondary-selection ((t (:background "controlHighlightColor" :foreground "dark cyan"))))
 '(sp-pair-overlay-face ((t (:background "gray16" :foreground "dodger blue"))))
 '(spacemacs-lisp-face ((t (:inherit mode-line :background "dark cyan" :foreground "light green" :box (:line-width 1 :color "#657b83")))))
 '(spacemacs-motion-face ((t (:foreground "RosyBrown2" :box (:line-width 1 :color "#657b83")))))))

(menu-bar-mode 1)
(set-face-attribute 'default nil :font "inconsolata-12")
(setenv "PATH" (concat "~/bin:" (getenv "PATH")))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))


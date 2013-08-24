(evil-leader/set-key
  "c"  'evilnc-comment-or-uncomment-lines
  "f"  'find-file-in-project
  "b"  'switch-to-buffer
  "z"  'toggle-maximize-buffer
  "nn" 'sr-speedbar-toggle
  "nr" 'nrepl-jack-in
  "ns" 'nrepl-set-ns
  ","  'nrepl-eval-expression-at-point
  "sf" 'nrepl-load-current-buffer
  "rn" 'nrepl-ritz-jack-in
  "N"  'nrepl-switch-to-repl-buffer

  "S"  'paredit-splice-sexp
  "W"  'paredit-wrap-sexp
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

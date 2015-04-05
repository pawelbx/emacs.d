(winner-mode 1)

(dolist (boring-buffer'("*helm M-x*"
                        "*helm mini*"
                        "*Helm Completions*"
                        "*Helm Find Files*"
                        "*helm mu*"
                        "*helm mu contacts*"
                        "*helm-mode-describe-variable*"
                        "*helm-mode-describe-function*"
                        "*helm projectile*"
                        "*helm grep*"))
  (add-to-list 'winner-boring-buffers boring-buffer))

(provide 'init-winner)

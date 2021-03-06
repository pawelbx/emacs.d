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

(global-set-key (kbd "C-c b") 'winner-undo)
(global-set-key (kbd "C-c n") 'winner-redo)

(provide 'init-winner)

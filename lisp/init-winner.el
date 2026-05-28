(use-package winner
  :ensure nil
  :init
  (winner-mode 1)
  :config
  (dolist (boring-buffer '("*Completions*"
                          "*Compile-Log*"
                          "*Apropos*"
                          "*Messages*"
                          "*Backtrace*"))
    (add-to-list 'winner-boring-buffers boring-buffer)))
(provide 'init-winner)

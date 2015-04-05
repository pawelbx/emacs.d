(require 'f)
(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-agenda-file-regexp "\\`todo\\.org\\'")
(setq org-agenda-files (cons "~/notes/" (f-directories "~/notes/" nil t)))
(setq org-log-done 'time)

(provide 'init-org)

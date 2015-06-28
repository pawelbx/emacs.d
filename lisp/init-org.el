(require 'f)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c o") 'org-capture)

(setq org-agenda-file-regexp "\\`todo\\.org\\'")
(setq org-agenda-files (cons "~/notes/" (f-directories "~/notes/" nil t)))
(setq org-log-done 'time)
(setq org-startup-indented 1)

(setq org-capture-templates
      '(("m" "entry for meditation journal" entry (file "~/notes/personal/meditation/journal.org")
         "\n* %u\n :PROPERTIES:\n :TIME: %? minutes\n :END:\n** Notes\n - ")
        ("l" "entry for life todo list" entry (file "~/notes/life.org")
         "\n* TODO %?")
        ("w" "entry for work todo list" entry (file+headline "~/notes/work.org" "Inbox")
         "** TODO %?")
        ))
(provide 'init-org)

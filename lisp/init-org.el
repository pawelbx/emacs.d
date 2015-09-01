(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c o") 'org-capture)

(setq org-agenda-file-regexp "\\`todo\\.org\\'")
(setq org-agenda-files '("~/notes/life.org" "~/notes/work.org"))
(setq org-log-done 'time)
(setq org-startup-indented 1)

(require 'org-habit)
(add-to-list 'org-modules 'org-habit)

(setq org-capture-templates
      '(("m" "entry for meditation journal" entry (file "~/notes/personal/meditation/journal.org")
         "\n* %u\n :PROPERTIES:\n :TIME: %? minutes\n :END:\n** Notes\n - ")
        ("n" "entry for thoughts" entry (file+headline "~/notes/thoughts.org" "Inbox")
         "** %u\n - %?")
        ("l" "entry for life todo list" entry (file+headline "~/notes/life.org" "Inbox")
         "\n* TODO %?")
        ("w" "entry for work todo list" entry (file+headline "~/notes/work.org" "Inbox")
         "** TODO %?")
        ))
(provide 'init-org)

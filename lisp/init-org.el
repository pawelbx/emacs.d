(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c o") 'org-capture)

(setq org-agenda-file-regexp "\\`todo\\.org\\'")
(setq org-agenda-files '("~/text/life.org" "~/text/work.org"))
(setq org-log-done 'time)
(setq org-startup-indented 1)

(require 'org-habit)
(add-to-list 'org-modules 'org-habit)

(setq org-capture-templates
      '(("m" "entry for meditation journal" entry (file "~/text/personal/meditation/journal.org")
         "\n* %u\n :PROPERTIES:\n :TIME: %? minutes\n :END:\n** Notes\n - ")
        ("n" "entry for thoughts" entry (file+headline "~/text/thoughts.org" "Inbox")
         "** %u\n - %?")
        ("l" "entry for life todo list" entry (file+headline "~/text/life.org" "Inbox")
         "\n* TODO %?")
        ("w" "entry for work todo list" entry (file+headline "~/text/work.org" "Inbox")
         "** TODO %?")
        ))

(defun org-mode-hook-setup ()
  ; from http://blog.binchen.org/posts/emacs-auto-completion-for-non-programmers.html
  (make-local-variable 'company-backends)
  (add-to-list 'company-backends 'company-ispell))

(add-hook 'org-mode-hook 'org-mode-hook-setup)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((haskell . t)
   (emacs-lisp . t)
   (ruby . t)))

(provide 'init-org)
(use-package org
  :ensure nil ;; Built-in
  :bind (("C-c a" . org-agenda)
         ("C-c o" . org-capture))
  :hook (org-mode . (lambda ()
                      ;; Modern way to set local backends
                      (setq-local company-backends '(company-ispell company-capf))))
  :config

  (setq org-agenda-files '("~/Dropbox/life/today.org" "~/Dropbox/work/today.org")
        org-log-done 'time
        org-startup-indented t
        org-habit-show-habits-only-for-today t)

  (require 'org-tempo)
  (require 'org-habit)

  (setq org-capture-templates
        '(("n" "daily work log" entry (file+datetree "~/Dropbox/work/daily-log.org")
           "* %U - %?")
          ("o" "daily life log" entry (file+datetree "~/Dropbox/life/daily-life.org.gpg")
           "* %U - %?")
          ("l" "entry for life todo list" entry (file+headline "~/Dropbox/life/life.org" "Inbox")
           "\n* TODO %?")
          ("w" "entry for work todo list" entry (file+headline "~/Dropbox/work/work.org" "Inbox")
           "** TODO %?")))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((haskell . t)
     (emacs-lisp . t)
     (ruby . t)))

  (defun my/org-export-calendar-after-save ()
    (when (and (buffer-file-name) 
               (string-match-p "Dropbox/life/today.org" (buffer-file-name)))
      (message "Exporting calendar...")
      (async-shell-command "emacs --script ~/projects/scripts/export-org-calendar.el")))
  
  (add-hook 'after-save-hook #'my/org-export-calendar-after-save))

(provide 'init-org)

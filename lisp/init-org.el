(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c o") 'org-capture)

(setq org-agenda-file-regexp "\\`[^.].*\\.org\\'")
(setq org-agenda-files '("~/Dropbox/life/today.org" "~/Dropbox/work/today.org"))
(setq org-log-done 'time)
(setq org-startup-indented 1)

(require 'org-habit)
(add-to-list 'org-modules 'org-habit)

(setq org-capture-templates
      '(("n" "daily work log" entry (file+datetree "~/Dropbox/work/daily-log.org")
         "* %U - %?")
        ("o" "daily life log" entry (file+datetree "~/Dropbox/life/daily-life.org.gpg")
         "* %U - %?")
        ("l" "entry for life todo list" entry (file+headline "~/Dropbox/life/life.org" "Inbox")
         "\n* TODO %?")
        ("w" "entry for work todo list" entry (file+headline "~/Dropbox/work/work.org" "Inbox")
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

(add-hook 'after-save-hook
          (lambda ()
            (when (string-match-p "/Dropbox/life/today.org" (buffer-file-name))
              (print "Exporting calendar")
              (async-shell-command "emacs --script ~/projects/scripts/export-org-calendar.el"))))

(provide 'init-org)

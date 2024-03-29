; from xahlee
(defun word-def-lookup ()
  "Look up the word under cursor in Wikipedia.
If there is a text selection (a phrase), use that.

This command switches to browser."
  (interactive)
  (let (word)
    (setq word
          (if (use-region-p)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (current-word)))
    (setq word (replace-regexp-in-string " " "_" word))
    (eww (concat "http://www.google.com/search?q=define:" word))))

(global-set-key (kbd "<f8>") 'word-def-lookup)

;backups and undo tree
(let* ((backup-dir (expand-file-name "~/.backups"))
       (undotree-dir (expand-file-name "undo-tree" backup-dir)))
  (unless (file-exists-p backup-dir) (make-directory backup-dir))
  (unless (file-exists-p undotree-dir) (make-directory undotree-dir))
  (setq undo-tree-history-directory-alist `(("." . ,undotree-dir)))
  (setq backup-by-copying t ; don't clobber symlinks
        backup-directory-alist (list (cons "." backup-dir))
        delete-old-versions t
        version-control t  ;use versioned backups
        kept-new-versions 8
        kept-old-versions 4)
  )

(provide 'init-other)

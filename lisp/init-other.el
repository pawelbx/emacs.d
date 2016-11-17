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

(provide 'init-other)

(require-package 'hydra)

(eval-after-load 'hydra
  '(progn
     (global-set-key
      (kbd "C-n")
      (defhydra hydra-move
        (:body-pre (next-line))
        "move"
        ("n" next-line)
        ("p" previous-line)
        ("f" forward-char)
        ("b" backward-char)
        ("a" beginning-of-line)
        ("e" move-end-of-line)
        ("v" scroll-up-command)
        ;; Converting M-v to V here by analogy.
        ("V" scroll-down-command)
        ("l" recenter-top-bottom)))))

(provide 'init-hydra)

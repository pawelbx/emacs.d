(setq inhibit-startup-screen t)
(toggle-indicate-empty-lines)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Set 90% background transparency but keep text 100% solid
;; (add-to-list 'default-frame-alist '(alpha-background . 95))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(add-to-list 'display-buffer-alist
  (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))

(provide 'init-gui-frames)

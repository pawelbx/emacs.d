(require-package 'web-mode)

(after-load 'web-mode
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-hook 'web-mode-hook
            (lambda ()
              (setq web-mode-markup-indent-offset 2)
              (setq eb-mode-code-indent-offset 2)
              (setq web-mode-css-indent-offset 2))))

(provide 'init-web)

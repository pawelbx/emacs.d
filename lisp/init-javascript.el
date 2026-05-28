(use-package typescript-ts-mode
  :ensure nil
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode))
  :hook (typescript-ts-mode . subword-mode)
  :config
  (setq typescript-ts-mode-indent-offset 2))

(use-package js
  :ensure nil
  :mode ("\\.js\\'" . js-ts-mode)
  :hook (js-ts-mode . subword-mode)
  :config
  (setq js-indent-level 2))

;; (use-package apheleia
;;   :ensure t
;;   :config
;;   (apheleia-global-mode +1))

(provide 'init-javascript)

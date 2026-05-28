(use-package ruby-ts-mode
  :ensure nil ; Built-in to Emacs 29+
  :mode (("\\.rb\\'"       . ruby-ts-mode)
         ("Rakefile\\'"    . ruby-ts-mode)
         ("\\.rake\\'"     . ruby-ts-mode)
         ("Gemfile\\'"     . ruby-ts-mode)
         ("\\.gemspec\\'"  . ruby-ts-mode)
         ("\\.ru\\'"       . ruby-ts-mode)
         ("Kirkfile\\'"    . ruby-ts-mode))
  :init
  ;; Remap classic ruby-mode to tree-sitter version globally
  (add-to-list 'major-mode-remap-alist '(ruby-mode . ruby-ts-mode))
  :hook ((ruby-ts-mode . subword-mode)
         ;; (ruby-ts-mode . robe-mode)
         (ruby-ts-mode . eglot-ensure))
  :bind (:map ruby-ts-mode-map
         ("TAB" . indent-for-tab-command)
         ([f6]  . recompile)
         ([f7]  . ruby-compilation-this-test)
         ([S-f7] . ruby-compilation-this-buffer))
  :config
  (setq ruby-ts-highlight-level 4) ; Maximum syntax color detail

  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '((ruby-mode ruby-ts-mode) . ("ruby-lsp"))))

  ;; Unified Environment/Path Setup
  (let ((rbenv-shims (expand-file-name "~/.rbenv/shims"))
        (rbenv-bin   (expand-file-name "~/.rbenv/bin")))
    (setenv "PATH" (concat rbenv-shims ":" rbenv-bin ":" (getenv "PATH")))
    (add-to-list 'exec-path rbenv-shims)
    (add-to-list 'exec-path rbenv-bin)))

;; (use-package robe
;;   :ensure t
;;   :defer t
;;   :config
;;   ;; Integration: Tell Robe to use inf-ruby
;;   (add-hook 'robe-mode-hook 'robe-start))

(use-package inf-ruby
  :ensure t
  :defer t)

(use-package ruby-compilation
  :ensure t
  :defer t)

(use-package yari
  :ensure t
  :bind (("C-c r i" . yari))
  :init (defalias 'ri 'yari))

(use-package yaml-ts-mode
  :ensure nil
  :mode "\\.ya?ml\\'")

(provide 'init-ruby)

(use-package counsel
  :ensure t
  :diminish ; Keep your modeline clean
  :bind (("M-x" . counsel-M-x)
         ("C-s" . swiper)
         ("C-x C-f" . counsel-find-file)
         ("C-c g" . counsel-git)
         ("C-c j" . counsel-git-grep)
         ("C-c k" . counsel-rg)      ; Fast search for Ruby/Go projects
         ("C-x l" . counsel-locate))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-initial-inputs-alist nil ; Clean start: no ^ in search
        ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (counsel-rg . ivy--regex-plus)
          (t . ivy--regex-fuzzy))) ; Use fuzzy for M-x and files
  (counsel-mode 1))

(use-package flx
  :ensure t)

;; (use-package ivy-rich
;;   :ensure t
;;   :after counsel
;;   :init (ivy-rich-mode 1))

(provide 'init-ivy)

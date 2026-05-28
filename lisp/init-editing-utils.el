(use-package emacs
  :init

  (if (fboundp 'pixel-scroll-precision-mode)
      (pixel-scroll-precision-mode 1))

  (global-auto-revert-mode 1)
  (setq global-auto-revert-non-file-buffers t
        auto-revert-verbose nil)

  (show-paren-mode 1)
  (electric-pair-mode 1)
  (column-number-mode t)
  (indent-tabs-mode nil)
  (cua-mode 1)

  (setq scroll-preserve-screen-position 'always
        mouse-yank-at-point t)

  (setq blink-cursor-interval 0.4
        buffers-menu-max-size 30)

  (setq ediff-split-window-function 'split-window-horizontally
        ediff-window-setup-function 'ediff-setup-windows-plain)

  (setq-default indent-tabs-mode nil) ; Use spaces instead of tabs
  (setq whitespace-style
        '(face tabs spaces trailing space-before-tab
          newline indentation empty space-after-tab
          space-mark tab-mark newline-mark))

  (setq-default fill-column 110)

  :hook
  (prog-mode . display-fill-column-indicator-mode)
  (prog-mode . whitespace-mode)

  :config
  (setq show-paren-delay 0
        show-paren-style 'parenthesis
        show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t))


(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode 1)
  :config
  (setq undo-tree-history-directory-alist
        `(("." . ,(expand-file-name "undo" user-emacs-directory))))
  (setq undo-tree-auto-save-history t))

(use-package symbol-overlay
  :ensure t
  :diminish
  :bind (("M-i" . symbol-overlay-put)
         ("M-n" . symbol-overlay-jump-next)
         ("M-p" . symbol-overlay-jump-prev))
  :hook (prog-mode . symbol-overlay-mode))

(setq-default c-basic-offset 2)


(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

;; (use-package browse-kill-ring
;;   :ensure t
;;   :bind ("M-y" . browse-kill-ring)
;;   :config
;;   (setq browse-kill-ring-quit-action 'save-and-restore))

(use-package avy
  :ensure t
  :bind (("C-;" . avy-goto-char-timer) ; Type 1-2 chars then jump
         ("C-:" . avy-goto-word-1)))   ; Jump to word start

(use-package ace-window
  :ensure t
  :bind ("M-o" . ace-window))

(use-package multiple-cursors
  :ensure t
  :bind (("C->"     . mc/mark-next-like-this)
         ("C-<"     . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package move-dup
  :ensure t
  :diminish move-dup-mode
  :init (global-move-dup-mode 1)
  :bind (("M-S-<up>" . move-dup-move-line-up)      ; Move line up
         ("M-S-<down>" . move-dup-move-line-down)  ; Move line down
         ("C-c d" . move-dup-duplicate-down)       ; Duplicate line down
         ("C-c u" . move-dup-duplicate-up)))       ; Duplicate line up

(use-package highlight-escape-sequences
  :ensure t
  :diminish hes-mode
  :init (hes-mode 1))

(use-package which-key
  :ensure t
  :diminish
  :init
  (which-key-mode 1)
  :config
  ;; How long to wait (in seconds) before the popup appears
  (setq which-key-idle-delay 0.5)
  ;; Show it at the bottom of the frame
  (which-key-setup-side-window-bottom))

(defun my/find-file-as-root ()
  "Reopen the current file as root (sudo), preserving point."
  (interactive)
  (let ((file (buffer-file-name))
        (p (point)))
    (if (and file (file-exists-p file))
        (progn
          (find-file (concat "/sudo:root@localhost:" file))
          (goto-char p))
      (user-error "Current buffer is not visiting a file!"))))

(global-set-key (kbd "C-c v") #'my/find-file-as-root)

(provide 'init-editing-utils)

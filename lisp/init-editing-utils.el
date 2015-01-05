(when (fboundp 'electric-pair-mode)
  (electric-pair-mode))

(when (fboundp 'global-prettify-symbols-mode)
  (global-prettify-symbols-mode))

(setq-default
 blink-cursor-interval 0.4
 buffers-menu-max-size 30
 column-number-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
 mouse-yank-at-point t
 scroll-preserve-screen-position 'always
 )

(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

;;Whitespace
(defun sanityinc/no-trailing-whitespace ()
  "Turn off display of trailing whitespace in this buffer."
  (setq show-trailing-whitespace nil))

;; But don't show trailing whitespace in SQLi, inf-ruby etc.
(dolist (hook '(special-mode-hook
                eww-mode-hook
                term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                twittering-mode-hook
                minibuffer-setup-hook))
  (add-hook hook #'sanityinc/no-trailing-whitespace))

(setq whitespace-style
      '(tabs spaces trailing space-before-tab
             newline indentation empty space-after-tab space-mark tab-mark newline-mark))


(require-package 'undo-tree)
(global-undo-tree-mode)
(diminish 'undo-tree-mode)
(require-package 'highlight-symbol)

(dolist (hook '(prog-mode-hook html-mode-hook css-mode-hook))
  (add-hook hook 'highlight-symbol-mode)
  (add-hook hook 'highlight-symbol-nav-mode))
(eval-after-load 'highlight-symbol
  '(diminish 'highlight-symbol-mode))

(show-paren-mode 1)

(require-package 'browse-kill-ring)

(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(cua-mode 1)

(require-package 'ace-jump-mode)
(global-set-key (kbd "C-;") 'ace-jump-mode)
(global-set-key (kbd "C-:") 'ace-jump-word-mode)

(require-package 'multiple-cursors)
;; multiple-cursors
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-+") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;----------------------------------------------------------------------------
;; Fill column indicator
;;----------------------------------------------------------------------------
(require-package 'fill-column-indicator)
(defun sanityinc/prog-mode-fci-settings ()
  (turn-on-fci-mode)
  (when show-trailing-whitespace
    (set (make-local-variable 'whitespace-style) '(face trailing))
    (whitespace-mode 1)))

(defun sanityinc/fci-enabled-p ()
  (and (boundp 'fci-mode) fci-mode))

(defvar sanityinc/fci-mode-suppressed nil)
(defadvice popup-create (before suppress-fci-mode activate)
  "Suspend fci-mode while popups are visible"
  (let ((fci-enabled (sanityinc/fci-enabled-p)))
    (when fci-enabled
      (set (make-local-variable 'sanityinc/fci-mode-suppressed) fci-enabled)
      (turn-off-fci-mode))))
(defadvice popup-delete (after restore-fci-mode activate)
  "Restore fci-mode when all popups have closed"
  (when (and sanityinc/fci-mode-suppressed
             (null popup-instances))
    (setq sanityinc/fci-mode-suppressed nil)
    (turn-on-fci-mode)))

;; Regenerate fci-mode line images after switching themes
(defadvice enable-theme (after recompute-fci-face activate)
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (sanityinc/fci-enabled-p)
        (turn-on-fci-mode)))))

(require-package 'move-dup)
(global-set-key [M-up] 'md/move-lines-up)
(global-set-key [M-down] 'md/move-lines-down)
(global-set-key [M-S-up] 'md/move-lines-up)
(global-set-key [M-S-down] 'md/move-lines-down)

(require-package 'highlight-escape-sequences)
(hes-mode)

(require-package 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c" "C-x 4" "C-x 5"
                                     "C-c ;" "C-c ; f" "C-c ' f"
                                     "C-x n" "C-c p" "C-c z"))
(guide-key-mode 1)
(diminish 'guide-key-mode)

(provide 'init-editing-utils)
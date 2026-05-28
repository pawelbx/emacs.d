(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca elpaca-use-package
  (elpaca-use-package-mode))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(use-package cl-lib
  :ensure nil
  :demand t)

(use-package diminish
  :ensure t)

(use-package f
  :ensure t)

(require 'init-ts)
(require 'init-gui-frames)
(require 'init-uniquify)
;(require 'init-haml)
(require 'init-flycheck)
(require 'init-editing-utils)
(require 'init-css)
(require 'init-company)
(require 'init-git)
(require 'init-flyspell)
(require 'init-isearch)
(require 'init-ivy)
;(require 'init-elfeed)
(require 'init-winner)
(require 'init-projectile)
(require 'init-ruby)
(require 'init-org)
(require 'init-javascript)
;(require 'init-haskell) ;X
;; (require 'init-go) ;X
(require 'init-dired)
(require 'init-other)
(require 'init-erc)
(require 'init-web)
(require 'init-hydra)
(require 'custom-funcs)

(setq-default tab-width 2)

(use-package gist
  :ensure t)

(use-package solarized-theme
  :ensure t
  :config (load-theme 'solarized-dark t))

(use-package nerd-icons
  :ensure (:wait t))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 35)
  (doom-modeline-bar-width 4)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-font-family "nf"))

(use-package desktop
  :config
  (setq desktop-restore-eager 20
        desktop-save 'if-exists) ;; Only save if a desktop file already exists
  (desktop-save-mode 1))

(global-hl-line-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

(set-face-attribute 'default nil
                    :family "JetBrains Mono"
                    :height 120)

(setq-default ispell-program-name "aspell")
(global-set-key (kbd "C-c c") 'ediff-regions-wordwise)
(global-set-key (kbd "M-o") 'other-window)

(global-set-key (kbd "M-1") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-`") 'delete-window) ; close current pane
(global-set-key (kbd "M-2") 'split-window-vertically) ; split pane top/bottom
(global-set-key (kbd "M-3") 'split-window-horizontally) ; split pane top/bottom

(when (string-equal system-type "darwin") ; Mac OS X
  (setq mac-option-key-is-meta nil)
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (setq mac-right-option-modifier 'none))

;; --- Core Editor Behavior ---
(use-package emacs
  :init
  (defalias 'list-buffers 'ibuffer)

  (put 'dired-find-alternate-file 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil)
  (put 'narrow-to-region 'disabled nil)

  :config
  (setq custom-file (expand-file-name "customs.el" user-emacs-directory))
  (when (file-exists-p custom-file)
    (load custom-file)))


(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1))

(use-package visual-regexp
  :ensure t
  :bind (("C-c q" . vr/query-replace)
         ("C-c r" . vr/replace)))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init)

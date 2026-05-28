(setq package-enable-at-startup nil)

(setq gc-cons-threshold (* 50 1024 1024)
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 8 1024 1024)
                  gc-cons-percentage 0.1)))

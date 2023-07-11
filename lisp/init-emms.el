(require-package 'emms)

(emms-all)

(setq emms-player-list '(emms-player-mpv)
      emms-info-functions '(emms-info-native))

(provide 'init-emms)

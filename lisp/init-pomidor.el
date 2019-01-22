(require-package 'pomidor)

(after-load "pomidor"
  (setq pomidor-sound-tick nil
        pomidor-sound-tack nil
        pomidor-sound-overwork (expand-file-name (concat pomidor-dir "overwork.wav"))
        pomidor-sound-break-over (expand-file-name (concat pomidor-dir "overwork.wav")))

  (setq pomidor-play-sound-file
        (lambda (file)
          (start-process "my-pomidor-play-sound"
                         nil
                         "mplayer"
                         file))))

(provide 'init-pomidor)

(defun interleave-lines ()
  "interleaves lines in region with lines from the beginning of the buffer"
    (interactive)
    (let ((region-lines
           (split-string
            (buffer-substring-no-properties (region-beginning) (region-end)) "\n")))
      (goto-char (point-min))
      (dolist (line region-lines)
        (end-of-line)
        (insert "\n" line)
        (forward-line 1))))

(defun count-matches-each (regex-str)
  "Detects dups"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "- key: " nil t)
      (let*  ((key (buffer-substring-no-properties (point) (line-end-position)))
              (num-matches (count-matches (concat key "$") (line-end-position))))
        (when (> num-matches 0)
          (message key))))))

(defun lfm-deploy-tile (deploy-code) ;;tile-name)
  "deploys specified tile to local env"
  (interactive "p\n");;sWhich tile to deploy: ")
  (require 'f)
  (let* ((deploy-type (if (>= deploy-code 4) "deploy" "local-deploy"))
         (root-tile-dir "/home/pbokota/projects/tiles/")
         (tile-name "")
         (tile-to-deploy (cond
                          ;;((not (equal tile-name "")) tile-name)
                          ((and (equal tile-name "") (f-descendant-of? (buffer-file-name) root-tile-dir))
                           (car (f-split (f-relative (buffer-file-name) root-tile-dir))))
                          (t (error "no such tile")))))
    (async-shell-command
     (concat "make -C " root-tile-dir " " deploy-type " TILE_NAME=" tile-to-deploy))))

(defun load-template()
  "load current story template"
  (interactive)
  (shell-command (concat "bundle exec rake story_templates:load[" (buffer-name) "]")))

(defun build-dcr ()
  "build dcr and copies it to bi-api"
  (interactive)
  (shell-command "(cd /home/pbokota/projects/dcr/bin/ && bundle exec export-data-points)")
  (copy-file "/home/pbokota/projects/dcr/data-points.csv" "/home/pbokota/projects/lfm-bi-api/bi-api/data-points.csv" t))

(provide 'custom-funcs)

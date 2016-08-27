(require-package 'elfeed)

(global-set-key (kbd "C-x w") 'elfeed)

;; Somewhere in your .emacs file
(setq elfeed-feeds
      '(("http://twitrss.me/twitter_user_to_rss/?user=%40jwiegley" twitter dev)
        ("http://ejohn.org/category/blog/feed/" dev js)
        ("http://feeds.feedburner.com/nczonline" dev js)
        ("http://feeds.feedburner.com/dailyjs" dev js)
        ("http://blog.binchen.org/rss.xml" dev emacs)
        ("http://nullprogram.com/feed/" dev emacs)
        ("http://sachachua.com/blog/feed/" productivity emacs)
        ("http://feeds.feedburner.com/html5rocks" html5)
        ("http://feeds.feedburner.com/Truthdig/ChrisHedges" politics)
        ("https://blog.nader.org/feed/" politics)
        ("http://www1.cs.columbia.edu/~unger/myBlog/rssFeed.xml")))

(provide 'init-elfeed)

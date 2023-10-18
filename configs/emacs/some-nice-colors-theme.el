;;; some-nice-colors-theme.el --- some-nice-colors
;;; Version: 1.0
;;; Commentary:
;;; A theme called some-nice-colors
;;; Code:

(defvar palette/primary "#a15c79")
(defvar palette/primary-dark "#501825")
(defvar palette/secondary "#bccc9a")
(defvar palette/yellowish "#ffd187")
(defvar palette/blueish "#84acbd")
(defvar palette/darkfg "#3e3834")
(defvar palette/darkbg "#070506")
(defvar palette/darkbg2 "#201110")

;; (load-theme 'some-nice-colors t)

(deftheme some-nice-colors "DOCSTRING for some-nice-colors")
(custom-theme-set-faces 'some-nice-colors
  `(default ((t (:foreground "#c4b3ad" :background "#000000"))))
  `(cursor ((t (:background "#fdf4c1" ))))
  `(fringe ((t (:background "#000000" ))))
  `(mode-line ((t (:foreground ,palette/secondary :background "#222222" ))))
  `(mode-line-inactive ((t (:foreground ,palette/secondary :background "#111111" ))))
  `(region ((t (:background ,palette/primary-dark))))
  `(secondary-selection ((t (:background "#3e3834" ))))
  `(font-lock-builtin-face ((t (:foreground ,palette/secondary))))
  `(font-lock-comment-face ((t (:foreground "#727272" ))))
  `(font-lock-function-name-face ((t (:foreground ,palette/primary))))
  `(font-lock-keyword-face ((t (:foreground ,palette/secondary))))
  `(font-lock-string-face ((t (:foreground ,palette/yellowish))))
  `(font-lock-type-face ((t (:foreground "#F6AE99" ))))
  `(font-lock-constant-face ((t (:foreground ,palette/primary))))
  `(font-lock-variable-name-face ((t (:foreground ,palette/blueish ))))
  `(minibuffer-prompt ((t (:foreground ,palette/yellowish :bold t ))))
  `(font-lock-warning-face ((t (:foreground "#be4222" :bold t ))))
  `(highlight-numbers-number ((t (:foreground ,palette/primary))))
  `(line-number ((t :foreground ,palette/darkfg)))
  `(org-block-begin-line ((t :height 80 :foreground ,palette/darkfg)))
  `(org-block-end-line ((t :height 80 :foreground ,palette/darkfg)))
  `(org-block ((t (:background ,palette/darkbg))))
  `(org-level-1 ((t :height 200 :foreground ,palette/primary)))
  `(org-level-2 ((t :height 150 :foreground ,palette/yellowish)))
  `(org-level-3 ((t :height 130 :foreground ,palette/blueish)))
  `(org-level-4 ((t :height 120)))
  `(org-level-5 ((t :height 120)))
  `(org-level-6 ((t :height 120)))
  `(org-document-info-keyword ((t :height 80 :foreground ,palette/darkfg)))
  `(org-document-title ((t :height 220 t :foreground ,palette/blueish)))
  `(org-document-info ((t :height: 150 :foreground ,palette/blueish))))

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'some-nice-colors)

;;; some-nice-colors-theme.el ends here

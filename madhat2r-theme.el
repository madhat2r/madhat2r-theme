;;; madhat2r-theme.el --- Color theme with a dark and light versions.

;; Copyright (C) 2015-2016 Micah Duke

;; Author: Micah Duke
;; URL: <https://github.com/madhat2r/madhat2r-theme>
;;
;; Version: 0.1
;; Keywords: color, theme
;; Package-Requires: ((emacs "24"))

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:

;;; Credits:

;; Thanks to Nasser Alshammari of the Spacemacs Theme which was used as the skeleton:
;; https://github.com/nashamri/spacemacs-theme

;;; Code:

(defmacro madhat2r-dyn-let (varlist fn setfaces setvars)
  (list 'let (append varlist (funcall fn)) setfaces setvars))

(defgroup madhat2r-theme nil
  "Madhat2r-theme options."
  :group 'faces)

(defcustom madhat2r-theme-comment-bg nil
  "Use a background for comment lines."
  :type 'boolean
  :group 'madhat2r-theme)

(defcustom madhat2r-theme-org-agenda-height t
  "Use varying text heights for org agenda."
  :type 'boolean
  :group 'madhat2r-theme)

(defcustom madhat2r-theme-org-height nil
  "Use varying text heights for org headings."
  :type 'boolean
  :group 'madhat2r-theme)


(defcustom madhat2r-theme-custom-colors nil
  "Specify a list of custom colors"
  :type 'alist
  :group 'madhat2r-theme)


(defun madhat2r-true-color-p ()
  (or
   (display-graphic-p)
   (= (tty-display-color-cells) 16777216)))

(defun madhat2r-custom-colors-override ()
  (mapcar (lambda (x) (list (car x) (cdr x)))
          madhat2r-theme-custom-colors))

(defun create-madhat2r-theme ()
  (madhat2r-dyn-let ((class '((class color) (min-colors 89)))
        ;;                                            GUI       TER
        ;; generic
        (act1          (if (madhat2r-true-color-p) "#373d3f" "brightblack"))
        (act2          (if (madhat2r-true-color-p) "#131516" "black"))
        (base          (if (madhat2r-true-color-p) "#c1c7c9" "#afd7d7"))
        (base-dim      (if (madhat2r-true-color-p) "#e0e0e0" "#d7d7d7"))
        (bg1           (if (madhat2r-true-color-p) "#131516" "#121212"))
        (bg2           (if (madhat2r-true-color-p) "#1b1e1f" "black"))
        (bg3           (if (madhat2r-true-color-p) "#232628" "black"))
        (bg4           (if (madhat2r-true-color-p) "#6f7c80" "#5f8787"))
        (complement-bg (if (madhat2r-true-color-p) "#1b1e1f" "#121212"))
        (border        (if (madhat2r-true-color-p) "#0d3c55" "brightmagenta"))
        (cblk          (if (madhat2r-true-color-p) "#c1c7c9" "#afd7d7"))
        (cblk-bg       (if (madhat2r-true-color-p) "#131516" "#121212"))
        (cblk-ln       (if (madhat2r-true-color-p) "#a7afb2" "#afafaf"))
        (cblk-ln-bg    (if (madhat2r-true-color-p) "#232628" "#232628"))
        (cursor        (if (madhat2r-true-color-p) "#e3dedd" "#d0d0d0"))
        (const         (if (madhat2r-true-color-p) "#f16c20" "#ff5f00"))
        (comment       (if (madhat2r-true-color-p) "#555f61" "#5f5f5f"))
        (comment-bg    (if (madhat2r-true-color-p) "#373d3f" "#080808"))
        (comp          (if (madhat2r-true-color-p) "#ebc844" "#ffd75f"))
        (err           (if (madhat2r-true-color-p) "#c02e1d" "#af0000"))
        (func          (if (madhat2r-true-color-p) "#ecaa38" "#ffff00"))
        (head1         (if (madhat2r-true-color-p) "#ebc844" "#ffd75f"))
        (head2         (if (madhat2r-true-color-p) "#0f5b78" "#005f87"))
        (head3         (if (madhat2r-true-color-p) "#5ca793" "#5faf87"))
        (head4         (if (madhat2r-true-color-p) "#1395ba" "#0087af"))
        (highlight     (if (madhat2r-true-color-p) "#0d3c55" "magenta"))
        (keyword       (if (madhat2r-true-color-p) "#1395ba" "#0087af"))
        (lnum          (if (madhat2r-true-color-p) "#44505c" "#5f5f5f"))
        (mat           (if (madhat2r-true-color-p) "#f3df91" "#ffd787"))
        (meta          (if (madhat2r-true-color-p) "#555f61" "#5f5f5f"))
        (str           (if (madhat2r-true-color-p) "#a2b86c" "green"))
        (suc           (if (madhat2r-true-color-p) "#9bda34" "#afd75f"))
        (ttip          (if (madhat2r-true-color-p) "#c1c7c9" "#afd7d7"))
        (ttip-sl       (if (madhat2r-true-color-p) "#1395ba" "#0087af"))
        (ttip-bg       (if (madhat2r-true-color-p) "#0d3c55" "magenta"))
        (type          (if (madhat2r-true-color-p) "#ef8b2c" "#ff8700"))
        (var           (if (madhat2r-true-color-p) "#5ca793" "#5faf87"))
        (war           (if (madhat2r-true-color-p) "#d94e1f" "#d75f00"))
        (link          (if (madhat2r-true-color-p) "#f2f3f4" "#eeeeee"))
        (over-bg       (if (madhat2r-true-color-p) "#8c979a" "#878787"))

        ;; colors
        (aqua          (if (madhat2r-true-color-p) "#10A585" "#10A585"))
        (aqua-bg       (if (madhat2r-true-color-p) "#293235" "#262626"))
        (green         (if (madhat2r-true-color-p) "#40805b" "#40805b"))
        (green-bg      (if (madhat2r-true-color-p) "#293235" "#262626"))
        (green-bg-s    (if (madhat2r-true-color-p) "#2a5748" "#2a5748"))
        (cyan          (if (madhat2r-true-color-p) "#22aae1" "#22aae1"))
        (red           (if (madhat2r-true-color-p) "#d93334" "#d93334"))
        (red-bg        (if (madhat2r-true-color-p) "#3c2a2c" "#262626"))
        (red-bg-s      (if (madhat2r-true-color-p) "#59355a" "#59355a"))
        (blue          (if (madhat2r-true-color-p) "#4f97d7" "#268bd2"))
        (blue-bg       (if (madhat2r-true-color-p) "#293239" "#262626"))
        (magenta       (if (madhat2r-true-color-p) "#c24160" "#c24160"))
        (yellow        (if (madhat2r-true-color-p) "#b1951d" "#875f00"))
        (yellow-bg     (if (madhat2r-true-color-p) "#32322c" "#262626"))
        )

        madhat2r-custom-colors-override

    (custom-theme-set-faces
     'madhat2r

;;;;; basics
     `(cursor ((,class (:background ,cursor))))
     `(custom-button ((,class :background ,bg2 :foreground ,base :box (:line-width 2 :style released-button))))
     `(default ((,class (:background ,bg1 :foreground ,base))))
     `(default-italic ((,class (:italic t))))
     `(error ((,class (:foreground ,err))))
     `(eval-sexp-fu-flash ((,class (:background ,suc :foreground ,bg1))))
     `(eval-sexp-fu-flash-error ((,class (:background ,err :foreground ,bg1))))
     `(font-lock-builtin-face ((,class (:foreground ,keyword))))
     `(font-lock-comment-face ((,class (:foreground ,comment ))))
     `(font-lock-constant-face ((,class (:foreground ,const))))
     `(font-lock-doc-face ((,class (:foreground ,comment))))
     `(font-lock-function-name-face ((,class (:foreground ,func :inherit bold))))
     `(font-lock-keyword-face ((,class (:inherit bold :foreground ,keyword))))
     `(font-lock-negation-char-face ((,class (:foreground ,const))))
     `(font-lock-preprocessor-face ((,class (:foreground ,func))))
     `(font-lock-reference-face ((,class (:foreground ,const))))
     `(font-lock-string-face ((,class (:foreground ,str))))
     `(font-lock-type-face ((,class (:foreground ,type :inherit bold))))
     `(font-lock-variable-name-face ((,class (:foreground ,var))))
     `(font-lock-warning-face ((,class (:foreground ,war :background ,bg1))))
     `(fringe ((,class (:background ,bg1 :foreground ,base))))
     `(header-line ((,class :background ,highlight)))
     `(highlight ((,class (:foreground ,base :background ,highlight))))
     `(hl-line ((,class (:background ,bg2))))
     `(isearch ((,class (:foreground ,bg1 :background ,mat))))
     `(lazy-highlight ((,class (:underline t :foreground ,mat :weight bold))))
     `(link ((,class (:foreground ,link :underline t))))
     `(link-visited ((,class (:foreground ,comp :underline t))))
     `(match ((,class (:background ,highlight :foreground ,mat))))
     `(minibuffer-prompt ((,class (:inherit bold :foreground ,keyword))))
     `(page-break-lines ((,class (:foreground ,act2))))
     `(region ((,class (:background ,highlight))))
     `(secondary-selection ((,class (:background ,bg3))))
     `(success ((,class (:foreground ,suc))))
     `(tooltip ((,class (:background ,ttip-sl :foreground ,base :bold nil :italic nil :underline nil))))
     `(vertical-border ((,class (:foreground ,bg4))))
     `(warning ((,class (:foreground ,war))))

;;;;; ahs
     `(ahs-face ((,class (:underline t :foreground ,mat))))
     `(ahs-plugin-whole-buffer-face ((,class (:background ,mat :foreground ,bg1))))

;;;;; Message-mode
     `(notmuch-message-summary-face((,class (:background ,bg3))))
     `(notmuch-wash-cited-text((,class (:foreground ,comment))))
     `(notmuch-wash-toggle-button ((,class (:background ,bg3))))
     `(message-cited-text((,class (:foreground ,comment))))
     `(message-header-other      ((,class (:foreground ,base :background nil :weight normal))))
     `(message-header-subject    ((,class (:inherit message-header-other :weight bold :foreground ,head3))))
     `(message-header-to         ((,class (:inherit message-header-other :weight bold :foreground ,const))))
     `(message-header-cc         ((,class (:inherit message-header-to ))))
     `(message-header-name       ((,class (:foreground ,keyword))))
     `(message-header-newsgroups ((,class (:foreground ,cyan  :slant normal))))
     `(message-separator         ((,class (:foreground ,comment))))
     `(message-mml               ((,class (:foreground ,bg4 :background ,bg3))))

;;;;; anzu-mode
     `(anzu-mode-line ((,class (:foreground ,yellow :inherit bold))))

;;;;; auto-complete
     `(ac-completion-face ((,class (:background ,ttip-bg :foreground ,ttip))))

;;;;; avy
     `(avy-lead-face   ((,class (:background "#43339e" :foreground ,comp))))
     `(avy-lead-face-0 ((,class (:background "#43339e" :foreground ,suc))))
     `(avy-lead-face-1 ((,class (:background "#43339e" :foreground ,comp))))
     `(avy-lead-face-2 ((,class (:background "#43339e" :foreground ,suc))))

;;;;; cider
     `(cider-enlightened ((,class (:background nil :box (:color ,yellow :line-width -1 :style nil) :foreground ,yellow))))
     `(cider-enlightened-local ((,class (:foreground ,yellow))))
     `(cider-instrumented-face ((,class (:background nil :box (:color ,red :line-width -1 :style nil) :foreground ,red))))
     `(cider-result-overlay-face ((,class (:background nil :box (:color ,blue :line-width -1 :style nil) :foreground ,blue))))
     `(cider-test-error-face ((,class (:background ,war :foreground ,bg1))))
     `(cider-test-failure-face ((,class (:background ,err :foreground ,bg1))))
     `(cider-test-success-face ((,class (:background ,suc :foreground ,bg1))))
     `(cider-traced-face ((,class :box (:color ,cyan :line-width -1 :style nil))))

;;;;; company
     `(company-echo-common ((,class (:background ,base :foreground ,bg1))))
     `(company-preview ((,class (:background ,ttip-bg :foreground ,ttip))))
     `(company-preview-common ((,class (:background ,ttip-bg :foreground ,base))))
     `(company-preview-search ((,class (:inherit match))))
     `(company-scrollbar-bg ((,class (:background ,bg2))))
     `(company-scrollbar-fg ((,class (:background ,act2))))
     `(company-template-field ((,class (:inherit region))))
     `(company-tooltip ((,class (:background ,ttip-bg :foreground ,ttip))))
     `(company-tooltip-annotation ((,class (:foreground ,keyword))))
     `(company-tooltip-common ((,class (:background ,ttip-bg :foreground ,base))))
     `(company-tooltip-common-selection ((,class (:foreground ,base))))
     `(company-tooltip-mouse ((,class (:inherit highlight))))
     `(company-tooltip-search ((,class (:inherit match))))
     `(company-tooltip-selection ((,class (:background ,ttip-sl :foreground ,base))))

;;;;; diff
     `(diff-added             ((,class :background nil :foreground ,green)))
     `(diff-changed           ((,class :background nil :foreground ,keyword)))
     `(diff-header            ((,class :background ,cblk-ln-bg :foreground ,func)))
     `(diff-indicator-added   ((,class :background nil :foreground ,green)))
     `(diff-indicator-changed ((,class :background nil :foreground ,keyword)))
     `(diff-indicator-removed ((,class :background nil :foreground ,red)))
     `(diff-refine-added      ((,class :background ,green :foreground ,bg4)))
     `(diff-refine-changed    ((,class :background ,keyword :foreground ,bg4)))
     `(diff-refine-removed    ((,class :background ,red :foreground ,bg4)))
     `(diff-removed           ((,class :background nil :foreground ,red)))

;;;;; diff-hl
     `(diff-hl-change ((,class :background ,blue-bg :foreground ,blue)))
     `(diff-hl-delete ((,class :background ,red-bg :foreground ,red)))
     `(diff-hl-insert ((,class :background ,green-bg :foreground ,green)))

;;;;; dired
     `(dired-directory ((,class (:foreground ,keyword :background ,bg1 :inherit bold))))
     `(dired-flagged ((,class (:foreground ,red))))
     `(dired-header ((,class (:foreground ,comp :inherit bold))))
     `(dired-ignored ((,class (:inherit shadow))))
     `(dired-mark ((,class (:foreground ,comp :inherit bold))))
     `(dired-marked ((,class (:foreground ,magenta :inherit bold))))
     `(dired-perm-write ((,class (:foreground ,base :underline t))))
     `(dired-symlink ((,class (:foreground ,cyan :background ,bg1 :inherit bold))))
     `(dired-warning ((,class (:foreground ,war))))

;;;;; ediff
     `(ediff-current-diff-A ((,class (:background ,red-bg-s :foreground ,red))))
     `(ediff-current-diff-Ancestor ((,class (:background ,aqua-bg :foreground ,aqua))))
     `(ediff-current-diff-B ((,class (:background ,green-bg-s :foreground ,green))))
     `(ediff-current-diff-C ((,class (:background ,blue-bg :foreground ,blue))))
     `(ediff-even-diff-A ((,class (:background ,bg3))))
     `(ediff-even-diff-Ancestor ((,class (:background ,bg3))))
     `(ediff-even-diff-B ((,class (:background ,bg3))))
     `(ediff-even-diff-C ((,class (:background ,bg3))))
     `(ediff-fine-diff-A ((,class (:background nil :inherit bold))))
     `(ediff-fine-diff-Ancestor ((,class (:background nil :inherit bold))))
     `(ediff-fine-diff-B ((,class (:background nil :inherit bold))))
     `(ediff-fine-diff-C ((,class (:background nil :inherit bold))))
     `(ediff-odd-diff-A ((,class (:background ,bg4))))
     `(ediff-odd-diff-Ancestor ((,class (:background ,bg4))))
     `(ediff-odd-diff-B ((,class (:background ,bg4))))
     `(ediff-odd-diff-C ((,class (:background ,bg4))))

;;;;; ein
     `(ein:cell-input-area((,class (:background ,bg2))))
     `(ein:cell-input-prompt ((,class (:foreground ,suc))))
     `(ein:cell-output-prompt ((,class (:foreground ,err))))
     `(ein:notification-tab-normal ((,class (:foreground ,keyword))))
     `(ein:notification-tab-selected ((,class (:foreground ,suc :inherit bold))))

;;;;; eldoc
     `(eldoc-highlight-function-argument ((,class (:foreground ,mat :inherit bold))))

;;;;; elfeed
     `(elfeed-search-title-face ((,class (:foreground ,base-dim))))
     `(elfeed-search-unread-title-face ((,class (:foreground ,base))))
     `(elfeed-search-feed-face ((,class (:foreground ,blue))))
     `(elfeed-search-tag-face ((,class (:foreground ,func))))

;;;;; enh-ruby
     `(enh-ruby-string-delimiter-face ((,class (:foreground ,str))))
     `(enh-ruby-op-face ((,class (:background ,bg1 :foreground ,base))))

;;;;; erc
     `(erc-input-face ((,class (:foreground ,func))))
     `(erc-my-nick-face ((,class (:foreground ,keyword))))
     `(erc-nick-default-face ((,class (:foreground ,keyword))))
     `(erc-nick-prefix-face ((,class (:foreground ,yellow))))
     `(erc-notice-face ((,class (:foreground ,str))))
     `(erc-prompt-face ((,class (:foreground ,mat :inherit bold))))
     `(erc-timestamp-face ((,class (:foreground ,keyword))))

;;;;; eshell
     `(eshell-ls-archive ((,class (:foreground ,red :inherit bold))))
     `(eshell-ls-backup ((,class (:inherit font-lock-comment-face))))
     `(eshell-ls-clutter ((,class (:inherit font-lock-comment-face))))
     `(eshell-ls-directory ((,class (:foreground ,keyword :inherit bold))))
     `(eshell-ls-executable ((,class (:foreground ,suc :inherit bold))))
     `(eshell-ls-missing ((,class (:inherit font-lock-warning-face))))
     `(eshell-ls-product ((,class (:inherit font-lock-doc-face))))
     `(eshell-ls-special ((,class (:foreground ,yellow :inherit bold))))
     `(eshell-ls-symlink ((,class (:foreground ,cyan :inherit bold))))
     `(eshell-ls-unreadable ((,class (:foreground ,base))))
     `(eshell-prompt ((,class (:foreground ,keyword :inherit bold))))

;;;;; evil
     `(evil-ex-substitute-matches ((,class (:background ,red-bg :foreground ,red))))
     `(evil-ex-substitute-replacement ((,class (:background ,green-bg :foreground ,green))))

;;;;; flycheck
     `(flycheck-error
       ((,(append '((supports :underline (:style line))) class)
         (:underline (:style line :color ,err)))
        (,class (:foreground ,base :background ,err :inherit bold :underline t))))
     `(flycheck-error-list-checker-name ((,class (:foreground ,keyword))))
     `(flycheck-fringe-error ((,class (:foreground ,err :inherit bold))))
     `(flycheck-fringe-info ((,class (:foreground ,keyword :inherit bold))))
     `(flycheck-fringe-warning ((,class (:foreground ,war :inherit bold))))
     `(flycheck-info
       ((,(append '((supports :underline (:style line))) class)
         (:underline (:style line :color ,keyword)))
        (,class (:foreground ,base :background ,keyword :inherit bold :underline t))))
     `(flycheck-warning
       ((,(append '((supports :underline (:style line))) class)
         (:underline (:style line :color ,war)))
        (,class (:foreground ,base :background ,war :inherit bold :underline t))))

;;;;; jabber
     `(jabber-activity-face ((,class (:inherit bold :foreground ,red))))
     `(jabber-activity-personal-face ((,class (:inherit bold :foreground ,blue))))
     `(jabber-chat-error ((,class (:inherit bold :foreground ,red))))
     `(jabber-chat-prompt-foreign ((,class (:inherit bold :foreground ,red))))
     `(jabber-chat-prompt-local ((,class (:inherit bold :foreground ,blue))))
     `(jabber-chat-prompt-system ((,class (:inherit bold :foreground ,green))))
     `(jabber-chat-text-foreign ((,class (:foreground ,base))))
     `(jabber-chat-text-local ((,class (:foreground ,base))))
     `(jabber-rare-time-face ((,class (:foreground ,green))))
     `(jabber-roster-user-away ((,class (:foreground ,yellow))))
     `(jabber-roster-user-chatty ((,class (:inherit bold :foreground ,green))))
     `(jabber-roster-user-dnd ((,class (:foreground ,red))))
     `(jabber-roster-user-error ((,class (:foreground ,err))))
     `(jabber-roster-user-offline ((,class (:foreground ,base))))
     `(jabber-roster-user-online ((,class (:inherit bold :foreground ,green))))
     `(jabber-roster-user-xa ((,class (:foreground ,aqua))))

;;;;; git-gutter-fr
     `(git-gutter-fr:added ((,class (:foreground ,green :inherit bold))))
     `(git-gutter-fr:deleted ((,class (:foreground ,war :inherit bold))))
     `(git-gutter-fr:modified ((,class (:foreground ,keyword :inherit bold))))

;;;;; git-timemachine
     `(git-timemachine-minibuffer-detail-face ((,class (:foreground ,blue :inherit bold :background ,blue-bg))))

;;;;; gnus
     `(gnus-emphasis-highlight-words ((,class (:background ,suc :foreground ,bg1))))
     `(gnus-header-content ((,class (:foreground ,keyword))))
     `(gnus-header-from ((,class (:foreground ,var))))
     `(gnus-header-name ((,class (:foreground ,comp))))
     `(gnus-header-subject ((,class (:foreground ,func :inherit bold))))
     `(gnus-summary-cancelled ((,class (:background ,war :foreground ,bg1))))

;;;;; guide-key
     `(guide-key/highlight-command-face ((,class (:foreground ,base))))
     `(guide-key/key-face ((,class (:foreground ,keyword))))
     `(guide-key/prefix-command-face ((,class (:foreground ,keyword :inherit bold))))

;;;;; helm
     `(helm-bookmark-directory ((,class (:inherit helm-ff-directory))))
     `(helm-bookmark-file ((,class (:foreground ,base))))
     `(helm-bookmark-gnus ((,class (:foreground ,comp))))
     `(helm-bookmark-info ((,class (:foreground ,comp))))
     `(helm-bookmark-man ((,class (:foreground ,comp))))
     `(helm-bookmark-w3m ((,class (:foreground ,comp))))
     `(helm-buffer-directory ((,class (:foreground ,base :background ,bg1))))
     `(helm-buffer-file ((,class (:foreground ,base :background ,bg1))))
     `(helm-buffer-not-saved ((,class (:foreground ,comp :background ,bg1))))
     `(helm-buffer-process ((,class (:foreground ,keyword :background ,bg1))))
     `(helm-buffer-saved-out ((,class (:foreground ,base :background ,bg1))))
     `(helm-buffer-size ((,class (:foreground ,base :background ,bg1))))
     `(helm-candidate-number ((,class (:background ,bg1 :foreground ,keyword :inherit bold))))
     `(helm-ff-directory ((,class (:foreground ,keyword :background ,bg1 :inherit bold))))
     `(helm-ff-dotted-directory ((,class (:foreground ,keyword :background ,bg1 :inherit bold))))
     `(helm-ff-dotted-symlink-directory ((,class (:foreground ,cyan :background ,bg1 :inherit bold))))
     `(helm-ff-executable ((,class (:foreground ,suc :background ,bg1 :weight normal))))
     `(helm-ff-file ((,class (:foreground ,base :background ,bg1 :weight normal))))
     `(helm-ff-invalid-symlink ((,class (:foreground ,red :background ,bg1 :inherit bold))))
     `(helm-ff-prefix ((,class (:foreground ,bg1 :background ,keyword :weight normal))))
     `(helm-ff-symlink ((,class (:foreground ,cyan :background ,bg1 :inherit bold))))
     `(helm-grep-cmd-line ((,class (:foreground ,base :background ,bg1))))
     `(helm-grep-file ((,class (:foreground ,base :background ,bg1))))
     `(helm-grep-finish ((,class (:foreground ,base :background ,bg1))))
     `(helm-grep-lineno ((,class (:foreground ,type :background ,bg1 :inherit bold))))
     `(helm-grep-match ((,class (:foreground nil :background nil :inherit helm-match))))
     `(helm-header ((,class (:foreground ,base :background ,bg1 :underline nil :box nil))))
     `(helm-header-line-left-margin ((,class (:foreground ,keyword :background ,nil))))
     `(helm-match ((,class (:background ,complement-bg :foreground ,head1))))
     `(helm-match-item ((,class (:background ,complement-bg :foreground ,head1))))
     `(helm-moccur-buffer ((,class (:foreground ,var :background ,bg1))))
     `(helm-selection ((,class (:background ,highlight))))
     `(helm-selection-line ((,class (:background ,bg2))))
     `(helm-separator ((,class (:foreground ,comp :background ,bg1))))
     `(helm-source-header ((,class (:background ,comp :foreground ,bg1 :inherit bold))))
     `(helm-time-zone-current ((,class (:foreground ,keyword :background ,bg1))))
     `(helm-time-zone-home ((,class (:foreground ,comp :background ,bg1))))
     `(helm-visible-mark ((,class (:foreground ,keyword :background ,bg3))))

;;;;; helm-swoop
     `(helm-swoop-target-line-block-face ((,class (:foreground ,base :background ,highlight))))
     `(helm-swoop-target-line-face ((,class (:background ,highlight))))
     `(helm-swoop-target-word-face ((,class (:background ,highlight :foreground ,mat))))

;;;;; highlights
     `(hi-yellow ((,class (:foreground ,yellow :background ,yellow-bg))))
     `(hi-green  ((,class (:foreground ,green :background ,green-bg))))

;;;;; highlight-indentation
     `(highlight-indentation-face ((,class (:background ,comment-bg))))

;;;;; highlight-symbol
     `(highlight-symbol-face ((,class (:background ,bg2))))

;;;;; hydra
     `(hydra-face-blue ((,class (:foreground ,keyword))))
     `(hydra-face-red ((,class (:foreground ,func))))

;;;;; ido
     `(ido-first-match ((,class (:foreground ,comp :inherit bold))))
     `(ido-only-match ((,class (:foreground ,mat :inherit bold))))
     `(ido-subdir ((,class (:foreground ,keyword))))
     `(ido-vertical-match-face ((,class (:foreground ,comp :underline nil))))

;;;;; info
     `(info-header-xref ((,class (:foreground ,func :underline t))))
     `(info-xref ((,class (:foreground ,comp :underline t))))
     `(info-menu ((,class (:foreground ,suc))))
     `(info-node ((,class (:foreground ,func :inherit bold))))
     `(info-quoted-name ((,class (:foreground ,keyword))))
     `(info-reference-item ((,class (:background nil :underline t :inherit bold))))
     `(info-string ((,class (:foreground ,str))))
     `(info-title-1 ((,class (:height 1.4 :inherit bold))))
     `(info-title-2 ((,class (:height 1.3 :inherit bold))))
     `(info-title-3 ((,class (:height 1.3))))
     `(info-title-4 ((,class (:height 1.2))))

;;;;; ivy
     `(ivy-current-match ((,class (:background ,highlight :inherit bold))))
     `(ivy-minibuffer-match-face-1 ((,class (:inherit bold))))
     `(ivy-minibuffer-match-face-2 ((,class (:foreground ,head1 :underline t))))
     `(ivy-minibuffer-match-face-3 ((,class (:foreground ,head4 :underline t))))
     `(ivy-minibuffer-match-face-4 ((,class (:foreground ,head3 :underline t))))
     `(ivy-remote ((,class (:foreground ,cyan))))

;;;;; latex
     `(font-latex-bold-face ((,class (:foreground ,comp))))
     `(font-latex-italic-face ((,class (:foreground ,keyword :italic t))))
     `(font-latex-match-reference-keywords ((,class (:foreground ,const))))
     `(font-latex-match-variable-keywords ((,class (:foreground ,var))))
     `(font-latex-sectioning-0-face ((,class (:inherit bold :foreground ,head3 :height ,(if madhat2r-theme-org-height 1.3 1.0)))))
     `(font-latex-sectioning-1-face ((,class (:inherit bold :foreground ,head4 :height ,(if madhat2r-theme-org-height 1.3 1.0)))))
     `(font-latex-sectioning-2-face ((,class (:inherit bold :foreground ,head1 :height ,(if madhat2r-theme-org-height 1.3 1.0)))))
     `(font-latex-sectioning-3-face ((,class (:inherit bold :foreground ,head2 :height ,(if madhat2r-theme-org-height 1.2 1.0)))))
     `(font-latex-sectioning-4-face ((,class (:bold nil :foreground ,head3 :height ,(if madhat2r-theme-org-height 1.1 1.0)))))
     `(font-latex-sectioning-5-face ((,class (:bold nil :foreground ,head4))))
     `(font-latex-string-face ((,class (:foreground ,str))))

;;;;; linum-mode
     `(linum ((,class (:foreground ,lnum :background ,bg3))))

;;;;; linum-relative
     `(linum-relative-current-face ((,class (:foreground ,comp))))

;;;;; magit
     `(magit-blame-culprit ((,class :background ,yellow-bg :foreground ,yellow)))
     `(magit-blame-header  ((,class :background ,yellow-bg :foreground ,green)))
     `(magit-blame-sha1    ((,class :background ,yellow-bg :foreground ,func)))
     `(magit-blame-subject ((,class :background ,yellow-bg :foreground ,yellow)))
     `(magit-blame-time    ((,class :background ,yellow-bg :foreground ,green)))
     `(magit-blame-name    ((,class :background ,yellow-bg :foreground ,yellow)))
     `(magit-blame-heading ((,class :background ,yellow-bg :foreground ,green)))
     `(magit-blame-hash    ((,class :background ,yellow-bg :foreground ,func)))
     `(magit-blame-summary ((,class :background ,yellow-bg :foreground ,yellow)))
     `(magit-blame-date    ((,class :background ,yellow-bg :foreground ,green)))
     `(magit-branch ((,class (:foreground ,const :inherit bold))))
     `(magit-branch-current ((,class (:background ,blue-bg :foreground ,blue :inherit bold :box t))))
     `(magit-branch-local ((,class (:background ,blue-bg :foreground ,blue :inherit bold))))
     `(magit-branch-remote ((,class (:background ,aqua-bg :foreground ,aqua :inherit bold))))
     `(magit-diff-context-highlight ((,class (:background ,bg2 :foreground ,base))))
     `(magit-diff-file-header ((,class (:background ,comment-bg :foreground ,comment))))
     `(magit-diff-file-heading ((,class (:background ,comment-bg :foreground ,comment))))
     `(magit-diff-file-heading-highlight ((,class (:background ,comment-bg :foreground ,comment))))
     `(magit-diff-hunk-header ((,class (:background ,ttip-bg :foreground ,ttip))))
     `(magit-diff-hunk-heading ((,class (:background ,ttip-bg :foreground ,ttip))))
     `(magit-diff-hunk-heading-highlight ((,class (:background ,ttip-bg :foreground ,ttip))))
     `(magit-hash ((,class (:foreground ,var))))
     `(magit-hunk-heading           ((,class (:background ,bg3))))
     `(magit-hunk-heading-highlight ((,class (:background ,bg3))))
     `(magit-item-highlight ((,class :background ,bg2)))
     `(magit-log-author ((,class (:foreground ,func))))
     `(magit-log-head-label-head ((,class (:background ,yellow :foreground ,bg1 :inherit bold))))
     `(magit-log-head-label-local ((,class (:background ,keyword :foreground ,bg1 :inherit bold))))
     `(magit-log-head-label-remote ((,class (:background ,suc :foreground ,bg1 :inherit bold))))
     `(magit-log-head-label-tags ((,class (:background ,magenta :foreground ,bg1 :inherit bold))))
     `(magit-log-head-label-wip ((,class (:background ,cyan :foreground ,bg1 :inherit bold))))
     `(magit-log-sha1 ((,class (:foreground ,str))))
     `(magit-process-ng ((,class (:foreground ,war :inherit bold))))
     `(magit-process-ok ((,class (:foreground ,func :inherit bold))))
     `(magit-section-heading        ((,class (:foreground ,keyword :inherit bold))))
     `(magit-section-highlight      ((,class (:background ,bg2))))
     `(magit-section-title ((,class (:background ,bg1 :foreground ,keyword :inherit bold))))

;;;;; man
     `(Man-overstrike ((,class (:foreground ,head1 :inherit bold))))
     `(Man-reverse ((,class (:foreground ,highlight))))
     `(Man-underline ((,class (:foreground ,comp :underline t))))

;;;;; markdown
     `(markdown-header-face-1 ((,class (:inherit bold :foreground ,head1 :height ,(if madhat2r-theme-org-height 1.3 1.0) ))))
     `(markdown-header-face-2 ((,class (:inherit bold :foreground ,head2 :height ,(if madhat2r-theme-org-height 1.2 1.0) ))))
     `(markdown-header-face-3 ((,class (:bold nil :foreground ,head3 :height ,(if madhat2r-theme-org-height 1.1 1.0)))))
     `(markdown-header-face-4 ((,class (:bold nil :foreground ,head4))))
     `(markdown-header-face-5 ((,class (:bold nil :foreground ,head1))))
     `(markdown-header-face-6 ((,class (:bold nil :foreground ,head2))))

;;;;; mode-line
     `(mode-line           ((,class (:foreground ,base :background ,act1 :box (:color ,border :line-width 1)))))
     `(mode-line-inactive  ((,class (:foreground ,base :background ,bg1  :box (:color ,border :line-width 1)))))
     `(mode-line-buffer-id ((,class (:inherit bold :foreground ,func))))

;;;;; mu4e
     `(mu4e-cited-1-face ((,class (:foreground ,base))))
     `(mu4e-cited-7-face ((,class (:foreground ,base))))
     `(mu4e-header-marks-face ((,class (:foreground ,comp))))
     `(mu4e-header-key-face ((,class (:foreground ,head2 :inherit bold))))
     `(mu4e-view-url-number-face ((,class (:foreground ,comp))))
     `(mu4e-unread-face ((,class (:foreground ,yellow :inherit bold))))

;;;;; neotree
     `(neo-dir-link-face ((,class (:foreground ,keyword :inherit bold))))
     `(neo-expand-btn-face ((,class (:foreground ,base))))
     `(neo-file-link-face ((,class (:foreground ,base))))
     `(neo-root-dir-face ((,class (:foreground ,func :inherit bold))))

;;;;; org
     `(org-agenda-clocking ((,class (:background ,highlight :foreground ,comp))))
     `(org-agenda-date ((,class (:foreground ,var :height ,(if madhat2r-theme-org-agenda-height 1.1 1.0)))))
     `(org-agenda-date-today ((,class (:foreground ,keyword :inherit bold :height ,(if madhat2r-theme-org-agenda-height 1.3 1.0)))))
     `(org-agenda-date-weekend ((,class (:inherit bold :foreground ,var))))
     `(org-agenda-done ((,class (:foreground ,suc :height ,(if madhat2r-theme-org-agenda-height 1.2 1.0)))))
     `(org-agenda-structure ((,class (:inherit bold :foreground ,comp))))
     `(org-block ((,class (:background ,cblk-bg :foreground ,cblk))))
     `(org-block-begin-line ((,class (:background ,cblk-ln-bg :foreground ,cblk-ln))))
     `(org-block-end-line ((,class (:background ,cblk-ln-bg :foreground ,cblk-ln))))
     `(org-clock-overlay ((,class (:foreground ,comp))))
     `(org-code ((,class (:foreground ,cyan))))
     `(org-column ((,class (:background ,highlight))))
     `(org-column-title ((,class (:background ,highlight))))
     `(org-date ((,class (:underline t :foreground ,var))))
     `(org-date-selected ((,class (:background ,func :foreground ,bg1))))
     `(org-document-info-keyword ((,class (:foreground ,meta))))
     `(org-document-title ((,class (:foreground ,func :inherit bold :height ,(if madhat2r-theme-org-height 1.4 1.0) :underline t))))
     `(org-done ((,class (:foreground ,suc :inherit bold :background ,green-bg))))
     `(org-ellipsis ((,class (:foreground ,keyword))))
     `(org-footnote  ((,class (:underline t :foreground ,base))))
     `(org-hide ((,class (:foreground ,base))))
     `(org-kbd ((,class (:inherit region :foreground ,base :box (:line-width 1 :style released-button)))))
     `(org-level-1 ((,class (:inherit bold :foreground ,head1 :height ,(if madhat2r-theme-org-height 1.3 1.0)))))
     `(org-level-2 ((,class (:inherit bold :foreground ,head2 :height ,(if madhat2r-theme-org-height 1.2 1.0)))))
     `(org-level-3 ((,class (:bold nil :foreground ,head3 :height ,(if madhat2r-theme-org-height 1.1 1.0)))))
     `(org-level-4 ((,class (:bold nil :foreground ,head4))))
     `(org-level-5 ((,class (:bold nil :foreground ,head1))))
     `(org-level-6 ((,class (:bold nil :foreground ,head2))))
     `(org-level-7 ((,class (:bold nil :foreground ,head3))))
     `(org-level-8 ((,class (:bold nil :foreground ,head4))))
     `(org-link ((,class (:underline t :foreground ,link))))
     `(org-meta-line ((,class (:foreground ,meta))))
     `(org-mode-line-clock-overrun ((,class (:foreground ,err))))
     `(org-priority ((,class (:foreground ,war :inherit bold))))
     `(org-quote ((,class (:inherit org-block :slant italic))))
     `(org-scheduled ((,class (:foreground ,comp))))
     `(org-scheduled-today ((,class (:foreground ,func :height ,(if madhat2r-theme-org-agenda-height 1.2 1.0)))))
     `(org-sexp-date ((,class (:foreground ,base))))
     `(org-special-keyword ((,class (:foreground ,func))))
     `(org-table ((,class (:foreground ,base :background ,complement-bg))))
     `(org-time-grid ((,class (:foreground ,str))))
     `(org-todo ((,class (:foreground ,war :inherit bold :background ,yellow-bg))))
     `(org-verbatim ((,class (:foreground ,keyword))))
     `(org-verse ((,class (:inherit org-block :slant italic))))
     `(org-warning ((,class (:foreground ,err))))

;;;;; perspective
     `(persp-selected-face ((,class (:inherit bold :foreground ,func))))

;;;;; popup
     `(popup-face ((,class (:background ,ttip-bg :foreground ,ttip))))
     `(popup-tip-face ((,class (:background ,ttip-sl :foreground ,base :bold nil :italic nil :underline nil))))
     `(popup-menu-face ((,class (:background ,ttip-bg :foreground ,base))))
     `(popup-enu-selection-face ((,class (:background ,ttip-sl :foreground ,base))))
     `(popup-menu-mouse-face ((,class (:inherit highlight))))
     `(popup-isearch-match ((,class (:inherit match))))
     `(popup-scroll-bar-foreground-face ((,class (:background ,act2))))
     `(popup-scroll-bar-background-face ((,class (:background ,bg2))))

;;;;; powerline
     `(powerline-active1 ((,class (:background ,act2 :foreground ,base))))
     `(powerline-active2 ((,class (:background ,act2 :foreground ,base))))
     `(powerline-inactive1 ((,class (:background ,bg2 :foreground ,base))))
     `(powerline-inactive2 ((,class (:background ,bg2 :foreground ,base))))

;;;;; rainbow-delimiters
     `(rainbow-delimiters-depth-1-face ((,class :foreground ,keyword)))
     `(rainbow-delimiters-depth-2-face ((,class :foreground ,func)))
     `(rainbow-delimiters-depth-3-face ((,class :foreground ,str)))
     `(rainbow-delimiters-depth-4-face ((,class :foreground ,green)))
     `(rainbow-delimiters-depth-5-face ((,class :foreground ,yellow)))
     `(rainbow-delimiters-depth-6-face ((,class :foreground ,keyword)))
     `(rainbow-delimiters-depth-7-face ((,class :foreground ,func)))
     `(rainbow-delimiters-depth-8-face ((,class :foreground ,str)))
     `(rainbow-delimiters-unmatched-face ((,class :foreground ,err :overline t)))
     `(rainbow-delimiters-mismatched-face ((,class :foreground ,err :overline t)))

;;;;; shm
     `(shm-current-face ((,class (:background ,green-bg-s))))
     `(shm-quarantine-face ((,class (:background ,red-bg-s))))

;;;;; show-paren
     `(show-paren-match ((,class (:background ,green-bg-s))))
     `(show-paren-mismatch ((,class (:background ,red-bg-s))))

;;;;; smartparens
     `(sp-pair-overlay-face ((,class (:background ,highlight :foreground nil))))
     `(sp-show-pair-match-face ((,class (:background ,mat :foreground ,bg1 :inherit bold))))

;;;;; spaceline
     `(spaceline-python-venv ((,class (:foreground ,comp))))
     `(spaceline-flycheck-error  ((,class (:foreground ,err))))
     `(spaceline-flycheck-info   ((,class (:foreground ,keyword))))
     `(spaceline-flycheck-warning((,class (:foreground ,war))))

     dotspacemacs-use-ido nil
;;;;; spacemacs-specific
     `(spacemacs-transient-state-title-face ((,class (:background nil :foreground ,keyword :box nil :inherit bold))))

;;;;; swiper
     `(swiper-line-face ((,class (:background ,highlight :inherit bold))))
     `(swiper-match-face-1 ((,class (:inherit bold))))
     `(swiper-match-face-2 ((,class (:foreground ,head1 :underline t))))
     `(swiper-match-face-3 ((,class (:foreground ,head4 :underline t))))
     `(swiper-match-face-4 ((,class (:foreground ,head3 :underline t))))

;;;;; term
     `(term ((,class (:foreground ,base :background ,bg1))))
     `(term-color-black ((,class (:foreground ,bg4))))
     `(term-color-blue ((,class (:foreground ,keyword))))
     `(term-color-cyan ((,class (:foreground ,cyan))))
     `(term-color-green ((,class (:foreground ,green))))
     `(term-color-magenta ((,class (:foreground ,magenta))))
     `(term-color-red ((,class (:foreground ,red))))
     `(term-color-white ((,class (:foreground ,base))))
     `(term-color-yellow ((,class (:foreground ,yellow))))

;;;;; web-mode
     `(web-mode-builtin-face ((,class (:inherit ,font-lock-builtin-face))))
     `(web-mode-comment-face ((,class (:inherit ,font-lock-comment-face))))
     `(web-mode-constant-face ((,class (:inherit ,font-lock-constant-face))))
     `(web-mode-doctype-face ((,class (:inherit ,font-lock-comment-face))))
     `(web-mode-function-name-face ((,class (:inherit ,font-lock-function-name-face))))
     `(web-mode-html-attr-name-face ((,class (:foreground ,func))))
     `(web-mode-html-attr-value-face ((,class (:foreground ,var))))
     `(web-mode-html-tag-face ((,class (:foreground ,keyword))))
     `(web-mode-keyword-face ((,class (:foreground ,keyword))))
     `(web-mode-string-face ((,class (:foreground ,str))))
     `(web-mode-symbol-face ((,class (:foreground ,type))))
     `(web-mode-type-face ((,class (:inherit ,font-lock-type-face))))
     `(web-mode-warning-face ((,class (:inherit ,font-lock-warning-face))))
     `(web-mode-current-element-highlight-face ((,class (:background ,mat))))

;;;;; which-key
     `(which-key-command-description-face ((,class (:foreground ,base))))
     `(which-key-group-description-face ((,class (:foreground ,keyword))))
     `(which-key-key-face ((,class (:foreground ,func :inherit bold))))
     `(which-key-separator-face ((,class (:background nil :foreground ,str))))
     `(which-key-special-key-face ((,class (:background ,func :foreground ,bg1))))

;;;;; which-function-mode
     `(which-func ((,class (:foreground ,func))))

;;;;; whitespace-mode
     `(whitespace-empty ((,class (:background nil :foreground ,yellow))))
     `(whitespace-indentation ((,class (:background nil :foreground ,war))))
     `(whitespace-line ((,class (:background nil :foreground ,comp))))
     `(whitespace-newline ((,class (:background nil :foreground ,comp))))
     `(whitespace-space ((,class (:background nil :foreground ,act2))))
     `(whitespace-space-after-tab ((,class (:background nil :foreground ,yellow))))
     `(whitespace-space-before-tab ((,class (:background nil :foreground ,yellow))))
     `(whitespace-tab ((,class (:background nil))))
     `(whitespace-trailing ((,class (:background ,err :foreground ,war))))

;;;;; other, need more work
     `(ac-completion-face ((,class (:underline t :foreground ,keyword))))
     `(ffap ((,class (:foreground ,base))))
     `(flx-highlight-face ((,class (:foreground ,comp :underline nil))))
     `(icompletep-determined ((,class :foreground ,keyword)))
     `(js2-external-variable ((,class (:foreground ,comp))))
     `(js2-function-param ((,class (:foreground ,const))))
     `(js2-jsdoc-html-tag-delimiter ((,class (:foreground ,str))))
     `(js2-jsdoc-html-tag-name ((,class (:foreground ,keyword))))
     `(js2-jsdoc-value ((,class (:foreground ,str))))
     `(js2-private-function-call ((,class (:foreground ,const))))
     `(js2-private-member ((,class (:foreground ,base))))
     `(js3-error-face ((,class (:underline ,war))))
     `(js3-external-variable-face ((,class (:foreground ,var))))
     `(js3-function-param-face ((,class (:foreground ,keyword))))
     `(js3-instance-member-face ((,class (:foreground ,const))))
     `(js3-jsdoc-tag-face ((,class (:foreground ,keyword))))
     `(js3-warning-face ((,class (:underline ,keyword))))
     `(slime-repl-inputed-output-face ((,class (:foreground ,comp))))
     `(trailing-whitespace ((,class :foreground nil :background ,err)))
     `(undo-tree-visualizer-current-face ((,class :foreground ,keyword)))
     `(undo-tree-visualizer-default-face ((,class :foreground ,base)))
     `(undo-tree-visualizer-register-face ((,class :foreground ,comp)))
     `(undo-tree-visualizer-unmodified-face ((,class :foreground ,var)))
     `(custom-link ((,class :foreground ,comp :underline t))))

    (custom-theme-set-variables
     'madhat2r
     `(ansi-color-names-vector [,bg4 ,red ,green ,yellow ,blue ,magenta ,cyan ,base]))

    ))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))


(deftheme madhat2r "Madhat2r theme")

(create-madhat2r-theme)

;;;###autoload
(provide-theme 'madhat2r)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; madhat2r-theme.el ends here

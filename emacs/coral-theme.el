;;; coral-theme.el --- A fruity color theme for Emacs.

;; Copyright (C) 2011-2016

;; Author: Kelvin Smith <oneKelvinSmith@gmail.com>
;; URL: http://github.com/oneKelvinSmith/coral-emacs
;; Package-Version: 20170731.504
;; Version: 3.3.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Based on poony's `coral-reef' theme on dotshare.it and on the Monokai
;; Emacs theme file.
;;
;;; Code:

(unless (>= emacs-major-version 24)
  (error "The coral theme requires Emacs 24 or later!"))

(deftheme coral "The Coral colour theme")

(defgroup coral nil
  "Coral theme options.
The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom coral-distinct-fringe-background nil
  "Make the fringe background different from the normal background color.
Also affects 'linum-mode' background."
  :type 'boolean
  :group 'coral)

(defcustom coral-use-variable-pitch nil
  "Use variable pitch face for some headings and titles."
  :type 'boolean
  :group 'coral)

;; (defcustom coral-height-minus-1 0.8
(defcustom coral-height-minus-1 nil
  "Font size -1."
  :type 'number
  :group 'coral)

;; (defcustom coral-height-plus-1 1.1
(defcustom coral-height-plus-1 1
  "Font size +1."
  :type 'number
  :group 'coral)

;;(defcustom coral-height-plus-2 1.15
(defcustom coral-height-plus-2 1
  "Font size +2."
  :type 'number
  :group 'coral)

;; (defcustom coral-height-plus-3 1.2
(defcustom coral-height-plus-3 1
  "Font size +3."
  :type 'number
  :group 'coral)

;; (defcustom coral-height-plus-4 1.3
(defcustom coral-height-plus-4 1
  "Font size +4."
  :type 'number
  :group 'coral)

;; Primary colors
(defcustom coral-yellow "#FFE863"
  "Primary colors - yellow"
  :type 'string
  :group 'coral)

(defcustom coral-orange "#FEA63C"
  "Primary colors - orange"
  :type 'string
  :group 'coral)

(defcustom coral-red "#BD4A4A"
  "Primary colors - red"
  :type 'string
  :group 'coral)

(defcustom coral-magenta "#FF5879"
  "Primary colors - magenta"
  :type 'string
  :group 'coral)

(defcustom coral-blue "#66AABB"
  "Primary colors - blue"
  :type 'string
  :group 'coral)

(defcustom coral-green "#B7CE42"
  "Primary colors - green"
  :type 'string
  :group 'coral)

(defcustom coral-cyan "#72AD8C"
  "Primary colors - cyan"
  :type 'string
  :group 'coral)

(defcustom coral-violet "#F26B9E"
  "Primary colors - violet"
  :type 'string
  :group 'coral)

(defcustom coral-gray "#4e585e" ;; 
  "Primary colors - gray"
  :type 'string
  :group 'coral)

(defcustom coral-foreground "#DDEEDD"
  "Adaptive colors - foreground"
  :type 'string
  :group 'coral)

(defcustom coral-background "#131D24"
  "Adaptive colors - background"
  :type 'string
  :group 'coral)

(defcustom coral-background-light "#25374A"
  "Adaptive colors - light background"
  :type 'string
  :group 'coral)

(defcustom coral-comments "#3A526B"
  "Adaptive colors - comments"
  :type 'string
  :group 'coral)

(defcustom coral-emphasis "#F8F8F0"
  "Adaptive colors - emphasis"
  :type 'string
  :group 'coral)

(defcustom coral-line-number "#8F908A"
  "Adaptive colors - line number"
  :type 'string
  :group 'coral)

(defcustom coral-highlight "#2e4657"
  "Adaptive colors - highlight"
  :type 'string
  :group 'coral)

(defcustom coral-highlight-alt "#3E3D31"
  "Adaptive colors - highlight"
  :type 'string
  :group 'coral)

(defcustom coral-highlight-line "#3C3D37"
  "Adaptive colors - line highlight"
  :type 'string
  :group 'coral)

(defun coral-modify-brightness (color modifier)
  "Lighten an RGC color by a decimal modifier as R * m, B * m, G * m."
  (let ((triplet (mapcar
		  (lambda (i) (* i modifier))
		  (color-name-to-rgb color))))
    (format "#%02x%02x%02x"
	    (floor (* (nth 0 triplet) 256))
	    (floor (* (nth 1 triplet) 256))
	    (floor (* (nth 2 triplet) 256)))))
  
(let* (;; Variable pitch
       (coral-pitch (if coral-use-variable-pitch
                          'variable-pitch
                        'default))

       ;; Definitions for guis that support 256 colors
       (coral-class '((class color) (min-colors 257)))

       ;; Darker and lighter accented colors
       (coral-yellow-d       (coral-modify-brightness coral-yellow 0.8))
       (coral-yellow-l       (coral-modify-brightness coral-yellow 1.2))
       (coral-orange-d       (coral-modify-brightness coral-orange 0.8))
       (coral-orange-l       (coral-modify-brightness coral-orange 1.2))
       (coral-red-d          (coral-modify-brightness coral-red 0.8))
       (coral-red-l          (coral-modify-brightness coral-red 1.2))
       (coral-magenta-d      (coral-modify-brightness coral-red 0.8))
       (coral-magenta-l      (coral-modify-brightness coral-red 1.2))
       (coral-violet-d       (coral-modify-brightness coral-violet 0.8))
       (coral-violet-l       (coral-modify-brightness coral-violet 1.2))
       (coral-blue-d         (coral-modify-brightness coral-blue 0.8))
       (coral-blue-l         (coral-modify-brightness coral-blue 1.2))
       (coral-cyan-d         (coral-modify-brightness coral-cyan 0.8))
       (coral-cyan-l         (coral-modify-brightness coral-cyan 1.2))
       (coral-green-d        (coral-modify-brightness coral-green 0.8))
       (coral-green-l        (coral-modify-brightness coral-green 1.2))
       (coral-gray-d         (coral-modify-brightness coral-gray 0.8))
       (coral-gray-l         (coral-modify-brightness coral-gray 1.2))
       ;; Adaptive higher/lower contrast accented colors
       (coral-foreground-hc  (coral-modify-brightness coral-foreground 1.2))
       (coral-foreground-lc  (coral-modify-brightness coral-foreground 0.8))
       (coral-background-hc  (coral-modify-brightness coral-background 1.5))
       ;; High contrast colors
       (coral-yellow-hc      (coral-modify-brightness coral-yellow 1.4))
       (coral-yellow-lc      (coral-modify-brightness coral-yellow 0.6))
       (coral-orange-hc      (coral-modify-brightness coral-orange 1.4))
       (coral-orange-lc      (coral-modify-brightness coral-orange 0.6))
       (coral-red-hc         (coral-modify-brightness coral-red 1.4))
       (coral-red-lc         (coral-modify-brightness coral-red 0.6))
       (coral-magenta-hc     (coral-modify-brightness coral-magenta 1.4))
       (coral-magenta-lc     (coral-modify-brightness coral-magenta 0.6))
       (coral-violet-hc      (coral-modify-brightness coral-violet 1.4))
       (coral-violet-lc      (coral-modify-brightness coral-violet 0.6))
       (coral-blue-hc        (coral-modify-brightness coral-blue 1.4))
       (coral-blue-lc        (coral-modify-brightness coral-blue 0.6))
       (coral-cyan-hc        (coral-modify-brightness coral-cyan 1.4))
       (coral-cyan-lc        (coral-modify-brightness coral-cyan 0.6))
       (coral-green-hc       (coral-modify-brightness coral-green 1.4))
       (coral-green-lc       (coral-modify-brightness coral-green 0.6))
       (coral-comments-hc    (coral-modify-brightness coral-comments 1.4))
       
       ;; Distinct fringe
       (coral-fringe-bg (if coral-distinct-fringe-background
                              coral-gray
                            coral-background))

       ;; Definitions for terminals that do not support 256 colors
       (coral-256-class '((class color) (min-colors 89)))
       ;; Primary colors
       (coral-256-yellow         "brightyellow")
       (coral-256-orange         "yellow")
       (coral-256-red            "red")
       (coral-256-magenta        "magenta")
       (coral-256-violet         "brightmagenta")
       (coral-256-blue           "blue")
       (coral-256-cyan           "cyan")
       (coral-256-green          "green")
       (coral-256-gray           "brightblack")
       ;; Darker and lighter accented colors
       (coral-256-yellow-d       "#878700")
       (coral-256-yellow-l       "#FFFF87")
       (coral-256-orange-d       "#AF5F00")
       (coral-256-orange-l       "#FFAF5F")
       (coral-256-red-d          "#870000")
       (coral-256-red-l          "#FF5F87")
       (coral-256-magenta-d      "#AF0087")
       (coral-256-magenta-l      "#FF87DF")
       (coral-256-violet-d       "#5F00AF")
       (coral-256-violet-l       "#AF87D7")
       (coral-256-blue-d         "#008787")
       (coral-256-blue-l         "#87D7FF")
       (coral-256-cyan-d         "#5FAFAF")
       (coral-256-cyan-l         "#AFFFFF")
       (coral-256-green-d        "#5F8700")
       (coral-256-green-l        "#AFD700")
       (coral-256-gray-d         "#333333")
       (coral-256-gray-l         "#707070")
       ;; Adaptive colors
       (coral-256-foreground     "white")
       (coral-256-background     "black")
       (coral-256-comments       "brightblack")
       (coral-256-emphasis       "brightwhite")
       (coral-256-line-number    "#8F908A")
       (coral-256-highlight      "#474747")
       (coral-256-highlight-alt  "#3E3E3E")
       (coral-256-highlight-line "#000000")
       ;; Adaptive higher/lower contrast accented colors
       (coral-256-foreground-hc  "#171A0B")
       (coral-256-foreground-lc  "#141414")
       ;; High contrast colors
       (coral-256-yellow-hc      coral-256-yellow-d)
       (coral-256-yellow-lc      coral-256-yellow-l)
       (coral-256-orange-hc      coral-256-orange-d)
       (coral-256-orange-lc      coral-256-orange-l)
       (coral-256-red-hc         coral-256-red-d)
       (coral-256-red-lc         coral-256-red-l)
       (coral-256-magenta-hc     coral-256-magenta-d)
       (coral-256-magenta-lc     coral-256-magenta-l)
       (coral-256-violet-hc      coral-256-violet-d)
       (coral-256-violet-lc      coral-256-violet-l)
       (coral-256-blue-hc        coral-256-blue-d)
       (coral-256-blue-lc        coral-256-blue-l)
       (coral-256-cyan-hc        coral-256-cyan-d)
       (coral-256-cyan-lc        coral-256-cyan-l)
       (coral-256-green-hc       coral-256-green-d)
       (coral-256-green-lc       coral-256-green-l)

       ;; Distinct fringe
       (coral-256-fringe-bg (if coral-distinct-fringe-background
                                  coral-256-gray
                                coral-256-background)))

  ;; Define faces
  (custom-theme-set-faces
   'coral

   ;; font lock for syntax highlighting
   `(font-lock-builtin-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :inherit bold))))

   `(font-lock-comment-delimiter-face
     ((,coral-class (:foreground ,coral-comments-hc :inherit italic))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(font-lock-comment-face
     ((,coral-class (:foreground ,coral-comments-hc :inherit italic))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(font-lock-constant-face
     ((,coral-class (:foreground ,coral-orange :slant normal))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   `(font-lock-doc-face
     ((,coral-class (:foreground ,coral-comments-hc :inherit italic))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(font-lock-function-name-face
     ((,coral-class (:foreground ,coral-green))
       (,coral-256-class  (:foreground ,coral-256-green))))

   `(font-lock-keyword-face
     ((,coral-class (:foreground ,coral-red
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :inherit bold))))

   `(font-lock-negation-char-face
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   `(font-lock-preprocessor-face
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(font-lock-regexp-grouping-construct
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   `(font-lock-regexp-grouping-backslash
     ((,coral-class (:foreground ,coral-violet
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-violet
                                        :inherit bold))))

   `(font-lock-string-face
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(font-lock-type-face
     ((,coral-class (:foreground ,coral-blue
                                   :inherit italic))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :italic nil))))

   `(font-lock-variable-name-face
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(font-lock-warning-face
     ((,coral-class (:foreground ,coral-orange
                                   :inherit bold
                                   :italic nil
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-orange
                                        :inherit bold
                                        :italic nil
                                        :underline t))))

   `(c-annotation-face
     ((,coral-class (:inherit font-lock-constant-face))
      (,coral-256-class  (:inherit font-lock-constant-face))))

   ;; general colouring
   '(button ((t (:underline t))))

   `(default
      ((,coral-class (:foreground ,coral-foreground
					  :background ,coral-background))
       (,coral-256-class  (:foreground ,coral-256-foreground
					       :background ,coral-256-background))))

   `(italic
     ((,coral-class (:slant italic))
      (,coral-256-class (:slant italic))))

   `(highlight
     ((,coral-class (:background ,coral-highlight))
      (,coral-256-class  (:background ,coral-256-highlight))))

   `(lazy-highlight
     ((,coral-class (:inherit highlight
                                :background ,coral-highlight-alt))
      (,coral-256-class  (:inherit highlight
                                     :background ,coral-256-highlight-alt))))

   `(region
     ((,coral-class (:inherit highlight
                                :background ,coral-highlight))
      (,coral-256-class  (:inherit highlight
                                     :background ,coral-256-highlight))))

   `(secondary-selection
     ((,coral-class (:inherit region
                                :background ,coral-highlight-alt))
      (,coral-256-class  (:inherit region
                                     :background ,coral-256-highlight-alt))))

   `(shadow
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(match
     ((,coral-class (:background ,coral-green
                                   :foreground ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-green
                                        :foreground ,coral-256-background
                                        :inherit bold))))

   `(cursor
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-foreground
                                   :inverse-video t))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-foreground
                                        :inverse-video t))))

   `(mouse
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-foreground
                                   :inverse-video t))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-foreground
                                        :inverse-video t))))

   `(escape-glyph
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(escape-glyph-face
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(fringe
     ((,coral-class (:foreground ,coral-foreground
                                   :background ,coral-fringe-bg))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :background ,coral-256-fringe-bg))))

   `(link
     ((,coral-class (:foreground ,coral-blue
                                   :underline t
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :underline t
                                        :inherit bold))))

   `(link-visited
     ((,coral-class (:foreground ,coral-violet
                                   :underline t
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-violet
                                        :underline t
                                        :inherit bold))))

   `(success
     ((,coral-class (:foreground ,coral-green ))
      (,coral-256-class  (:foreground ,coral-256-green ))))

   `(bold
     ((,coral-class (:weight bold))
      (,coral-256-class (:weight regular))))

   `(bold-italic
     ((,coral-class (:inherit bold))))
   
   `(warning
     ((,coral-class (:foreground ,coral-yellow ))
      (,coral-256-class  (:foreground ,coral-256-yellow ))))

   `(error
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(eval-sexp-fu-flash
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-green))))

   `(eval-sexp-fu-flash-error
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-red))))

   `(trailing-whitespace
     ((,coral-class (:background ,coral-red))
      (,coral-256-class  (:background ,coral-256-red))))

   `(vertical-border
     ((,coral-class (:foreground ,coral-gray))
      (,coral-256-class  (:foreground ,coral-256-gray))))

   `(menu
     ((,coral-class (:foreground ,coral-foreground
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :background ,coral-256-background))))

   `(minibuffer-prompt
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   ;; mode-line and powerline
   `(mode-line-buffer-id
     ((,coral-class (:foreground ,coral-green
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :inherit bold))))

   `(mode-line
     ((,coral-class (:foreground ,coral-emphasis
				 :background ,coral-comments))

      (,coral-256-class  (:inverse-video unspecified
                                           :underline unspecified
                                           :foreground ,coral-256-foreground
                                           :background ,coral-256-gray
                                           :box (:line-width 1
                                                             :color ,coral-256-highlight
                                                             :style unspecified)))))

   `(powerline-active1
     ((,coral-class (:background ,coral-gray-d :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-gray-d))))

   `(powerline-active2
     ((,coral-class (:background ,coral-highlight :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-background))))


   `(mode-line-inactive
     ((,coral-class (:foreground ,coral-comments
				 :background ,coral-background))
      (,coral-256-class  (:inverse-video unspecified
                                           :underline unspecified
                                           :foreground ,coral-256-comments
                                           :background ,coral-256-background
                                           :box (:line-width 1
                                                             :color ,coral-256-gray
                                                             :style unspecified)))))

   `(powerline-inactive1
     ((,coral-class (:background ,coral-gray-d :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-gray-d))))

   `(powerline-inactive2
     ((,coral-class (:background ,coral-background :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-background))))

   ;; header-line
   `(header-line
     ((,coral-class (:foreground ,coral-emphasis
                                   :background ,coral-highlight))
;;                                   :box (:color ,coral-gray
                                                ;; :line-width 1
                                                ;; :style unspecified)))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :background ,coral-256-highlight
                                        :box (:color ,coral-256-gray
                                                     :line-width 1
                                                     :style unspecified)))))

   ;; Help
   `(help-argument-name
     ((,coral-class (:underline t))
      (,coral-256-class (:underline t))))

   ;; Circe
   `(circe-server-face
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class (:foreground ,coral-256-comments))))

   `(circe-highlight-nick-face
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class (:foreground ,coral-256-blue))))

   `(circe-prompt-face
     ((,coral-class (:foreground ,coral-magenta))
      (,coral-256-class (:foreground ,coral-256-magenta))))

   `(lui-time-stamp-face
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class (:foreground ,coral-256-comments))))

   ;; comint
   `(comint-highlight-input
     ((,coral-class ())
      (,coral-256-class ())))

   `(comint-highlight-prompt
     ((,coral-class (:underline nil))
      (,coral-256-class (:underline nil :foreground ,coral-256-blue))))
   
   ;; cua
   `(cua-global-mark
     ((,coral-class (:background ,coral-yellow
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-yellow
                                        :foreground ,coral-256-background))))

   `(cua-rectangle
     ((,coral-class (:inherit region))
      (,coral-256-class  (:inherit region))))

   `(cua-rectangle-noselect
     ((,coral-class (:inherit secondary-selection))
      (,coral-256-class  (:inherit secondary-selection))))

   ;; diary
   `(diary
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   ;; dired
   `(dired-directory
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(dired-flagged
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(dired-header
     ((,coral-class (:foreground ,coral-blue
                                   :background ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :background ,coral-256-background
                                        :inherit bold))))

   `(dired-ignored
     ((,coral-class (:inherit shadow))
      (,coral-256-class  (:inherit shadow))))

   `(dired-mark
     ((,coral-class (:foreground ,coral-green
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :inherit bold))))

   `(dired-marked
     ((,coral-class (:foreground ,coral-violet
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-violet
                                        :inherit bold))))

   `(dired-perm-write
     ((,coral-class (:foreground ,coral-foreground
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :underline t))))

   `(dired-symlink
     ((,coral-class (:foreground ,coral-cyan
                                   :slant normal))
      (,coral-256-class  (:foreground ,coral-256-cyan
                                        :slant normal))))

   `(dired-warning
     ((,coral-class (:foreground ,coral-orange
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-orange
                                        :underline t))))

   ;; dropdown
   `(dropdown-list-face
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-blue))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-blue))))

   `(dropdown-list-selection-face
     ((,coral-class (:background ,coral-green
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-green
                                        :foreground ,coral-256-background))))

   ;; ecb
   `(ecb-default-highlight-face
     ((,coral-class (:background ,coral-blue
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-blue
                                        :foreground ,coral-256-background))))

   `(ecb-history-bucket-node-dir-soure-path-face
     ((,coral-class (:inherit ecb-history-bucket-node-face
                                :foreground ,coral-yellow))
      (,coral-256-class  (:inherit ecb-history-bucket-node-face
                                     :foreground ,coral-256-yellow))))

   `(ecb-source-in-directories-buffer-face
     ((,coral-class (:inherit ecb-directories-general-face
                                :foreground ,coral-foreground))
      (,coral-256-class  (:inherit ecb-directories-general-face
                                     :foreground ,coral-256-foreground))))

   `(ecb-history-dead-buffer-face
     ((,coral-class (:inherit ecb-history-general-face
                                :foreground ,coral-comments))
      (,coral-256-class  (:inherit ecb-history-general-face
                                     :foreground ,coral-256-comments))))

   `(ecb-directory-not-accessible-face
     ((,coral-class (:inherit ecb-directories-general-face
                                :foreground ,coral-comments))
      (,coral-256-class  (:inherit ecb-directories-general-face
                                     :foreground ,coral-256-comments))))

   `(ecb-bucket-node-face
     ((,coral-class (:inherit ecb-default-general-face
                                :inherit bold
                                :foreground ,coral-blue))
      (,coral-256-class  (:inherit ecb-default-general-face
                                     :inherit bold
                                     :foreground ,coral-256-blue))))

   `(ecb-tag-header-face
     ((,coral-class (:background ,coral-highlight-line))
      (,coral-256-class  (:background ,coral-256-highlight-line))))

   `(ecb-analyse-bucket-element-face
     ((,coral-class (:inherit ecb-analyse-general-face
                                :foreground ,coral-green))
      (,coral-256-class  (:inherit ecb-analyse-general-face
                                     :foreground ,coral-256-green))))

   `(ecb-directories-general-face
     ((,coral-class (:inherit ecb-default-general-face))
      (,coral-256-class  (:inherit ecb-default-general-face))))
   
   `(ecb-method-non-semantic-face
     ((,coral-class (:inherit ecb-methods-general-face
                                :foreground ,coral-cyan))
      (,coral-256-class  (:inherit ecb-methods-general-face
                                     :foreground ,coral-256-cyan))))

   `(ecb-mode-line-prefix-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(ecb-tree-guide-line-face
     ((,coral-class (:inherit ecb-default-general-face
                                :foreground ,coral-gray
                                :height 1.0))
      (,coral-256-class  (:inherit ecb-default-general-face
                                     :foreground ,coral-256-gray
                                     :height 1.0))))

   ;; ee
   `(ee-bookmarked
     ((,coral-class (:foreground ,coral-emphasis))
      (,coral-256-class  (:foreground ,coral-256-emphasis))))

   `(ee-category
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(ee-link
     ((,coral-class (:inherit link))
      (,coral-256-class  (:inherit link))))

   `(ee-link-visited
     ((,coral-class (:inherit link-visited))
      (,coral-256-class  (:inherit link-visited))))

   `(ee-marked
     ((,coral-class (:foreground ,coral-magenta
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-magenta
                                        :inherit bold))))

   `(ee-omitted
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(ee-shadow
     ((,coral-class (:inherit shadow))
      (,coral-256-class  (:inherit shadow))))

   ;; grep
   `(grep-context-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(grep-error-face
     ((,coral-class (:foreground ,coral-red
                                   :inherit bold
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :inherit bold
                                        :underline t))))

   `(grep-hit-face
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(grep-match-face
     ((,coral-class (:foreground ,coral-green
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :inherit bold))))

   ;; isearch
   `(isearch
     ((,coral-class (:inherit region
                                :background ,coral-green))
      (,coral-256-class  (:inherit region
                                     :background ,coral-256-green))))

   `(isearch-fail
     ((,coral-class (:inherit isearch
                                :foreground ,coral-red
                                :background ,coral-background
                                :inherit bold))
      (,coral-256-class  (:inherit isearch
                                     :foreground ,coral-256-red
                                     :background ,coral-256-background
                                     :inherit bold))))


   ;; ace-jump-mode
   `(ace-jump-face-background
     ((,coral-class (:foreground ,coral-comments
                                   :background ,coral-background
                                   :inverse-video nil))
      (,coral-256-class  (:foreground ,coral-256-comments
                                        :background ,coral-256-background
                                        :inverse-video nil))))

   `(ace-jump-face-foreground
     ((,coral-class (:foreground ,coral-yellow
                                   :background ,coral-background
                                   :inverse-video nil
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :background ,coral-256-background
                                        :inverse-video nil
                                        :inherit bold))))

   ;; auctex
   `(font-latex-bold-face
     ((,coral-class (:inherit bold
                                :foreground ,coral-emphasis))
      (,coral-256-class  (:inherit bold
                                     :foreground ,coral-256-emphasis))))

   `(font-latex-doctex-documentation-face
     ((,coral-class (:background unspecified))
      (,coral-256-class  (:background unspecified))))

   `(font-latex-doctex-preprocessor-face
     ((,coral-class
       (:inherit (font-latex-doctex-documentation-face
                  font-lock-builtin-face
                  font-lock-preprocessor-face)))
      (,coral-class
       (:inherit (font-latex-doctex-documentation-face
                  font-lock-builtin-face
                  font-lock-preprocessor-face)))))

   `(font-latex-italic-face
     ((,coral-class (:inherit italic :foreground ,coral-emphasis))
      (,coral-256-class  (:underline t :foreground ,coral-256-emphasis))))

   `(font-latex-math-face
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   `(font-latex-sectioning-0-face
     ((,coral-class (:inherit font-latex-sectioning-1-face))
      (,coral-256-class  (:inherit font-latex-sectioning-1-face))))

   `(font-latex-sectioning-1-face
     ((,coral-class (:inherit font-latex-sectioning-2-face))
      (,coral-256-class  (:inherit font-latex-sectioning-2-face))))

   `(font-latex-sectioning-2-face
     ((,coral-class (:inherit font-latex-sectioning-3-face))
      (,coral-256-class  (:inherit font-latex-sectioning-3-face))))

   `(font-latex-sectioning-3-face
     ((,coral-class (:inherit font-latex-sectioning-4-face))
      (,coral-256-class  (:inherit font-latex-sectioning-4-face))))

   `(font-latex-sectioning-4-face
     ((,coral-class (:inherit font-latex-sectioning-5-face))
      (,coral-256-class  (:inherit font-latex-sectioning-5-face))))

   `(font-latex-sectioning-5-face
     ((,coral-class (:inherit ,coral-pitch
                                :foreground ,coral-yellow
                                :inherit bold))
      (,coral-256-class  (:inherit ,coral-pitch
					   :foreground ,coral-256-yellow
					   :inherit bold))))

   `(font-latex-sedate-face
     ((,coral-class (:foreground ,coral-emphasis))
      (,coral-256-class  (:foreground ,coral-256-emphasis))))

   `(font-latex-slide-title-face
     ((,coral-class (:inherit (,coral-pitch font-lock-type-face)
				      :inherit bold)))
     (,coral-256-class  (:inherit (,coral-pitch font-lock-type-face)
                                     :inherit bold)))

   `(font-latex-string-face
     ((,coral-class (:foreground ,coral-cyan))
      (,coral-256-class  (:foreground ,coral-256-cyan))))

   `(font-latex-subscript-face
     ((,coral-class ())
      (,coral-256-class  ())))

   `(font-latex-superscript-face
     ((,coral-class ())
      (,coral-256-class  ())))

   `(font-latex-verbatim-face
     ((,coral-class (:inherit fixed-pitch
                                :foreground ,coral-foreground
                                :slant normal))
      (,coral-256-class  (:inherit fixed-pitch
                                     :foreground ,coral-256-foreground
                                     :slant normal))))

   `(font-latex-warning-face
     ((,coral-class (:inherit bold
                                :foreground ,coral-orange))
      (,coral-256-class  (:inherit bold
                                     :foreground ,coral-256-orange))))

   ;; auto-complete
   `(ac-candidate-face
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-blue))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-blue))))

   `(ac-selection-face
     ((,coral-class (:background ,coral-blue
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-blue
                                        :foreground ,coral-256-background))))

   `(ac-candidate-mouse-face
     ((,coral-class (:background ,coral-blue
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-blue
                                        :foreground ,coral-256-background))))

   `(ac-completion-face
     ((,coral-class (:foreground ,coral-emphasis
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :underline t))))

   `(ac-gtags-candidate-face
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-blue))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-blue))))

   `(ac-gtags-selection-face
     ((,coral-class (:background ,coral-blue
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-blue
                                        :foreground ,coral-256-background))))

   `(ac-yasnippet-candidate-face
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-yellow))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-yellow))))

   `(ac-yasnippet-selection-face
     ((,coral-class (:background ,coral-yellow
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-yellow
                                        :foreground ,coral-256-background))))

   ;; auto highlight symbol
   `(ahs-definition-face
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-blue))))

   `(ahs-edit-mode-face
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-highlight))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-highlight))))

   `(ahs-face
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-magenta
                                        :background unspecified))))

   `(ahs-plugin-bod-face
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-violet ))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-cyan ))))

   `(ahs-plugin-defalt-face
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-orange))))

   `(ahs-plugin-whole-buffer-face
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-green))))

   `(ahs-warning-face
     ((,coral-class (:foreground ,coral-red
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :inherit bold))))

   ;; android mode
   `(android-mode-debug-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(android-mode-error-face
     ((,coral-class (:foreground ,coral-orange
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-orange
                                        :inherit bold))))

   `(android-mode-info-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(android-mode-verbose-face
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(android-mode-warning-face
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   ;; anzu-mode
   `(anzu-mode-line
     ((,coral-class (:foreground ,coral-violet
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-violet
                                        :inherit bold))))

   ;; bm
   `(bm-face
     ((,coral-class (:background ,coral-yellow-lc
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-yellow-lc
                                        :foreground ,coral-256-background))))

   `(bm-fringe-face
     ((,coral-class (:background ,coral-yellow-lc
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-yellow-lc
                                        :foreground ,coral-256-background))))

   `(bm-fringe-persistent-face
     ((,coral-class (:background ,coral-green-lc
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-green-lc
                                        :foreground ,coral-256-background))))

   `(bm-persistent-face
     ((,coral-class (:background ,coral-green-lc
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-green-lc
                                        :foreground ,coral-256-background))))

   ;; calfw
   `(cfw:face-day-title
     ((,coral-class (:background ,coral-highlight-line))
      (,coral-256-class  (:background ,coral-256-highlight-line))))

   `(cfw:face-annotation
     ((,coral-class (:inherit cfw:face-day-title
                                :foreground ,coral-yellow))
      (,coral-256-class  (:inherit cfw:face-day-title
                                     :foreground ,coral-256-yellow))))

   `(cfw:face-default-content
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(cfw:face-default-day
     ((,coral-class (:inherit cfw:face-day-title
                                :inherit bold))
      (,coral-256-class  (:inherit cfw:face-day-title
                                     :inherit bold))))

   `(cfw:face-disable
     ((,coral-class (:inherit cfw:face-day-title
                                :foreground ,coral-comments))
      (,coral-256-class  (:inherit cfw:face-day-title
                                     :foreground ,coral-256-comments))))

   `(cfw:face-grid
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(cfw:face-header
     ((,coral-class (:foreground ,coral-blue-hc
                                   :background ,coral-blue-lc
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue-hc
                                        :background ,coral-256-blue-lc
                                        :inherit bold))))

   `(cfw:face-holiday
     ((,coral-class (:background nil
                                   :foreground ,coral-red
                                   :inherit bold))
      (,coral-256-class  (:background nil
                                        :foreground ,coral-256-red
                                        :inherit bold))))

   `(cfw:face-periods
     ((,coral-class (:foreground ,coral-magenta))
      (,coral-256-class  (:foreground ,coral-256-magenta))))

   `(cfw:face-select
     ((,coral-class (:background ,coral-magenta-lc
                                   :foreground ,coral-magenta-hc))
      (,coral-256-class  (:background ,coral-256-magenta-lc
                                        :foreground ,coral-256-magenta-hc))))

   `(cfw:face-saturday
     ((,coral-class (:foreground ,coral-cyan-hc
                                   :background ,coral-cyan-lc))
      (,coral-256-class  (:foreground ,coral-256-cyan-hc
                                        :background ,coral-256-cyan-lc))))

   `(cfw:face-sunday
     ((,coral-class (:foreground ,coral-red-hc
                                   :background ,coral-red-lc
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-red-hc
                                        :background ,coral-256-red-lc
                                        :inherit bold))))

   `(cfw:face-title
     ((,coral-class (:inherit ,coral-pitch
                                :foreground ,coral-yellow
                                :inherit bold
                                :height ,coral-height-plus-4))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :foreground ,coral-256-yellow
                                     :inherit bold
                                     :height ,coral-height-plus-4))))

   `(cfw:face-today
     ((,coral-class (:inherit bold
                               :background ,coral-highlight-line
                               :foreground nil))
      (,coral-256-class  (:inherit bold
                                    :background ,coral-256-highlight-line
                                    :foreground nil))))

   `(cfw:face-today-title
     ((,coral-class (:background ,coral-yellow-lc
                                   :foreground ,coral-yellow-hc
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-yellow-lc
                                        :foreground ,coral-256-yellow-hc
                                        :inherit bold))))

   `(cfw:face-toolbar
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-foreground))))

   `(cfw:face-toolbar-button-off
     ((,coral-class (:background ,coral-yellow-lc
                                   :foreground ,coral-yellow-hc
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-yellow-lc
                                        :foreground ,coral-256-yellow-hc
                                        :inherit bold))))

   `(cfw:face-toolbar-button-on
     ((,coral-class (:background ,coral-yellow-hc
                                   :foreground ,coral-yellow-lc
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-yellow-hc
                                        :foreground ,coral-256-yellow-lc
                                        :inherit bold))))

   ;; cider
   `(cider-enlightened
     ((,coral-class (:foreground ,coral-yellow
                                   :background nil
                                   :box (:color ,coral-yellow :line-width -1 :style nil)))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :background nil
                                        :box (:color ,coral-256-yellow :line-width -1 :style nil))) ))

   `(cider-enlightened-local
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(cider-instrumented-face
     ((,coral-class (:foreground ,coral-violet
                                   :background nil
                                   :box (:color ,coral-violet :line-width -1 :style nil)))
      (,coral-256-class  (:foreground ,coral-256-violet
                                        :background nil
                                        :box (:color ,coral-256-violet :line-width -1 :style nil)))))

   `(cider-result-overlay-face
     ((,coral-class (:foreground ,coral-blue
                                   :background nil
                                   :box (:color ,coral-blue :line-width -1 :style nil)))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :background nil
                                        :box (:color ,coral-256-blue :line-width -1 :style nil)))))

   `(cider-test-error-face
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-orange))))

   `(cider-test-failure-face
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-red))))

   `(cider-test-success-face
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-green))))

   `(cider-traced-face
     ((,coral-class :box (:color ,coral-blue :line-width -1 :style nil))
      (,coral-256-class  :box (:color ,coral-256-blue :line-width -1 :style nil))))

   ;; clojure-test
   `(clojure-test-failure-face
     ((,coral-class (:foreground ,coral-red
                                   :inherit bold
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :inherit bold
                                        :underline t))))

   `(clojure-test-error-face
     ((,coral-class (:foreground ,coral-orange
                                   :inherit bold
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :inherit bold
                                        :underline t))))

   `(clojure-test-success-face
     ((,coral-class (:foreground ,coral-green
                                   :inherit bold
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :inherit bold
                                        :underline t))))

   ;; company-mode
   `(company-tooltip
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-emphasis))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-emphasis))))

   `(company-tooltip-selection
     ((,coral-class (:background ,coral-blue
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-blue
                                        :foreground ,coral-256-background))))

   `(company-tooltip-mouse
     ((,coral-class (:background ,coral-blue
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-blue
                                        :foreground ,coral-256-background))))

   `(company-tooltip-common
     ((,coral-class (:foreground ,coral-blue
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :underline t))))

   `(company-tooltip-common-selection
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-blue
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-blue
                                        :underline t))))

   `(company-preview
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-emphasis))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-emphasis))))

   `(company-preview-common
     ((,coral-class (:foreground ,coral-blue
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :underline t))))

   `(company-scrollbar-bg
     ((,coral-class (:background ,coral-gray))
      (,coral-256-class  (:background ,coral-256-gray))))

   `(company-scrollbar-fg
     ((,coral-class (:background ,coral-comments))
      (,coral-256-class  (:background ,coral-256-comments))))

   `(company-tooltip-annotation
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-green))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-green))))

   `(company-template-field
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-blue))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-blue))))

   ;; compilation
   `(compilation-column-face
     ((,coral-class (:foreground ,coral-cyan
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-cyan
                                        :underline nil))))

   `(compilation-column-number
     ((,coral-class (:inherit font-lock-doc-face
                                :foreground ,coral-cyan
                                :underline nil))
      (,coral-256-class  (:inherit font-lock-doc-face
                                     :foreground ,coral-256-cyan
                                     :underline nil))))

   `(compilation-enter-directory-face
     ((,coral-class (:foreground ,coral-green
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :underline nil))))

   `(compilation-error
     ((,coral-class (:inherit error
                                :underline nil))
      (,coral-256-class  (:inherit error
                                     :underline nil))))

   `(compilation-error-face
     ((,coral-class (:foreground ,coral-red
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :underline nil))))

   `(compilation-face
     ((,coral-class (:foreground ,coral-foreground
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :underline nil))))

   `(compilation-info
     ((,coral-class (:foreground ,coral-comments
                                   :underline nil
                                   :bold nil))
      (,coral-256-class  (:foreground ,coral-256-comments
                                        :underline nil
                                        :bold nil))))

   `(compilation-info-face
     ((,coral-class (:foreground ,coral-blue
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :underline nil))))

   `(compilation-leave-directory-face
     ((,coral-class (:foreground ,coral-green
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :underline nil))))

   `(compilation-line-face
     ((,coral-class (:foreground ,coral-green
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :underline nil))))

   `(compilation-line-number
     ((,coral-class (:foreground ,coral-green
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :underline nil))))

   `(compilation-warning
     ((,coral-class (:inherit warning
                                :underline nil))
      (,coral-256-class  (:inherit warning
                                     :underline nil))))

   `(compilation-warning-face
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold
                                        :underline nil))))

   `(compilation-mode-line-exit
     ((,coral-class (:inherit compilation-info
                                :foreground ,coral-green
                                :inherit bold))
      (,coral-256-class  (:inherit compilation-info
                                     :foreground ,coral-256-green
                                     :inherit bold))))

   `(compilation-mode-line-fail
     ((,coral-class (:inherit compilation-error
                                :foreground ,coral-red
                                :inherit bold))
      (,coral-256-class  (:inherit compilation-error
                                     :foreground ,coral-256-red
                                     :inherit bold))))

   `(compilation-mode-line-run
     ((,coral-class (:foreground ,coral-orange
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-orange
                                        :inherit bold))))

   ;; CSCOPE
   `(cscope-file-face
     ((,coral-class (:foreground ,coral-green
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :inherit bold))))

   `(cscope-function-face
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(cscope-line-number-face
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(cscope-line-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(cscope-mouse-face
     ((,coral-class (:background ,coral-blue
                                   :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-blue
                                        :foreground ,coral-256-foreground))))

   ;; ctable
   `(ctbl:face-cell-select
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-emphasis
                                   :underline ,coral-emphasis
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-emphasis
                                        :underline ,coral-256-emphasis
                                        :inherit bold))))

   `(ctbl:face-continue-bar
     ((,coral-class (:background ,coral-gray
                                   :foreground ,coral-yellow))
      (,coral-256-class  (:background ,coral-256-gray
                                        :foreground ,coral-256-yellow))))

   `(ctbl:face-row-select
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-foreground
                                   :underline t))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-foreground
                                        :underline t))))

   ;; coffee
   `(coffee-mode-class-name
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   `(coffee-mode-function-param
     ((,coral-class (:foreground ,coral-violet
                                   :slant normal))
      (,coral-256-class  (:foreground ,coral-256-violet
                                        :slant normal))))

   ;; custom
   `(custom-face-tag
     ((,coral-class (:inherit ,coral-pitch
                                :height ,coral-height-plus-3
                                :foreground ,coral-violet
                                :inherit bold))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :height ,coral-height-plus-3
                                     :foreground ,coral-256-violet
                                     :inherit bold))))

   `(custom-variable-tag
     ((,coral-class (:inherit ,coral-pitch
                                :foreground ,coral-cyan
                                :height ,coral-height-plus-3))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :foreground ,coral-256-cyan
                                     :height ,coral-height-plus-3))))

   `(custom-comment-tag
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(custom-group-tag
     ((,coral-class (:inherit ,coral-pitch
                                :foreground ,coral-blue
                                :height ,coral-height-plus-3))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :foreground ,coral-256-blue
                                     :height ,coral-height-plus-3))))

   `(custom-group-tag-1
     ((,coral-class (:inherit ,coral-pitch
                                :foreground ,coral-red
                                :height ,coral-height-plus-3))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :foreground ,coral-256-red
                                     :height ,coral-height-plus-3))))

   `(custom-state
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   ;; diff
   `(diff-added
     ((,coral-class (:foreground ,coral-green
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :background ,coral-256-background))))

   `(diff-changed
     ((,coral-class (:foreground ,coral-blue
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :background ,coral-256-background))))

   `(diff-removed
     ((,coral-class (:foreground ,coral-red
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :background ,coral-256-background))))

   `(diff-header
     ((,coral-class (:background ,coral-background))
      (,coral-256-class  (:background ,coral-256-background))))

   `(diff-file-header
     ((,coral-class (:background ,coral-background
                                   :foreground ,coral-foreground
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-background
                                        :foreground ,coral-256-foreground
                                        :inherit bold))))

   `(diff-refine-added
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-green))))

   `(diff-refine-change
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-blue))))

   `(diff-refine-removed
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-red))))

   ;; diff-hl
   `(diff-hl-change
     ((,coral-class (:background ,coral-blue-lc
                                   :foreground ,coral-blue-hc))
      (,coral-256-class  (:background ,coral-256-blue-lc
                                        :foreground ,coral-256-blue-hc))))

   `(diff-hl-delete
     ((,coral-class (:background ,coral-red-lc
                                   :foreground ,coral-red-hc))
      (,coral-256-class  (:background ,coral-256-red-lc
                                        :foreground ,coral-256-red-hc))))

   `(diff-hl-insert
     ((,coral-class (:background ,coral-green-lc
                                   :foreground ,coral-green-hc))
      (,coral-256-class  (:background ,coral-256-green-lc
                                        :foreground ,coral-256-green-hc))))

   `(diff-hl-unknown
     ((,coral-class (:background ,coral-violet-lc
                                   :foreground ,coral-violet-hc))
      (,coral-256-class  (:background ,coral-256-violet-lc
                                        :foreground ,coral-256-violet-hc))))

   ;; ediff
   `(ediff-fine-diff-A
     ((,coral-class (:background ,coral-orange-lc))
      (,coral-256-class  (:background ,coral-256-orange-lc))))

   `(ediff-fine-diff-B
     ((,coral-class (:background ,coral-green-lc))
      (,coral-256-class  (:background ,coral-256-green-lc))))

   `(ediff-fine-diff-C
     ((,coral-class (:background ,coral-yellow-lc))
      (,coral-256-class  (:background ,coral-256-yellow-lc))))

   `(ediff-current-diff-C
     ((,coral-class (:background ,coral-blue-lc))
      (,coral-256-class  (:background ,coral-256-blue-lc))))

   `(ediff-even-diff-A
     ((,coral-class (:background ,coral-comments
                                   :foreground ,coral-foreground-lc ))
      (,coral-256-class  (:background ,coral-256-comments
                                        :foreground ,coral-256-foreground-lc ))))

   `(ediff-odd-diff-A
     ((,coral-class (:background ,coral-comments
                                   :foreground ,coral-foreground-hc ))
      (,coral-256-class  (:background ,coral-256-comments
                                        :foreground ,coral-256-foreground-hc ))))

   `(ediff-even-diff-B
     ((,coral-class (:background ,coral-comments
                                   :foreground ,coral-foreground-hc ))
      (,coral-256-class  (:background ,coral-256-comments
                                        :foreground ,coral-256-foreground-hc ))))

   `(ediff-odd-diff-B
     ((,coral-class (:background ,coral-comments
                                   :foreground ,coral-foreground-lc ))
      (,coral-256-class  (:background ,coral-256-comments
                                        :foreground ,coral-256-foreground-lc ))))

   `(ediff-even-diff-C
     ((,coral-class (:background ,coral-comments
                                   :foreground ,coral-foreground ))
      (,coral-256-class  (:background ,coral-256-comments
                                        :foreground ,coral-256-foreground ))))

   `(ediff-odd-diff-C
     ((,coral-class (:background ,coral-comments
                                   :foreground ,coral-background ))
      (,coral-256-class  (:background ,coral-256-comments
                                        :foreground ,coral-256-background ))))

   ;; edts
   `(edts-face-error-line
     ((,(append '((supports :underline (:style line))) coral-class)
       (:underline (:style line :color ,coral-red)
                   :inherit unspecified))
      (,coral-class (:foreground ,coral-red-hc
                                   :background ,coral-red-lc
                                   :inherit bold
                                   :underline t))
      (,(append '((supports :underline (:style line))) coral-256-class )
       (:underline (:style line :color ,coral-256-red)
                   :inherit unspecified))
      (,coral-256-class  (:foreground ,coral-256-red-hc
                                        :background ,coral-256-red-lc
                                        :inherit bold
                                        :underline t))))

   `(edts-face-warning-line
     ((,(append '((supports :underline (:style line))) coral-class)
       (:underline (:style line :color ,coral-yellow)
                   :inherit unspecified))
      (,coral-class (:foreground ,coral-yellow-hc
                                   :background ,coral-yellow-lc
                                   :inherit bold
                                   :underline t))
      (,(append '((supports :underline (:style line))) coral-256-class )
       (:underline (:style line :color ,coral-256-yellow)
                   :inherit unspecified))
      (,coral-256-class  (:foreground ,coral-256-yellow-hc
                                        :background ,coral-256-yellow-lc
                                        :inherit bold
                                        :underline t))))

   `(edts-face-error-fringe-bitmap
     ((,coral-class (:foreground ,coral-red
                                   :background unspecified
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :background unspecified
                                        :inherit bold))))

   `(edts-face-warning-fringe-bitmap
     ((,coral-class (:foreground ,coral-yellow
                                   :background unspecified
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :background unspecified
                                        :inherit bold))))

   `(edts-face-error-mode-line
     ((,coral-class (:background ,coral-red
                                   :foreground unspecified))
      (,coral-256-class  (:background ,coral-256-red
                                        :foreground unspecified))))

   `(edts-face-warning-mode-line
     ((,coral-class (:background ,coral-yellow
                                   :foreground unspecified))
      (,coral-256-class  (:background ,coral-256-yellow
                                        :foreground unspecified))))


   ;; elfeed
   `(elfeed-search-date-face
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(elfeed-search-feed-face
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(elfeed-search-tag-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(elfeed-search-title-face
     ((,coral-class (:foreground ,coral-cyan))
      (,coral-256-class  (:foreground ,coral-256-cyan))))

   ;; ein
   `(ein:cell-input-area
     ((,coral-class (:background ,coral-highlight-line))
      (,coral-256-class  (:background ,coral-256-highlight-line))))
   `(ein:cell-input-prompt
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))
   `(ein:cell-output-prompt
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))
   `(ein:notification-tab-normal
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))
   `(ein:notification-tab-selected
     ((,coral-class (:foreground ,coral-orange :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-orange :inherit bold))))

   ;; enhanced ruby mode
   `(enh-ruby-string-delimiter-face
     ((,coral-class (:inherit font-lock-string-face))
      (,coral-256-class  (:inherit font-lock-string-face))))

   `(enh-ruby-heredoc-delimiter-face
     ((,coral-class (:inherit font-lock-string-face))
      (,coral-256-class  (:inherit font-lock-string-face))))

   `(enh-ruby-regexp-delimiter-face
     ((,coral-class (:inherit font-lock-string-face))
      (,coral-256-class  (:inherit font-lock-string-face))))

   `(enh-ruby-op-face
     ((,coral-class (:inherit font-lock-keyword-face))
      (,coral-256-class  (:inherit font-lock-keyword-face))))

   ;; erm-syn
   `(erm-syn-errline
     ((,(append '((supports :underline (:style wave))) coral-class)
       (:underline (:style wave :color ,coral-red)
                   :inherit unspecified))
      (,coral-class (:foreground ,coral-red-hc
                                   :background ,coral-red-lc
                                   :inherit bold
                                   :underline t))
      (,(append '((supports :underline (:style wave))) coral-256-class )
       (:underline (:style wave :color ,coral-256-red)
                   :inherit unspecified))
      (,coral-256-class  (:foreground ,coral-256-red-hc
                                        :background ,coral-256-red-lc
                                        :inherit bold
                                        :underline t))))

   `(erm-syn-warnline
     ((,(append '((supports :underline (:style wave))) coral-class)
       (:underline (:style wave :color ,coral-orange)
                   :inherit unspecified))
      (,coral-class (:foreground ,coral-orange-hc
                                   :background ,coral-orange-lc
                                   :inherit bold
                                   :underline t))
      (,(append '((supports :underline (:style wave))) coral-256-class )
       (:underline (:style wave :color ,coral-256-orange)
                   :inherit unspecified))
      (,coral-256-class  (:foreground ,coral-256-orange-hc
                                        :background ,coral-256-orange-lc
                                        :inherit bold
                                        :underline t))))

   ;; epc
   `(epc:face-title
     ((,coral-class (:foreground ,coral-blue
                                   :background ,coral-background
                                   :inherit bold
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :background ,coral-256-background
                                        :inherit bold
                                        :underline nil))))

   ;; erc
   `(erc-action-face
     ((,coral-class (:inherit erc-default-face))
      (,coral-256-class  (:inherit erc-default-face))))

   `(erc-bold-face
     ((,coral-class (:inherit bold))
      (,coral-256-class  (:inherit bold))))

   `(erc-button
     ((,coral-class (:inherit bold :underline t))
      (,coral-256-class (:inherit bold))))

   `(erc-current-nick-face
     ((,coral-class (:foreground ,coral-blue :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :inherit bold))))

   `(erc-dangerous-host-face
     ((,coral-class (:inherit font-lock-warning-face))
      (,coral-256-class  (:inherit font-lock-warning-face))))

   `(erc-default-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(erc-highlight-face
     ((,coral-class (:inherit erc-default-face
                                :background ,coral-highlight))
      (,coral-256-class  (:inherit erc-default-face
                                     :background ,coral-256-highlight))))

   `(erc-direct-msg-face
     ((,coral-class (:inherit erc-default-face))
      (,coral-256-class  (:inherit erc-default-face))))

   `(erc-error-face
     ((,coral-class (:inherit font-lock-warning-face))
      (,coral-256-class  (:inherit font-lock-warning-face))))

   `(erc-fool-face
     ((,coral-class (:inherit erc-default-face))
      (,coral-256-class  (:inherit erc-default-face))))

   `(erc-input-face
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(erc-keyword-face
     ((,coral-class (:foreground ,coral-blue
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :inherit bold))))

   `(erc-nick-default-face
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   `(erc-my-nick-face
     ((,coral-class (:foreground ,coral-red
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-red
				      :inherit bold))))
   
   `(erc-my-nick-prefix-face
     ((,coral-class (:foreground ,coral-red
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :inherit bold))))

   `(erc-nick-msg-face
     ((,coral-class (:inherit erc-default-face))
      (,coral-256-class  (:inherit erc-default-face))))

   `(erc-notice-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(erc-pal-face
     ((,coral-class (:foreground ,coral-orange
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-orange
                                        :inherit bold))))

   `(erc-prompt-face
     ((,coral-class (:foreground ,coral-orange
                                   :background ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-orange
                                        :background ,coral-256-background
                                        :inherit bold))))

   `(erc-timestamp-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(erc-underline-face
     ((t (:underline t))))

   ;; eshell
   `(eshell-prompt
     ((,coral-class (:foreground ,coral-blue
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :inherit bold))))

   `(eshell-ls-archive
     ((,coral-class (:foreground ,coral-red
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :inherit bold))))

   `(eshell-ls-backup
     ((,coral-class (:inherit font-lock-comment-face))
      (,coral-256-class  (:inherit font-lock-comment-face))))

   `(eshell-ls-clutter
     ((,coral-class (:inherit font-lock-comment-face))
      (,coral-256-class  (:inherit font-lock-comment-face))))

   `(eshell-ls-directory
     ((,coral-class (:foreground ,coral-blue
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :inherit bold))))

   `(eshell-ls-executable
     ((,coral-class (:foreground ,coral-green
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :inherit bold))))

   `(eshell-ls-unreadable
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(eshell-ls-missing
     ((,coral-class (:inherit font-lock-warning-face))
      (,coral-256-class  (:inherit font-lock-warning-face))))

   `(eshell-ls-product
     ((,coral-class (:inherit font-lock-doc-face))
      (,coral-256-class  (:inherit font-lock-doc-face))))

   `(eshell-ls-special
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   `(eshell-ls-symlink
     ((,coral-class (:foreground ,coral-cyan
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-cyan
				      :inherit bold))))

   ;; evil-ex-substitute
   `(evil-ex-substitute-matches
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-red-l
                                   :inherit italic))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-red-l
                                        :inherit italic))))
   `(evil-ex-substitute-replacement
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-green-l
                                   :inherit italic))
      (,coral-256-class  (:background ,coral-256-highlight-line :foreground ,coral-256-green-l :inherit italic))))

   ;; evil-search-highlight-persist
   `(evil-search-highlight-persist-highlight-face
     ((,coral-class (:inherit region))
      (,coral-256-class  (:inherit region))))

   ;; fic
   `(fic-author-face
     ((,coral-class (:background ,coral-background
                                   :foreground ,coral-orange
                                   :underline t
                                   :slant normal))
      (,coral-256-class  (:background ,coral-256-background
                                        :foreground ,coral-256-orange
                                        :underline t
                                        :slant normal))))

   `(fic-face
     ((,coral-class (:background ,coral-background
                                   :foreground ,coral-orange
                                   :inherit bold
                                   :slant normal))
      (,coral-256-class  (:background ,coral-256-background
                                        :foreground ,coral-256-orange
                                        :inherit bold
                                        :slant normal))))

   `(font-lock-fic-face
     ((,coral-class (:background ,coral-background
                                   :foreground ,coral-orange
                                   :inherit bold
                                   :slant normal))
      (,coral-256-class  (:background ,coral-256-background
                                        :foreground ,coral-256-orange
                                        :inherit bold
                                        :slant normal))))

   ;; flx
   `(flx-highlight-face
     ((,coral-class (:foreground ,coral-blue
                                   :inherit bold
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :inherit bold
                                        :underline nil))))

   ;; flymake
   `(flymake-errline
     ((,(append '((supports :underline (:style wave))) coral-class)
       (:underline (:style wave :color ,coral-red)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,coral-class (:foreground ,coral-red-hc
                                   :background ,coral-red-lc
                                   :inherit bold
                                   :underline t))
      (,(append '((supports :underline (:style wave))) coral-256-class )
       (:underline (:style wave :color ,coral-256-red)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,coral-256-class  (:foreground ,coral-256-red-hc
                                        :background ,coral-256-red-lc
                                        :inherit bold
                                        :underline t))))

   `(flymake-infoline
     ((,(append '((supports :underline (:style wave))) coral-class)
       (:underline (:style wave :color ,coral-green)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,coral-class (:foreground ,coral-green-hc
                                   :background ,coral-green-lc))
      (,(append '((supports :underline (:style wave))) coral-256-class )
       (:underline (:style wave :color ,coral-256-green)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,coral-256-class  (:foreground ,coral-256-green-hc
                                        :background ,coral-256-green-lc))))

   `(flymake-warnline
     ((,(append '((supports :underline (:style wave))) coral-class)
       (:underline (:style wave :color ,coral-yellow)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,coral-class (:foreground ,coral-yellow-hc
                                   :background ,coral-yellow-lc
                                   :inherit bold
                                   :underline t))
      (,(append '((supports :underline (:style wave))) coral-256-class )
       (:underline (:style wave :color ,coral-256-yellow)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,coral-256-class  (:foreground ,coral-256-yellow-hc
                                        :background ,coral-256-yellow-lc
                                        :inherit bold
                                        :underline t))))

   ;; flycheck
   `(flycheck-error
     ((,(append '((supports :underline (:style line))) coral-class)
       (:underline (:style line :color ,coral-red)))
      (,coral-class (:foreground ,coral-red
			     :background ,coral-background
                             :inherit bold
                             :underline t))
      (,(append '((supports :underline (:style line))) coral-256-class )
       (:underline (:style line :color ,coral-256-red)))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :background ,coral-256-background
                                        :inherit bold
                                        :underline t))))

   `(flycheck-warning
     ((,(append '((supports :underline (:style line))) coral-class)
       (:underline (:style line :color ,coral-orange)))
      (,coral-class (:foreground ,coral-orange
                                   :background ,coral-background
                                   :inherit bold
                                   :underline t))
      (,(append '((supports :underline (:style line))) coral-256-class )
       (:underline (:style line :color ,coral-256-orange)))
      (,coral-256-class  (:foreground ,coral-256-orange
                                        :background ,coral-256-background
                                        :inherit bold
                                        :underline t))))

   `(flycheck-info
     ((,(append '((supports :underline (:style line))) coral-class)
       (:underline (:style line :color ,coral-blue)))
      (,coral-class (:foreground ,coral-blue
                                   :background ,coral-background
                                   :inherit bold
                                   :underline t))
      (,(append '((supports :underline (:style line))) coral-256-class )
       (:underline (:style line :color ,coral-256-blue)))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :background ,coral-256-background
                                        :inherit bold
                                        :underline t))))

   `(flycheck-fringe-error
     ((,coral-class (:foreground ,coral-red
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-red-l
                                        :inherit bold))))

   `(flycheck-fringe-warning
     ((,coral-class (:foreground ,coral-orange
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-orange-l
                                        :inherit bold))))

   `(flycheck-fringe-info
     ((,coral-class (:foreground ,coral-blue
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue-l
                                        :inherit bold))))

   ;; flyspell
   `(flyspell-duplicate
     ((,(append '((supports :underline (:style wave))) coral-class)
       (:underline (:style wave :color ,coral-yellow)
                   :inherit unspecified))
      (,coral-class (:foreground ,coral-yellow
                                   :inherit bold
                                   :underline t))
      (,(append '((supports :underline (:style wave))) coral-256-class )
       (:underline (:style wave :color ,coral-256-yellow)
                   :inherit unspecified))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold
                                        :underline t))))

   `(flyspell-incorrect
     ((,(append '((supports :underline (:style wave))) coral-class)
       (:underline (:style wave :color ,coral-red)
                   :inherit unspecified))
      (,coral-class (:foreground ,coral-red
                                   :inherit bold
                                   :underline t))
      (,(append '((supports :underline (:style wave))) coral-256-class )
       (:underline (:style wave :color ,coral-256-red)
                   :inherit unspecified))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :inherit bold
                                        :underline t))))


   ;; git-gutter
   `(git-gutter:added
     ((,coral-class (:background ,coral-green
                                   :foreground ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-green
                                        :foreground ,coral-256-background
                                        :inherit bold))))

   `(git-gutter:deleted
     ((,coral-class (:background ,coral-red
                                   :foreground ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-red
                                        :foreground ,coral-256-background
                                        :inherit bold))))

   `(git-gutter:modified
     ((,coral-class (:background ,coral-blue
                                   :foreground ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-blue
                                        :foreground ,coral-256-background
                                        :inherit bold))))

   `(git-gutter:unchanged
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-background
                                        :inherit bold))))

   ;; git-gutter-fr
   `(git-gutter-fr:added
     ((,coral-class (:foreground ,coral-green
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :inherit bold))))

   `(git-gutter-fr:deleted
     ((,coral-class (:foreground ,coral-red
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :inherit bold))))

   `(git-gutter-fr:modified
     ((,coral-class (:foreground ,coral-blue
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :inherit bold))))

   ;; git-gutter+ and git-gutter+-fr
   `(git-gutter+-added
     ((,coral-class (:background ,coral-green
                                   :foreground ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-green
                                        :foreground ,coral-256-background
                                        :inherit bold))))

   `(git-gutter+-deleted
     ((,coral-class (:background ,coral-red
                                   :foreground ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-red
                                        :foreground ,coral-256-background
                                        :inherit bold))))

   `(git-gutter+-modified
     ((,coral-class (:background ,coral-blue
                                   :foreground ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-blue
                                        :foreground ,coral-256-background
                                        :inherit bold))))

   `(git-gutter+-unchanged
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-background
                                        :inherit bold))))

   `(git-gutter-fr+-added
     ((,coral-class (:foreground ,coral-green
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :inherit bold))))

   `(git-gutter-fr+-deleted
     ((,coral-class (:foreground ,coral-red
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :inherit bold))))

   `(git-gutter-fr+-modified
     ((,coral-class (:foreground ,coral-blue
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :inherit bold))))

   ;; git-timemachine
   `(git-timemachine-minibuffer-detail-face
     ((,coral-class (:foreground ,coral-blue
                                   :background ,coral-highlight-line
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-blue
                                        :background ,coral-256-highlight-line
                                        :inherit bold))))

   ;; guide-key
   `(guide-key/highlight-command-face
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(guide-key/key-face
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(guide-key/prefix-command-face
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   ;; gnus
   `(gnus-group-mail-1
     ((,coral-class (:inherit bold
                               :inherit gnus-group-mail-1-empty))
      (,coral-256-class  (:inherit bold
                                    :inherit gnus-group-mail-1-empty))))

   `(gnus-group-mail-1-empty
     ((,coral-class (:inherit gnus-group-news-1-empty))
      (,coral-256-class  (:inherit gnus-group-news-1-empty))))

   `(gnus-group-mail-2
     ((,coral-class (:inherit bold
                               :inherit gnus-group-mail-2-empty))
      (,coral-256-class  (:inherit bold
                                    :inherit gnus-group-mail-2-empty))))

   `(gnus-group-mail-2-empty
     ((,coral-class (:inherit gnus-group-news-2-empty))
      (,coral-256-class  (:inherit gnus-group-news-2-empty))))

   `(gnus-group-mail-3
     ((,coral-class (:inherit bold
                               :inherit gnus-group-mail-3-empty))
      (,coral-256-class  (:inherit bold
                                    :inherit gnus-group-mail-3-empty))))

   `(gnus-group-mail-3-empty
     ((,coral-class (:inherit gnus-group-news-3-empty))
      (,coral-256-class  (:inherit gnus-group-news-3-empty))))

   `(gnus-group-mail-low
     ((,coral-class (:inherit bold
                               :inherit gnus-group-mail-low-empty))
      (,coral-256-class  (:inherit bold
                                    :inherit gnus-group-mail-low-empty))))

   `(gnus-group-mail-low-empty
     ((,coral-class (:inherit gnus-group-news-low-empty))
      (,coral-256-class  (:inherit gnus-group-news-low-empty))))

   `(gnus-group-news-1
     ((,coral-class (:inherit bold
                               :inherit gnus-group-news-1-empty))
      (,coral-256-class  (:inherit bold
                                    :inherit gnus-group-news-1-empty))))

   `(gnus-group-news-2
     ((,coral-class (:inherit bold
                               :inherit gnus-group-news-2-empty))
      (,coral-256-class  (:inherit bold
                                    :inherit gnus-group-news-2-empty))))

   `(gnus-group-news-3
     ((,coral-class (:inherit bold
                               :inherit gnus-group-news-3-empty))
      (,coral-256-class  (:inherit bold
                                    :inherit gnus-group-news-3-empty))))

   `(gnus-group-news-4
     ((,coral-class (:inherit bold
                               :inherit gnus-group-news-4-empty))
      (,coral-256-class  (:inherit bold
                                    :inherit gnus-group-news-4-empty))))

   `(gnus-group-news-5
     ((,coral-class (:inherit bold
                               :inherit gnus-group-news-5-empty))
      (,coral-256-class  (:inherit bold
                                    :inherit gnus-group-news-5-empty))))

   `(gnus-group-news-6
     ((,coral-class (:inherit bold
                               :inherit gnus-group-news-6-empty))
      (,coral-256-class  (:inherit bold
                                    :inherit gnus-group-news-6-empty))))

   `(gnus-group-news-low
     ((,coral-class (:inherit bold
                               :inherit gnus-group-news-low-empty))
      (,coral-256-class  (:inherit bold
                                    :inherit gnus-group-news-low-empty))))

   `(gnus-header-content
     ((,coral-class (:inherit message-header-other))
      (,coral-256-class  (:inherit message-header-other))))

   `(gnus-header-from
     ((,coral-class (:inherit message-header-other))
      (,coral-256-class  (:inherit message-header-other))))

   `(gnus-header-name
     ((,coral-class (:inherit message-header-name))
      (,coral-256-class  (:inherit message-header-name))))

   `(gnus-header-newsgroups
     ((,coral-class (:inherit message-header-other))
      (,coral-256-class  (:inherit message-header-other))))

   `(gnus-header-subject
     ((,coral-class (:inherit message-header-subject))
      (,coral-256-class  (:inherit message-header-subject))))

   `(gnus-summary-cancelled
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(gnus-summary-high-ancient
     ((,coral-class (:foreground ,coral-blue
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :inherit bold))))

   `(gnus-summary-high-read
     ((,coral-class (:foreground ,coral-green
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :inherit bold))))

   `(gnus-summary-high-ticked
     ((,coral-class (:foreground ,coral-orange
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-orange
                                        :inherit bold))))

   `(gnus-summary-high-unread
     ((,coral-class (:foreground ,coral-foreground
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :inherit bold))))

   `(gnus-summary-low-ancient
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(gnus-summary-low-read
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(gnus-summary-low-ticked
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(gnus-summary-low-unread
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(gnus-summary-normal-ancient
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(gnus-summary-normal-read
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(gnus-summary-normal-ticked
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(gnus-summary-normal-unread
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(gnus-summary-selected
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   `(gnus-cite-1
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(gnus-cite-2
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(gnus-cite-3
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(gnus-cite-4
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(gnus-cite-5
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(gnus-cite-6
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(gnus-cite-7
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(gnus-cite-8
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(gnus-cite-9
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(gnus-cite-10
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(gnus-cite-11
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(gnus-group-news-1-empty
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(gnus-group-news-2-empty
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(gnus-group-news-3-empty
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(gnus-group-news-4-empty
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(gnus-group-news-5-empty
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(gnus-group-news-6-empty
     ((,coral-class (:foreground ,coral-blue-lc))
      (,coral-256-class  (:foreground ,coral-256-blue-lc))))

   `(gnus-group-news-low-empty
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(gnus-signature
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(gnus-x-face
     ((,coral-class (:background ,coral-foreground
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-foreground
                                        :foreground ,coral-256-background))))


   ;; helm
   `(helm-apt-deinstalled
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(helm-apt-installed
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(helm-bookmark-directory
     ((,coral-class (:inherit helm-ff-directory))
      (,coral-256-class  (:inherit helm-ff-directory))))

   `(helm-bookmark-file
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(helm-bookmark-gnus
     ((,coral-class (:foreground ,coral-cyan))
      (,coral-256-class  (:foreground ,coral-256-cyan))))

   `(helm-bookmark-info
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(helm-bookmark-man
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   `(helm-bookmark-w3m
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(helm-bookmarks-su
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(helm-buffer-file
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(helm-buffer-directory
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(helm-buffer-process
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(helm-buffer-saved-out
     ((,coral-class (:foreground ,coral-red
                                   :background ,coral-background
                                   :inverse-video t))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :background ,coral-256-background
                                        :inverse-video t))))

   `(helm-buffer-size
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(helm-candidate-number
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-emphasis
                                   :bold t))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-emphasis
                                        :bold t))))

   `(helm-ff-directory
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(helm-ff-executable
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(helm-ff-file
     ((,coral-class (:background ,coral-background
                                   :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-background
                                        :foreground ,coral-256-foreground))))

   `(helm-ff-invalid-symlink
     ((,coral-class (:background ,coral-background
                                   :foreground ,coral-orange
                                   :slant normal))
      (,coral-256-class  (:background ,coral-256-background
                                        :foreground ,coral-256-orange
                                        :slant normal))))

   `(helm-ff-prefix
     ((,coral-class (:background ,coral-green
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-green
                                        :foreground ,coral-256-background))))

   `(helm-ff-symlink
     ((,coral-class (:foreground ,coral-cyan))
      (,coral-256-class  (:foreground ,coral-256-cyan))))

   `(helm-grep-file
     ((,coral-class (:foreground ,coral-cyan
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-cyan
                                        :underline t))))

   `(helm-grep-finish
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(helm-grep-lineno
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(helm-grep-match
     ((,coral-class (:inherit helm-match)))
     ((,coral-256-class  (:inherit helm-match))))

   `(helm-grep-running
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(helm-header
     ((,coral-class (:inherit header-line))
      (,coral-256-class  (:inherit terminal-header-line))))

   `(helm-lisp-completion-info
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(helm-lisp-show-completion
     ((,coral-class (:foreground ,coral-yellow
                                   :background ,coral-highlight-line
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :background ,coral-256-highlight-line
                                        :inherit bold))))

   `(helm-M-x-key
     ((,coral-class (:foreground ,coral-orange
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-orange
                                        :underline t))))

   `(helm-moccur-buffer
     ((,coral-class (:foreground ,coral-cyan
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-cyan
                                        :underline t))))

   `(helm-match
     ((,coral-class (:foreground ,coral-green :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-green :inherit bold))))

   `(helm-match-item
     ((,coral-class (:inherit helm-match))
      (,coral-256-class  (:inherit helm-match))))

   `(helm-selection
     ((,coral-class (:background ,coral-highlight
                                   :inherit bold
                                   :underline nil))
      (,coral-256-class  (:background ,coral-256-highlight
                                        :inherit bold
                                        :underline nil))))

   `(helm-selection-line
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-emphasis
                                   :underline nil))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-emphasis
                                        :underline nil))))

   `(helm-separator
     ((,coral-class (:foreground ,coral-gray))
      (,coral-256-class  (:foreground ,coral-256-gray))))

   `(helm-source-header
     ((,coral-class (:background ,coral-violet-l
                                   :foreground ,coral-background
                                   :underline nil))
      (,coral-256-class  (:background ,coral-256-violet-l
                                        :foreground ,coral-256-background
                                        :underline nil))))

   `(helm-swoop-target-line-face
     ((,coral-class (:background ,coral-highlight-line))
      (,coral-256-class  (:background ,coral-256-highlight-line))))

   `(helm-swoop-target-line-block-face
     ((,coral-class (:background ,coral-highlight-line))
      (,coral-256-class  (:background ,coral-256-highlight-line))))

   `(helm-swoop-target-word-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(helm-time-zone-current
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(helm-time-zone-home
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(helm-visible-mark
     ((,coral-class (:background ,coral-background
                                   :foreground ,coral-magenta :inherit bold))
      (,coral-256-class  (:background ,coral-256-background
                                        :foreground ,coral-256-magenta :inherit bold))))

   ;; helm-ls-git
   `(helm-ls-git-modified-not-staged-face
     ((,coral-class :foreground ,coral-blue)
      (,coral-256-class  :foreground ,coral-256-blue)))

   `(helm-ls-git-modified-and-staged-face
     ((,coral-class :foreground ,coral-blue-l)
      (,coral-256-class  :foreground ,coral-256-blue-l)))

   `(helm-ls-git-renamed-modified-face
     ((,coral-class :foreground ,coral-blue-l)
      (,coral-256-class  :foreground ,coral-256-blue-l)))

   `(helm-ls-git-untracked-face
     ((,coral-class :foreground ,coral-orange)
      (,coral-256-class  :foreground ,coral-256-orange)))

   `(helm-ls-git-added-copied-face
     ((,coral-class :foreground ,coral-green)
      (,coral-256-class  :foreground ,coral-256-green)))

   `(helm-ls-git-added-modified-face
     ((,coral-class :foreground ,coral-green-l)
      (,coral-256-class  :foreground ,coral-256-green-l)))

   `(helm-ls-git-deleted-not-staged-face
     ((,coral-class :foreground ,coral-red)
      (,coral-256-class  :foreground ,coral-256-red)))

   `(helm-ls-git-deleted-and-staged-face
     ((,coral-class :foreground ,coral-red-l)
      (,coral-256-class  :foreground ,coral-256-red-l)))

   `(helm-ls-git-conflict-face
     ((,coral-class :foreground ,coral-yellow)
      (,coral-256-class  :foreground ,coral-256-yellow)))

   ;; hi-lock-mode
   `(hi-yellow
     ((,coral-class (:foreground ,coral-yellow-lc
                                   :background ,coral-yellow-hc))
      (,coral-256-class  (:foreground ,coral-256-yellow-lc
                                        :background ,coral-256-yellow-hc))))

   `(hi-pink
     ((,coral-class (:foreground ,coral-magenta-lc
                                   :background ,coral-magenta-hc))
      (,coral-256-class  (:foreground ,coral-256-magenta-lc
                                        :background ,coral-256-magenta-hc))))

   `(hi-green
     ((,coral-class (:foreground ,coral-green-lc
                                   :background ,coral-green-hc))
      (,coral-256-class  (:foreground ,coral-256-green-lc
                                        :background ,coral-256-green-hc))))

   `(hi-blue
     ((,coral-class (:foreground ,coral-blue-lc
                                   :background ,coral-blue-hc))
      (,coral-256-class  (:foreground ,coral-256-blue-lc
                                        :background ,coral-256-blue-hc))))

   `(hi-black-b
     ((,coral-class (:foreground ,coral-emphasis
                                   :background ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :background ,coral-256-background
                                        :inherit bold))))

   `(hi-blue-b
     ((,coral-class (:foreground ,coral-blue-lc
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue-lc
                                        :inherit bold))))

   `(hi-green-b
     ((,coral-class (:foreground ,coral-green-lc
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-green-lc
                                        :inherit bold))))

   `(hi-red-b
     ((,coral-class (:foreground ,coral-red
                                   :inherit bold))))

   `(hi-black-hb
     ((,coral-class (:foreground ,coral-emphasis
                                   :background ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :background ,coral-256-background
                                        :inherit bold))))

   ;; highlight-changes
   `(highlight-changes
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(highlight-changes-delete
     ((,coral-class (:foreground ,coral-red
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :underline t))))

   ;; highlight-indentation
   `(highlight-indentation-face
     ((,coral-class (:background ,coral-gray))
      (,coral-256-class  (:background ,coral-256-gray))))

   `(highlight-indentation-current-column-face
     ((,coral-class (:background ,coral-gray))
      (,coral-256-class  (:background ,coral-256-gray))))

   ;; highlight-symbol
   `(highlight-symbol-face
     ((,coral-class (:background ,coral-highlight))
      (,coral-256-class  (:background ,coral-256-highlight))))

   ;; hl-line-mode
   `(hl-line
     ((,coral-class (:background ,coral-highlight-line))
      (,coral-256-class  (:background ,coral-256-highlight-line))))

   `(hl-line-face
     ((,coral-class (:background ,coral-highlight-line))
      (,coral-256-class  (:background ,coral-256-highlight-line))))

   ;; ido-mode
   `(ido-first-match
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   `(ido-only-match
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-yellow
                                        :inherit bold))))

   `(ido-subdir
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(ido-incomplete-regexp
     ((,coral-class (:foreground ,coral-red
                                   :inherit bold ))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :inherit bold ))))

   `(ido-indicator
     ((,coral-class (:background ,coral-red
                                   :foreground ,coral-background
                                   :width condensed))
      (,coral-256-class  (:background ,coral-256-red
                                        :foreground ,coral-256-background
                                        :width condensed))))

   `(ido-virtual
     ((,coral-class (:foreground ,coral-cyan))
      (,coral-256-class  (:foreground ,coral-256-cyan))))

   ;; info
   `(info-header-xref
     ((,coral-class (:foreground ,coral-green
                                   :inherit bold
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :inherit bold
                                        :underline t))))

   `(info-menu
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(info-node
     ((,coral-class (:foreground ,coral-violet
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-violet
                                        :inherit bold))))

   `(info-quoted-name
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(info-reference-item
     ((,coral-class (:background nil
                                   :underline t
                                   :inherit bold))
      (,coral-256-class  (:background nil
                                        :underline t
                                        :inherit bold))))

   `(info-string
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(info-title-1
     ((,coral-class (:height ,coral-height-plus-4))
      (,coral-256-class  (:height ,coral-height-plus-4))))

   `(info-title-2
     ((,coral-class (:height ,coral-height-plus-3))
      (,coral-256-class  (:height ,coral-height-plus-3))))

   `(info-title-3
     ((,coral-class (:height ,coral-height-plus-2))
      (,coral-256-class  (:height ,coral-height-plus-2))))

   `(info-title-4
     ((,coral-class (:height ,coral-height-plus-1))
      (,coral-256-class  (:height ,coral-height-plus-1))))

   ;; ivy
   `(ivy-current-match
     ((,coral-class (:background ,coral-gray :inherit bold))
      (,coral-256-class  (:background ,coral-gray-l :inherit bold))))

   `(ivy-minibuffer-match-face-1
     ((,coral-class (:inherit bold))
      (,coral-256-class  (:inherit bold))))

   `(ivy-minibuffer-match-face-2
     ((,coral-class (:foreground ,coral-violet
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-violet
                                        :underline t))))

   `(ivy-minibuffer-match-face-3
     ((,coral-class (:foreground ,coral-green
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :underline t))))

   `(ivy-minibuffer-match-face-4
     ((,coral-class (:foreground ,coral-yellow
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :underline t))))

   `(ivy-remote
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(swiper-line-face
     ((,coral-class (:background ,coral-highlight-line))))

   `(swiper-match-face-1
     ((,coral-class (:background ,coral-gray-d))))

   `(swiper-match-face-2
     ((,coral-class (:background ,coral-green))))

   `(swiper-match-face-3
     ((,coral-class (:background ,coral-orange))))

   `(swiper-match-face-4
     ((,coral-class (:background ,coral-magenta))))

   ;; jabber
   `(jabber-activity-face
     ((,coral-class (:inherit bold
                               :foreground ,coral-red))
      (,coral-256-class  (:inherit bold
                                    :foreground ,coral-256-red))))

   `(jabber-activity-personal-face
     ((,coral-class (:inherit bold
                               :foreground ,coral-blue))
      (,coral-256-class  (:inherit bold
                                    :foreground ,coral-256-blue))))

   `(jabber-chat-error
     ((,coral-class (:inherit bold
                               :foreground ,coral-red))
      (,coral-256-class  (:inherit bold
                                    :foreground ,coral-256-red))))

   `(jabber-chat-prompt-foreign
     ((,coral-class (:inherit bold
                               :foreground ,coral-red))
      (,coral-256-class  (:inherit bold
                                    :foreground ,coral-256-red))))

   `(jabber-chat-prompt-local
     ((,coral-class (:inherit bold
                               :foreground ,coral-blue))
      (,coral-256-class  (:inherit bold
                                    :foreground ,coral-256-blue))))

   `(jabber-chat-prompt-system
     ((,coral-class (:inherit bold
                               :foreground ,coral-green))
      (,coral-256-class  (:inherit bold
                                    :foreground ,coral-256-green))))

   `(jabber-chat-text-foreign
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(jabber-chat-text-local
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(jabber-chat-rare-time-face
     ((,coral-class (:underline t
                                  :foreground ,coral-green))
      (,coral-256-class  (:underline t
                                       :foreground ,coral-256-green))))

   `(jabber-roster-user-away
     ((,coral-class (:slant normal
                              :foreground ,coral-green))
      (,coral-256-class  (:slant normal
                                   :foreground ,coral-256-green))))

   `(jabber-roster-user-chatty
     ((,coral-class (:inherit bold
                               :foreground ,coral-orange))
      (,coral-256-class  (:inherit bold
                                    :foreground ,coral-256-orange))))

   `(jabber-roster-user-dnd
     ((,coral-class (:slant normal
                              :foreground ,coral-red))
      (,coral-256-class  (:slant normal
                                   :foreground ,coral-256-red))))

   `(jabber-roster-user-error
     ((,coral-class (:weight light
                               :slant normal
                               :foreground ,coral-red))
      (,coral-256-class  (:weight light
                                    :slant normal
                                    :foreground ,coral-256-red))))

   `(jabber-roster-user-offline
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(jabber-roster-user-online
     ((,coral-class (:inherit bold
                               :foreground ,coral-blue))
      (,coral-256-class  (:inherit bold
                                    :foreground ,coral-256-blue))))

   `(jabber-roster-user-xa
     ((,coral-class (:slant normal
                              :foreground ,coral-magenta))
      (,coral-256-class  (:slant normal
                                   :foreground ,coral-256-magenta))))

   ;; js2-mode colors
   `(js2-error
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(js2-external-variable
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(js2-function-call
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(js2-function-param
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(js2-instance-member
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   `(js2-jsdoc-html-tag-delimiter
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(js2-jsdoc-html-tag-name
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(js2-jsdoc-tag
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   `(js2-jsdoc-type
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(js2-jsdoc-value
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(js2-magic-paren
     ((,coral-class (:underline t))
      (,coral-256-class  (:underline t))))

   `(js2-object-property
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(js2-private-function-call
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   `(js2-private-member
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(js2-warning
     ((,coral-class (:underline ,coral-orange))
      (,coral-256-class  (:underline ,coral-256-orange))))

   ;; jedi
   `(jedi:highlight-function-argument
     ((,coral-class (:inherit bold))
      (,coral-256-class  (:inherit bold))))

   ;; linum-mode
   `(linum
     ((,coral-class (:foreground ,coral-line-number
                                   :background ,coral-fringe-bg
                                   :inherit default
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-line-number
                                        :background ,coral-256-fringe-bg
                                        :inherit default
                                        :underline nil))))

   ;; linum-relative-current-face
   `(linum-relative-current-face
     ((,coral-class (:foreground ,coral-line-number
                                   :background ,coral-highlight-line
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-line-number
                                        :background ,coral-256-highlight-line
                                        :underline nil))))

   ;; lusty-explorer
   `(lusty-directory-face
     ((,coral-class (:inherit dicoral-red-directory))
      (,coral-256-class  (:inherit dicoral-red-directory))))

   `(lusty-file-face
     ((,coral-class nil)
      (,coral-256-class  nil)))

   `(lusty-match-face
     ((,coral-class (:inherit ido-first-match))
      (,coral-256-class  (:inherit ido-first-match))))

   `(lusty-slash-face
     ((,coral-class (:foreground ,coral-cyan
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-cyan
                                        :inherit bold))))

   ;; magit
   ;;
   ;; TODO: Add supports for all magit faces
   ;; https://github.com/magit/magit/search?utf8=%E2%9C%93&q=face
   ;;

   `(magit-section-highlight
     ((,coral-class (:background "grey20" :inherit bold))))

   `(magit-section-heading
     ((,coral-class (:foreground ,coral-yellow :inherit bold))))
   
   `(magit-section-secondary-heading
     ((,coral-class (:inherit bold))))
   
   `(magit-diff-added
     ((,coral-class (:foreground ,coral-green
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :background ,coral-256-background))))

   `(magit-diff-added-highlight
     ((,coral-class (:foreground ,coral-green
                                   :background ,coral-highlight-line))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :background ,coral-256-highlight-line))))

   `(magit-diff-file-heading
     ((,coral-class (:inherit bold))))
   
   `(magit-diff-removed
     ((,coral-class (:foreground ,coral-red
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :background ,coral-256-background))))

   `(magit-diff-removed-highlight
     ((,coral-class (:foreground ,coral-red
                                   :background ,coral-highlight-line))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :background ,coral-256-highlight-line))))

   `(magit-section-title
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   `(magit-branch
     ((,coral-class (:foreground ,coral-orange
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-orange
                                        :inherit bold))))

   `(magit-item-highlight
     ((,coral-class (:background ,coral-highlight-line
                                   :weight unspecified))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :weight unspecified))))

   `(magit-log-author
     ((,coral-class (:foreground ,coral-cyan))
      (,coral-256-class  (:foreground ,coral-256-cyan))))

   `(magit-log-graph
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(magit-log-head-label-bisect-bad
     ((,coral-class (:background ,coral-red-hc
                                   :foreground ,coral-red-lc
                                   :box 1))
      (,coral-256-class  (:background ,coral-256-red-hc
                                        :foreground ,coral-256-red-lc
                                        :box 1))))

   `(magit-log-head-label-bisect-good
     ((,coral-class (:background ,coral-green-hc
                                   :foreground ,coral-green-lc
                                   :box 1))
      (,coral-256-class  (:background ,coral-256-green-hc
                                        :foreground ,coral-256-green-lc
                                        :box 1))))

   `(magit-log-head-label-default
     ((,coral-class (:background ,coral-highlight-line
                                   :box 1))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :box 1))))

   `(magit-log-head-label-local
     ((,coral-class (:background ,coral-blue-lc
                                   :foreground ,coral-blue-hc
                                   :box 1))
      (,coral-256-class  (:background ,coral-256-blue-lc
                                        :foreground ,coral-256-blue-hc
                                        :box 1))))

   `(magit-log-head-label-patches
     ((,coral-class (:background ,coral-red-lc
                                   :foreground ,coral-red-hc
                                   :box 1))
      (,coral-256-class  (:background ,coral-256-red-lc
                                        :foreground ,coral-256-red-hc
                                        :box 1))))

   `(magit-log-head-label-remote
     ((,coral-class (:background ,coral-green-lc
                                   :foreground ,coral-green-hc
                                   :box 1))
      (,coral-256-class  (:background ,coral-256-green-lc
                                        :foreground ,coral-256-green-hc
                                        :box 1))))

   `(magit-log-head-label-tags
     ((,coral-class (:background ,coral-yellow-lc
                                   :foreground ,coral-yellow-hc
                                   :box 1))
      (,coral-256-class  (:background ,coral-256-yellow-lc
                                        :foreground ,coral-256-yellow-hc
                                        :box 1))))

   `(magit-log-sha1
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   ;; man
   `(Man-overstrike
     ((,coral-class (:foreground ,coral-blue
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :inherit bold))))

   `(Man-reverse
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(Man-underline
     ((,coral-class (:foreground ,coral-green :underline t))
      (,coral-256-class  (:foreground ,coral-256-green :underline t))))

   ;; monky
   `(monky-section-title
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   `(monky-diff-add
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(monky-diff-del
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   ;; markdown-mode
   `(markdown-header-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(markdown-header-face-1
     ((,coral-class (:inherit markdown-header-face
                                :height ,coral-height-plus-4))
      (,coral-256-class  (:inherit markdown-header-face
                                     :height ,coral-height-plus-4))))

   `(markdown-header-face-2
     ((,coral-class (:inherit markdown-header-face
                                :height ,coral-height-plus-3))
      (,coral-256-class  (:inherit markdown-header-face
                                     :height ,coral-height-plus-3))))

   `(markdown-header-face-3
     ((,coral-class (:inherit markdown-header-face
                                :height ,coral-height-plus-2))
      (,coral-256-class  (:inherit markdown-header-face
                                     :height ,coral-height-plus-2))))

   `(markdown-header-face-4
     ((,coral-class (:inherit markdown-header-face
                                :height ,coral-height-plus-1))
      (,coral-256-class  (:inherit markdown-header-face
                                     :height ,coral-height-plus-1))))

   `(markdown-header-face-5
     ((,coral-class (:inherit markdown-header-face))
      (,coral-256-class  (:inherit markdown-header-face))))

   `(markdown-header-face-6
     ((,coral-class (:inherit markdown-header-face))
      (,coral-256-class  (:inherit markdown-header-face))))

   ;; message-mode
   `(message-cited-text
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(message-header-name
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(message-header-other
     ((,coral-class (:foreground ,coral-foreground
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :inherit bold))))

   `(message-header-to
     ((,coral-class (:foreground ,coral-foreground
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :inherit bold))))

   `(message-header-cc
     ((,coral-class (:foreground ,coral-foreground
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :inherit bold))))

   `(message-header-newsgroups
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   `(message-header-subject
     ((,coral-class (:foreground ,coral-cyan
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-cyan
                                        :inherit bold))))

   `(message-header-xheader
     ((,coral-class (:foreground ,coral-cyan))
      (,coral-256-class  (:foreground ,coral-256-cyan))))

   `(message-mml
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   `(message-separator
     ((,coral-class (:foreground ,coral-comments
                                   :slant normal))
      (,coral-256-class  (:foreground ,coral-256-comments
                                        :slant normal))))

   ;; mew
   `(mew-face-header-subject
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(mew-face-header-from
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(mew-face-header-date
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(mew-face-header-to
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(mew-face-header-key
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(mew-face-header-private
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(mew-face-header-important
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(mew-face-header-marginal
     ((,coral-class (:foreground ,coral-foreground
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :inherit bold))))

   `(mew-face-header-warning
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(mew-face-header-xmew
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(mew-face-header-xmew-bad
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(mew-face-body-url
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(mew-face-body-comment
     ((,coral-class (:foreground ,coral-foreground
                                   :slant normal))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :slant normal))))

   `(mew-face-body-cite1
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(mew-face-body-cite2
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(mew-face-body-cite3
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(mew-face-body-cite4
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(mew-face-body-cite5
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(mew-face-mark-review
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(mew-face-mark-escape
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(mew-face-mark-delete
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(mew-face-mark-unlink
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(mew-face-mark-refile
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(mew-face-mark-unread
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(mew-face-eof-message
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(mew-face-eof-part
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   ;; mingus
   `(mingus-directory-face
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(mingus-pausing-face
     ((,coral-class (:foreground ,coral-magenta))
      (,coral-256-class  (:foreground ,coral-256-magenta))))

   `(mingus-playing-face
     ((,coral-class (:foreground ,coral-cyan))
      (,coral-256-class  (:foreground ,coral-256-cyan))))

   `(mingus-playlist-face
     ((,coral-class (:foreground ,coral-cyan ))
      (,coral-256-class  (:foreground ,coral-256-cyan ))))

   `(mingus-song-file-face
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(mingus-stopped-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   ;; mmm
   `(mmm-init-submode-face
     ((,coral-class (:background ,coral-violet-d))
      (,coral-256-class  (:background ,coral-256-violet-d))))

   `(mmm-cleanup-submode-face
     ((,coral-class (:background ,coral-orange-d))
      (,coral-256-class  (:background ,coral-256-orange-d))))

   `(mmm-declaration-submode-face
     ((,coral-class (:background ,coral-cyan-d))
      (,coral-256-class  (:background ,coral-256-cyan-d))))

   `(mmm-comment-submode-face
     ((,coral-class (:background ,coral-blue-d))
      (,coral-256-class  (:background ,coral-256-blue-d))))

   `(mmm-output-submode-face
     ((,coral-class (:background ,coral-red-d))
      (,coral-256-class  (:background ,coral-256-red-d))))

   `(mmm-special-submode-face
     ((,coral-class (:background ,coral-green-d))
      (,coral-256-class  (:background ,coral-256-green-d))))

   `(mmm-code-submode-face
     ((,coral-class (:background ,coral-gray))
      (,coral-256-class  (:background ,coral-256-gray))))

   `(mmm-default-submode-face
     ((,coral-class (:background ,coral-gray-d))
      (,coral-256-class  (:background ,coral-256-gray-d))))

   ;; moccur
   `(moccur-current-line-face
     ((,coral-class (:underline t))
      (,coral-256-class  (:underline t))))

   `(moccur-edit-done-face
     ((,coral-class (:foreground ,coral-comments
                                   :background ,coral-background
                                   :slant normal))
      (,coral-256-class  (:foreground ,coral-256-comments
                                        :background ,coral-256-background
                                        :slant normal))))

   `(moccur-edit-face
     ((,coral-class (:background ,coral-yellow
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-yellow
                                        :foreground ,coral-256-background))))

   `(moccur-edit-file-face
     ((,coral-class (:background ,coral-highlight-line))
      (,coral-256-class  (:background ,coral-256-highlight-line))))

   `(moccur-edit-reject-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(moccur-face
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-emphasis
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-emphasis
                                        :inherit bold))))

   `(search-buffers-face
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-emphasis
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-emphasis
                                        :inherit bold))))

   `(search-buffers-header-face
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-yellow
                                        :inherit bold))))

   ;; mu4e

   `(mu4e-compose-separator-face
     ((,coral-class (:foreground ,coral-comments))))
   
   `(mu4e-cited-1-face
     ((,coral-class (:foreground ,coral-green
                                   :slant normal
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :slant normal
                                        :inherit bold))))

   `(mu4e-cited-2-face
     ((,coral-class (:foreground ,coral-blue
                                   :slant normal
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :slant normal
                                        :inherit bold))))

   `(mu4e-cited-3-face
     ((,coral-class (:foreground ,coral-orange
                                   :slant normal
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-orange
                                        :slant normal
                                        :inherit bold))))

   `(mu4e-cited-4-face
     ((,coral-class (:foreground ,coral-yellow
                                   :slant normal
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :slant normal
                                        :inherit bold))))

   `(mu4e-cited-5-face
     ((,coral-class (:foreground ,coral-cyan
                                   :slant normal
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-cyan
                                        :slant normal
                                        :inherit bold))))

   `(mu4e-cited-6-face
     ((,coral-class (:foreground ,coral-green
                                   :slant normal
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :slant normal
                                        :inherit bold))))

   `(mu4e-cited-7-face
     ((,coral-class (:foreground ,coral-blue
                                   :slant normal
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :slant normal
                                        :inherit bold))))

   `(mu4e-flagged-face
     ((,coral-class (:foreground ,coral-magenta
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-magenta
                                        :inherit bold))))

   `(mu4e-view-url-number-face
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   `(mu4e-warning-face
     ((,coral-class (:foreground ,coral-red
                                   :slant normal
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :slant normal
                                        :inherit bold))))

   `(mu4e-header-highlight-face
     ((,coral-class (
                                :foreground unspecified
                                :background ,coral-highlight-line
                                :underline ,coral-emphasis
                                :inherit bold))
      (,coral-256-class  (:inherit unspecified
                                     :foreground unspecified
                                     :background ,coral-256-highlight-line
                                     :underline ,coral-256-emphasis
                                     :inherit bold))))


   `(mu4e-draft-face
     ((,coral-class (:inherit font-lock-string-face))
      (,coral-256-class  (:inherit font-lock-string-face))))

   `(mu4e-footer-face
     ((,coral-class (:inherit font-lock-comment-face))
      (,coral-256-class  (:inherit font-lock-comment-face))))

   `(mu4e-forwarded-face
     ((,coral-class (:inherit font-lock-builtin-face))
      (,coral-256-class  (:inherit font-lock-builtin-face))))

   `(mu4e-header-face
     ((,coral-class (:inherit default))
      (,coral-256-class  (:inherit default))))

   `(mu4e-header-key-face
     ((,coral-class (:inherit message-header-name))))

   `(mu4e-header-marks-face
     ((,coral-class (:inherit font-lock-preprocessor-face))
      (,coral-256-class  (:inherit font-lock-preprocessor-face))))

   `(mu4e-header-title-face
     ((,coral-class (:inherit font-lock-type-face))
      (,coral-256-class  (:inherit font-lock-type-face))))

   `(mu4e-highlight-face
     ((,coral-class (:inherit font-lock-pseudo-keyword-face))
      (,coral-256-class  (:inherit font-lock-pseudo-keyword-face))))

   `(mu4e-modeline-face
     ((,coral-class (:inherit font-lock-string-face))
      (,coral-256-class (:inherit font-lock-string-face))))
   
   `(mu4e-moved-face
     ((,coral-class (:inherit font-lock-comment-face
                                :slant normal))
      (,coral-256-class  (:inherit font-lock-comment-face
                                     :slant normal))))

   `(mu4e-ok-face
     ((,coral-class (:inherit font-lock-comment-face
                                :slant normal))
      (,coral-256-class  (:inherit font-lock-comment-face
                                     :slant normal))))

   `(mu4e-replied-face
     ((,coral-class (:inherit font-lock-builtin-face))
      (,coral-256-class  (:inherit font-lock-builtin-face
                                     :inherit bold))))

   `(mu4e-system-face
     ((,coral-class (:inherit font-lock-comment-face
                                :slant normal))
      (,coral-256-class  (:inherit font-lock-comment-face
                                     :slant normal))))

   `(mu4e-title-face
     ((,coral-class (:inherit font-lock-type-face))
      (,coral-256-class  (:inherit font-lock-type-face))))

   `(mu4e-trashed-face
     ((,coral-class (:inherit font-lock-comment-face
                                :strike-through t))
      (,coral-256-class  (:inherit font-lock-comment-face
                                     :strike-through t))))

   `(mu4e-unread-face
     ((,coral-class (:inherit font-lock-keyword-face))
      (,coral-256-class  (:inherit font-lock-keyword-face))))

   `(mu4e-view-attach-number-face
     ((,coral-class (:inherit font-lock-variable-name-face
                                :inherit bold))
      (,coral-256-class  (:inherit font-lock-variable-name-face
                                     :inherit bold))))

   `(mu4e-view-contact-face
     ((,coral-class (:foreground ,coral-foreground
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :inherit bold))))

   `(mu4e-view-header-key-face
     ((,coral-class (:inherit message-header-name))
      (,coral-256-class  (:inherit message-header-name))))

   `(mu4e-view-header-value-face
     ((,coral-class (:foreground ,coral-cyan
                                   :inherit bold
                                   :slant normal))
      (,coral-256-class  (:foreground ,coral-256-cyan
                                        :inherit bold
                                        :slant normal))))

   `(mu4e-view-link-face
     ((,coral-class (:inherit link))
      (,coral-256-class  (:inherit link))))

   `(mu4e-view-special-header-value-face
     ((,coral-class (:foreground ,coral-blue
                                   :inherit bold
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :inherit bold
                                        :underline nil))))

   ;; mumamo
   `(mumamo-background-chunk-submode1
     ((,coral-class (:background ,coral-highlight-line))
      (,coral-256-class  (:background ,coral-256-highlight-line))))

   ;; nav
   `(nav-face-heading
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(nav-face-button-num
     ((,coral-class (:foreground ,coral-cyan))
      (,coral-256-class  (:foreground ,coral-256-cyan))))

   `(nav-face-dir
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(nav-face-hdir
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(nav-face-file
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(nav-face-hfile
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   ;; nav-flash
   `(nav-flash-face
     ((,coral-class (:background ,coral-highlight-line))
      (,coral-256-class  (:background ,coral-256-highlight-line))))

   ;; neo-tree
   `(neo-banner-face
     ((,coral-class (:foreground ,coral-blue
                                   :background ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :background ,coral-256-background
                                        :inherit bold))))


   `(neo-header-face
     ((,coral-class (:foreground ,coral-emphasis
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :background ,coral-256-background))))

   `(neo-root-dir-face
     ((,coral-class (:foreground ,coral-green
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :background ,coral-256-background))))

   `(neo-dir-link-face
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :background ,coral-256-background))))

   `(neo-file-link-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(neo-button-face
     ((,coral-class (:underline nil))
      (,coral-256-class  (:underline nil))))

   `(neo-expand-btn-face
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(neo-vc-default-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(neo-vc-user-face
     ((,coral-class (:foreground ,coral-red
                                   :slant normal))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :slant normal))))

   `(neo-vc-up-to-date-face
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(neo-vc-edited-face
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(neo-vc-needs-update-face
     ((,coral-class (:underline t))
      (,coral-256-class  (:underline t))))

   `(neo-vc-needs-merge-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(neo-vc-unlocked-changes-face
     ((,coral-class (:foreground ,coral-red
                                   :background ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :background ,coral-256-comments))))

   `(neo-vc-added-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(neo-vc-removed-face
     ((,coral-class (:strike-through t))
      (,coral-256-class  (:strike-through t))))

   `(neo-vc-conflict-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(neo-vc-missing-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(neo-vc-ignored-face
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   ;; nim

   `(nim-non-overloadable-face
     ((,coral-class (:foreground ,coral-green :underline t))
      (,coral-256-class (:foreground ,coral-green :underline t))))

   `(nim-font-lock-number-face
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class (:foreground ,coral-256-orange))))

   `(nim-font-lock-export-face
     ((,coral-class (:foreground ,coral-yellow :underline t))
      (,coral-256-class (:foreground ,coral-256-yellow :underline t))))

   ;; adoc-mode / markup
   `(markup-meta-face
     ((,coral-class (:foreground ,coral-gray-l))
      (,coral-256-class  (:foreground ,coral-256-gray-l))))

   `(markup-table-face
     ((,coral-class (:foreground ,coral-blue-hc
                                   :background ,coral-blue-lc))
      (,coral-256-class  (:foreground ,coral-256-blue-hc
                                        :background ,coral-256-blue-lc))))

   `(markup-verbatim-face
     ((,coral-class (:background ,coral-orange-lc))
      (,coral-256-class  (:background ,coral-256-orange-lc))))

   `(markup-list-face
     ((,coral-class (:foreground ,coral-violet-hc
                                   :background ,coral-violet-lc))
      (,coral-256-class  (:foreground ,coral-256-violet-hc
                                        :background ,coral-256-violet-lc))))

   `(markup-replacement-face
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   `(markup-complex-replacement-face
     ((,coral-class (:foreground ,coral-violet-hc
                                   :background ,coral-violet-lc))
      (,coral-256-class  (:foreground ,coral-256-violet-hc
                                        :background ,coral-256-violet-lc))))

   `(markup-gen-face
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(markup-secondary-text-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   ;; org-mode
   `(org-agenda-structure
     ((,coral-class (:foreground ,coral-emphasis
                                   :background ,coral-highlight-line
                                   :inherit bold
                                   :slant normal
                                   :inverse-video nil
                                   :height ,coral-height-plus-1
                                   :underline nil
                                   :box (:line-width 2 :color ,coral-background)))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :background ,coral-256-highlight-line
                                        :inherit bold
                                        :slant normal
                                        :inverse-video nil
                                        :height ,coral-height-plus-1
                                        :underline nil
                                        :box (:line-width 2 :color ,coral-256-background)))))

   `(org-agenda-calendar-event
     ((,coral-class (:foreground ,coral-emphasis))
      (,coral-256-class  (:foreground ,coral-256-emphasis))))

   `(org-agenda-calendar-sexp
     ((,coral-class (:foreground ,coral-foreground
                                   :slant normal))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :slant normal))))

   `(org-agenda-date
     ((,coral-class (:foreground ,coral-comments
                                   :background ,coral-background
                                   :inherit bold
                                   :inverse-video nil
                                   :overline nil
                                   :slant normal
                                   :height 1.0
                                   :box (:line-width 2 :color ,coral-background)))
      (,coral-256-class  (:foreground ,coral-256-comments
                                        :background ,coral-256-background
                                        :inherit bold
                                        :inverse-video nil
                                        :overline nil
                                        :slant normal
                                        :height 1.0
                                        :box (:line-width 2 :color ,coral-256-background)))) t)

   `(org-agenda-date-weekend
     ((,coral-class (:inherit org-agenda-date
                                :inverse-video nil
                                :background unspecified
                                :foreground ,coral-comments
                                :weight unspecified
                                :underline t
                                :overline nil
                                :box unspecified))
      (,coral-256-class  (:inherit org-agenda-date
                                     :inverse-video nil
                                     :background unspecified
                                     :foreground ,coral-256-comments
                                     :weight unspecified
                                     :underline t
                                     :overline nil
                                     :box unspecified))) t)

   `(org-agenda-date-today
     ((,coral-class (:inherit org-agenda-date
                                :inverse-video t
                                :inherit bold
                                :underline unspecified
                                :overline nil
                                :box unspecified
                                :foreground ,coral-blue
                                :background ,coral-background))
      (,coral-256-class  (:inherit org-agenda-date
                                     :inverse-video t
                                     :inherit bold
                                     :underline unspecified
                                     :overline nil
                                     :box unspecified
                                     :foreground ,coral-256-blue
                                     :background ,coral-256-background))) t)

   `(org-agenda-done
     ((,coral-class (:foreground ,coral-comments
                                   :slant normal))
      (,coral-256-class  (:foreground ,coral-256-comments
                                        :slant normal))) t)

   `(org-archived
     ((,coral-class (:foreground ,coral-comments
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-comments
                                        :inherit bold))))

   `(org-block
     ((,coral-class (:foreground ,coral-emphasis
                                   :background ,coral-highlight-alt))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :background ,coral-256-highlight-alt))))

   `(org-block-background
     ((,coral-class (:background ,coral-background-hc))
      (,coral-256-class  (:background ,coral-256-highlight-alt))))

   `(org-block-begin-line
     ((,coral-class (:foreground ,coral-comments
                                   :slant normal))
      (,coral-256-class  (:foreground ,coral-256-comments
                                        :background ,coral-256-gray-d
                                        :slant normal))))

   `(org-block-end-line
     ((,coral-class (:foreground ,coral-comments
                                   :slant normal))
      (,coral-256-class  (:foreground ,coral-256-comments
                                        :background ,coral-256-gray-d
                                        :slant normal))))

   `(org-checkbox
     ((,coral-class (:background ,coral-background
				 :foreground ,coral-yellow))
      (,coral-256-class  (:background ,coral-256-background
                                        :foreground ,coral-256-foreground
                                        :box (:line-width 1 :style released-button)))))

   `(org-code
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(org-date
     ((,coral-class (:foreground ,coral-blue
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :underline t))))

   `(org-done
     ((,coral-class (:inherit bold
                               :foreground ,coral-green))
      (,coral-256-class  (:inherit bold
                                    :foreground ,coral-256-green))))

   `(org-ellipsis
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(org-formula
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(org-headline-done
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(org-hide
     ((,coral-class (:foreground ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-background))))

   `(org-level-1
     ((,coral-class (:inherit ,coral-pitch
                                :height unspecified
                                :foreground ,coral-orange))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :height ,coral-height-plus-4
                                     :foreground ,coral-256-orange))))

   `(org-level-2
     ((,coral-class (:inherit ,coral-pitch
                                :height unspecified
                                :foreground ,coral-green))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :height ,coral-height-plus-3
                                     :foreground ,coral-256-green))))

   `(org-level-3
     ((,coral-class (:inherit ,coral-pitch
                                :height unspecified
                                :foreground ,coral-blue))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :height ,coral-height-plus-2
                                     :foreground ,coral-256-blue))))

   `(org-level-4
     ((,coral-class (:inherit ,coral-pitch
                                :height unspecified
                                :foreground ,coral-yellow))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :height ,coral-height-plus-1
                                     :foreground ,coral-256-yellow))))

   `(org-level-5
     ((,coral-class (:inherit ,coral-pitch
                                :foreground ,coral-cyan))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :foreground ,coral-256-cyan))))

   `(org-level-6
     ((,coral-class (:inherit ,coral-pitch
                                :foreground ,coral-green))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :foreground ,coral-256-green))))

   `(org-level-7
     ((,coral-class (:inherit ,coral-pitch
                                :foreground ,coral-red))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :foreground ,coral-256-red))))

   `(org-level-8
     ((,coral-class (:inherit ,coral-pitch
                                :foreground ,coral-blue))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :foreground ,coral-256-blue))))

   `(org-link
     ((,coral-class (:foreground ,coral-blue
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :underline t))))

   `(org-list-dt
     ((,coral-class (:inherit bold))))
   
   `(org-sexp-date
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   `(org-scheduled
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(org-scheduled-previously
     ((,coral-class (:foreground ,coral-cyan))
      (,coral-256-class  (:foreground ,coral-256-cyan))))

   `(org-scheduled-today
     ((,coral-class (:foreground ,coral-blue
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :inherit bold))))

   `(org-special-keyword
     ((,coral-class (:foreground ,coral-comments
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-comments
                                        :inherit bold))))

   `(org-table
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(org-tag
     ((,coral-class (:inherit bold))
      (,coral-256-class  (:inherit bold))))

   `(org-time-grid
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(org-todo
     ((,coral-class (:foreground ,coral-red
                                   :inherit bold)))
     ((,coral-256-class  (:foreground ,coral-256-red
                                        :inherit bold))))

   `(org-upcoming-deadline
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold
                                        :underline nil))))

   `(org-warning
     ((,coral-class (:foreground ,coral-orange
                                   :inherit bold
                                   :underline nil))
      (,coral-256-class  (:foreground ,coral-256-orange
                                        :inherit bold
                                        :underline nil))))

   ;; org-habit (clear=blue, ready=green, alert=yellow, overdue=red. future=lower contrast)
   `(org-habit-clear-face
     ((,coral-class (:background ,coral-blue-lc
                                   :foreground ,coral-blue-hc))
      (,coral-256-class  (:background ,coral-256-blue-lc
                                        :foreground ,coral-256-blue-hc))))

   `(org-habit-clear-future-face
     ((,coral-class (:background ,coral-blue-lc))
      (,coral-256-class  (:background ,coral-256-blue-lc))))

   `(org-habit-ready-face
     ((,coral-class (:background ,coral-green-lc
                                   :foreground ,coral-green))
      (,coral-256-class  (:background ,coral-256-green-lc
                                        :foreground ,coral-256-green))))

   `(org-habit-ready-future-face
     ((,coral-class (:background ,coral-green-lc))
      (,coral-256-class  (:background ,coral-256-green-lc))))

   `(org-habit-alert-face
     ((,coral-class (:background ,coral-yellow
                                   :foreground ,coral-yellow-lc))
      (,coral-256-class  (:background ,coral-256-yellow
                                        :foreground ,coral-256-yellow-lc))))

   `(org-habit-alert-future-face
     ((,coral-class (:background ,coral-yellow-lc))
      (,coral-256-class  (:background ,coral-256-yellow-lc))))

   `(org-habit-overdue-face
     ((,coral-class (:background ,coral-red
                                   :foreground ,coral-red-lc))
      (,coral-256-class  (:background ,coral-256-red
                                        :foreground ,coral-256-red-lc))))

   `(org-habit-overdue-future-face
     ((,coral-class (:background ,coral-red-lc))
      (,coral-256-class  (:background ,coral-256-red-lc))))

   ;; latest additions
   `(org-agenda-dimmed-todo-face
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(org-agenda-restriction-lock
     ((,coral-class (:background ,coral-yellow))
      (,coral-256-class  (:background ,coral-256-yellow))))

   `(org-clock-overlay
     ((,coral-class (:background ,coral-yellow))
      (,coral-256-class  (:background ,coral-256-yellow))))

   `(org-column
     ((,coral-class (:background ,coral-highlight-line
                                   :strike-through nil
                                   :underline nil
                                   :slant normal
                                   :inherit bold
                                   :inherit default))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :strike-through nil
                                        :underline nil
                                        :slant normal
                                        :inherit bold
                                        :inherit default))))

   `(org-column-title
     ((,coral-class (:background ,coral-highlight-line
                                   :underline t
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :underline t
                                        :inherit bold))))

   `(org-date-selected
     ((,coral-class (:foreground ,coral-red
                                   :inverse-video t))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :inverse-video t))))

   `(org-document-info
     ((,coral-class (:foreground ,coral-foreground :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(org-document-title
     ((,coral-class (:foreground ,coral-emphasis :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-emphasis))))

   `(org-drawer
     ((,coral-class (:foreground ,coral-cyan))
      (,coral-256-class  (:foreground ,coral-256-cyan))))

   `(org-footnote
     ((,coral-class (:foreground ,coral-magenta
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-magenta
                                        :underline t))))

   `(org-latex-and-export-specials
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(org-mode-line-clock-overrun
     ((,coral-class (:inherit mode-line))
      (,coral-256-class  (:inherit mode-line))))

   ;; outline
   `(outline-1
     ((,coral-class (:inherit org-level-1))
      (,coral-256-class  (:inherit org-level-1))))

   `(outline-2
     ((,coral-class (:inherit org-level-2))
      (,coral-256-class  (:inherit org-level-2))))

   `(outline-3
     ((,coral-class (:inherit org-level-3))
      (,coral-256-class  (:inherit org-level-3))))

   `(outline-4
     ((,coral-class (:inherit org-level-4))
      (,coral-256-class  (:inherit org-level-4))))

   `(outline-5
     ((,coral-class (:inherit org-level-5))
      (,coral-256-class  (:inherit org-level-5))))

   `(outline-6
     ((,coral-class (:inherit org-level-6))
      (,coral-256-class  (:inherit org-level-6))))

   `(outline-7
     ((,coral-class (:inherit org-level-7))
      (,coral-256-class  (:inherit org-level-7))))

   `(outline-8
     ((,coral-class (:inherit org-level-8))
      (,coral-256-class  (:inherit org-level-8))))

   ;; parenface
   `(paren-face
     ((,coral-256-class  (:foreground ,coral-comments))))

   ;; perspective
   `(persp-selected-face
     ((,coral-class (:foreground ,coral-blue
                                   :inherit bold))))

   ;; pretty-mode
   `(pretty-mode-symbol-face
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   ;; popup
   `(popup-face
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-foreground))))

   `(popup-isearch-match
     ((,coral-class (:background ,coral-green))
      (,coral-256-class  (:background ,coral-256-green))))

   `(popup-menu-face
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-foreground))))

   `(popup-menu-mouse-face
     ((,coral-class (:background ,coral-blue
                                   :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-blue
                                        :foreground ,coral-256-foreground))))

   `(popup-menu-selection-face
     ((,coral-class (:background ,coral-magenta
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-magenta
                                        :foreground ,coral-256-background))))

   `(popup-scroll-bar-background-face
     ((,coral-class (:background ,coral-comments))
      (,coral-256-class  (:background ,coral-256-comments))))

   `(popup-scroll-bar-foreground-face
     ((,coral-class (:background ,coral-emphasis))
      (,coral-256-class  (:background ,coral-256-emphasis))))

   `(popup-tip-face
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-foreground))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   `(rainbow-delimiters-depth-2-face
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(rainbow-delimiters-depth-3-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(rainbow-delimiters-depth-4-face
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(rainbow-delimiters-depth-5-face
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(rainbow-delimiters-depth-6-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(rainbow-delimiters-depth-7-face
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   `(rainbow-delimiters-depth-8-face
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(rainbow-delimiters-depth-9-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(rainbow-delimiters-depth-10-face
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(rainbow-delimiters-depth-11-face
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(rainbow-delimiters-depth-12-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(rainbow-delimiters-unmatched-face
     ((,coral-class (:foreground ,coral-foreground
                                   :background ,coral-background
                                   :inverse-video t))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :background ,coral-256-background
                                        :inverse-video t))))

   ;; realgud
   `(realgud-overlay-arrow1
     ((,coral-class (:foreground ,coral-green-d))
      (,coral-256-class  (:foreground ,coral-256-green-d))))

   `(realgud-overlay-arrow2
     ((,coral-class (:foreground ,coral-yellow-d))
      (,coral-256-class  (:foreground ,coral-256-yellow-d))))

   `(realgud-overlay-arrow3
     ((,coral-class (:foreground ,coral-orange-d))
      (,coral-256-class  (:foreground ,coral-256-orange-d))))

   `(realgud-bp-enabled-face
     ((,coral-class (:inherit error)))
     ((,coral-256-class (:inherit error))))

   `(realgud-bp-disabled-face
     ((,coral-class (:inherit secondary-selection)))
     ((,coral-256-class (:inherit secondary-selection))))

   `(realgud-bp-line-enabled-face
     ((,coral-class (:foreground ,coral-red-d)))
     ((,coral-256-class (:foreground ,coral-256-red-d))))

   `(realgud-bp-line-disabled-face
     ((,coral-class (:inherit secondary-selection)))
     ((,coral-256-class (:inherit secondary-selection))))

   `(realgud-line-number
     ((,coral-class (:inerhit coral-line-number)))
     ((,coral-256-class (:inerhit coral-line-number))))

   `(realgud-backtrace-number
     ((,coral-class (:foreground ,coral-yellow-d
                                   :inherit bold)))
     ((,coral-256-class (:foreground ,coral-256-yellow
                                       :inherit bold))))

   ;; rhtm-mode
   `(erb-face
     ((,coral-class (:foreground ,coral-emphasis
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :background ,coral-256-background))))

   `(erb-delim-face
     ((,coral-class (:foreground ,coral-cyan
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-cyan
                                        :background ,coral-256-background))))

   `(erb-exec-face
     ((,coral-class (:foreground ,coral-emphasis
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :background ,coral-256-background))))

   `(erb-exec-delim-face
     ((,coral-class (:foreground ,coral-cyan
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-cyan
                                        :background ,coral-256-background))))

   `(erb-out-face
     ((,coral-class (:foreground ,coral-emphasis
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :background ,coral-256-background))))

   `(erb-out-delim-face
     ((,coral-class (:foreground ,coral-cyan
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-cyan
                                        :background ,coral-256-background))))

   `(erb-comment-face
     ((,coral-class (:foreground ,coral-emphasis
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :background ,coral-256-background))))

   `(erb-comment-delim-face
     ((,coral-class (:foreground ,coral-cyan
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-cyan
                                        :background ,coral-256-background))))

   ;; rst-mode
   `(rst-level-1-face
     ((,coral-class (:background ,coral-yellow
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-yellow
                                        :foreground ,coral-256-background))))

   `(rst-level-2-face
     ((,coral-class (:background ,coral-cyan
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-cyan
                                        :foreground ,coral-256-background))))

   `(rst-level-3-face
     ((,coral-class (:background ,coral-blue
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-blue
                                        :foreground ,coral-256-background))))

   `(rst-level-4-face
     ((,coral-class (:background ,coral-violet
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-violet
                                        :foreground ,coral-256-background))))

   `(rst-level-5-face
     ((,coral-class (:background ,coral-magenta
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-magenta
                                        :foreground ,coral-256-background))))

   `(rst-level-6-face
     ((,coral-class (:background ,coral-red
                                   :foreground ,coral-background))
      (,coral-256-class  (:background ,coral-256-red
                                        :foreground ,coral-256-background))))

   ;; rpm-mode
   `(rpm-spec-dir-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(rpm-spec-doc-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(rpm-spec-ghost-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(rpm-spec-macro-face
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(rpm-spec-obsolete-tag-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(rpm-spec-package-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(rpm-spec-section-face
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(rpm-spec-tag-face
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(rpm-spec-var-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(rust-string-interpolation-face
     ((,coral-class (:inherit font-lock-string-face :inherit italic))))
   
   ;; sh-mode
   `(sh-quoted-exec
     ((,coral-class (:foreground ,coral-violet
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-violet
                                        :inherit bold))))

   `(sh-escaped-newline
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   `(sh-heredoc
     ((,coral-class (:foreground ,coral-yellow
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :inherit bold))))

   ;; smartparens
   `(sp-pair-overlay-face
     ((,coral-class (:background ,coral-highlight-line))
      (,coral-256-class  (:background ,coral-256-highlight-line))))

   `(sp-wrap-overlay-face
     ((,coral-class (:background ,coral-highlight-line))
      (,coral-256-class  (:background ,coral-256-highlight-line))))

   `(sp-wrap-tag-overlay-face
     ((,coral-class (:background ,coral-highlight-line))
      (,coral-256-class  (:background ,coral-256-highlight-line))))

   `(sp-show-pair-enclosing
     ((,coral-class (:inherit highlight))
      (,coral-256-class  (:inherit highlight))))

   `(sp-show-pair-match-face
     ((,coral-class (:foreground ,coral-green
                                   :background ,coral-background
                                   :inherit bold
                                   :inverse-video t))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :background ,coral-256-background
                                        :inherit bold
                                        :inverse-video t))))

   `(sp-show-pair-mismatch-face
     ((,coral-class (:foreground ,coral-red
                                   :background ,coral-background
                                   :inherit bold
                                   :inverse-video t))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :background ,coral-256-background
                                        :inherit bold
                                        :inverse-video t))))

   ;; show-paren
   `(show-paren-match
     ((,coral-class (:foreground ,coral-green
                                   :background ,coral-background
                                   :inherit bold
                                   :inverse-video t))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :background ,coral-256-background
                                        :inherit bold
                                        :inverse-video t))))

   `(show-paren-mismatch
     ((,coral-class (:foreground ,coral-red
                                   :background ,coral-background
                                   :inherit bold
                                   :inverse-video t))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :background ,coral-256-background
                                        :inherit bold
                                        :inverse-video t))))

   ;; mic-paren
   `(paren-face-match
     ((,coral-class (:foreground ,coral-green
                                   :background ,coral-background
                                   :inherit bold
                                   :inverse-video t))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :background ,coral-256-background
                                        :inherit bold
                                        :inverse-video t))))

   `(paren-face-mismatch
     ((,coral-class (:foreground ,coral-red
                                   :background ,coral-background
                                   :inherit bold
                                   :inverse-video t))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :background ,coral-256-background
                                        :inherit bold
                                        :inverse-video t))))

   `(paren-face-no-match
     ((,coral-class (:foreground ,coral-red
                                   :background ,coral-background
                                   :inherit bold
                                   :inverse-video t))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :background ,coral-256-background
                                        :inherit bold
                                        :inverse-video t))))

   ;; SLIME
   `(slime-repl-inputed-output-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   ;; speedbar
   `(speedbar-button-face
     ((,coral-class (:inherit ,coral-pitch
                                :foreground ,coral-comments))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :foreground ,coral-256-comments))))

   `(speedbar-directory-face
     ((,coral-class (:inherit ,coral-pitch
                                :foreground ,coral-blue))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :foreground ,coral-256-blue))))

   `(speedbar-file-face
     ((,coral-class (:inherit ,coral-pitch
                                :foreground ,coral-foreground))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :foreground ,coral-256-foreground))))

   `(speedbar-highlight-face
     ((,coral-class (:inherit ,coral-pitch
                                :background ,coral-highlight-line))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :background ,coral-256-highlight-line))))

   `(speedbar-selected-face
     ((,coral-class (:inherit ,coral-pitch
                                :foreground ,coral-yellow
                                :underline t))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :foreground ,coral-256-yellow
                                     :underline t))))

   `(speedbar-separator-face
     ((,coral-class (:inherit ,coral-pitch
                                :background ,coral-blue
                                :foreground ,coral-background
                                :overline ,coral-cyan-lc))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :background ,coral-256-blue
                                     :foreground ,coral-256-background
                                     :overline ,coral-256-cyan-lc))))

   `(speedbar-tag-face
     ((,coral-class (:inherit ,coral-pitch
                                :foreground ,coral-green))
      (,coral-256-class  (:inherit ,coral-pitch
                                     :foreground ,coral-256-green))))

   ;; sunrise commander headings
   `(sr-active-path-face
     ((,coral-class (:background ,coral-blue
                                   :foreground ,coral-background
                                   :height ,coral-height-plus-1
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-blue
                                        :foreground ,coral-256-background
                                        :height ,coral-height-plus-1
                                        :inherit bold))))

   `(sr-editing-path-face
     ((,coral-class (:background ,coral-yellow
                                   :foreground ,coral-background
                                   :inherit bold
                                   :height ,coral-height-plus-1))
      (,coral-256-class  (:background ,coral-256-yellow
                                        :foreground ,coral-256-background
                                        :inherit bold
                                        :height ,coral-height-plus-1))))

   `(sr-highlight-path-face
     ((,coral-class (:background ,coral-green
                                   :foreground ,coral-background
                                   :inherit bold
                                   :height ,coral-height-plus-1))
      (,coral-256-class  (:background ,coral-256-green
                                        :foreground ,coral-256-background
                                        :inherit bold
                                        :height ,coral-height-plus-1))))

   `(sr-passive-path-face
     ((,coral-class (:background ,coral-comments
                                   :foreground ,coral-background
                                   :inherit bold
                                   :height ,coral-height-plus-1))
      (,coral-256-class  (:background ,coral-256-comments
                                        :foreground ,coral-256-background
                                        :inherit bold
                                        :height ,coral-height-plus-1))))

   ;; sunrise commander marked
   `(sr-marked-dir-face
     ((,coral-class (:inherit dicoral-red-marked))
      (,coral-256-class  (:inherit dicoral-red-marked))))

   `(sr-marked-file-face
     ((,coral-class (:inherit dicoral-red-marked))
      (,coral-256-class  (:inherit dicoral-red-marked))))

   `(sr-alt-marked-dir-face
     ((,coral-class (:background ,coral-magenta
                                   :foreground ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-magenta
                                        :foreground ,coral-256-background
                                        :inherit bold))))

   `(sr-alt-marked-file-face
     ((,coral-class (:background ,coral-magenta
                                   :foreground ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-magenta
                                        :foreground ,coral-256-background
                                        :inherit bold))))

   ;; sunrise commander fstat
   `(sr-directory-face
     ((,coral-class (:inherit dicoral-red-directory
                                :inherit bold))
      (,coral-256-class  (:inherit dicoral-red-directory
                                     :inherit bold))))

   `(sr-symlink-directory-face
     ((,coral-class (:inherit dicoral-red-directory
                                :slant normal
                                :inherit bold))
      (,coral-256-class  (:inherit dicoral-red-directory
                                     :slant normal
                                     :inherit bold))))

   `(sr-symlink-face
     ((,coral-class (:inherit dicoral-red-symlink
                                :slant normal
                                :inherit bold))
      (,coral-256-class  (:inherit dicoral-red-symlink
                                     :slant normal
                                     :inherit bold))))

   `(sr-broken-link-face
     ((,coral-class (:inherit dicoral-red-warning
                                :slant normal
                                :inherit bold))
      (,coral-256-class  (:inherit dicoral-red-warning
                                     :slant normal
                                     :inherit bold))))

   ;; sunrise commander file types
   `(sr-compressed-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(sr-encrypted-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(sr-log-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(sr-packaged-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(sr-html-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(sr-xml-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   ;; sunrise commander misc
   `(sr-clex-hotchar-face
     ((,coral-class (:background ,coral-red
                                   :foreground ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-red
                                        :foreground ,coral-256-background
                                        :inherit bold))))

   ;; syslog-mode
   `(syslog-ip-face
     ((,coral-class (:background unspecified
                                   :foreground ,coral-yellow))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-yellow))))

   `(syslog-hour-face
     ((,coral-class (:background unspecified
                                   :foreground ,coral-green))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-green))))

   `(syslog-error-face
     ((,coral-class (:background unspecified
                                   :foreground ,coral-red
                                   :inherit bold))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-red
                                        :inherit bold))))

   `(syslog-warn-face
     ((,coral-class (:background unspecified
                                   :foreground ,coral-orange
                                   :inherit bold))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-orange
                                        :inherit bold))))

   `(syslog-info-face
     ((,coral-class (:background unspecified
                                   :foreground ,coral-blue
                                   :inherit bold))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-blue
                                        :inherit bold))))

   `(syslog-debug-face
     ((,coral-class (:background unspecified
                                   :foreground ,coral-cyan
                                   :inherit bold))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-cyan
                                        :inherit bold))))

   `(syslog-su-face
     ((,coral-class (:background unspecified
                                   :foreground ,coral-magenta))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-magenta))))

   ;; table
   `(table-cell
     ((,coral-class (:foreground ,coral-foreground
                                   :background ,coral-highlight-line))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :background ,coral-256-highlight-line))))

   ;; term

   `(term-bold
     ((,coral-class (:underline t))
      (,coral-256-class (:underline t))))
   
   `(term-color-black
     ((,coral-class (:foreground ,coral-background
                                   :background ,coral-highlight-line))
      (,coral-256-class  (:foreground ,coral-256-background
                                        :background ,coral-256-highlight-line))))

   `(term-color-red
     ((,coral-class (:foreground ,coral-red
                                   :background ,coral-red-d))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :background ,coral-256-red-d))))

   `(term-color-green
     ((,coral-class (:foreground ,coral-green
                                   :background ,coral-green-d))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :background ,coral-256-green-d))))

   `(term-color-yellow
     ((,coral-class (:foreground ,coral-yellow
                                   :background ,coral-yellow-d))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :background ,coral-256-yellow-d))))

   `(term-color-blue
     ((,coral-class (:foreground ,coral-blue
                                   :background ,coral-blue-d))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :background ,coral-256-blue-d))))

   `(term-color-magenta
     ((,coral-class (:foreground ,coral-magenta
                                   :background ,coral-magenta-d))
      (,coral-256-class  (:foreground ,coral-256-magenta
                                        :background ,coral-256-magenta-d))))

   `(term-color-cyan
     ((,coral-class (:foreground ,coral-cyan
                                   :background ,coral-cyan-d))
      (,coral-256-class  (:foreground ,coral-256-cyan
                                        :background ,coral-256-cyan-d))))

   `(term-color-white
     ((,coral-class (:foreground ,coral-emphasis
                                   :background ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :background ,coral-256-foreground))))

   `(term-default-fg-color
     ((,coral-class (:inherit term-color-white))
      (,coral-256-class  (:inherit term-color-white))))

   `(term-default-bg-color
     ((,coral-class (:inherit term-color-black))
      (,coral-256-class  (:inherit term-color-black))))

   ;; tooltip. (NOTE: This setting has no effect on the os widgets for me
   ;; zencoding uses this)
   `(tooltip
     ((,coral-class (:background ,coral-yellow-hc
                                   :foreground ,coral-background
                                   :inherit ,coral-pitch))))

   ;; tuareg
   `(tuareg-font-lock-governing-face
     ((,coral-class (:foreground ,coral-magenta
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-magenta
                                        :inherit bold))))

   `(tuareg-font-lock-multistage-face
     ((,coral-class (:foreground ,coral-blue
                                   :background ,coral-highlight-line
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :background ,coral-256-highlight-line
                                        :inherit bold))))

   `(tuareg-font-lock-operator-face
     ((,coral-class (:foreground ,coral-emphasis))
      (,coral-256-class  (:foreground ,coral-256-emphasis))))

   `(tuareg-font-lock-error-face
     ((,coral-class (:foreground ,coral-yellow
                                   :background ,coral-red
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :background ,coral-256-red
                                        :inherit bold))))

   `(tuareg-font-lock-interactive-output-face
     ((,coral-class (:foreground ,coral-cyan))
      (,coral-256-class  (:foreground ,coral-256-cyan))))

   `(tuareg-font-lock-interactive-error-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   ;; undo-tree
   `(undo-tree-visualizer-default-face
     ((,coral-class (:foreground ,coral-comments
                                   :background ,coral-background))
      (,coral-256-class  (:foreground ,coral-256-comments
                                        :background ,coral-256-background))))

   `(undo-tree-visualizer-unmodified-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(undo-tree-visualizer-current-face
     ((,coral-class (:foreground ,coral-blue
                                   :inverse-video t))
      (,coral-256-class  (:foreground ,coral-256-blue
                                        :inverse-video t))))

   `(undo-tree-visualizer-active-branch-face
     ((,coral-class (:foreground ,coral-emphasis
                                   :background ,coral-background
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :background ,coral-256-background
                                        :inherit bold))))

   `(undo-tree-visualizer-register-face
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   ;; volatile highlights
   `(vhl/default-face
     ((,coral-class (:background ,coral-green-lc
                                   :foreground ,coral-green-hc))
      (,coral-256-class  (:background ,coral-256-green-lc
                                        :foreground ,coral-256-green-hc))))

   ;; w3m
   `(w3m-anchor
     ((,coral-class (:inherit link))
      (,coral-256-class  (:inherit link))))

   `(w3m-arrived-anchor
     ((,coral-class (:inherit link-visited))
      (,coral-256-class  (:inherit link-visited))))

   `(w3m-form
     ((,coral-class (:background ,coral-background
                                   :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-background
                                        :foreground ,coral-256-foreground))))

   `(w3m-header-line-location-title
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-yellow))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-yellow))))

   `(w3m-header-line-location-content

     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-foreground))))

   `(w3m-bold
     ((,coral-class (:foreground ,coral-emphasis
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :inherit bold))))

   `(w3m-image-anchor
     ((,coral-class (:background ,coral-background
                                   :foreground ,coral-cyan
                                   :inherit link))
      (,coral-256-class  (:background ,coral-256-background
                                        :foreground ,coral-256-cyan
                                        :inherit link))))

   `(w3m-image
     ((,coral-class (:background ,coral-background
                                   :foreground ,coral-cyan))
      (,coral-256-class  (:background ,coral-256-background
                                        :foreground ,coral-256-cyan))))

   `(w3m-lnum-minibuffer-prompt
     ((,coral-class (:foreground ,coral-emphasis))
      (,coral-256-class  (:foreground ,coral-256-emphasis))))

   `(w3m-lnum-match
     ((,coral-class (:background ,coral-highlight-line))
      (,coral-256-class  (:background ,coral-256-highlight-line))))

   `(w3m-lnum
     ((,coral-class (:underline nil
                                  :bold nil
                                  :foreground ,coral-red))
      (,coral-256-class  (:underline nil
                                       :bold nil
                                       :foreground ,coral-256-red))))

   `(w3m-session-select
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(w3m-session-selected
     ((,coral-class (:foreground ,coral-emphasis
                                   :inherit bold
                                   :underline t))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :inherit bold
                                        :underline t))))

   `(w3m-tab-background
     ((,coral-class (:background ,coral-background
                                   :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-background
                                        :foreground ,coral-256-foreground))))

   `(w3m-tab-selected-background
     ((,coral-class (:background ,coral-background
                                   :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-background
                                        :foreground ,coral-256-foreground))))

   `(w3m-tab-mouse
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-yellow))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-yellow))))

   `(w3m-tab-selected
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-emphasis
                                   :inherit bold))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-emphasis
                                        :inherit bold))))

   `(w3m-tab-unselected
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-foreground))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-foreground))))

   `(w3m-tab-selected-retrieving
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-red))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-red))))

   `(w3m-tab-unselected-retrieving
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-orange))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-orange))))

   `(w3m-tab-unselected-unseen
     ((,coral-class (:background ,coral-highlight-line
                                   :foreground ,coral-violet))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :foreground ,coral-256-violet))))

   ;; web-mode
   `(web-mode-builtin-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(web-mode-comment-face
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(web-mode-constant-face
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   `(web-mode-current-element-highlight-face
     ((,coral-class (:underline unspecified
                                  :weight unspecified
                                  :background ,coral-highlight-line))
      (,coral-256-class  (:underline unspecified
                                       :weight unspecified
                                       :background ,coral-256-highlight-line))))

   `(web-mode-doctype-face
     ((,coral-class (:foreground ,coral-comments
                                   :slant normal
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-comments
                                        :slant normal
                                        :inherit bold))))

   `(web-mode-folded-face
     ((,coral-class (:underline t))
      (,coral-256-class  (:underline t))))

   `(web-mode-function-name-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(web-mode-html-attr-name-face
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(web-mode-html-attr-custom-face
     ((,coral-class (:inherit web-mode-html-attr-name-face))
      (,coral-256-class  (:inherit web-mode-html-attr-name-face))))

   `(web-mode-html-attr-engine-face
     ((,coral-class (:inherit web-mode-block-delimiter-face))
      (,coral-256-class  (:inherit web-mode-block-delimiter-face))))

   `(web-mode-html-attr-equal-face
     ((,coral-class (:inherit web-mode-html-attr-name-face))
      (,coral-256-class  (:inherit web-mode-html-attr-name-face))))

   `(web-mode-html-attr-value-face
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(web-mode-html-tag-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(web-mode-keyword-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(web-mode-preprocessor-face
     ((,coral-class (:foreground ,coral-yellow
                                   :slant normal
                                   :weight unspecified))
      (,coral-256-class  (:foreground ,coral-256-yellow
                                        :slant normal
                                        :weight unspecified))))

   `(web-mode-string-face
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(web-mode-type-face
     ((,coral-class (:inherit font-lock-type-face))
      (,coral-256-class  (:inherit font-lock-type-face))))

   `(web-mode-variable-name-face
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(web-mode-warning-face
     ((,coral-class (:inherit font-lock-warning-face))
      (,coral-256-class  (:inherit font-lock-warning-face))))

   `(web-mode-block-face
     ((,coral-class (:background unspecified))
      (,coral-256-class  (:background unspecified))))

   `(web-mode-block-delimiter-face
     ((,coral-class (:inherit font-lock-preprocessor-face))
      (,coral-256-class  (:inherit font-lock-preprocessor-face))))

   `(web-mode-block-comment-face
     ((,coral-class (:inherit web-mode-comment-face))
      (,coral-256-class  (:inherit web-mode-comment-face))))

   `(web-mode-block-control-face
     ((,coral-class (:inherit font-lock-preprocessor-face))
      (,coral-256-class  (:inherit font-lock-preprocessor-face))))

   `(web-mode-block-string-face
     ((,coral-class (:inherit web-mode-string-face))
      (,coral-256-class  (:inherit web-mode-string-face))))

   `(web-mode-comment-keyword-face
     ((,coral-class (:box 1 :inherit bold))
      (,coral-256-class  (:box 1 :inherit bold))))

   `(web-mode-css-at-rule-face
     ((,coral-class (:inherit font-lock-constant-face))
      (,coral-256-class  (:inherit font-lock-constant-face))))

   `(web-mode-css-pseudo-class-face
     ((,coral-class (:inherit font-lock-builtin-face))
      (,coral-256-class  (:inherit font-lock-builtin-face))))

   `(web-mode-css-color-face
     ((,coral-class (:inherit font-lock-builtin-face))
      (,coral-256-class  (:inherit font-lock-builtin-face))))

   `(web-mode-css-filter-face
     ((,coral-class (:inherit font-lock-function-name-face))
      (,coral-256-class  (:inherit font-lock-function-name-face))))

   `(web-mode-css-function-face
     ((,coral-class (:inherit font-lock-builtin-face))
      (,coral-256-class  (:inherit font-lock-builtin-face))))

   `(web-mode-css-function-call-face
     ((,coral-class (:inherit font-lock-function-name-face))
      (,coral-256-class  (:inherit font-lock-function-name-face))))

   `(web-mode-css-priority-face
     ((,coral-class (:inherit font-lock-builtin-face))
      (,coral-256-class  (:inherit font-lock-builtin-face))))

   `(web-mode-css-property-name-face
     ((,coral-class (:inherit font-lock-variable-name-face))
      (,coral-256-class  (:inherit font-lock-variable-name-face))))

   `(web-mode-css-selector-face
     ((,coral-class (:inherit font-lock-keyword-face))
      (,coral-256-class  (:inherit font-lock-keyword-face))))

   `(web-mode-css-string-face
     ((,coral-class (:inherit web-mode-string-face))
      (,coral-256-class  (:inherit web-mode-string-face))))

   `(web-mode-javascript-string-face
     ((,coral-class (:inherit web-mode-string-face))
      (,coral-256-class  (:inherit web-mode-string-face))))

   `(web-mode-json-comment-face
     ((,coral-class (:inherit web-mode-comment-face))
      (,coral-256-class  (:inherit web-mode-comment-face))))

   `(web-mode-json-context-face
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   `(web-mode-json-key-face
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   `(web-mode-json-string-face
     ((,coral-class (:inherit web-mode-string-face))
      (,coral-256-class  (:inherit web-mode-string-face))))

   `(web-mode-param-name-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(web-mode-part-comment-face
     ((,coral-class (:inherit web-mode-comment-face))
      (,coral-256-class  (:inherit web-mode-comment-face))))

   `(web-mode-part-face
     ((,coral-class (:inherit web-mode-block-face))
      (,coral-256-class  (:inherit web-mode-block-face))))

   `(web-mode-part-string-face
     ((,coral-class (:inherit web-mode-string-face))
      (,coral-256-class  (:inherit web-mode-string-face))))

   `(web-mode-symbol-face
     ((,coral-class (:foreground ,coral-violet))
      (,coral-256-class  (:foreground ,coral-256-violet))))

   `(web-mode-whitespace-face
     ((,coral-class (:background ,coral-red))
      (,coral-256-class  (:background ,coral-256-red))))

   ;; whitespace-mode
   `(whitespace-space
     ((,coral-class (:background unspecified
                                   :foreground ,coral-comments
                                   :inverse-video unspecified
                                   :slant normal))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-comments
                                        :inverse-video unspecified
                                        :slant normal))))

   `(whitespace-hspace
     ((,coral-class (:background unspecified
                                   :foreground ,coral-emphasis
                                   :inverse-video unspecified))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-emphasis
                                        :inverse-video unspecified))))

   `(whitespace-tab
     ((,coral-class (:background unspecified
                                   :foreground ,coral-red
                                   :inverse-video unspecified
                                   :inherit bold))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-red
                                        :inverse-video unspecified
                                        :inherit bold))))

   `(whitespace-newline
     ((,coral-class(:background unspecified
                                  :foreground ,coral-comments
                                  :inverse-video unspecified))
      (,coral-256-class (:background unspecified
                                       :foreground ,coral-256-comments
                                       :inverse-video unspecified))))

   `(whitespace-trailing
     ((,coral-class (:background unspecified
                                   :foreground ,coral-orange-lc
                                   :inverse-video t))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-orange-lc
                                        :inverse-video t))))

   `(whitespace-line
     ((,coral-class (:background unspecified
                                   :foreground ,coral-magenta
                                   :inverse-video unspecified))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-magenta
                                        :inverse-video unspecified))))

   `(whitespace-space-before-tab
     ((,coral-class (:background ,coral-red-lc
                                   :foreground unspecified
                                   :inverse-video unspecified))
      (,coral-256-class  (:background ,coral-256-red-lc
                                        :foreground unspecified
                                        :inverse-video unspecified))))

   `(whitespace-indentation
     ((,coral-class (:background unspecified
                                   :foreground ,coral-yellow
                                   :inverse-video unspecified
                                   :inherit bold))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-yellow
                                        :inverse-video unspecified
                                        :inherit bold))))

   `(whitespace-empty
     ((,coral-class (:background unspecified
                                   :foreground ,coral-red-lc
                                   :inverse-video t))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-red-lc
                                        :inverse-video t))))

   `(whitespace-space-after-tab
     ((,coral-class (:background unspecified
                                   :foreground ,coral-orange
                                   :inverse-video t
                                   :inherit bold))
      (,coral-256-class  (:background unspecified
                                        :foreground ,coral-256-orange
                                        :inverse-video t
                                        :inherit bold))))

   ;; wanderlust
   `(wl-highlight-folder-few-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(wl-highlight-folder-many-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(wl-highlight-folder-path-face
     ((,coral-class (:foreground ,coral-orange))
      (,coral-256-class  (:foreground ,coral-256-orange))))

   `(wl-highlight-folder-unread-face
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(wl-highlight-folder-zero-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(wl-highlight-folder-unknown-face
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(wl-highlight-message-citation-header
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(wl-highlight-message-cited-text-1
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(wl-highlight-message-cited-text-2
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(wl-highlight-message-cited-text-3
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(wl-highlight-message-cited-text-4
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(wl-highlight-message-header-contents-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(wl-highlight-message-headers-face
     ((,coral-class (:foreground ,coral-red))
      (,coral-256-class  (:foreground ,coral-256-red))))

   `(wl-highlight-message-important-header-contents
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(wl-highlight-message-header-contents
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(wl-highlight-message-important-header-contents2
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(wl-highlight-message-signature
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   `(wl-highlight-message-unimportant-header-contents
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(wl-highlight-summary-answecoral-red-face
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(wl-highlight-summary-disposed-face
     ((,coral-class (:foreground ,coral-foreground
                                   :slant normal))
      (,coral-256-class  (:foreground ,coral-256-foreground
                                        :slant normal))))

   `(wl-highlight-summary-new-face
     ((,coral-class (:foreground ,coral-blue))
      (,coral-256-class  (:foreground ,coral-256-blue))))

   `(wl-highlight-summary-normal-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(wl-highlight-summary-thread-top-face
     ((,coral-class (:foreground ,coral-yellow))
      (,coral-256-class  (:foreground ,coral-256-yellow))))

   `(wl-highlight-thread-indent-face
     ((,coral-class (:foreground ,coral-magenta))
      (,coral-256-class  (:foreground ,coral-256-magenta))))

   `(wl-highlight-summary-refiled-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(wl-highlight-summary-displaying-face
     ((,coral-class (:underline t
                                  :inherit bold))
      (,coral-256-class  (:underline t
                                       :inherit bold))))

   ;; weechat
   `(weechat-error-face
     ((,coral-class (:inherit error))
      (,coral-256-class  (:inherit error))))

   `(weechat-highlight-face
     ((,coral-class (:foreground ,coral-emphasis
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-emphasis
                                        :inherit bold))))

   `(weechat-nick-self-face
     ((,coral-class (:foreground ,coral-green
                                   :weight unspecified
                                   :inverse-video t))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :weight unspecified
                                        :inverse-video t))))

   `(weechat-prompt-face
     ((,coral-class (:inherit minibuffer-prompt))
      (,coral-256-class  (:inherit minibuffer-prompt))))

   `(weechat-time-face
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   ;; which-func-mode
   `(which-func
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   ;; which-key
   `(which-key-key-face
     ((,coral-class (:foreground ,coral-green
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-green
                                        :inherit bold))))

   `(which-key-separator-face
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(which-key-note-face
     ((,coral-class (:foreground ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments))))

   `(which-key-command-description-face
     ((,coral-class (:foreground ,coral-foreground))
      (,coral-256-class  (:foreground ,coral-256-foreground))))

   `(which-key-local-map-description-face
     ((,coral-class (:foreground ,coral-yellow-hc))
      (,coral-256-class  (:foreground ,coral-256-yellow-hc))))

   `(which-key-group-description-face
     ((,coral-class (:foreground ,coral-red
                                   :inherit bold))
      (,coral-256-class  (:foreground ,coral-256-red
                                        :inherit bold))))
   ;; window-number-mode
   `(window-number-face
     ((,coral-class (:foreground ,coral-green))
      (,coral-256-class  (:foreground ,coral-256-green))))

   ;; yascroll
   `(yascroll:thumb-text-area
     ((,coral-class (:foreground ,coral-comments
                                   :background ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments
                                        :background ,coral-256-comments))))

   `(yascroll:thumb-fringe
     ((,coral-class (:foreground ,coral-comments
                                   :background ,coral-comments))
      (,coral-256-class  (:foreground ,coral-256-comments
                                        :background ,coral-256-comments))))

   ;; zencoding
   `(zencoding-preview-input
     ((,coral-class (:background ,coral-highlight-line
                                   :box ,coral-emphasis))
      (,coral-256-class  (:background ,coral-256-highlight-line
                                        :box ,coral-256-emphasis)))))

  (custom-theme-set-variables
   'coral
   `(ansi-color-names-vector [,coral-background ,coral-red ,coral-green ,coral-yellow
                                                  ,coral-blue ,coral-magenta ,coral-cyan ,coral-foreground])

   ;; compilation
   `(compilation-message-face 'default)

   ;; fill-column-indicator
   `(fci-rule-color ,coral-highlight-line)

   ;; magit
   `(magit-diff-use-overlays nil)

   ;; highlight-changes
   `(highlight-changes-colors '(,coral-magenta ,coral-violet))

   ;; highlight-tail
   `(highlight-tail-colors
     '((,coral-highlight-line . 0)
       (,coral-green-lc . 20)
       (,coral-cyan-lc . 30)
       (,coral-blue-lc . 50)
       (,coral-yellow-lc . 60)
       (,coral-orange-lc . 70)
       (,coral-magenta-lc . 85)
       (,coral-highlight-line . 100)))

   ;; pos-tip
   `(pos-tip-foreground-color ,coral-background)
   `(pos-tip-background-color ,coral-yellow-hc)

   ;; vc
   `(vc-annotate-color-map
     '((20 . ,coral-red)
       (40 . "#CF4F1F")
       (60 . "#C26C0F")
       (80 . ,coral-yellow)
       (100 . "#AB8C00")
       (120 . "#A18F00")
       (140 . "#989200")
       (160 . "#8E9500")
       (180 . ,coral-green)
       (200 . "#729A1E")
       (220 . "#609C3C")
       (240 . "#4E9D5B")
       (260 . "#3C9F79")
       (280 . ,coral-cyan)
       (300 . "#299BA6")
       (320 . "#2896B5")
       (340 . "#2790C3")
       (360 . ,coral-blue)))
   `(vc-annotate-very-old-color nil)
   `(vc-annotate-background nil)

   ;; weechat
   `(weechat-color-list
     (unspecified ,coral-background ,coral-highlight-line
                  ,coral-red-d ,coral-red
                  ,coral-green-d ,coral-green
                  ,coral-yellow-d ,coral-yellow
                  ,coral-blue-d ,coral-blue
                  ,coral-magenta-d ,coral-magenta
                  ,coral-cyan-d ,coral-cyan
                  ,coral-foreground ,coral-emphasis))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'coral)

;; Local Variables:
;; no-byte-compile: t
;; fill-column: 95
;; End:

;;; coral-theme.el ends here

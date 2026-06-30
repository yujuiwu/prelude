;; remove some undesired faces from the hi lock mode and add more

(defface hi-custom-green
  '((((min-colors 88) (background dark))
     (:background "#C6E87A" :foreground "black"))
    (((background dark)) (:background "#C6E87A" :foreground "black"))
    (((min-colors 88)) (:background "#C6E87A"))
    (t (:background "#C6E87A")))
  "Customized face for hi-lock mode."
  :group 'hi-lock-faces)
(defface hi-custom-blue-alt
  '((((min-colors 88) (background dark))
     (:background "#2188b6" :foreground "black"))
    (((background dark)) (:background "#2188b6" :foreground "black"))
    (((min-colors 88)) (:background "#2188b6"))
    (t (:background "#2188b6")))
  "Customized face for hi-lock mode."
  :group 'hi-lock-faces)
(defface hi-custom-purple
  '((((min-colors 88) (background dark))
     (:background "#AA759F" :foreground "black"))
    (((background dark)) (:background "#AA759F" :foreground "black"))
    (((min-colors 88)) (:background "#AA759F"))
    (t (:background "#AA759F")))
  "Customized face for hi-lock mode."
  :group 'hi-lock-faces)
(defface hi-custom-purple-alt
  '((((min-colors 88) (background dark))
     (:background "#5D54E1" :foreground "black"))
    (((background dark)) (:background "#5D54E1" :foreground "black"))
    (((min-colors 88)) (:background "#5D54E1"))
    (t (:background "#5D54E1")))
  "Customized face for hi-lock mode."
  :group 'hi-lock-faces)
(defface hi-custom-lpurple
  '((((min-colors 88) (background dark))
     (:background "#E69DD6" :foreground "black"))
    (((background dark)) (:background "#E69DD6" :foreground "black"))
    (((min-colors 88)) (:background "#E69DD6"))
    (t (:background "#E69DD6")))
  "Customized face for hi-lock mode."
  :group 'hi-lock-faces)
(defface hi-custom-cyan-alt
  '((((min-colors 88) (background dark))
     (:background "#61dafb" :foreground "black"))
    (((background dark)) (:background "#61dafb" :foreground "black"))
    (((min-colors 88)) (:background "#61dafb"))
    (t (:background "#61dafb")))
  "Customized face for hi-lock mode."
  :group 'hi-lock-faces)
(defface hi-custom-lcyan
  '((((min-colors 88) (background dark))
     (:background "#A5FDEC" :foreground "black"))
    (((background dark)) (:background "#A5FDEC" :foreground "black"))
    (((min-colors 88)) (:background "#A5FDEC"))
    (t (:background "#A5FDEC")))
  "Customized face for hi-lock mode."
  :group 'hi-lock-faces)

(defvar hi-lock-face-defaults
  '("hi-custom-green" "hi-custom-blue-alt" "hi-custom-purple"
    "hi-custom-purple-alt" "hi-custom-lpurple" "hi-custom-cyan-alt"
    "hi-custom-lcyan" "hi-yellow" "hi-pink" "hi-green" "hi-blue" "hi-salmon"
    "hi-aquamarine")
  "Default faces for hi-lock interactive functions.")

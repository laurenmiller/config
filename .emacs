;; ;; ====================================================================
;; ;; Emacs Configuration File
;; ;;
;; ;; This file is a configuration file for Mac OS X GNU Emacs (> Version 24.4)
;; ;; emacs-app 24.4 installed from macports
;; ;; ====================================================================


;; =================================================================
;; Setting Path, Directory
;; =================================================================

;;set default directory
;(setq default-directory "/Users/lauren/Dropbox/Programming/Emacs")

(setq debug-on-error t)

;; Add to path
(push "~/.emacs.d/lisp" load-path)

;(add-to-list 'exec-path "/usr/local/bin")

;; Read in PATH from .profile
(if (not (getenv "TERM_PROGRAM"))
    (setenv "PATH" (shell-command-to-string "source $HOME/.profile && printf $PATH")))
(setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH")))
(setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))
(setenv "PATH" (concat "/opt/local/var:" (getenv "PATH")))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;;==================================================================
;; GUI Emacs config (make things work nicely)
;; =================================================================

(setq
 ;; Prevent Emacs from create backup files with a tilde
 make-backup-files nil
;; Turn off splash screen
;; Turn off the message in the scratch buffer
;; set default mode to org-mode inhibit-splash-screen t
 initial-scratch-message nil
 initial-major-mode 'org-mode)

(setq inhibit-startup-message t) 

;;Turn off toolbar, menu, scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
;;(scroll-bar-mode -1)

(setq
 ;;turn of dialog box
 use-dialog-box nil
;; Turn off beep
ring-bell-function 'ignore
echo-keystrokes 0.1
use-dialog-box nil)

;; Turn on transient and delete selection mode
(transient-mark-mode)
(delete-selection-mode)

;; turn on paren matching
(show-paren-mode t)

;; Turn on line wrapping
(global-visual-line-mode 1)

;; Add line numbering
(require 'linum)
(global-linum-mode t)
(setq column-number-mode t)

;; turn on auto fill in all lmodes
(setq auto-fill-mode 1)
;; set the fill column
(setq-default fill-column 72)

;; Turn on window saving mode for restoring window configs:
(winner-mode 1)

;; Set Smooth Scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;;a minor tweak to the frame title, so it prints
;the path
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

; don't type out full words for yes or now
(defalias 'yes-or-no-p 'y-or-n-p)

;undo/redo 
;(require 'undo-tree)
;(global-undo-tree-mode 1)
;;reset key bindings
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "C-S-z") 'redo) ; 【Ctrl+Shift+z】;  Mac style

;; follow symlinks and don't ask
(setq  vc-follow-symlinks t)

;key minding to toggle full screen 
(global-set-key (kbd "M-RET") 'toggle-frame-maximized)
;;other keybindings
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "M-/") 'hippie-expand)
;; ;;==================================================================
;; ;; Add Packages and Turn On Modes
;; ;;==================================================================

;; Add marmalade functionality:
(require 'package)
(package-initialize)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/") t)

;;add interactively do things
(require 'ido)
(ido-mode t)
                                        ;remembers previous buffers so you can just use C-b
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

;; Smex: provides history and searching on top of M-x.
(require 'smex)
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                                        ; when Smex is auto-initialized on its first run.

(setq mac-emulate-three-button-mouse t)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)





                                        ;to enable autopair in all buffers
                                        ;This makes sure that brace structures (), [], {}, etc. are closed as soon as the opening character is typed.
;(require 'autopair) (autopair-global-mode)

                                        ;Turn on auto complete.
(require 'auto-complete-config)
(ac-config-default)

                                        ;(add-to-list 'load-path "~/.emacs.d/exec-path-from-shell-20140219.104/")
                                        ;(require 'exec-path-from-shell)

(setq flyspell-issue-welcome-flag nil)

(setq-default ispell-program-name "/opt/local/bin/aspell")
(setq-default ispell-list-command "list")

;; ===================================================================
;; Appearance
;; ===================================================================
;;  Set window defaults
(setq default-frame-alist
      '((top . 0) (left . 50)
        (width . 80) (height . 60)
                                        ;(cursor-color . "black")
        (cursor-type . box)
        ))


;; fonts

;(set-face-attribute 'default nil :height 120)
;(set-face-attribute 'default nil :font "Monaco")
(set-face-attribute 'default nil
                    :font "Consolas"
		    :height 125
		    :weight 'normal)
;(load-theme 'wombat t)
;(load-theme 'charcoal  t)
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-charcoal)

;; Please set your themes directory to 'custom-theme-load-path
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/themes/monokai-theme-20141106.2250"))

(load-theme 'monokai t t)
(enable-theme 'monokai)

;; load your favorite theme
;(load-theme 'charcoal-black t t)
;(enable-theme 'charcoal-black)

;(load-theme 'midnight t t)
;(enable-theme 'midnight)

;(enable-theme 'pok-wob-)
;;Indentation and buffer cleanup
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))
(global-set-key (kbd "C-x M-t") 'cleanup-region)
(global-set-key (kbd "C-c n") 'cleanup-buffer)


;; =================================================================
;; Python Functionalixsty
;; =================================================================
;; make sure that PYTHONPATH environment variable is set correctly
(setenv "PYTHONPATH" "/opt/local/bin/python")
;(prepend-path "~/.emacs.d/emacs-env/bin")


					;the default keyboard shortcuts
(autoload 'jedi:setup "jedi" nil t)

(setq jedi:setup-keys t)                      ; optional
;when you type some object or module name and a “.” it gives you all the possible attributes/submodules/methods/etc
(setq jedi:complete-on-dot t)                 ; optional


;(package-initialize)
(elpy-enable)
(elpy-use-ipython)
; setup JEDI			
(add-hook 'python-mode-hook 'jedi:setup)

;(elpy-clean-modeline)

;permanently prefer jedi for auto completion (rope still installed for refactoring support)
(setq elpy-rpc-backend "jedi")




;; ================================================================
;;  Latex Functionality
;;  ===============================================================

;;;(require 'tex)
(setq font-latex-fontify-sectioning 1.2)

(setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))

(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)

;(setq 'case-fold-sarch t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)

(setq TeX-view-program-list
      '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %q")))

(setq TeX-view-program-selection '((output-pdf "Skim")))

                                        ;make sure errors are printed
(setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))

                                        ;(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-auctex t)
(setq reftex-ref-macro-prompt nil)

;;Minor Mode
(add-hook 'LaTeX-mode-hook 'outline-minor-mode)
;; LaTeX-math-mode http://www.gnu.org/s/auctex/manual/auctex/Mathematics.html
(add-hook 'TeX-mode-hook 'LaTeX-math-mode)

; Outline-minor-mode key map
 (define-prefix-command 'cm-map nil "Outline-")
 ; HIDE
 (define-key cm-map "q" 'hide-sublevels)    ; Hide everything but the top-level headings
 (define-key cm-map "t" 'hide-body)         ; Hide everything but headings (all body lines)
 (define-key cm-map "o" 'hide-other)        ; Hide other branches
 (define-key cm-map "c" 'hide-entry)        ; Hide this entry's body
 (define-key cm-map "l" 'hide-leaves)       ; Hide body lines in this entry and sub-entries
 (define-key cm-map "d" 'hide-subtree)      ; Hide everything in this entry and sub-entries
 ; SHOW
 (define-key cm-map "a" 'show-all)          ; Show (expand) everything
 (define-key cm-map "e" 'show-entry)        ; Show this heading's body
 (define-key cm-map "i" 'show-children)     ; Show this heading's immediate child sub-headings
 (define-key cm-map "k" 'show-branches)     ; Show all sub-headings under this heading
 (define-key cm-map "s" 'show-subtree)      ; Show (expand) everything in this heading & below
 ; MOVE
 (define-key cm-map "u" 'outline-up-heading)                ; Up
 (define-key cm-map "n" 'outline-next-visible-heading)      ; Next
 (define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
 (define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
 (define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level
 (global-set-key "\M-o" cm-map)
;;(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
;;(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
;;(setq outline-minor-mode-prefix "\C-c \C-o");

;; Tex folding. turn on automatically, and automatically call fold command shen $ or } are typed to see if there's anything to fold
;; (add-hook 'LaTeX-mode-hook 
;;       (lambda () 
;;         (TeX-fold-mode 1)
;;         (add-hook 'find-file-hook 'TeX-fold-buffer t t)
;;         (add-hook 'after-change-functions 
;;               (lambda (start end oldlen) 
;;                 (when (= (- end start) 1)
;;                   (let ((char-point 
;;                                  (buffer-substring-no-properties 
;;                                   start end)))
;;                    (when (or (string= char-point "}")
;;                          (string= char-point "$"))
;;                     (TeX-fold-paragraph)))))
;; 	      t t)))

;;use latexmk to compile my LaTeX documents 
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'LaTeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))


(add-hook 'LaTeX-mode-hook
          (lambda ()
            (LaTeX-add-environments
             '("theorem" LaTeX-env-label)
             '("lemma" LaTeX-env-label)
             '("algorithm" LaTeX-env-label)
             '("proof" LaTeX-env-label))))

(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)

(add-hook 'python-mode-hook 'flyspell-prog-mode)
;; ===================================================================
;; ;; Org Functionalixsty
;; ================================================================
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

                                        ;Enable logging when tasks are complete. This puts a time-stamp on the completed task. Since I usually am doing quite a few things at once, I added the INPROGRESS keyword and made the color blue. Finally, enable flyspell-mode and writegood-mode when org-mode is active.
;; (setq org-log-done t
;;       org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE"))
;;       org-todo-keyword-faces '(("INPROGRESS" . (:foreground "blue" :weight bold))))
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (flyspell-mode)))
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (writegood-mode)))


;; ;First, create the global binding for org-agenda. This allows it to be quickly accessed. The agenda view requires that org files be added to it. The personal.org and groupon.org files are my daily files for review. I have a habit to plan the next day. I do this by assessing my calendar and my list of todo items. If a todo item is already scheduled or has a deadline, don't show it in the global todo list. looka t this site for more: http://www.aaronbedra.com/emacs.d/




;;========================================
;; start the emacsserver that listens to emacsclient
(server-start)

;; ;; ======================================================================
;; Custom added from Emacs ;;=====================================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   (quote
    (("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("View" "open -a /Applications/Skim.app %s.pdf" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file")
     ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(custom-safe-themes
   (quote
("0e7da2c7c64fb5d4764250ffa4b8b33c0946577108d1d6444f1020d0dabba784" default)))
 '(sentence-end-double-space nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
				    

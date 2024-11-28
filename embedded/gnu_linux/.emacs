
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;			 ("marmalade" . "http://marmalade-repo.org/packages/")
;			 ("melpa" . "http://melpa.milkbox.net/packages/")))

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("MELPA Stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/")
                         ("Org"  .   "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ("nongnu"  .   "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")))
                         ;; ("Marmalade"    "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")))


(package-initialize)

(setq load-path (cons "/usr/share/emacs/site-lisp" load-path))
;(setq load-path (cons "/usr/share/emacs/site-lisp/auctex" load-path))
;(setq load-path (cons "~/site-lisp" load-path))
;;; XEmacs backwards compatibility file
;;(setq user-init-file
;;      (expand-file-name "init.el"
;;			(expand-file-name ".xemacs" "~")))
;;(setq custom-file
;;      (expand-file-name "custom.el"
;;			(expand-file-name ".xemacs" "~")))
;;
;;(load-file user-init-file)
;;(load-file custom-file)
;;(load "/usr/share/lush/lush.el")
;;(load "lush")
;;(setq load-path (append (list "~/emacs/site-lisp/scilab" ) load-path))
;;(load "scilab-startup")
;;outline mode for easy use of LaTeX

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(setq outline-minor-mode-prefix [(control o)])
;;一个 buffer 里同时存在很多个 major mode
(autoload 'mmm-mode "mmm-mode" "Multiple Major Modes" t)
(autoload 'mmm-parse-buffer "mmm-mode" "Automatic MMM-ification" t)
;;Enable LaTeX preview
;;(add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)
;;(autoload 'LaTeX-preview-setup "preview" )
;;方便的在kill-ring里找东西
(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
;(browse-kill-ring-default-keybindings)
;;使用Tab显示
(require 'tabbar)
(tabbar-mode)
(global-set-key (kbd "") 'tabbar-backward-group)
(global-set-key (kbd "") 'tabbar-forward-group)
(global-set-key (kbd "") 'tabbar-backward)
(global-set-key (kbd "") 'tabbar-forward)

;;显示时间
(display-time-mode 1)
(setq display-time-24hr-format t)
;;(setq display-time-day-and-date t)
;;(setq display-time-use-mail-icon t)
(setq display-time-interval 10)
;;显示列号。
(setq column-number-mode t)
;;用一个很大的 kill ring. 这样防止我不小心删掉重要的东西。
(setq kill-ring-max 200)
;;把 fill-column 设为 60. 这样的文字更好读。
(setq default-fill-column 60)
;;不用 TAB 字符来indent, 这会引起很多奇怪的错误。编辑 Makefile 的时候也不用担心，因为 makefile-mode 会把 TAB 键设置成真正的 TAB 字符，并且加亮显示的。
;(setq default-indent-tabs-mode nil)
;(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
;(setq default-tab-width 4)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
;(setq tab-width 4)
;(setq tab-stop-list ())
;(loop for x downfrom 40 to 1 do
;      (setq tab-stop-list (cons (* x 4) tab-stop-list)))


;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;;可以递归的使用 minibuffer。经常需要这么做。
(setq enable-recursive-minibuffers t)
;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)
;;括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号。
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;这是一个很小的函数。你是不是觉得 Emacs 在匹配的括号之间来回跳转的时候按 C-M-f 和 C-M-b 太麻烦了？vi的 % 就很方便，我们可以把 % 设置为匹配括号。可是你想输入 % 怎么办呢？
;;一个很巧妙的解决方案就是，当 % 在括号上按下时，那么匹配括号，否则输入一个 %。你只需要在 .emacs 文件里加入这些东西就可以达到目的：
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(mouse-avoidance-mode 'animate)
;;在标题栏显示buffer的名字，而不是 emacs@localhost.localdomain 这样没用的提示。
;;%b显示的是buffer name
;;%f显示的是file name (含路径)
(setq frame-title-format "emacs@%f")
;;让 Emacs 可以直接打开和显示图片。
(auto-image-file-mode)
;;进行语法加亮。
(global-font-lock-mode t)
;;不要如此大的工具条
(tool-bar-mode -1)
;;当有两个文件名相同的缓冲时，使用前缀的目录名做 buffer 名字
;;默认是 foobar<1>，foobar<2> ……的形式
(setq uniquify-buffer-name-style 'forward)
;;把这些缺省禁用的功能打开。
;;(put 'set-goal-column 'disabled nil)
;;(put 'narrow-to-region 'disabled nil)
;;(put 'upcase-region 'disabled nil)
;;(put 'downcase-region 'disabled nil)
;;(put 'LaTeX-hide-environment 'disabled nil)
;(require 'color-theme)
;(color-theme-blue-mood)
(require 'thumbs)

;;(require 'un-define)暂时关闭
;;(put-charset-property 'cn-gb2312 'x-charset-registry "iso10646")
;;(create-fontset-from-fontset-spec "<*-fixed-medium-r-normal-*-16-*-*-*-*-*-fontset-standard>")
;;(utf-translate-cjk-mode 1)

;; chinese environment setting
;;(set-language-environment 'Chinese-GB)
;;`C-x <RET> f'
;;(set-buffer-file-coding-system 'gb2312)
;;`C-x <RET> x'
;;(set-selection-coding-system 'iso-2022-cn)
;;`C-x <RET> k'
;;(set-keyboard-coding-system 'gb2312)
;;`C-x <RET> c'
;;(universal-coding-system-argument 'iso-2022-cn);;不能这么写，因为此命令还需要一个命令(如‘C-x C-f’)作为参数
;;`C-x <RET> t'
;;(set-terminal-coding-system 'gb2312)
;;(setq default-enable-multibyte-characters t)
;;(prefer-coding-system 'gb2312)


;; Load mule-gbk
;;(require 'mule-gbk)
;; Setup GBK environment
;;(set-terminal-coding-system 'chinese-gbk)
;;(set-keyboard-coding-system 'chinese-gbk)
;;(set-language-environment 'chinese-gbk)
;;(setq locale-coding-system 'chinese-gbk)
;;(setq current-language-environment "Chinese-GBK")
;;;; Setup X Selection for mule-gbk
;;(mule-gbk-selection-setup)

;See more details in `/usr/share/doc/mule-gbk/README.gz'.

;;See `/usr/share/doc/mule-gbk/README.unicode' for
;;information about unicode support.(Emacs CVS (21.3.50) only)

;;See `/usr/share/doc/mule-gbk/README.mime' for
;;information of Mew and Gnus.



;; ====================================
;; Development Setup
;; https://realpython.com/emacs-the-best-python-editor/
;; ====================================
;; Enable elpy
(elpy-enable)
;(setq elpy-rpc-backend "jedi") 
;(jedi:install-server)

;; Use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;上次离开 Emacs 时的全局变量 (kill-ring，命令记录……)，局部变量，寄存器，打开的文件，修改过的文件和最后修改的位置，…… 全部都会被记录下来。
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
;;Save recent buffers
(load "desktop") 
;;(desktop-load-default) 
(desktop-save-mode 1)
(desktop-read)
;;打开文件与切换buffer扩展
(require 'ido)
(ido-mode t)
;;buffer menu 增强
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)




;;; Emacs/W3 Configuration
;(setq load-path (append (list  "/usr/share/xemacs/site-lisp") load-path))
(condition-case () (require 'w3-auto "w3-auto") (error nil))
(autoload 'w3 "w3" "WWW Browser"  t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(gruvbox-dark-medium))
 '(custom-safe-themes
   '("a22b002b3b0946b8ab8e156b74929ec88252b385c868e1be934631f56535ae1d" "2ad8cb4f6f8509341afb79f6f39636816e8cbf2d42681ff54cae6836b51d7cee" "262589c790e262af5fa62d59838f40d0e23bc6455e267aca1816eda86c936c8c" "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378" "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d" "51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3" default))
 '(display-time-mode t)
 '(geiser-mit-binary "/opt/mitscheme/bin/mit-scheme")
 '(org-format-latex-options
   '(:foreground default :background default :scale 3.0 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-preview-latex-default-process 'imagemagick)
 '(package-selected-packages
   '(diredc vterm ac-inf-ruby fish-completion darktooth-theme suscolors-theme gruvbox-theme ac-geiser company geiser-mit geiser-racket geiser-guile paredit geiser tabbar ssh session org-ref mmm-mode magit jupyter julia-repl julia-mode jedi-core helm-bibtex flycheck elpy ein cdlatex browse-kill-ring auto-complete auctex))
 '(session-use-package t nil (session))
 '(tool-bar-mode nil))

;To use company-mode in all buffers, add the following line to your init file:
(add-hook 'after-init-hook 'global-company-mode)

;(setq completions-format 'one-column)
;(setq completions-header-format nil)
;(setq completions-max-height 20)
;(setq completion-auto-select nil)
(when (and (executable-find "fish")
           (require 'fish-completion nil t))
  (global-fish-completion-mode))

(eval-after-load "mule-sysdp"
  '(and
    (push '("windows-1251" . cp1251) w3-mime-charset-coding-alist)
    (push '("utf-8" . utf-8) w3-mime-charset-coding-alist)
    (push '("gb2312" . gb2312) w3-mime-charset-coding-alist)))
(setq w3-default-homepage
      "http://bellinux.sourceforge.net")

;        ;;使用wiki
;        (require 'emacs-wiki)
;        (add-hook 'emacs-wiki-mode-hook
;        	  (lambda ()
;        	    (define-key emacs-wiki-mode-map (kbd "C-c C-h") 'emacs-wiki-preview-html)
;        	    (define-key emacs-wiki-mode-map (kbd "C-c C-c") 'emacs-wiki-preview-source)
;        	    (define-key emacs-wiki-mode-map (kbd "C-c C-v") 'emacs-wiki-change-project)
;        ))
;        (setq emacs-wiki-publishing-directory "/mnt/e/f/EmacsWiki/PublishHtml/Wiki")
;        (setq emacs-wiki-directories '("/mnt/e/f/EmacsWiki/Wiki"))
;        ;;(setq emacs-wiki-meta-charset "gb2312")
;        ;;(setq emacs-wiki-coding-map 'gb2312)
;        (setq emacs-wiki-style-sheet  "")
;        
;        (setq emacs-wiki-inline-relative-to 'emacs-wiki-publishing-directory)
;        (setq emacs-wiki-projects
;              `(("default" . ((emacs-wiki-publishing-directory . "/mnt/e/f/EmacsWiki/PublishHtml/wiki/default/")
;                             (emacs-wiki-directories . ("/mnt/e/f/EmacsWiki/wiki/default/"))))
;                ("work" . ((emacs-wiki-publishing-directory . "/mnt/e/f/EmacsWiki/PublishHtml/wiki/work/")
;                          (emacs-wiki-directories . ("/mnt/e/f/EmacsWiki/wiki/work/"))))
;                ("study" .((emacs-wiki-publishing-directory . "/mnt/e/f/EmacsWiki/PublishHtml/wiki/study/")
;                          (emacs-wiki-directories . ("/mnt/e/f/EmacsWiki/wiki/study/"))))
;                ("teach" .((emacs-wiki-publishing-directory . "/mnt/e/f/EmacsWiki/PublishHtml/wiki/teach/")
;                          (emacs-wiki-directories . ("/mnt/e/f/EmacsWiki/wiki/teach/"))))))
;        
;        
;        (defun emacs-wiki-preview-source()
;          (interactive)
;          (emacs-wiki-publish-this-page)
;          (find-file (emacs-wiki-published-file)))
;        (defun emacs-wiki-preview-html()
;          (interactive)
;          (emacs-wiki-publish-this-page)
;          (browse-url (emacs-wiki-published-file)))
;        ;; (setq emacs-wiki-grep-command "glimpse -nyi \"%W\"")

;;使用Planner作为 Personal Information Manager
;;(require 'planner)暂时
;; By default and for backward compatibility, the following operations
;; do not have keybindings, and are only accessible from the Planner
;; menu:
;;    planner-copy-or-move-region
;;    planner-delete-task
;;    planner-task-delegated
;;    planner-task-pending
;;    planner-renumber-tasks
;;
;; You may find it easier to install keybindings for those operations by
;; inserting the following in your .emacs file:
;;
;;   ;; Note: This changes some of the default key bindings for planner-mode
;;(planner-install-extra-task-keybindings)暂时
;;
;; If you want to change `planner-directory' and some other variables,
;; either use Customize or use `planner-option-customized'. For
;; example:
;;
;;(planner-option-customized 'planner-directory "~/Plans")暂时
;;(planner-option-customized 'planner-publishing-directory "~/PublishHtml/Plans")暂时
;;
;; and if you want to modify other emacs-wiki variables:
;;
;;    (add-to-list 'planner-custom-variables '(some-emacs-wiki-variable . "some-emacs-wiki-value"))
;;    (planner-option-customized 'planner-custom-variables planner-custom-variables)
;;
;; See `emacs-wiki-update-project' and `planner-custom-variables' for more details.
;;
;; Planner can work with other Emacs packages. Try
;;
;;(planner-insinuate-calendar)暂时
;;(planner-insinuate-gnus)暂时

;;html32-mode
;;(autoload 'html32-mode "html32-mode" "HTML major mode." t)
;;(or (assoc "\\.html$" auto-mode-alist)
;;  (setq auto-mode-alist (cons '("\\.html$" . html32-mode)
;;                              auto-mode-alist)))
;;(or (assoc "\\.shtml$" auto-mode-alist)
;;    (setq auto-mode-alist (cons '("\\.shtml$" . html32-mode)
;;				auto-mode-alist)))
;;(or (assoc "\\.htm$" auto-mode-alist)
;;    (setq auto-mode-alist (cons '("\\.htm$" . html32-mode)
;;				auto-mode-alist)))

;;加载html-helper-mode
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;;To invoke html-helper-mode automatically on .html files, do this:
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
;;加载browse-url
(autoload 'browse-url-at-point "browse-url"
   "Ask a WWW browser to load the URL at or before point." t)
(autoload 'browse-url-at-mouse "browse-url"
   "Ask a WWW browser to load a URL clicked with the mouse." t)
(autoload 'browse-url-of-buffer "browse-url"
   "Ask a WWW browser to display BUFFER." t)
(autoload 'browse-url-of-file "browse-url"
   "Ask a WWW browser to display FILE." t)
(autoload 'browse-url-of-dired-file "browse-url"
   "In Dired, ask a WWW browser to display the file named on this line." t)
;;加载w3m
;;(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
;;(autoload 'w3m-find-file "w3m" "Find a local file using emacs-w3m." t)
;;(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)
;;(autoload 'w3m-weather "w3m-weather" "Display a weather report." t)
;;(autoload 'w3m-antenna "w3m-antenna" "Report changes of web sites." t)
;;(autoload 'w3m-namazu "w3m-namazu" "Search files with Namazu." t)
;;(setq w3m-display-inline-image t)
;;(setq mm-text-html-renderer 'w3m)
;;(setq mm-inline-text-html-with-images t)
;;(setq mm-inline-text-html-renderer 'mm-inline-text-html-render-with-w3m)
;;(setq mm-inline-text-html-with-images "")

;;使用图片
;;(load "image-file")
;;(load "notesmode.el")
;;输出语法加亮的html
;(load "htmlize.el")

;;不使用菜单条
(menu-bar-mode nil)
;;使用命令 tmm-menubar 可以用键盘操作菜单

;(defun browse-url-firefox-new-tab (url &optional new-window)
; "Open URL in a new tab in Firefox."
; (interactive (browse-url-interactive-arg "URL: "))
; (if (string= (substring url 0 1) "/")
;     (setq url (concat "file://" url)))
; (let ((cmd (shell-command-to-string
;	      (concat "/usr/lib/iceweasel/iceweasel-xremote-client -a any 'openURL("
;		      url ",new-tab)'"))))
;   (unless (string= "" cmd)
;     (message "Starting Firefox...")
;     (start-process (concat "firefox " url) nil "/usr/lib/iceweasel/iceweasel" url)
;     (message "Starting Firefox...done"))))
;(setq browse-url-browser-function 'browse-url-firefox-new-tab)

;        (defun load-html-firefox ()
;        "Load Wiki's published html file into a firefox tab."
;        (interactive)
;        (browse-url 
;         (expand-file-name 
;          (emacs-wiki-published-name (emacs-wiki-page-name))
;          emacs-wiki-publishing-directory)))
;        
;        (define-key emacs-wiki-mode-map
;          [(control ?c) (control ?F)]
;          'load-html-firefox)

;(setq load-path (cons "/usr/share/emacs/site-lisp/ocaml" load-path))
;(require 'caml)
;(if window-system (require 'caml-font))
;;(autoload 'caml-mode "caml" "Major mode for editing Caml code." t)
;;(autoload 'run-caml "inf-caml" "Run an inferior Caml process." t)

;;(setq auto-mode-alist (append '(("\\.i$" . yorick-mode))
;;			  auto-mode-alist))
;;(autoload 'yorick-mode
;;  "yorick-mode" "*Editing mode for Yorick *.i files." t)

;;(setq load-path (cons "/usr/share/emacs/site-lisp/tela" load-path))
;;(autoload 'tela-mode "tela" "TeLa mode" t)
;;(setq auto-mode-alist (cons '("\\.t\\'" . tela-mode) auto-mode-alist))
;;(setq auto-mode-alist (cons '("\\.ct\\'" . c++-mode) auto-mode-alist))

(setq auto-mode-alist (cons '("\\.max" . maxima-mode) auto-mode-alist))
(setq load-path (cons  "/usr/share/maxima/5.9.1/emacs" load-path ))
(autoload 'maxima "maxima" "Running Maxima interactively" t)
(autoload 'maxima-mode "maxima" "Maxima editing mode" t)

(setq inferior-lisp-program "sbcl")
;(require 'slime)

;;webjump
(require 'webjump)
(global-set-key "\C-cj" 'webjump)
(setq webjump-sites
      (append '(
		("MyHomePage" . "xing.wikispaces.com")
		)
	      webjump-sample-sites))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans" :foundry "GOOG" :slant normal :weight regular :height 100 :width normal)))))


(require 'ob-octave)
(autoload 'octave-mode "octave-mod" nil t)
;;(setq auto-mode-alist (cons' ("\\.m $" .  octave-mode) auto-mode-alist))


(require 'ssh)
(add-hook 'ssh-mode-hook 
	  (lambda ()
	    (setq ssh-directory-tracking-mode t)
	    (shell-dirtrack-mode t)
	    (setq dirtrackp nil)))


;;(require 'cmuscheme)
;;(setq scheme-program-name "~/github/ChezScheme/a6le/bin/scheme")

(setq visible-bell t)


(org-babel-do-load-languages
  'org-babel-load-languages
  '(;; other Babel languages
    (ditaa . t)
;;    (shell . t)
;    (asymptote . t)
    (dot . t)
    (octave . t)
    (python . t)
    (scheme . t)
    (lisp . t)
;    (jupyter-julia . t)
    (latex . t)
    ))



(autoload 'helm-bibtex "helm-bibtex" "" t)
(require 'org-ref)
(require 'org-ref-helm)
(define-key org-mode-map (kbd "C-c ]") 'org-ref-insert-link)
(define-key org-mode-map (kbd "C-c [") 'org-ref-insert-link)
(setq reftex-default-bibliography '("~/Documents/bibliography/references.bib"))
(setq org-ref-bibliography-notes "~/Documents/bibliography/notes.org"
      org-ref-default-bibliography '("~/Documents/bibliography/references.bib")
      org-ref-pdf-directory "~/Documents/bibliography/bibtex-pdfs/")
;;(setq org-ref-insert-ref-link "C-c )")
(setq bibtex-completion-notes-path "~/Documents/bibliography/notes.org")
(setq bibtex-completion-bibliography '("~/Documents/bibliography/references.bib"  ))
(setq bibtex-completion-library-path "~/Documents/bibliography/bibtex-pdfs")

(setq bibtex-completion-pdf-field t)
(setq bibtex-completion-pdf-open-function
      (lambda (fpath)
        (let ((f_ext (f-ext fpath)))
          (cond
           ((equal f_ext  "pdf")  (call-process "okular" nil 0 nil fpath))
           (t (call-process "dolphin" nil 0 nil fpath))))))

;(shell-command (concat "okular  " fpath " &"))))
(setq bibtex-completion-pdf-field "file")

(setq org-startup-truncated nil)

;; Pomodoro
(add-to-list 'org-modules 'org-timer)
(setq org-timer-default-timer 25)
(add-hook 'org-clock-in-hook (lambda()
			       (org-timer-set-timer '(25))))


(setq julia-repl-executable-records
      '(        (default "~/juliaup/julialauncher")))
; compiled from the repository

; Set both org-pretty-entities and org-pretty-entities-include-sub-superscripts to t to start with super- and subscripts visually interpreted as specified by the option org-use-sub-superscripts.

(setq org-pretty-entities t)
(setq org-pretty-entities-include-sub-superscripts t)

(yas-global-mode nil)
;;keys for navigation
; (define-key yas-keymap [(tab)]       nil)
; (define-key yas-keymap (kbd "TAB")   nil)
; (define-key yas-keymap [(shift tab)] nil)
; (define-key yas-keymap [backtab]     nil)
; (define-key yas-keymap (kbd "right") 'yas-next-field-or-maybe-expand)
; (define-key yas-keymap (kbd "left") 'yas-prev)

;(define-key yas-minor-mode-map (kbd "<tab>") nil)
;(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<RET>") yas-maybe-expand)
;; use Meta-j and Meta-k to jump between fields
(define-key yas-keymap (kbd "<right>") 'yas-next-field-or-maybe-expand)
(define-key yas-keymap (kbd "<left>") 'yas-prev-field)

(setq eshell-history-size         10000
        eshell-buffer-maximum-lines 10000
        eshell-hist-ignoredups t
        eshell-scroll-to-bottom-on-input t)
(setq eshell-destroy-buffer-when-process-dies t)

;; transparent frame
(set-frame-parameter nil 'alpha-background 90) ; For current frame
(add-to-list 'default-frame-alist '(alpha-background . 90)) ; For all new frames henceforth

;; toggle transparency
(defun kb/toggle-window-transparency ()
  "Toggle transparency."
  (interactive)
  (let ((alpha-transparency 90))
      (cond ((= alpha-transparency (frame-parameter nil 'alpha-background))
            (set-frame-parameter nil 'alpha-background 100))
      (t (set-frame-parameter nil 'alpha-background alpha-transparency)))))

;(set-frame-font "sans 15")
(add-to-list 'default-frame-alist
	     '(font . "sans 15"))



(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

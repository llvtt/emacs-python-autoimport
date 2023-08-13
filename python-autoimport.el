;;; python-autoimport.el --- Automatically import python packages with `autoimport'  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Luke Lovett

;; Author: Luke Lovett <lukeharmonlovett@duck.com>
;; Keywords: languages
;; URL: https://github.com/llvtt/python-autoimport.el
;; Package-Requires: ((emacs "26") (reformatter "0.6"))
;; Version: 1.0.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; # Usage
;;
;; (require 'python-autoimport)
;; (add-hook 'python-mode-hook 'python-autoimport-on-save-mode)

;;

;;; Code:

(require 'reformatter)

(defgroup python-autoimport nil
  "Python autoimport."
  :group 'python
  :prefix "python-autoimport-")

(defcustom python-autoimport-command "autoimport"
  "The name or the path to the `autoimport' command."
  :type 'string
  :group 'python-autoimport)

(defcustom python-autoimport-arguments '()
  "Arguments to `python-autoimport-command'."
  :type '(repeat string)
  :group 'python-autoimport)

;;;###autoload (autoload 'python-autoimport-buffer "python-autoimport" nil t)
;;;###autoload (autoload 'python-autoimport-region "python-autoimport" nil t)
;;;###autoload (autoload 'python-autoimport-on-save-mode "python-autoimport" nil t)
(reformatter-define python-autoimport
  :program python-autoimport-command
  :args python-autoimport-arguments
  :stdin nil
  :stdout nil
  )

(provide 'python-autoimport)
;;; python-autoimport.el ends here

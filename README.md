# Installation

Pull the code down into ~/.config/nvim (init.vim should be in this directory). Then run:

	sudo bash install.sh

## First Load

The first time you load nvim you will need to use the following command:

	nvim -S install.vim

## Fonts

The install script installed some new fonts. To enable them you must select the "OperatorMonoNerdFont Nerd Font Light" in the preferences of the terminal program (usually in profile section)

# Install Language Servers

The setup comes with JavaScript and HTML language servers installed by default. Other servers can be installed using LspInstall. E.g.

	:LspInstall tsserver

# Getting Started

## Sessions

	\sc = create session from current working directory (:cd)
	\ss = fuzzy find session

Sessions can also be deleted from within fuzzy find session, but pressing escape then pressing 'd' over the session to delete

## Navigating Files

	\f = fuzzy find files
	\b = fuzzy find open files
	\r = grep search for a file

## Embedded Terminal

	\t = open the terminal
	<ESC> = close the terminal

## Panel Navigation

You can more between the main panel, the file explorer and any other panels using:

	<ALT>h = left
	<ALT>j = down
	<ALT>k = up
	<ALT>l = right

## Comments

Select multiple lines then comment/uncomment them by:

	\c<space>

SysPass XML decrypter
=====================

XML decrypter for [sysPass](https://github.com/nuxsmin/sysPass/).

## Supported export formats

 - LastPass
 
 The resulting file is comma-delimited and is also suitable for CSV generic import in KeePass.

## Requirements

 - PHP >= 7.0
 - php-xml
 - php-mbstring
 - php-mcrypt
 
## Installation

 - Clone the repository:

 ```
 git clone https://github.com/julenpardo/sysPass-XML-Decrypter
 ```

 - Install Composer dependencies:

 ```
 cd sysPass-XML-Decrypter
 composer install
 ```

## Usage

 - Execute the script:
 ```
 # INITIAL SETUP OF ALIAS
 echo "alias syspass-decrypt='docker run -u root -t --rm -v ${HOME}:/root/:rw syspass-decrypter/latest \"\$*\"'" >> ~/.bashrc
 exec ${SHELL}

 syspass-decrypter <path-to-encrypted-xml> <xml-export-key> <master-syspass-key> <dest-file> [format]
 ```

Tested with PHP 7.0.15 and XML exported with sysPass 2.1.5.17041201.

" IFC / STEP syntax highlighting
" Made with ChatGPT
syntax match IfcEntity "#\d\+"
syntax match IfcKeyword /\<\(ENTITY\|END_ENTITY\|DATA\|HEADER\|SCHEMA\|ENDSEC\|WHERE\|DERIVE\|SELECT\|TYPE\|END_TYPE\|USE\|FROM\|IFC[A-Z0-9_]*\)\>/
syntax match IfcString /'[^']*'/
syntax match IfcComment /\/\/.*/
syntax match IfcAssignment /=/

highlight link IfcEntity Identifier
highlight link IfcKeyword Keyword
highlight link IfcString String
highlight link IfcComment Comment
highlight link IfcAssignment Operator

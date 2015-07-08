print "Slug: "
slug = gets.strip
date = Time.now

file_name = date.strftime('%Y-%m-%d') + "-#{slug}.html.markdown"
file_path = "source/articles/#{file_name}"

article = <<ARTICLE
---
title: 
date: #{date.strftime('%Y-%M-%d')}
tags: 
lang: en
---
ARTICLE


File.write(file_path, article)
`sublime #{file_path}`
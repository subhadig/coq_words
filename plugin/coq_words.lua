COQsources = COQsources or {}

COQsources['Dict words'] = {
    name = 'WORD',
    fn = function (_, callback)
        -- Only plaintext and markdown filetypes are supported
        if vim.bo.filetype ~= 'markdown' and vim.bo.filetype ~= 'text' then
            callback(nil)
        end

        -- Get the word under cursor
        local cur_line = vim.fn.getline('.')
        local cur_word = ""
        for w in string.gmatch(cur_line, "%s?(%a+)$") do
            cur_word = w
            break
        end

        -- Prepare the suggestions
        local items = {}
        if #cur_word ~= 0 then
            -- Invoke the system 'look' command, read the stdout
            local look_output = vim.system({'look', cur_word}):wait().stdout

            local returned_words = vim.fn.split(look_output, "\n")

            for _, value in pairs(returned_words) do
	            table.insert(items, {
                    label = value,
                    kind = 1, -- text, https://elbywan.github.io/crystal-lsp/LSP/CompletionItemKind.html
                    insertText = value
                })
            end
        end

        callback {
            isIncomplete = false, -- 'false' ensures caching
            items = items
        }
    end
}

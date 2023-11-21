local command_checklist= {
    {command = "fzf", website = "https://github.com/junegunn/fzf"},
    {command = "tmux", website = "https://github.com/tmux/tmux"},
    {command = "lazygit", website = "https://github.com/jesseduffield/lazygit"},
    {command = "bat", website = "https://github.com/sharkdp/bat"},
    {command = "nvm", website = "https://github.com/nvm-sh/nvm"},
    {command = "curl", website = "https://curl.se"},
    {command = "openssl", website = "https://www.openssl.org"},
    {command = "rg", website = "https://github.com/BurntSushi/ripgrep"},
    {command = "htop", website = "https://htop.dev"},
    {command = "exa", website = "https://github.com/ogham/exa"},
    {command = "httpie"},
    {command = "conda"},
    {command = "go"},
    {command = "mmdc", website = "https://github.com/mermaid-js/mermaid-cli"},
    {command = "git"},
    {command = "hugo"},
    {command = "dlv"},
    {command = "etcdctl"},
    {command = "kubectl"},
    {command = "docker"},
    {command = "zsh"},
    {command = "cloc", website = "https://github.com/AlDanial/cloc"},
    {command = "protoc", website = "https://github.com/protocolbuffers/protobuf"},
    {command = "frpc", website = "https://github.com/fatedier/frp"},
    {command = "fd", website = "https://github.com/sharkdp/fd"}

}

function remove_escape_sequences(str)
    local result = str:gsub("\t", "") -- 删除所有的制表符
    result = result:gsub("\n", "") -- 删除所有的换行符
    return result
end

local function display_command(command, description)
   if command == nil or command == "" then
    return
   end

   local handle = io.popen("command -v " .. command, 'r')
   handle:flush()
   local result = handle:read("*all")
   handle:close()

   result = remove_escape_sequences(result)
   if result == nil or result == "" then
       print(string.format("\27[31m%-10s\t\27[0m", command))
    return
   end
    print(string.format("\27[32m%-10s\27[0m\t%s", command, result))
end

for _, item in ipairs(command_checklist) do
    display_command(item.command, item.description)
end



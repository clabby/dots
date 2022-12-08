local status_ok, dressing = pcall(require, "dressing")
if not status_ok then return end
dressing.setup(astronvim.user_plugin_opts("plugins.dressing", {
  input = {
    default_prompt = "➤ ",
    win_options = {
      winhighlight = "Normal:Normal,NormalNC:Normal"
    },
  },
  select = {
    backend = { "telescope", "builtin" },
    builtin = { win_options = { winhighlight = "Normal:Normal,NormalNC:Normal" } },
  },
}))

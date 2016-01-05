module ProjectsHelper

def toggle_activation_button(project)
  if project.active
    link_to "Close project", project_close_path(project)
  else
    link_to "Reopen project", project_reopen_path(project)
  end
end

end

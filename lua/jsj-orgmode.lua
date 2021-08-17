require('orgmode').setup{
  org_default_notes_file = '~/Nutstore Files/Nutstore/Org/todo.org',
  org_agenda_files = { '~/Nutstore Files/Nutstore/Org/*', '~/Nutstore Files/Nutstore/Org/**/*' },
  org_agenda_templates = {
    t = {
      description = 'Task',
      template = '** TODO %?\n  SCHEDULED: %T DEADLINE: %T'
    },
  },
}

class Cli
  class DocReposUpdated < BookbinderCommand
    def run(_)
      book = Book.new full_name: config.fetch('github_repo'),
                      constituent_params: config.fetch('repos')

      change_monitor = DocRepoChangeMonitor.new book
      change_monitor.build_necessary? ? 0 : 42
    end
  end
end
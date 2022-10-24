require 'projects_helper'

module RqreProjectsHelperPatch
    extend ActiveSupport::Concern

    def project_settings_tabs
      tabs = super
      return tabs unless @project.module_enabled?(:redmine_empty_plugin)

      tabs.tap { |t| t << append_rqre_tab }.compact
    end

    def append_rqre_tab
      @rqre_setting = rqreSetting.find_or_create(@project.id)
      action = { name: 'rqre_settings',
                 controller: 'rqre_settings',
                 action: :edit,
                 partial: 'rqre_settings/show', label: :label_rqre }
      return nil unless User.current.allowed_to?(action, @project)

      action
    end
end

ProjectsController.helper(RqreProjectsHelperPatch)

require 'projects_helper'

module RempProjectsHelperPatch
    extend ActiveSupport::Concern

    def project_settings_tabs
      tabs = super
      return tabs unless @project.module_enabled?(:redmine_empty_plugin)

      tabs.tap { |t| t << append_remp_tab }.compact
    end

    def append_remp_tab
      @remp_setting = RempSetting.find_or_create(@project.id)
      action = { name: 'remp_settings',
                 controller: 'remp_settings',
                 action: :edit,
                 partial: 'remp_settings/show', label: :label_remp }
      return nil unless User.current.allowed_to?(action, @project)

      action
    end
end

ProjectsController.helper(RempProjectsHelperPatch)

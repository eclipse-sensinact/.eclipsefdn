local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-sensinact') {
  settings+: {
    default_repository_permission: "none",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: false,
    members_can_create_private_repositories: false,
    members_can_create_public_repositories: false,
    members_can_create_teams: false,
    members_can_delete_repositories: false,
    packages_containers_internal: false,
    packages_containers_public: false,
    plan: "free",
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('org.eclipse.sensinact') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.sensinact.gateway') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/eclipse-sensinact/263468/') {
          content_type: "json",
          events+: [
            "create",
            "delete",
            "pull_request",
            "push"
          ],
          secret: "********",
        },
      ],
    },
    orgs.newRepo('org.eclipse.sensinact.studio') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('org.eclipse.sensinact.studioweb') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
}
module.exports = {
  branches: [
    {
      name: 'main',
      prerelease: false,
    },
    {
      name: 'beta',
      prerelease: true,
    },
    {
      name: 'alpha',
      prerelease: true,
    }
  ],
  plugins: [
    '@semantic-release/commit-analyzer',
    '@semantic-release/release-notes-generator',
    [
      '@semantic-release/changelog',
      {
        'changelogFile': 'docs/CHANGELOG.md',
        'changelogTitle': '# Change log'
      }
    ],
    [
      '@semantic-release/git',
      {
        'assets': [
          'docs/CHANGELOG.md'
        ],
        'message': 'chore(release): Create release <%= nextRelease.version %>\n\nSigned-off-by: semantic-release-bot <semantic-release-bot@martynus.net>'
      }
    ],
    [
      '@semantic-release/github',
      {
        'assets': [
          {
            'path': 'docs/CHANGELOG.md',
            'label': 'CHANGELOG.md'
          }
        ],
        'assignees': [
          '@sscheib'
        ],
        'discussionCategoryName': 'Announcements'
      }
    ]
  ]
};

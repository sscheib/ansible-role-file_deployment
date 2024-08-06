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
        'changelogFile': 'docs/CHANGELOG.md'
      }
    ],
    [
      '@semantic-release/git',
      {
        'assets': [
          'docs/CHANGELOG.md'
        ],
        'message': 'chore(release): Create release <%= nextRelease.version %>'
      }
    ],
    [
      '@semantic-release/github',
      {
        'assets': [
          {
            'path': 'docs/CHANGELOG.md',
            'label': 'change log'
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
